//
//  AppInfo.m
//  OldHome
//
//  Created by Stereo on 2016/11/4.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import "AppInfo.h"
#import "AppCommon.h"

@implementation AppInfo

@synthesize titleFont,subFont,fontSize;

static AppInfo *_self;

-(instancetype)init
{
    self = [super init];
    
    
    
    appRunInfo.deviceType = 1;
  
    _userinfo = [[UserInfo alloc] init];


    [self FirstRun];
    return self;
}

-(UserInfo *)getUserInfo
{
    return _userinfo;
}

-(struct AppRunInfo *)getAppRunInfo
{
    return &appRunInfo;
}

+(instancetype)getInstance
{
    if (!_self)
        _self = [[AppInfo alloc] init];
    return _self;
}


-(void)FirstRun
{
    if ( ![USER_DEFAULT boolForKey:@"isFrist"])
    {
        [USER_DEFAULT setBool:YES forKey:@"isFrist"];
        [USER_DEFAULT setObject:@"" forKey:@"username"];
        [USER_DEFAULT setObject:@"" forKey:@"userpwd"];
        [USER_DEFAULT setObject:@"" forKey:@"token"];
        [USER_DEFAULT setObject:@"" forKey:@"serverUrl"];
        [USER_DEFAULT synchronize];
        _userinfo.loginName = @"";
        _userinfo.loginPwd=@"";
    }
    else
    {
        _userinfo.loginName =[USER_DEFAULT objectForKey:@"username"];
        _userinfo.loginPwd =[USER_DEFAULT objectForKey:@"userpwd"];
        _token = [USER_DEFAULT objectForKey:@"token"];
     
    }
    
    
//    //检查数据库版本，不正确，重新创建
//    if (_dbver !=DBVER)
//    {
//        NSFileManager *filemanger = [NSFileManager defaultManager];
//        NSString *docs = [FileCommon getCacheDirectory];
//        [filemanger removeItemAtPath:[docs stringByAppendingPathComponent:@"Main.db"] error:nil];
//        [USER_DEFAULT setInteger:DBVER forKey:@"dbver"];
//        [USER_DEFAULT setInteger:-1 forKey:@"orgver"];
//        [USER_DEFAULT setInteger:-1 forKey:@"deptver"];
//        [USER_DEFAULT setInteger:-1 forKey:@"userver"];
//    }
//    @try {
//            [DBmanger getIntance];//连接本地本地数据库
//    } @catch (NSException *exception) {
//        NSFileManager *filemanger = [NSFileManager defaultManager];
//        NSString *docs = [FileCommon getCacheDirectory];
//        [filemanger removeItemAtPath:[docs stringByAppendingPathComponent:@"Main.db"] error:nil];
//        [DBmanger getIntance];//连接本地本地数据库
//
//    }

  
    
}


-(void)ClearInfo
{

    _userinfo=  nil;
    _self =nil;
    
}

@end
