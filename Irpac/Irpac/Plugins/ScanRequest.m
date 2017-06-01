//
//  ScanRequest.m
//  SuEhome
//
//  Created by Stereo on 2016/11/14.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import "ScanRequest.h"

@implementation ScanRequest


-(void)Scan:(CDVInvokedUrlCommand *)command
{
    
    _command = command;
    __weak __typeof(self) weakself= self;
    [self.commandDelegate runInBackground:^{
       
        MAIN(^{
        
            ScanCodeView *scanview = [[ScanCodeView alloc] initWithNibName:@"scanCodeView" bundle:[[NSBundle alloc] initWithPath:@"CustomerView"]];
            scanview.delegate = weakself;
            [weakself.viewController presentViewController:scanview animated:YES completion:nil];
    
        });
    }];
    
   
}

-(void)ScanCode:(NSString *)Code CodeType:(enum CodeType)codetype
{

    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:Code];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:_command.callbackId];
}
@end
