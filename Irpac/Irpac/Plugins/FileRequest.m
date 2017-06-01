//
//  FileRequest.m
//  SuEhome
//
//  Created by Stereo on 2017/1/12.
//  Copyright © 2017年 Suypower. All rights reserved.
//

#import "FileRequest.h"
#import "HttpFile.h"
#import "AppCommon.h"
@implementation FileRequest


-(void)upload:(CDVInvokedUrlCommand *)command
{
    [self.commandDelegate runInBackground:^{
        __block NSMutableArray *fileids = [[NSMutableArray alloc] init];
    
        
        dispatch_group_t group = dispatch_group_create();
        
        __block BOOL ret=YES;
        for (NSString *mediaid in command.arguments) {
            dispatch_group_async(group, GLOBALQ, ^{
                HttpFile *httpfile =[[HttpFile alloc] init];
                ReturnData *rd =  [httpfile uploadFile:mediaid mediaType:@"02" imageType:@"02"];
                if (rd.returnCode !=0 )
                    ret=NO;
                [fileids addObject:[rd.returnData objectForKey:@"mediaId"]];
            });
        }
        
        dispatch_group_notify(group, GLOBALQ, ^{
            NSLog(@"%@",fileids);
            CDVPluginResult* pluginResult;
            if (ret)
                pluginResult  =[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArray:fileids];
            else
                pluginResult  =[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"上传失败"];
             [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        });

    }];

}
@end
