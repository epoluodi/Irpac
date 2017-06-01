//
//  MainRootViewController.h
//  OldHome
//
//  Created by Stereo on 2016/11/1.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppCommon.h"




@class ChatViewController;
@interface MainRootViewController : UINavigationController<UINavigationControllerDelegate,UIGestureRecognizerDelegate>
{
    BOOL isCloseEvent;
    NSString *_callJS ,* _jsArg;
    UIViewController * _oldVC;
    
    UIStatusBarStyle statusbarstyle;
    
  
   

    
}

@property (weak,nonatomic) NSLayoutConstraint *layoutBottom;
@property (weak,nonatomic) ChatViewController *chatviewcontroller;
@property (assign) BOOL IsLoadunReadData;
@property (strong,nonatomic) UILabel *labtitle;
@property (weak,nonatomic) UITabBarController *rootViewController;

-(void)LogOut;
-(void)setStatusbarMode:(UIStatusBarStyle) statusmode;

@end
