//
//  CommentsInputView.h
//  SuEhome
//
//  Created by Stereo on 2016/11/17.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CommentsInputViewDelegate

-(void)clickBtnCancel;
-(void)clickBtnPublish:(NSString *)content;


@end


@interface CommentsInputView : UIView


@property (weak, nonatomic) IBOutlet UITextView *inputtext;
@property (weak, nonatomic) IBOutlet UIView *titlebar;

@property (weak,nonatomic) UIViewController<CommentsInputViewDelegate> *controller;

- (IBAction)clickCancel:(id)sender;
- (IBAction)clickPublish:(id)sender;


@end
