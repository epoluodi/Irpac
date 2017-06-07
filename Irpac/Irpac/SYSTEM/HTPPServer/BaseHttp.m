//
//  BaseHttp.m
//  SuEhome
//
//  Created by Stereo on 2016/11/4.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import "BaseHttp.h"
#import "AppCommon.h"
@implementation BaseHttp


-(instancetype)init
{
    self = [super init];
    _http = [[HttpClass alloc] init];
    [_http setIsHead:YES];

    if ([AppInfo getInstance].token)
        [_http addHeadString:@"token" value:[AppInfo getInstance].token];
    

    [_http addHeadString:@"deviceID" value:[[UIDevice currentDevice].identifierForVendor UUIDString] ];
    [_http addHeadString:@"deviceType" value:@"1"];
    return self;
}


-(NSData *)getPost:(NSDictionary *)postdata url:(NSString *)url
{
    _http.WebServiceUrl = url;
    NSData *d = [_http httprequest:[_http dataEncodeDictionary:postdata]];
    return d;
}

-(void)setPoseData:(NSString *)data Key:(NSString *)key
{
    [_http addParamsString:key values:data];
}

-(void)clearPostData
{
    [_http clearArray];
}
@end
