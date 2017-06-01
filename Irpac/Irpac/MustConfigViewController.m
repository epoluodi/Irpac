//
//  MustConfigViewController.m
//  SuEhome
//
//  Created by Stereo on 2017/4/11.
//  Copyright © 2017年 Suypower. All rights reserved.
//

#import "MustConfigViewController.h"
#import "AppCommon.h"
#import "ToastView.h"
#import "HttpUserInfo.h"
#import <Common/PublicCommon.h>
@interface MustConfigViewController ()

@end

@implementation MustConfigViewController
@synthesize title;
@synthesize input;
@synthesize view,btnsave;
-(void)awakeFromNib
{
    [super awakeFromNib];
    [self setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.6f]];

    
    input.delegate=self;
    title.backgroundColor = APPCOLOR;
    title.textColor = [UIColor whiteColor];
    title.text = @"绑定手机号";
    
    view.backgroundColor = UIColorFromRGB(0xEAEAEA);
    view.layer.cornerRadius=6;
    view.layer.masksToBounds=YES;

    UILabel *lab = [[UILabel alloc] init];
    lab.text = @"+86";
    lab.textAlignment = NSTextAlignmentCenter;
    lab.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    lab.font = [UIFont systemFontOfSize:14];
    lab.frame = CGRectMake(5, 2, 38, 20);
    input.font = [UIFont systemFontOfSize:18];
    input.leftViewMode = UITextFieldViewModeAlways;
    [input setLeftView:lab];
    
    UIImage *back1 = [PublicCommon createImageWithColor:APPCOLOR Rect:CGRectMake(0, 0, 100, 100)];
    UIImage *back2 = [PublicCommon createImageWithColor:UIColorFromRGB(0xFF6347) Rect:CGRectMake(0, 0, 100, 100)];
    
    [btnsave setBackgroundImage:back1 forState:UIControlStateNormal];
    [btnsave setBackgroundImage:back2 forState:UIControlStateHighlighted];
    [btnsave setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btnsave.layer.cornerRadius=6;
    btnsave.layer.masksToBounds=YES;
    [btnsave addTarget:self action:@selector(clickbtnright) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)clickbtnright
{
    ToastView *hud = [[ToastView alloc] init:self Mode:MBProgressHUDModeIndeterminate];
    
    [hud showHud:0];
    dispatch_async(GLOBALQ, ^{
        HttpUserInfo *httpuserinfo = [[HttpUserInfo alloc] init];
        [httpuserinfo setPoseData:input.text Key:@"phone"];
//        [httpuserinfo setPoseData:([[AppInfo getInstance] getUserInfo].userType==OLDMAN)?@"2":@"1" Key:@"userType"];
        ReturnData *rd=  [httpuserinfo updateUserInfo];
        
        dispatch_async(MAINQ, ^{
            [hud hideHud];
            if (rd.returnCode != 0)
            {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"更新失败，请重新尝试" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
                [alert addAction:action];
                return ;
            }
            else
            {
//                [[AppInfo getInstance] getUserInfo].mobile = input.text;
                [self removeFromSuperview];
                return ;
            }

        });
    });
    
   

    
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([string isEqualToString:@""])
        return YES;
    if (textField.text.length <11)
        return YES;
    return NO;
}





@end
