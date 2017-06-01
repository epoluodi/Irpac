//
//  WebViewRequest.h
//  SuEhome
//
//  Created by Stereo on 2016/11/10.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import "CDVPlugin.h"

@interface WebViewRequest : CDVPlugin



//新建窗口
-(void)open:(CDVInvokedUrlCommand *)command;

//关闭窗口
-(void)close:(CDVInvokedUrlCommand *)command;

//添加关闭注册事件
-(void)closeEvent:(CDVInvokedUrlCommand *)command;

//设置右上角菜单
-(void)setBarRight:(CDVInvokedUrlCommand *)command;
@end
