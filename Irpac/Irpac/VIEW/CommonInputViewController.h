//
//  CommonInputViewController.h
//  SuEhome
//
//  Created by Stereo on 2016/11/18.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTabViewController.h"

typedef enum : NSUInteger {
    INPUT_TEXT,
    INPUT_PHONE,
    INPUT_EMAIL,
    INPUT_GROUPNAME,
    INPUT_GROUPNICKNAME,
} InputEnum;

@protocol CommonInputDelgate

-(void)UpdateValue:(NSString *)value inputtype:(InputEnum)inputtype selfvc:(UIViewController *)selfvc;

@end

@interface CommonInputViewController : BaseTabViewController
{
    UIBarButtonItem *btnright;
    NSString *newvalue;

}
@property (weak, nonatomic) IBOutlet UITextField *inputtext;
@property (weak, nonatomic) IBOutlet UINavigationItem *navtitle;
@property (weak,nonatomic) NSObject<CommonInputDelgate> *delegate;
@property (weak,nonatomic)NSString *value;
@property (assign)InputEnum inputEnum;

@end
