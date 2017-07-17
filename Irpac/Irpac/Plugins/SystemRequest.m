//
//  SystemRequest.m
//  SuEhome
//
//  Created by Stereo on 2016/11/10.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import "SystemRequest.h"
#import "CDVViewController.h"
#import "Plugins.h"
#import "ToastView.h"
#import <StoreKit/StoreKit.h>

@implementation SystemRequest


-(void)title:(CDVInvokedUrlCommand *)command
{
    CDVViewController *cdv = (CDVViewController *)self.viewController;
    [self.commandDelegate runInBackground:^{
        [cdv OnMessage:SETWEBTITLE command:command];
    }];
 
}

-(void)webrefresh:(CDVInvokedUrlCommand *)command
{
    CDVViewController *cdv = (CDVViewController *)self.viewController;
    [self.commandDelegate runInBackground:^{
        [cdv OnMessage:WEBREFRESH command:command];
    }];
}
-(void)navbar:(CDVInvokedUrlCommand *)command
{
    CDVViewController *cdv = (CDVViewController *)self.viewController;
    [self.commandDelegate runInBackground:^{
        [cdv OnMessage:SETNAVBAR command:command];
    }];
}

-(void)getLoginUser:(CDVInvokedUrlCommand *)command
{

    

    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                              [[AppInfo getInstance] getUserInfo].photo,@"avatar",
                              [[AppInfo getInstance] getUserInfo].userId,@"userId",
                              [[AppInfo getInstance] getUserInfo].nickName,@"nickName",
                              [[AppInfo getInstance] getUserInfo].officeName,@"officeName",
                              [[AppInfo getInstance] getUserInfo].gh,@"gh",
                              [AppInfo getInstance].token,@"token",
                              @"2",@"deviceType",nil];
        
        pluginResult  =[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:dict];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}
-(void)setLoginUser:(CDVInvokedUrlCommand *)command
{
    NSDictionary *dict =command.arguments[0];
    
    if ([dict objectForKey:@"avatar"])
    {
        [[AppInfo getInstance] getUserInfo].photo =[dict objectForKey:@"avatar"];
    }
    if ([dict objectForKey:@"nickName"])
    {
        [[AppInfo getInstance] getUserInfo].nickName =[dict objectForKey:@"nickName"];
    }
    if ([dict objectForKey:@"officeName"])
    {
        [[AppInfo getInstance] getUserInfo].officeName =[dict objectForKey:@"officeName"];
    }
}

-(void)toast:(CDVInvokedUrlCommand *)command
{
    NSString *info = command.arguments[0];
    [self.commandDelegate runInBackground:^{
        MAIN(^{
            ToastView *toast = [[ToastView alloc] init:self.viewController.view Mode:MBProgressHUDModeText];
            [toast setInfo:info];
            [toast showHud:1.3];
        });
    }];
}


-(void)openAppStore:(CDVInvokedUrlCommand *)command
{
    SKStoreProductViewController *storeviewcontroller;
    NSString *appid =command.arguments[0];
    __weak CDVViewController *cdv = (CDVViewController *)self.viewController;
    [self.commandDelegate runInBackground:^{
        MAIN(^{
            NSDictionary *dict = [NSDictionary dictionaryWithObject:appid forKey:SKStoreProductParameterITunesItemIdentifier];
            [storeviewcontroller loadProductWithParameters:dict completionBlock:^(BOOL result, NSError *error) {
                if (result) {
                    [cdv presentViewController:storeviewcontroller animated:YES completion:nil];
                }
            }];
        });
    }];
}

-(void)setBadgeItemCount:(CDVInvokedUrlCommand *)command
{
    CDVViewController *cdv = (CDVViewController *)self.viewController;
    [self.commandDelegate runInBackground:^{
        [cdv OnMessage:TABBARBADGE command:command];
    }];
}

-(void)exitSystem:(CDVInvokedUrlCommand *)command
{
    CDVViewController *cdv = (CDVViewController *)self.viewController;
    [self.commandDelegate runInBackground:^{
        [cdv OnMessage:EXITSYSTEM command:command];
    }];
}
@end
