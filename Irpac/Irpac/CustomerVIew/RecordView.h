//
//  RecordView.h
//  SuEhome
//
//  Created by Stereo on 2017/1/4.
//  Copyright © 2017年 Suypower. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MediaRecord.h"

#define WiDTH 150


@protocol RecordViewDelegate

@optional
-(void)startRecord;
-(void)stopRecord:(BOOL)state filename:(NSString *)filename duration:(NSTimeInterval)duration;

@end

@interface RecordView : UIView<Recorddelegate>
{
    MediaRecord *media;
    UIImageView *volumes;
    UILabel *labstate;
    BOOL isVaild;//录音是否有效
}


@property (weak,nonatomic)NSObject<RecordViewDelegate>*delegate;
-(instancetype)init:(UIViewController *)view;//初始化
-(void)cancelRecordChangeLabState:(BOOL)state;//状态改变


-(void)startRecord;//开始录音
-(void)stopRecord:(BOOL)state;//结束录音
@end
