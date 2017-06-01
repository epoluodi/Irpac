//
//  HttpUserInfo.h
//  SuEhome
//
//  Created by 程嘉雯 on 16/11/7.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import "BaseHttp.h"
#import "AppInfo.h"

//用户基本信息
#define getperson  [NSString stringWithFormat:@"%@getUserDetail",AppUrl]

//用户基本信息
#define getfamilylist  [NSString stringWithFormat:@"%@person/families",AppUrl]

//更新用户信息
#define updateuserinfo [NSString stringWithFormat:@"%@person/update",AppUrl]


#define getWelComeImg  [NSString stringWithFormat:@"%@welpage/get",AppUrl]


@interface HttpUserInfo : BaseHttp


//获取用户基本信息
-(ReturnData *)getBaseUserInfo;




//更新用户信息
-(ReturnData *)updateUserInfo;

//下载欢迎页
-(void)downloadWelComeImg;
@end
