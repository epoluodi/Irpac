//
//  ToastView.h
//  SuEhome
//
//  Created by Stereo on 2017/1/3.
//  Copyright © 2017年 Suypower. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
@interface ToastView : NSObject
{

    MBProgressHUD *hud;
}


-(instancetype)init:(UIView *)view Mode:(MBProgressHUDMode)mode;
-(void)setInfo:(NSString *)string;
-(void)showHud:(NSTimeInterval)timeinterval;
-(void)hideHud;



@property (assign)BOOL IsShow;

@end
