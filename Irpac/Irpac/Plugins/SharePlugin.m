//
//  SharePlugin.m
//  SuEhome
//
//  Created by Stereo on 2017/4/27.
//  Copyright © 2017年 Suypower. All rights reserved.
//

#import "SharePlugin.h"
#import "CDVViewController.h"
#import "Plugins.h"


@implementation SharePlugin

-(void)share:(CDVInvokedUrlCommand *)command
{
    CDVViewController *cdv = (CDVViewController *)self.viewController;
    [self.commandDelegate runInBackground:^{
        [cdv OnMessage:SHAREINFO command:command];
    }];
}
@end
