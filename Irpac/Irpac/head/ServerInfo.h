//
//  ServerInfo.h
//  OldHome
//
//  Created by Stereo on 2016/11/1.
//  Copyright © 2016年 Suypower. All rights reserved.
//



//#define HOST @"http://192.168.0.124:8080/riskControl/app"
//#define HOST1 @"http://app.njhd.com.cn/riskControl"
#define HOST1 @"http://192.168.0.124:8080/Irpac"
#import "AppCommon.h"
#define HOST [NSString stringWithFormat:@"http://%@/riskControl/app",[USER_DEFAULT objectForKey:@"serverUrl"]]
//#define HOST1 [NSString stringWithFormat:@"http://%@/riskControl",[USER_DEFAULT objectForKey:@"serverUrl"]]




#define AuthUrl                  [NSString stringWithFormat:@"%@/sysItf/",HOST]
#define AppUrl                   [NSString stringWithFormat:@"%@/sysItf/",HOST]
#define IMUrl                     [NSString stringWithFormat:@"%@/im/",HOST]
#define APIUrl                    [NSString stringWithFormat:@"%@/api/",HOST]
#define AppUpgradeUrl       [NSString stringWithFormat:@"%@/upgrade/",HOST]
#define ArticleUrl               [NSString stringWithFormat:@"%@/article/",HOST]
#define MobileUrl               [NSString stringWithFormat:@"%@/mobile/",HOST]


//标签页
#define Tab1Url1                [NSString stringWithFormat:@"%@/mobile/html/home/index.html",HOST1]
#define Tab1Url2                [NSString stringWithFormat:@"%@/mobile/html/notice/index.html",HOST1]
#define Tab1Url3                [NSString stringWithFormat:@"%@/mobile/html/mine/index.html",HOST1]

//亲情
#define FamilyUrl               [NSString stringWithFormat:@"%@/html/mobile/family/index.html",HOST1]

//意见反馈
#define FeedbackUrl           [NSString stringWithFormat:@"%@/html/mobile/help/feedBack.html",HOST1]


//提交月报
#define ReportUrl               [NSString stringWithFormat:@"%@/html/mobile/report/index.html",HOST1]


#import "HttpClass.h"
#import "ReturnData.h"
