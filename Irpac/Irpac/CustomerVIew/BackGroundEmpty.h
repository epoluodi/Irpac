//
//  BackGroundEmpty.h
//  SuEhome
//
//  Created by Stereo on 2017/1/17.
//  Copyright © 2017年 Suypower. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BackGroundEmpty : UIView
{
    UILabel *labstr;
    UIImageView *imgview;
}

-(instancetype)init:(NSString *)info frame:(CGRect)rect;
@end
