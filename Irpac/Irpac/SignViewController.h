//
//  SignViewController.h
//  Irpac
//
//  Created by Stereo on 2017/6/15.
//  Copyright © 2017年 Suypower. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPSSignatureView.h"

@interface SignViewController : UIViewController
{
    UIButton *btn1,*btn2,* btn3;
    
}

@property (weak,nonatomic) UIViewController *delegate;
@property (weak, nonatomic) IBOutlet PPSSignatureView *signview;
@property (copy,nonatomic) NSString *jsFun;
@property (weak, nonatomic) IBOutlet UIView *backview;

@end
