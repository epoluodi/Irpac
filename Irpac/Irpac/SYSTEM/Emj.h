//
//  Emj.h
//  SuEhome
//
//  Created by Stereo on 2016/12/6.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Emj : NSObject
{
    NSArray *emojijson;
    NSMutableDictionary *emjdict;
    
}

//获得实例
+(instancetype)getEmj;

//插入一个表情
+(NSAttributedString *)getAttrString:(NSString *)string addimg:(UIImage *)img EmjString:(NSString *)emjstr Range:(NSRange)CurRange;
+(NSAttributedString *)tranTextToAttributedString:(NSString *)string;
+(NSAttributedString *)tranTextToAttributedString:(NSString *)string font:(UIFont *)font;
+(int)getStringEmjCount:(NSString *)string;
+(BOOL)stringInAllEmj:(NSString *)string;
+(NSString *)getStringWithEmjForSize:(NSString *)string;

//获取表情数据字典
-(NSDictionary *)getEmjKeyAndValue:(int)index;
-(NSData *)getEmjData:(NSString *)emjstring;
-(NSData *)getEmjDataForIndex:(int)index;
-(NSString *)getEmjFileName:(NSString *)emjimg;
//获取当前表情数量
-(NSInteger)getCount;

//获得表情文字宽度
+(CGSize)GetTextSize:(NSString *)content maxwidth:(int)width;
@end
