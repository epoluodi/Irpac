//
//  ScanCodeView.h
//  stereo
//
//  Created by Stereo on 15/10/20.
//  Copyright © 2015年 com.suypower.stereo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "AppCommon.h"

enum CodeType
{
        BarCode,QRCode,
};


@protocol ScanCodeDelegate

//条码
-(void)ScanCode:(NSString *)Code CodeType:(enum CodeType)codetype;

@end


@interface ScanCodeView : UIViewController<AVCaptureMetadataOutputObjectsDelegate>
{
    UIBarButtonItem *btnleft;
    UINavigationItem *navtitle;
    AVCaptureSession *_captureSession;
    AVCaptureVideoPreviewLayer *_videoPreviewLayer;
    dispatch_queue_t dispatchQueue;// 队列

    CGRect scanRect;
    CALayer *line;
    BOOL isReading;
}

@property (weak,nonatomic) NSObject<ScanCodeDelegate> *delegate;
@property (weak, nonatomic) IBOutlet UINavigationBar *navbar;
@property (weak, nonatomic) IBOutlet UIImageView *backimg;


@end
