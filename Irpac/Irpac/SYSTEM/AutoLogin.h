//
//  AutoLogin.h
//  SuEhome
//
//  Created by Stereo on 2016/11/7.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STHttp.h"
#import "AppCommon.h"




@protocol AutoLoginDelegate

-(void)LoginSuccess;
-(void)Loginfail:(NSString *)msg;


@end

@interface AutoLogin : NSObject


@property (weak,nonatomic)UIViewController<AutoLoginDelegate> *VC;


-(void)autoLogin;

-(void)login:(NSString *)username pwd:(NSString *)pwd;


@end
