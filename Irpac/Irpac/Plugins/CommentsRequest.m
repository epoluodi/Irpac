//
//  CommentsRequest.m
//  SuEhome
//
//  Created by Stereo on 2016/11/16.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import "CommentsRequest.h"
#import "CDVViewController.h"

@implementation CommentsRequest


-(void)init:(CDVInvokedUrlCommand *)command
{
    CDVViewController *cdv = (CDVViewController *)self.viewController;
    [self.commandDelegate runInBackground:^{
        [cdv OnMessage:COMMENTS_INIT command:command];
    }];
}

-(void)unInit:(CDVInvokedUrlCommand *)command
{
    CDVViewController *cdv = (CDVViewController *)self.viewController;
    [self.commandDelegate runInBackground:^{
        [cdv OnMessage:COMMENTS_UNINIT command:command];
    }];
}

-(void)updateState:(CDVInvokedUrlCommand *)command
{
    CDVViewController *cdv = (CDVViewController *)self.viewController;
    [self.commandDelegate runInBackground:^{
        [cdv OnMessage:COMMENTS_UPDATESTATE command:command];
    }];
}
@end
