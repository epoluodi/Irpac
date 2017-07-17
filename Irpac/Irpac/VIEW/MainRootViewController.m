//
//  MainRootViewController.m
//  OldHome
//
//  Created by Stereo on 2016/11/1.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import "MainRootViewController.h"
#import <Common/PublicCommon.h>
#import "CordovaWebViewController.h"
#import "RootViewController.h"
#import "LoginViewController.h"
#import "RootViewController.h"
#import "AppDelegate.h"
#import "AppInfo.h"
#import "SingleWebViewController.h"
#import "MustConfigViewController.h"
@interface MainRootViewController ()
{
    RootViewController*tabbarmainvc;
    
}
@end

@implementation MainRootViewController
@synthesize labtitle;
@synthesize layoutBottom;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置全局 navbar
    
    layoutBottom.constant=0;
    self.interactivePopGestureRecognizer.delegate = self;
    UIImage *backbar = [PublicCommon createImageWithColor:APPCOLOR Rect:CGRectMake(0, 0, 100, 100)];
    
    [[UINavigationBar appearance] setBackgroundImage:backbar forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTranslucent:YES];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    //设置全局tabbar 选中颜色
    [[UITabBar appearance] setTintColor:APPCOLOR];
    [[UIBarButtonItem appearance] setTintColor:[UIColor whiteColor]];

    // Do any additional setup after loading the view.
    
    statusbarstyle = UIStatusBarStyleLightContent;
    
    labtitle = [[UILabel alloc] init];
    labtitle.font = [UIFont systemFontOfSize:20];
    
    labtitle.frame = CGRectMake(16, 8, [PublicCommon GetALLScreen].size.width-32, 30);
    labtitle.textColor = [UIColor whiteColor];
    labtitle.textAlignment = NSTextAlignmentCenter;
    isCloseEvent = NO;
    
    self.delegate = self;
    [self.navigationBar addSubview:labtitle];
    NSNotificationCenter *notiCenter = [NSNotificationCenter defaultCenter];
    [notiCenter addObserver:self selector:@selector(webViewControllerCloseNotification:) name:Notification_CLOSEVIEWCONTROLLER object:nil];
    [notiCenter addObserver:self selector:@selector(webViewControllerCloseNotification:) name:Notification_CLOSEVIEWCONTROLLEREVENT object:nil];

    
    
}


-(void)webViewControllerCloseNotification:(NSNotification *)notification
{
    NSLog(@"通知 %@",notification);
    CordovaWebViewController *cordovaview;
    if ([notification.name isEqualToString:Notification_CLOSEVIEWCONTROLLER])
    {
        if (self.viewControllers.count==2)
        {
            RootViewController *rootview = self.viewControllers[0];
            cordovaview = (CordovaWebViewController *)rootview.selectedViewController;
        }
        else
        {
            if (self.viewControllers.count==2)
            {
                cordovaview =self.viewControllers[self.viewControllers.count -1];
            }
            else
                cordovaview =self.viewControllers[self.viewControllers.count -2];
        }
        if (![[cordovaview class] isSubclassOfClass:[CordovaWebViewController class]])
            return;
        
        [cordovaview callJS:[NSString stringWithFormat:@"%@()",[notification.userInfo objectForKey:@"function"]]];
    }else if ([notification.name isEqualToString:@"closeViewControllerNotification"])
    {
        NSDictionary *dict = notification.userInfo;
        if ([[dict objectForKey:@"eventType"] isEqualToString:@"add"])
        {
            isCloseEvent=YES;
            _callJS = [[dict objectForKey:@"function"] copy];
            _jsArg =[[dict objectForKey:@"arg"] copy];
            if (_jsArg != [NSNull null]){
                if ([NSStringFromClass([[dict objectForKey:@"arg"] class]) isEqualToString:@"__NSDictionaryM"])
                {
                    NSData * d = [NSJSONSerialization dataWithJSONObject:[dict objectForKey:@"arg"] options:NSJSONWritingPrettyPrinted error:nil];
                    _jsArg  = [[[NSString alloc] initWithData:d encoding:NSUTF8StringEncoding] copy];
                }
                else
                    _jsArg =[[dict objectForKey:@"arg"] copy];
            }
            else
            {
                _jsArg = nil;
            }
            
            if (self.viewControllers.count == 2)
            {
                _oldVC = self.viewControllers[self.viewControllers.count-1];
            }
            else
                _oldVC = self.viewControllers[self.viewControllers.count -2];
            
        }
        else{
            isCloseEvent = NO;
            _callJS = nil;
            _jsArg = nil;
        }
    }
    
    
    
}




-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (isCloseEvent)
    {
        
        if ([_oldVC isEqual:viewController])
        {
            
            if (self.viewControllers.count==1)
            {
                RootViewController *rootview = (RootViewController *)viewController;
                
                if (![[rootview.selectedViewController class] isSubclassOfClass:[CordovaWebViewController class]])
                {
                    return;
                }
                _oldVC = (CordovaWebViewController *)rootview.selectedViewController;
                
            }
            if (![[_oldVC class] isSubclassOfClass:[CordovaWebViewController class]])
            {
                return;
            }
            NSString *js = [NSString stringWithFormat:@"%@(%@)",_callJS,_jsArg?_jsArg:@""];
            [((CordovaWebViewController *)_oldVC) callJS:js];
            isCloseEvent = NO;
            _jsArg=nil;
            _callJS = nil;
            _oldVC=nil;
        }
        
    }
    NSLog(@"viewlist显示的 %@",self.viewControllers);
    
}



-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
     tabbarmainvc =(RootViewController *) self.rootViewController;

}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//注销
-(void)LogOut
{

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定退出当前用户吗?" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [[AppInfo getInstance] ClearInfo];
        [USER_DEFAULT setObject:@"" forKey:@"userpwd"];
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        LoginViewController *loginvc = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        [UIApplication sharedApplication].keyWindow.rootViewController = loginvc;
        [[UIApplication sharedApplication].keyWindow makeKeyAndVisible];
        [self dismissViewControllerAnimated:YES completion:nil];
        return ;
    }];
 

    [alert addAction:action];
    [alert addAction:action1];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)setStatusbarMode:(UIStatusBarStyle)statusmode
{
    statusbarstyle =statusmode;
    [self setNeedsStatusBarAppearanceUpdate];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    
    return statusbarstyle;
}

#pragma mark 手势

//判断手势是否在输入法区域
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if (layoutBottom){
        CGPoint point = [touch  locationInView:self.view];
        int _notouchheight = [PublicCommon GetScreen].size.height -layoutBottom.constant;
        if (point.y>_notouchheight)
            return NO;//不准侧面滑动
        else
            return YES;
    }
    return YES;
}



#pragma mark -



//转场
//
//-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
//{
//    return 0.4f;
//    
//}
//
//-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
//{
//    UIView *generalContentView = [transitionContext containerView];
//    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
//    UIView *toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
//    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
//        generalContentView.alpha=0;
//        fromView.alpha = 0;
//    
//        
//    } completion:^(BOOL finished) {
//        
//        //Set the final position of every elements transformed
//
//        
//        
//        if ([transitionContext transitionWasCancelled]) {
//            [toView removeFromSuperview];
//        } else {
//            [fromView removeFromSuperview];
//        }
//        
//        // inform the context of completion
//        [transitionContext completeTransition:YES];
//        
//    }];
//    
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
