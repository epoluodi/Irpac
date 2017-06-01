//
//  STCommon.h
//  SuEhome
//
//  Created by Stereo on 2016/11/8.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>


@interface STCommon : NSObject
{
    
}

//检查文件是否存在
+(BOOL)CheckFileForcache:(NSString *)mediaId filetype:(NSString *)filetype;

//汉子转拼音
+(NSString *)PingYingTran:(NSString *)str;

+(NSString *)getLongNowDate;//得到当前时间的long
+(NSString *)getStringDateTimeForLongDT:(NSString*)longdt;
+(NSString *)getStringDateForLongDT:(NSString*)longdt;
+(NSDate *)getDateTimeForLongDT:(NSTimeInterval )longdt;
+(void)playMsgSound:(NSString *)soundname;
+ (NSString *) md5:(NSString *) input;
@end
