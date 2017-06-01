//
//  SearchView.m
//  SuEhome
//
//  Created by Stereo on 2016/11/24.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import "SearchView.h"




@implementation SearchView



-(instancetype)init:(UIView *)view
{
    self = [super init];
    beffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    _backview = [[UIVisualEffectView alloc]initWithEffect:beffect];
    _backview.frame = CGRectMake(0, viewOffset, view.frame.size.width, view.frame.size.height-viewOffset);
    //    [self.tabBarController.view addSubview:_backview];
    _backview.alpha=0;
    
    return self;
}

-(UIVisualEffectView *)getBackView
{
    return _backview;
}

@end
