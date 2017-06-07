//
//  HttpUserInfo.m
//  SuEhome
//
//  Created by 程嘉雯 on 16/11/7.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import "HttpUserInfo.h"
#import "DBmanger.h"
#import "HttpFile.h"
#import "AppCommon.h"
#import "AppDelegate.h"

@implementation HttpUserInfo

-(ReturnData *)getBaseUserInfo
{
    _http.WebServiceUrl = getperson;
    [_http addParamsString:@"userId" values:[[AppInfo getInstance]getUserInfo ].userId];
    NSData * ret =  [_http httprequest:[_http getDataForArrary]];
    
    ReturnData *rd = [ReturnData getReturnDatawithData:ret dataMode:YES];

    NSLog(@"用户基本信息 %@", rd.returnData);
    NSDictionary *d = rd.returnData;
    [[AppInfo getInstance] getUserInfo].nickName =      [d objectForKey:@"userName"];
    [[AppInfo getInstance] getUserInfo].realName =      [d objectForKey:@"userName"];
    if ([d objectForKey:@"photo"] == [NSNull null])
        [[AppInfo getInstance] getUserInfo].photo =@"";
    else
        [[AppInfo getInstance] getUserInfo].photo =        [d objectForKey:@"photo"];
    [[AppInfo getInstance] getUserInfo].officeName =         [d objectForKey:@"officeName"];
    [[AppInfo getInstance] getUserInfo].gh =         [d objectForKey:@"gh"];
    
    return  rd;
}



-(ReturnData *)updateUserInfo
{
    _http.WebServiceUrl = updateuserinfo;
    NSData * ret =  [_http httprequest:[_http getDataForArrary]];
    ReturnData *rd = [ReturnData getReturnDatawithData:ret dataMode:YES];
    NSLog(@"更新用户返回 %@", rd.returnDatas);
    return  rd;
}

-(void)downloadWelComeImg
{
    _http.WebServiceUrl = getWelComeImg;
    NSData * ret =  [_http httprequest:nil];
    ReturnData *rd = [ReturnData getReturnDatawithData:ret dataMode:YES];
    NSLog(@"下载欢迎页%@",rd.returnData);

    if (rd.returnCode == 0){
        NSString *pageid = [rd.returnData objectForKey:@"pageId"];
        NSString *url =[rd.returnData objectForKey:@"uri"];
        NSString *oldimgid =[USER_DEFAULT objectForKey:@"splashimg"];
        if (![oldimgid isEqualToString:pageid])
        {
            [USER_DEFAULT setObject:pageid forKey:@"splashimg"];
            NSData *imgdata = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
            NSString *filePath = [FileCommon getCacheDirectory];
            NSString *imgfilePath =[filePath stringByAppendingPathComponent:    [NSString stringWithFormat:@"%@.jpg",pageid]];
            [imgdata writeToFile:imgfilePath atomically:YES];
            
            imgfilePath =[filePath stringByAppendingPathComponent:    [NSString stringWithFormat:@"%@.jpg",oldimgid]];
            NSFileManager *filemanger = [NSFileManager defaultManager];
            [filemanger removeItemAtPath:imgfilePath error:nil];
        }
        
    }
}

@end
