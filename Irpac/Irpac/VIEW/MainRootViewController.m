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
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center postNotificationName:Notification_USER_LOGOUT object:nil userInfo:nil];
    
 
    [[AppInfo getInstance] ClearInfo];
    [USER_DEFAULT setObject:@"" forKey:@"userpwd"];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginvc = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    [UIApplication sharedApplication].keyWindow.rootViewController = loginvc;
    [[UIApplication sharedApplication].keyWindow makeKeyAndVisible];
    [self dismissViewControllerAnimated:YES completion:nil];
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
