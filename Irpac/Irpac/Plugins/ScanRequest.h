//
//  ScanRequest.h
//  SuEhome
//
//  Created by Stereo on 2016/11/14.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import "CDVPlugin.h"
#import "ScanCodeView.h"

@interface ScanRequest : CDVPlugin<ScanCodeDelegate>
{
        CDVInvokedUrlCommand * _command;
}

//打开扫描
-(void)Scan:(CDVInvokedUrlCommand *)command;


@end
