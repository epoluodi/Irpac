//
//  CommentsRequest.h
//  SuEhome
//
//  Created by Stereo on 2016/11/16.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import "CDVPlugin.h"
#import "Plugins.h"

@interface CommentsRequest : CDVPlugin


//初始化备注
-(void)init:(CDVInvokedUrlCommand *)command;

//关闭备注
-(void)unInit:(CDVInvokedUrlCommand *)command;

//更新备注状态
-(void)updateState:(CDVInvokedUrlCommand *)command;
@end
