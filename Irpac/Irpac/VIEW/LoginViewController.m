//
//  LoginViewController.m
//  OldHome
//
//  Created by Stereo on 2016/11/1.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import "LoginViewController.h"
#import <Common/PublicCommon.h>
#import "MainRootViewController.h"



@interface LoginViewController ()
{
  
}
@end

@implementation LoginViewController
@synthesize username,userpwd;
@synthesize loginview;
@synthesize btnlogin;
@synthesize nickimg;
@synthesize serverUrl;
- (void)viewDidLoad {
    [super viewDidLoad];
    

    [nickimg setRadius];
    
    btnlogin.layer.cornerRadius=4;
    btnlogin.layer.masksToBounds=YES;
    
    
    UIView *_lineview = [[UIView alloc] init];
    _lineview.frame= CGRectMake(16, 105/2, [PublicCommon GetScreen].size.width -32, 1);
    _lineview.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.15f];
    [loginview addSubview:_lineview];
    
    UIImage *back1 = [PublicCommon createImageWithColor:APPCOLOR Rect:CGRectMake(0, 0, 100, 100)];
    UIImage *back2 = [PublicCommon createImageWithColor:UIColorFromRGB(0x1b82c0) Rect:CGRectMake(0, 0, 100, 100)];
    
    [btnlogin setBackgroundImage:back1 forState:UIControlStateNormal];
    [btnlogin setBackgroundImage:back2 forState:UIControlStateHighlighted];
    
//    username.inputAccessoryView = [PublicCommon getInputToolbar:self sel:@selector(closeInputboard)];
//    userpwd.inputAccessoryView = [PublicCommon getInputToolbar:self sel:@selector(closeInputboard)];
//    username.delegate = self;
    
    [username setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    //显示 登录名称
    username.text = [[AppInfo getInstance] getUserInfo].loginName;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeInputboard)];
    [self.view addGestureRecognizer:tap];
    serverUrl.text  = [USER_DEFAULT objectForKey:@"serverUrl"];
    

    userpwd.delegate=self;
//    NSString *userimg = [USER_DEFAULT stringForKey:username.text];
//    if (userimg)
//    {
//        [nickimg setMediaIdLoadImg:userimg filesize:@""];
//    }
    
    if (iPhone4){
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardWillShowNotification object:nil];
        //注册键盘消失的通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardWillHideNotification object:nil];
    }
    
    

        // Do any additional setup after loading the view.
}



//键盘关闭通知
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    //键盘高度
    CGRect keyBoardFrame = [[[aNotification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    [UIView animateWithDuration:0.4 animations:^{
        nickimg.hidden = YES;
        loginview.transform = CGAffineTransformMakeTranslation(0, -180);
        btnlogin.transform = CGAffineTransformMakeTranslation(0, -180);
        [self.view layoutIfNeeded];
    }];
    
}


//键盘消失
-(void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    [UIView animateWithDuration:0.4 animations:^{
        nickimg.hidden = NO;
        loginview.transform = CGAffineTransformIdentity;
        btnlogin.transform = CGAffineTransformIdentity;
    }];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == userpwd)
    {
        [self ClickLogin:textField];
    }
    return YES;
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([string isEqualToString:@""])
        return YES;
    if (textField == username)
    {
        if (textField.text.length<19)
            return YES;
        return NO;
    }

    return YES;
}
-(void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason
{
    if (textField == username){
        nickimg.image = [UIImage imageNamed:@"default_user"];
        NSString *userimg = [USER_DEFAULT stringForKey:textField.text];
        if (userimg)
        {
            [nickimg setMediaIdLoadImg:userimg filesize:@""];
        }
    }
}


-(void)closeInputboard
{
    [username resignFirstResponder];
    [userpwd resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    
//  
//}


- (IBAction)ClickLogin:(id)sender {
    
    
    [self closeInputboard];
    
    if (![serverUrl.text isEqualToString:@""])
    {
        [USER_DEFAULT setObject:serverUrl.text forKey:@"serverUrl"];
    }
    
    if ([username.text isEqualToString:@""] )
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入账号" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }
    if ([userpwd.text isEqualToString:@""] )
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入密码" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }
    
    hud = [[ToastView alloc] init:self.view Mode:MBProgressHUDModeIndeterminate];

    [hud setInfo:@"登录中"];
    [hud showHud:0];
    AutoLogin *autologin = [[AutoLogin alloc] init];
    autologin.VC=self;
    NSString *md5pwd = [STCommon md5:userpwd.text];
    NSLog(@"md5 %@",md5pwd);
    
    [autologin login:username.text pwd:md5pwd];
    
    
    
//    [self performSegueWithIdentifier:@"showMainRoot" sender:self];
}


-(void)LoginSuccess
{
    [hud hideHud];
    if ([[AppInfo getInstance] getUserInfo].photo == [NSNull null])
        [USER_DEFAULT setObject:@"" forKey:[[AppInfo getInstance] getUserInfo].loginName];
    else
        [USER_DEFAULT setObject:[[AppInfo getInstance] getUserInfo].photo forKey:[[AppInfo getInstance] getUserInfo].loginName];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MainRootViewController *mainvc = [storyboard instantiateViewControllerWithIdentifier:@"MainRootViewController"];
    
    
    if (iPhone4){
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    }
    
    
    [UIApplication sharedApplication].keyWindow.rootViewController = mainvc;
    [[UIApplication sharedApplication].keyWindow makeKeyAndVisible];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
}

-(void)Loginfail:(NSString *)msg
{
    [hud hideHud];
    if (!msg || [msg isEqualToString:@""])
        msg=@"网络异常，请稍后尝试";
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)dealloc
{
    if (iPhone4){
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    }
}
@end
