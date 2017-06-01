//
//  SplashViewController.m
//  OldHome
//
//  Created by Stereo on 2016/11/1.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import "SplashViewController.h"
#import "LoginViewController.h"
#import "MainRootViewController.h"
#import "AppCommon.h"
#import <Common/FileCommon.h>

@interface SplashViewController ()

@end

@implementation SplashViewController
@synthesize splashimg;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.


    
}

-(void)viewDidAppear:(BOOL)animated
{
 

    AutoLogin *login = [[AutoLogin alloc] init];
    login.VC = self;
    [login autoLogin];
}


//登录成功
-(void)LoginSuccess
{
    

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MainRootViewController *mainvc = [storyboard instantiateViewControllerWithIdentifier:@"MainRootViewController"];
    [UIApplication sharedApplication].keyWindow.rootViewController = mainvc;
    [[UIApplication sharedApplication].keyWindow makeKeyAndVisible];
    [self dismissViewControllerAnimated:YES completion:nil];
    

}


//登录失败
-(void)Loginfail:(NSString *)msg
{
    if (!msg || [msg isEqualToString:@""])
        msg=@"网络异常，请稍后尝试";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginvc = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    
    
    [UIApplication sharedApplication].keyWindow.rootViewController = loginvc;
    [[UIApplication sharedApplication].keyWindow makeKeyAndVisible];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
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
