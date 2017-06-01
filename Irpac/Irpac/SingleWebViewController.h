//
//  SingleWebViewController.h
//  SuEhome
//
//  Created by Stereo on 2016/11/10.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CordovaWebViewController.h"
#import "MainRootViewController.h"


@interface SingleWebViewController : CordovaWebViewController
{
    MainRootViewController *mainviewcontroller;


}

@property (copy,nonatomic)NSString *loadUrl;

@end
