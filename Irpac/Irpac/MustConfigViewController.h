//
//  MustConfigViewController.h
//  SuEhome
//
//  Created by Stereo on 2017/4/11.
//  Copyright © 2017年 Suypower. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MustConfigViewController : UIView<UITextFieldDelegate>
{
   
}
@property (weak, nonatomic) IBOutlet UIView *view;

@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UITextField *input;
@property (weak, nonatomic) IBOutlet UIButton *btnsave;

@end
