//
//  CommentsInputView.m
//  SuEhome
//
//  Created by Stereo on 2016/11/17.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import "CommentsInputView.h"
#import <Common/PublicCommon.h>

@implementation CommentsInputView
@synthesize inputtext,titlebar;
@synthesize controller;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)awakeFromNib
{
    [super awakeFromNib];
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = [[[UIColor blackColor] colorWithAlphaComponent:0.3] CGColor];
    
  
    [inputtext becomeFirstResponder];
}

-(void)closeInputBorad
{
    [inputtext resignFirstResponder];
    
}
- (IBAction)clickCancel:(id)sender {
        [self closeInputBorad];
    [controller clickBtnCancel];

}

- (IBAction)clickPublish:(id)sender {
    [self closeInputBorad];
    [controller clickBtnPublish:inputtext.text];
  
}
@end
