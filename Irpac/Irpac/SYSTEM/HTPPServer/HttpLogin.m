//
//  HttpLogin.m
//  SuEhome
//
//  Created by Stereo on 2016/11/7.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import "HttpLogin.h"
#import "AppCommon.h"
#import <Common/PublicCommon.h>
#import "AppInfo.h"



@implementation HttpLogin


-(instancetype)init:(NSString *)username pwd:(NSString *)pwd
{
    self  = [super init];
    _weburl = [NSString stringWithFormat:@"%@",getToken];
    
    [_http addParamsString:@"userName" values:username];
    [_http addParamsString:@"pwd" values:pwd];
    [_http addParamsString:@"deviceId" values:[[UIDevice currentDevice].identifierForVendor UUIDString]];
    [_http addParamsString:@"deviceType" values:@"1"];
    if ([AppInfo getInstance].token)
        [_http addHeadString:@"token" value:[AppInfo getInstance] .token];
    return self;
}


-(ReturnData *)Login
{
    
    _http.WebServiceUrl = _weburl;

    NSData * ret =  [_http httprequest:[_http getDataForArrary]];
    ReturnData *rd = [ReturnData getReturnDatawithData:ret dataMode:YES];
    NSLog(@"登录返回 %@",[[NSString alloc] initWithData:ret encoding:NSUTF8StringEncoding]);
    if (rd.returnCode == 0  )
    {
        
        NSDictionary *d = rd.returnData;
        [[AppInfo getInstance] getUserInfo].userId =[d objectForKey:@"userId"];
      

        [AppInfo getInstance].token=[d objectForKey:@"token"] ;
        

    }
    
    return rd;
    
}


-(ReturnData *)submitAppleToken:(NSString *)token
{
    _http.WebServiceUrl = setAppleToken;
    [_http addParamsString:@"iosToken" values:token];
    NSData * ret =  [_http httprequest:[_http getDataForArrary] ];
    ReturnData *rd = [ReturnData getReturnDatawithData:ret dataMode:YES];
    NSLog(@"提交token %@",rd.returnData);
    return rd;
}



@end
