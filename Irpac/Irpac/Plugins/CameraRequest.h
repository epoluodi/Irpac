//
//  CameraRequest.h
//  SuEhome
//
//  Created by Stereo on 2017/1/12.
//  Copyright © 2017年 Suypower. All rights reserved.
//

#import "CDVPlugin.h"

@interface CameraRequest : CDVPlugin

//选择照片
-(void)chooseImage:(CDVInvokedUrlCommand *)command;


@end
