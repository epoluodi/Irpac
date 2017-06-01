//
//  SingleWebViewController.m
//  SuEhome
//
//  Created by Stereo on 2016/11/10.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import "SingleWebViewController.h"

@interface SingleWebViewController ()

@end

@implementation SingleWebViewController
@synthesize loadUrl;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _viewmode= VIEWCONTROLLERMODE;
    mainviewcontroller = (MainRootViewController*)self.navigationController;
    [self.view setBackgroundColor:UIColorFromRGB(0xEFEFF4)];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:loadUrl]]];


    
    // Do any additional setup after loading the view.
}



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    mainviewcontroller.labtitle.hidden = YES;
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
