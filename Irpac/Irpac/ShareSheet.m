//
//  ShareSheet.m
//  SuEhome
//
//  Created by Stereo on 2017/4/27.
//  Copyright © 2017年 Suypower. All rights reserved.
//

#import "ShareSheet.h"
#import <Common/PublicCommon.h>
#import "WXApiRequestHandler.h"

@implementation ShareSheet


-(instancetype)init:(NSString *)url title:(NSString *)title desc:(NSString *)desc thum:(NSString *)thum
{
    self = [super init];
    if (thum)
    {
        if (![thum isEqualToString:@"null"])
            _imgthumdata = [NSData dataWithContentsOfURL:[NSURL URLWithString:thum]];
        if (!_imgthumdata)
        {
            NSString *file = [[NSBundle mainBundle] pathForResource:@"logo60" ofType:@"png"];
            _imgthumdata = [NSData dataWithContentsOfFile:file];
        }
    }
    
    _title = title;
    _desc=desc;
    _url = url;
    
    return self;
}

-(UIAlertController *)showSheet
{
    

    
    alert = [UIAlertController alertControllerWithTitle:nil message:@"\n\n\n" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action];
    
    UIButton *btn1 = [[UIButton alloc] init];
    [btn1 setTitle:@"微信朋友" forState:UIControlStateNormal];
    [btn1 setBackgroundImage:[UIImage imageNamed:@"wxfriend"] forState:UIControlStateNormal];
    btn1.frame = CGRectMake(30 , 10, 50, 50);
    [btn1.titleLabel setFont:[UIFont systemFontOfSize:11]];
 
    [btn1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn1 setTitleEdgeInsets:UIEdgeInsetsMake(70, 0, 0, 0)];
    [btn1 addTarget:self action:@selector(sendWXFriend) forControlEvents:UIControlEventTouchUpInside];
    btn1.tag = 1;
    [alert.view addSubview:btn1];
   
    
    UIButton *btn2 = [[UIButton alloc] init];
    [btn2 setTitle:@"朋友圈" forState:UIControlStateNormal];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"wxgroup"] forState:UIControlStateNormal];
    btn2.frame = CGRectMake(btn1.frame.origin.x + 50 + 30 , 10, 50, 50);
    [btn2.titleLabel setFont:[UIFont systemFontOfSize:11]];
    
    [btn2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn2 setTitleEdgeInsets:UIEdgeInsetsMake(70, 0, 0, 0)];
    [btn2 addTarget:self action:@selector(sendWXGroup) forControlEvents:UIControlEventTouchUpInside];
    btn2.tag=2;
    [alert.view addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc] init];
    btn3.userInteractionEnabled=YES;
    [btn3 setTitle:@"复制" forState:UIControlStateNormal];
    [btn3 setBackgroundImage:[UIImage imageNamed:@"sharecopy"] forState:UIControlStateNormal];
    btn3.frame = CGRectMake(btn2.frame.origin.x + 50 + 30 , 10, 50, 50);
    [btn3.titleLabel setFont:[UIFont systemFontOfSize:11]];
    [btn3 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn3 setTitleEdgeInsets:UIEdgeInsetsMake(70, 0, 0, 0)];
    [btn3 addTarget:self action:@selector(copyinfo) forControlEvents:UIControlEventTouchUpInside];
    btn3.tag=3;
    [alert.view addSubview:btn3];
    
    UIButton *btn4 = [[UIButton alloc] init];
    [btn4 setTitle:@"发送短信" forState:UIControlStateNormal];
    [btn4 setBackgroundImage:[UIImage imageNamed:@"sms"] forState:UIControlStateNormal];
    btn4.frame = CGRectMake(btn3.frame.origin.x + 50 + 30 , 10, 50, 50);
    [btn4.titleLabel setFont:[UIFont systemFontOfSize:11]];
    [btn4 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn4 setTitleEdgeInsets:UIEdgeInsetsMake(70, 0, 0, 0)];
    [btn4 addTarget:self action:@selector(sendsms) forControlEvents:UIControlEventTouchUpInside];
    btn4.tag = 4;
    [alert.view addSubview:btn4];
    
    
    return alert;
}
#pragma mark share
-(void)sendWXFriend
{
    [alert dismissViewControllerAnimated:YES completion:nil];
    alert=nil;
    [WXApiRequestHandler sendLinkURL:_url TagName:@"zx" Title:_title Description:_desc ThumbImage:nil InScene:WXSceneSession];

}

-(void)sendWXGroup
{
    [alert dismissViewControllerAnimated:YES completion:nil];
    alert=nil;
    [WXApiRequestHandler sendLinkURL:_url TagName:@"zx" Title:_title Description:_desc ThumbImage:nil InScene:WXSceneTimeline];
}


-(void)copyinfo
{
    [alert dismissViewControllerAnimated:YES completion:nil];
    alert=nil;
    UIPasteboard *pasteboard;
    pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = [NSString stringWithFormat:@"%@\n%@",_title,_url];
}

-(void)sendsms
{
    [alert dismissViewControllerAnimated:YES completion:nil];
    alert=nil;
//    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"sms://13888888888"]];
    
    if( [MFMessageComposeViewController canSendText] )
    {
        MFMessageComposeViewController * controller;
    
        controller = [[MFMessageComposeViewController alloc] init];
//        controller.recipients = phones;
        controller.navigationBar.tintColor = [UIColor whiteColor];
        
        
        controller.body = [NSString stringWithFormat:@"%@\n%@",_title,_url];
        controller.messageComposeDelegate = self;
    
//        [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil] setTintColor:[UIColor whiteColor]];
//               NSDictionary *dic = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[UIColor colorWithRed:200 green:200 blue:200 alpha:1], [UIFont boldSystemFontOfSize:18.0f], [UIColor colorWithWhite:0.0 alpha:1], nil] forKeys:[NSArray arrayWithObjects:UITextAttributeTextColor, UITextAttributeFont, UITextAttributeTextShadowColor, nil]];
//        
//        [[UINavigationBar appearance] setTitleTextAttributes:dic];
  
        [_vc presentViewController:controller animated:YES completion:nil];
        
        
        
//        [[[[controller viewControllers] lastObject] navigationItem] setTitle:title];//修改短信界面标题
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示信息"
                                                        message:@"该设备不支持短信功能"
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }
    
    
}

-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    
    switch (result) {
        case MessageComposeResultSent:
            //信息传送成功
            
            break;
        case MessageComposeResultFailed:
            //信息传送失败
            
            break;
        case MessageComposeResultCancelled:
            //信息被用户取消传送
            [controller dismissViewControllerAnimated:YES completion:nil];
            break;
        default:
            break;
    }
}
@end
