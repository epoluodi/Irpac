//
//  BackGroundEmpty.m
//  SuEhome
//
//  Created by Stereo on 2017/1/17.
//  Copyright © 2017年 Suypower. All rights reserved.
//

#import "BackGroundEmpty.h"


@implementation BackGroundEmpty

-(instancetype)init:(NSString *)info frame:(CGRect)rect;
{
    self = [super init];
    labstr = [[UILabel alloc] init];
    imgview = [[UIImageView alloc] init];
    self.frame = rect;
    imgview.image = [UIImage imageNamed:@"empty_background"];
    imgview.frame = CGRectMake(rect.size.width /2 - 80, 80, 160, 160);
    [self addSubview:imgview];
    
    CGSize size = [info sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:14]}];
    labstr.font =[UIFont boldSystemFontOfSize:14];
    labstr.text =info;
    labstr.textAlignment = NSTextAlignmentCenter;
//    labstr.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.08];
    labstr.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    labstr.frame = CGRectMake(rect.size.width /2 - ((size.width+15) /2), 80+160+20, size.width+15, size.height+8);
    labstr.layer.cornerRadius=4;
    labstr.layer.masksToBounds=YES;
    [self addSubview:labstr];
    
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
