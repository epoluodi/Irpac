//
//  WebViewRequest.m
//  SuEhome
//
//  Created by Stereo on 2016/11/10.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import "WebViewRequest.h"
#import "CDVViewController.h"
#import "Plugins.h"

@implementation WebViewRequest


-(void)open:(CDVInvokedUrlCommand *)command
{
    CDVViewController *cdv = (CDVViewController *)self.viewController;
    [self.commandDelegate runInBackground:^{
        [cdv OnMessage:OPENWINDOWS command:command];
    }];
}


-(void)close:(CDVInvokedUrlCommand *)command
{
    CDVViewController *cdv = (CDVViewController *)self.viewController;
    [self.commandDelegate runInBackground:^{
        [cdv OnMessage:CLOSEWINDOWS command:command];
    }];
}

-(void)closeEvent:(CDVInvokedUrlCommand *)command
{
    CDVViewController *cdv = (CDVViewController *)self.viewController;
    [self.commandDelegate runInBackground:^{
        [cdv OnMessage:CLOSEEVENT command:command];
    }];
}

-(void)setBarRight:(CDVInvokedUrlCommand *)command
{
    CDVViewController *cdv = (CDVViewController *)self.viewController;
    [self.commandDelegate runInBackground:^{
        [cdv OnMessage:SETBARRIGHT command:command];
    }];
}
@end
