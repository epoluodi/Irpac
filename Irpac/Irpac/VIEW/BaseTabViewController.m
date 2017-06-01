//
//  BaseTabViewController.m
//  OldHome
//
//  Created by Stereo on 2016/11/1.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import "BaseTabViewController.h"
#import <Common/PublicCommon.h>


@interface BaseTabViewController ()

@end

@implementation BaseTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    mainviewcontroller = (MainRootViewController*)self.navigationController;
    [self.view setBackgroundColor:UIColorFromRGB(0xEFEFF4)];
    
    

    
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setNavTitleHide:YES];
    
}



-(void)setNavTitle:(NSString *)title
{
    mainviewcontroller.labtitle.text = title;

}

-(void)setNavTitleHide:(BOOL)hide
{
    mainviewcontroller.labtitle.hidden = hide;
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
