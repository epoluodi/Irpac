//
//  CameraRequest.m
//  SuEhome
//
//  Created by Stereo on 2017/1/12.
//  Copyright © 2017年 Suypower. All rights reserved.
//

#import "CameraRequest.h"
#import "CDVViewController.h"
#import "Plugins.h"

@implementation CameraRequest


-(void)chooseImage:(CDVInvokedUrlCommand *)command
{
    CDVViewController *cdv = (CDVViewController *)self.viewController;
    [self.commandDelegate runInBackground:^{
        [cdv OnMessage:CHOOSEIMAGE command:command];
    }];
}
@end
