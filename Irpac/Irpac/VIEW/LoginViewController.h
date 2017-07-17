//
//  LoginViewController.h
//  OldHome
//
//  Created by Stereo on 2016/11/1.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppCommon.h"
#import "AutoLogin.h"
#import "STImageView.h"
@interface LoginViewController : UIViewController<AutoLoginDelegate,UITextFieldDelegate>
{
    ToastView *hud;
    UITextField *serverUrl;
}

@property (weak, nonatomic) IBOutlet STImageView *nickimg;

@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *userpwd;
@property (weak, nonatomic) IBOutlet UIButton *btnlogin;

@property (weak, nonatomic) IBOutlet UIView *loginview;
@property (weak, nonatomic) IBOutlet UIButton *btnserverurl;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *top1;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *top2;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *top3;



- (IBAction)ClickserverUrl:(id)sender;
- (IBAction)ClickLogin:(id)sender;

@end
