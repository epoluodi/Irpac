//
//  BaseWebViewController.h
//  SuEhome
//
//  Created by Stereo on 2016/11/9.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CordovaWebViewController.h"
#import "AppCommon.h"
#import "MainRootViewController.h"


@interface BaseWebViewController : CordovaWebViewController
{
        MainRootViewController *mainviewcontroller;
}

//设置nav标题
-(void)setNavTitle:(NSString *)title;

//设置标题是否隐藏
-(void)setNavTitleHide:(BOOL)hide;


@end
