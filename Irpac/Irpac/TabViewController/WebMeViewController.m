//
//  WebMeViewController.m
//  Irpac
//
//  Created by Stereo on 2017/5/11.
//  Copyright © 2017年 Suypower. All rights reserved.
//

#import "WebMeViewController.h"

@interface WebMeViewController ()

@end

@implementation WebMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:Tab1Url3]]];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setNavTitleHide:NO];
    [self setNavTitle:@"我"];
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
