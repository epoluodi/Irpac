//
//  CommonInputViewController.m
//  SuEhome
//
//  Created by Stereo on 2016/11/18.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import "CommonInputViewController.h"

@interface CommonInputViewController ()

@end

@implementation CommonInputViewController
@synthesize inputtext,navtitle;
@synthesize inputEnum;
@synthesize delegate;
@synthesize value;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    btnright = [[UIBarButtonItem alloc] initWithTitle:@"提交" style:UIBarButtonItemStylePlain target:self action:@selector(clickbtnright)];
    
    [navtitle setRightBarButtonItem:btnright];
    inputtext.text =value;

    
    switch (inputEnum) {
        case INPUT_TEXT:
            inputtext.keyboardType =UIKeyboardTypeDefault;
            navtitle.title = @"详细地址";
            break;
        case INPUT_PHONE:
            inputtext.keyboardType =UIKeyboardTypePhonePad;
            navtitle.title = @"手机号";
            break;
        case INPUT_EMAIL:
            inputtext.keyboardType =UIKeyboardTypeEmailAddress;
            navtitle.title = @"邮箱";
            break;
        case INPUT_GROUPNAME:
            inputtext.keyboardType =UIKeyboardTypeDefault;
            navtitle.title = @"群名称";
            break;
        case INPUT_GROUPNICKNAME:
            inputtext.keyboardType =UIKeyboardTypeDefault;
            navtitle.title = @"群昵称";
            break;
    }
    
    [inputtext becomeFirstResponder];
    
    // Do any additional setup after loading the view.
}


-(void)clickbtnright
{
    
    
    [delegate UpdateValue:inputtext.text inputtype:inputEnum selfvc:self];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
