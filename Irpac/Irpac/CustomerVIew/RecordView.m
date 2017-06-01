//
//  RecordView.m
//  SuEhome
//
//  Created by Stereo on 2017/1/4.
//  Copyright © 2017年 Suypower. All rights reserved.
//

#import "RecordView.h"


@implementation RecordView
@synthesize delegate;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)init:(UIViewController *)view
{
    self=  [super init];
    self.frame = CGRectMake(view.view.frame.size.width/2 -WiDTH /2, view.view.frame.size.height/2 - WiDTH/2, WiDTH, WiDTH);
    self.backgroundColor = [UIColor blackColor];
    
    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"recordaudio"]];
    img.frame = CGRectMake(20, 20, 60, 80);
    img.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:img];
    self.layer.cornerRadius=8;
    self.layer.masksToBounds=YES;
    
    volumes = [[UIImageView alloc] init];
    volumes.frame = CGRectMake(20 +60+10, 25, 25, 75);
    [self addSubview:volumes];


    labstate = [[UILabel alloc] init];
    labstate.frame = CGRectMake(10, 20+80+15, 150-20, 25);
    [self addSubview:labstate];
    labstate.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.5];
    labstate.text =@"手指上滑，取消发送";
    labstate.font = [UIFont systemFontOfSize:13];
    labstate.textColor=[UIColor whiteColor];
    labstate.textAlignment = NSTextAlignmentCenter;
    labstate.layer.cornerRadius=4;
    labstate.layer.masksToBounds=YES;
    
    media =[[MediaRecord alloc] init];
    media.delegate=self;
    isVaild = NO;
    return self;
}

-(void)cancelRecordChangeLabState:(BOOL)state
{
    if (state){
        labstate.text =@"手指松开，取消发送";
        labstate.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.5];
    }
    else
    {
        labstate.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.5];
        labstate.text =@"手指上滑，取消发送";
    }
}


#pragma mark 录音delegate
-(void)OnStartRecord
{
    NSLog(@"开始录音");
    [delegate startRecord];
}

-(void)OnStopRecord:(NSString *)filename
{
    if (!isVaild)
        NSLog(@"停止录音 无效");
    else
        NSLog(@"停止录音 %@",filename);
    
    if (media.recordduration<0.8)
        isVaild=YES;
    [delegate stopRecord:isVaild filename:filename duration:media.recordduration];
    
}


-(void)OnPowerChange:(float)power
{

    int p = ABS(power);
    NSLog(@"音量 %d",p);
    
    if (p<10)
        volumes.image = [UIImage imageNamed:@"v9"];
    else if (p<10)
        volumes.image = [UIImage imageNamed:@"v8"];
    else if (p>10 && p<15)
        volumes.image = [UIImage imageNamed:@"v7"];
    else if (p>15 && p<20)
        volumes.image = [UIImage imageNamed:@"v6"];
    else if (p>20 && p<25)
        volumes.image = [UIImage imageNamed:@"v5"];
    else if (p>25 && p<30)
        volumes.image = [UIImage imageNamed:@"v4"];
    else if (p>30 && p<35)
        volumes.image = [UIImage imageNamed:@"v3"];
    else if (p>35 && p<40)
        volumes.image = [UIImage imageNamed:@"v2"];
    else if (p>40 )
        volumes.image = nil;
}
#pragma mark -

-(void)startRecord
{
    [media StartRecord];
}

-(void)stopRecord:(BOOL)state
{
    isVaild = state;
    [media StopRecord];
}
@end
