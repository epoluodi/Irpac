//
//  PreviewPlugin.m
//  SuEhome
//
//  Created by Stereo on 2017/5/9.
//  Copyright © 2017年 Suypower. All rights reserved.
//

#import "PreviewPlugin.h"
#import "CDVViewController.h"
#import "Plugins.h"

@implementation PreviewPlugin


-(void)webPreview:(CDVInvokedUrlCommand *)command
{
    CDVViewController *cdv = (CDVViewController *)self.viewController;
    [self.commandDelegate runInBackground:^{
        [cdv OnMessage:WEBPREVIEW command:command];
    }];
}

@end
