//
//  STCommon.m
//  SuEhome
//
//  Created by Stereo on 2016/11/8.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import "STCommon.h"
#import <Common/FileCommon.h>
#import<CommonCrypto/CommonDigest.h>

@implementation STCommon


+(BOOL)CheckFileForcache:(NSString *)mediaId filetype:(NSString *)filetype
{
    NSFileManager *filenamger = [NSFileManager defaultManager];
    NSString *path = [FileCommon getCacheDirectory];
    NSString *filepath =[path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@%@",mediaId,filetype]];
    
    return [filenamger fileExistsAtPath:filepath];
}


+(NSString *)PingYingTran:(NSString *)str
{

    if ([str length]) {
        NSMutableString *ms = [[NSMutableString alloc] initWithString:str];
        if (CFStringTransform((__bridge CFMutableStringRef)ms, 0, kCFStringTransformMandarinLatin, NO)) {
            NSLog(@"pinyin: %@", ms);
        }
        if (CFStringTransform((__bridge CFMutableStringRef)ms, 0, kCFStringTransformStripDiacritics, NO)) {
            NSLog(@"pinyin: %@", ms);
        }
        return [ms stringByReplacingOccurrencesOfString:@" " withString:@""];
    }
    return nil;
}


+(NSString *)getLongNowDate
{
    return [NSString stringWithFormat:@"%ld", (long)([[NSDate date] timeIntervalSince1970] *1000)];
}

+(NSString *)getStringDateTimeForLongDT:(NSString*)longdt
{
    NSDate *dt =  [NSDate dateWithTimeIntervalSince1970:[longdt doubleValue] /1000];
    NSDateFormatter *dtformat = [[NSDateFormatter alloc] init];
    dtformat.dateFormat = @"YYYY-MM-dd HH:mm:ss";
    return [dtformat stringFromDate:dt];
}

+(NSString *)getStringDateForLongDT:(NSString*)longdt
{
    NSDate *dt =  [NSDate dateWithTimeIntervalSince1970:[longdt doubleValue] /1000];
    NSDateFormatter *dtformat = [[NSDateFormatter alloc] init];
    dtformat.dateFormat = @"MM月dd日";
    return [dtformat stringFromDate:dt];
}


+(NSDate *)getDateTimeForLongDT:(NSTimeInterval)longdt
{
    NSDate *dt =  [NSDate dateWithTimeIntervalSince1970:longdt /1000];
    return dt;
}

//播放系统声音


//建立声音对象
static SystemSoundID  soundFileObject;
+(void)playMsgSound:(NSString *)soundname {
    
    NSString *Path=[[NSBundle mainBundle] pathForResource:soundname ofType:@"wav"];
    NSURL *soundfileURL=[NSURL fileURLWithPath:Path];
    
    //建立音效对象
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundfileURL, &soundFileObject);
    AudioServicesAddSystemSoundCompletion (soundFileObject, NULL, NULL,completionCallback,(__bridge void*) self);
    AudioServicesPlaySystemSound(soundFileObject);
}



//回调
static void completionCallback(SystemSoundID  mySSID, void* myself)
{
    NSLog(@"soundid %d",mySSID);
    AudioServicesDisposeSystemSoundID(mySSID);
}


+ (NSString *) md5:(NSString *) input {
    const char *cStr = [input UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
    {
        [output appendFormat:@"%02x", digest[i]];
    }
//
    
    return  output;
}



@end
