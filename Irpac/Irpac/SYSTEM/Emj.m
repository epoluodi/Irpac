//
//  Emj.m
//  SuEhome
//
//  Created by Stereo on 2016/12/6.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import "Emj.h"
#import "AppCommon.h"
static Emj *_emj;
@implementation Emj


+(instancetype)getEmj
{
    if (!_emj)
        _emj = [[Emj alloc] init];
    return _emj;
}




-(instancetype)init
{
    self = [super init];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"emoji" ofType:@"json"];
    NSData *emjdata = [NSData dataWithContentsOfFile:filePath];
    emjdict = [[NSMutableDictionary alloc] init];

    emojijson = [NSJSONSerialization JSONObjectWithData:emjdata options:NSJSONReadingMutableContainers error:nil];
    
    for (NSDictionary *_d in emojijson) {
        NSString *str =[_d objectForKey:@"emojiwildcard"];
        [emjdict setObject:[_d objectForKey:@"emojifile"] forKey:[str substringWithRange:NSMakeRange(1, str.length-2)]];
    }
    
    return self;
}

-(NSInteger)getCount
{
    return emojijson.count;
}

-(NSDictionary *)getEmjKeyAndValue:(int)index
{
    return  ((NSDictionary *)emojijson[index]);
}

-(NSString *)getEmjFileName:(NSString *)emjimg
{
    return [emjdict objectForKey:emjimg];
}
-(NSData *)getEmjData:(NSString *)emjstring
{
    NSString *_emjstr = [emjdict objectForKey:emjstring];
    if(!_emjstr)
        return nil;
    NSString *filePath = [[NSBundle mainBundle] pathForResource:_emjstr ofType:@"png"];
    NSData *emjdata = [NSData dataWithContentsOfFile:filePath];
    return emjdata;
}

-(NSData *)getEmjDataForIndex:(int)index
{
    NSDictionary *d = [self getEmjKeyAndValue:index];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:[d objectForKey:@"emojifile"] ofType:@"png"];
    NSData *emjdata = [NSData dataWithContentsOfFile:filePath];
    return emjdata;
}


+(NSAttributedString *)getAttrString:(NSString *)string addimg:(UIImage *)img EmjString:(NSString *)emjstr Range:(NSRange)CurRange
{
      NSLog(@"文字 %@",string);
    NSMutableAttributedString * mutStr = [[NSMutableAttributedString alloc] initWithString:string];
    [mutStr insertAttributedString:[[NSMutableAttributedString alloc] initWithString:emjstr] atIndex:CurRange.location];
    
//    NSTextAttachment * attachment1 = [[NSTextAttachment alloc] init];
//    attachment1.bounds = CGRectMake(0, 0, 22, 22);
//    attachment1.image = img;
//    NSAttributedString * attachStr1 = [NSAttributedString attributedStringWithAttachment:attachment1];

    
  
    NSLog(@"文字 %@",[mutStr string]);
//    [mutStr insertAttributedString:attachStr1 atIndex:mutStr.length];
    [mutStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:18.0 + [AppInfo getInstance].fontSize] range:NSMakeRange(0, mutStr.length)];
    
    return mutStr;//[Emj tranTextToAttributedString:mutStr.string];
}


//查找字符串中标签占位符
+(NSAttributedString *)tranTextToAttributedString:(NSString *)string
{
  
    return [Emj tranTextToAttributedString:string font:[UIFont systemFontOfSize:18 + [AppInfo getInstance].fontSize]];
}


+(NSAttributedString *)tranTextToAttributedString:(NSString *)string font:(UIFont *)font
{
    NSMutableAttributedString * mutStr = [[NSMutableAttributedString alloc] initWithString:string];
    
    Emj *emj= [[Emj alloc] init];
    
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\[\\w*\\]" options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray *result = [regex matchesInString:string options:0 range:NSMakeRange(0, [string length])];
    
    for (int i=0; i<result.count; i++) {
        NSArray *_result =[regex matchesInString:mutStr.string options:0 range:NSMakeRange(0, [mutStr.string length])];
        if (_result.count == 0)
            break;
        NSTextCheckingResult *regresult = _result[0];
        NSLog(@"%@\n", [string substringWithRange:regresult.range]);
        NSString *emjfilename =[[mutStr.string substringWithRange:regresult.range] substringWithRange:NSMakeRange(1, [mutStr.string substringWithRange:regresult.range].length-2)];
        NSLog(@"%@\n", emjfilename);
        NSData *emjdata = [emj getEmjData:emjfilename];
        if (emjdata){
            NSTextAttachment * attachment1 = [[NSTextAttachment alloc] init];
            attachment1.bounds = CGRectMake(0, -2, 22, 22);
            
            attachment1.image = [UIImage imageWithData:emjdata];
            NSAttributedString * attachStr1 = [NSAttributedString attributedStringWithAttachment:attachment1];
            [mutStr replaceCharactersInRange:regresult.range withAttributedString:attachStr1];
        }
    }
    
    
    
    
    [mutStr addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, mutStr.length)];
    
    return mutStr;
}



//判断是否全部是表情
+(BOOL)stringInAllEmj:(NSString *)string
{

    NSString *bakstring  = [string copy];
    
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\[\\w*\\]" options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray *result = [regex matchesInString:string options:0 range:NSMakeRange(0, [string length])];
    for (int i=0; i<result.count; i++) {
        NSTextCheckingResult *regresult = result[i];
        bakstring = [bakstring stringByReplacingOccurrencesOfString:[string substringWithRange:regresult.range] withString:@""];
        
    }
    
    
    if  ([bakstring isEqualToString:@""])
        return YES;
    else
        return NO;

}


+(NSString *)getStringWithEmjForSize:(NSString *)string
{
    NSMutableString *mstr = [[NSMutableString alloc] initWithString:string];
    

    
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\[\\w*\\]" options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray *result = [regex matchesInString:mstr options:0 range:NSMakeRange(0, [mstr length])];
    while (result.count!=0) {
        NSTextCheckingResult *regresult = result[0];
        [mstr replaceCharactersInRange:regresult.range withString:@"gg"];
  
        result = [regex matchesInString:mstr options:0 range:NSMakeRange(0, [mstr length])];
    }
    [mstr appendString:@"1"];
    
    return mstr;
    
}



//获得表情 占位数量
+(int)getStringEmjCount:(NSString *)string
{
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\[\\w*\\]" options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray *result = [regex matchesInString:string options:0 range:NSMakeRange(0, [string length])];
    
    return (int)result.count;
    
}


+(CGSize)GetTextSize:(NSString *)content maxwidth:(int)width
{
    NSAttributedString *attrstring =[Emj tranTextToAttributedString:content];
    CGRect tmpRect = [attrstring.string boundingRectWithSize:CGSizeMake(width, 3000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18 + [AppInfo getInstance].fontSize]} context:nil];
    //增加表情 宽度 减少
    int emjcount = [Emj getStringEmjCount:content];
    CGSize size = CGSizeMake(tmpRect.size.width + emjcount *15+((emjcount==0)?5:0), tmpRect.size.height +((emjcount>0)?5:0));
    return size;
}


@end
