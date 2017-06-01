//
//  UserInfo.h
//  OldHome
//
//  Created by Stereo on 2016/11/4.
//  Copyright © 2016年 Suypower. All rights reserved.
//





#import <Foundation/Foundation.h>


typedef enum : NSUInteger {
    MALE,
    FEMALE,
} SexEnum;

typedef enum : NSUInteger {
    OLDMAN,
    WORKER,
} UserTypeEnum;

@interface UserInfo : NSObject

//登录用户名
@property (copy,nonatomic)NSString *loginName;
//登录用户名密码
@property (copy,nonatomic)NSString *loginPwd;
//昵称
@property (copy,nonatomic)NSString *nickName;
//真实姓名
@property (copy,nonatomic)NSString *realName;
//用户ID
@property (copy,nonatomic)NSString *userId;

//头像ID
@property (copy,nonatomic)NSString *photo;
//部门名称
@property (copy,nonatomic)NSString *officeName;
//部门名称id
@property (copy,nonatomic)NSString *gh;


@end
