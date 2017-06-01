//
//  AjaxRequest.m
//  SuEhome
//
//  Created by Stereo on 2016/11/11.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import "AjaxRequest.h"
#import "BaseHttp.h"

@implementation AjaxRequest


-(void)post:(CDVInvokedUrlCommand *)command
{
    
    [self.commandDelegate runInBackground:^{
         NSDictionary * arg = [command.arguments objectAtIndex:0];
        NSString *_url = [NSString stringWithFormat:@"%@%@",HOST, [arg objectForKey:@"url"]];
        BaseHttp *_http = [[BaseHttp alloc] init];
        NSData *data;
        if ([arg objectForKey:@"param"] == [NSNull null])
            data = [_http getPost:nil url:_url];
        else
            data = [_http getPost:[arg objectForKey:@"param"] url:_url];

        
        CDVPluginResult* pluginResult = nil;

        if (data)
        {
            
            if ([[arg objectForKey:@"dataType"] isEqualToString:@"json"])
            {
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                pluginResult  =[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:json];
            }
            else
            {
                NSString *strjson = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                pluginResult  =[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:strjson];
            }
        }
        else
        {
            pluginResult  =[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"请求失败"];
        }
        
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}
@end
