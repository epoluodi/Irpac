//
//  SignViewController.m
//  Irpac
//
//  Created by Stereo on 2017/6/15.
//  Copyright © 2017年 Suypower. All rights reserved.
//

#import "SignViewController.h"
#import <Common/PublicCommon.h>
#import "AppCommon.h"
#import "ToastView.h"
#import "CordovaWebViewController.h"
@interface SignViewController ()

@end

@implementation SignViewController
@synthesize backview;
- (void)viewDidLoad {
    [super viewDidLoad];
    

    
       // Do any additional setup after loading the view.
}


-(void)updateViewConstraints
{
    [super updateViewConstraints];
    
    

    _signview.backgroundColor = [UIColor clearColor];

    
    backview.layer.shadowColor = [[[UIColor blackColor] colorWithAlphaComponent:0.6] CGColor];
    backview.layer.shadowOffset = CGSizeMake(0, 6);
    backview.layer.shadowRadius = 6;
    backview.layer.shadowOpacity=0.8f;
    
    btn1 = [[UIButton alloc] init];
    btn2 = [[UIButton alloc] init];
    btn3 = [[UIButton alloc] init];
    
    btn1.layer.cornerRadius=4;
    btn1.layer.masksToBounds=YES;
    
    btn2.layer.cornerRadius=4;
    btn2.layer.masksToBounds=YES;
    
    btn3.layer.cornerRadius=4;
    btn3.layer.masksToBounds=YES;
    
    btn1.frame= CGRectMake(16, [PublicCommon GetALLScreen].size.height - 66,
                           [PublicCommon GetALLScreen].size.width /3  -16 -10, 50);
    btn2.frame= CGRectMake(10 + btn1.frame.size.width+10+16, [PublicCommon GetALLScreen].size.height - 66,
                           [PublicCommon GetALLScreen].size.width /3  -16 -10, 50);
    btn3.frame= CGRectMake(btn2.frame.origin.x + btn2.frame.size.width +10+16, [PublicCommon GetALLScreen].size.height - 66,
                           [PublicCommon GetALLScreen].size.width /3  -16 -10, 50);
    
    UIImage *back1 = [PublicCommon createImageWithColor:APPCOLOR Rect:CGRectMake(0, 0, 100, 100)];
    UIImage *back2 = [PublicCommon createImageWithColor:UIColorFromRGB(0x1b82c0) Rect:CGRectMake(0, 0, 100, 100)];
    
    [btn3 setBackgroundImage:back1 forState:UIControlStateNormal];
    [btn3 setBackgroundImage:back2 forState:UIControlStateHighlighted];
    
    [btn1 setTitle:@"返回" forState:UIControlStateNormal];
    [btn2 setTitle:@"清除" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(clickreturn) forControlEvents:UIControlEventTouchUpInside];
    [btn2 addTarget:self action:@selector(clickClear) forControlEvents:UIControlEventTouchUpInside];
    [btn3 addTarget:self action:@selector(saveSignImg) forControlEvents:UIControlEventTouchUpInside];
    [btn3 setTitle:@"确认" forState:UIControlStateNormal];
    UIImage *back3 = [PublicCommon createImageWithColor:[UIColor grayColor] Rect:CGRectMake(0, 0, 100, 100)];
    UIImage *back4 = [PublicCommon createImageWithColor:[[UIColor grayColor] colorWithAlphaComponent:0.5] Rect:CGRectMake(0, 0, 100, 100)];
    
    [btn1 setBackgroundImage:back3 forState:UIControlStateNormal];
    [btn1 setBackgroundImage:back4 forState:UIControlStateHighlighted];

    [btn2 setBackgroundImage:back3 forState:UIControlStateNormal];
    [btn2 setBackgroundImage:back4 forState:UIControlStateHighlighted];
    [self.view addSubview:btn1];
    [self.view addSubview:btn2];
    [self.view addSubview:btn3];
}
//自动旋转取消
-(BOOL)shouldAutorotate
{
    return NO;
}


-(void)clickreturn
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)clickClear
{
    [_signview erase];
}

-(void)saveSignImg
{
    UIImage *img = [_signview signatureImage];
    if (!img)
    {
        ToastView *toast = [[ToastView alloc] init:self.view Mode:MBProgressHUDModeText];
        [toast setInfo:@"没有签名信息"];
        [toast showHud:0.8];
        return;
    }
    
    NSData *jpgdata = UIImageJPEGRepresentation(img, 0);
    NSString *fileuuid = [[NSUUID UUID] UUIDString];
    NSString *cachefilePath = [FileCommon getCacheDirectory];
    NSString *filePath =[cachefilePath stringByAppendingPathComponent:    [NSString stringWithFormat:@"%@.jpg",fileuuid]];
    [jpgdata writeToFile:filePath atomically:YES];
    
    [((CordovaWebViewController *)_delegate) saveSignImg:fileuuid jsFun:_jsFun];
  
    [self clickreturn];

}

-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationLandscapeRight;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
