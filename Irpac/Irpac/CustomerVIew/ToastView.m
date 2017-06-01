//
//  ToastView.m
//  SuEhome
//
//  Created by Stereo on 2017/1/3.
//  Copyright © 2017年 Suypower. All rights reserved.
//

#import "ToastView.h"
#import <Common/PublicCommon.h>
#define Hegiht 180


@implementation ToastView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/





-(instancetype)init:(UIView *)view Mode:(MBProgressHUDMode)mode
{
    self = [super init];
    hud = [[MBProgressHUD alloc] initWithView:view];
    [view addSubview:hud];
    hud.mode =mode;
    hud.margin=15;
    hud.bezelView.color = [UIColor blackColor];
    hud.activityIndicatorColor = [UIColor whiteColor];
    hud.labelColor = [UIColor whiteColor];
    return self;
}

-(void)setInfo:(NSString *)string
{
    hud.labelText = string;
}


-(void)showHud:(NSTimeInterval)timeinterval
{

    [hud showAnimated:YES];
    if (timeinterval > 0){
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeinterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hud hideAnimated:YES];
            hud = nil;
        });
    }
}

-(void)hideHud
{
    [hud hideAnimated:YES];
}
@end
