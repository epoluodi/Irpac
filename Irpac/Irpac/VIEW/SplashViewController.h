//
//  SplashViewController.h
//  OldHome
//
//  Created by Stereo on 2016/11/1.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppCommon.h"
#import "AutoLogin.h"


@interface SplashViewController : UIViewController<AutoLoginDelegate>



@property (weak, nonatomic) IBOutlet UIImageView *splashimg;

@end
