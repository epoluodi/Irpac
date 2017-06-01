//
//  ShareSheet.h
//  SuEhome
//
//  Created by Stereo on 2017/4/27.
//  Copyright © 2017年 Suypower. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>



@interface ShareSheet : NSObject<MFMessageComposeViewControllerDelegate>
{
    NSString *_title,*_desc,* _thum,*_url;
    NSData *_imgthumdata;
    UIAlertController *alert;
}

@property (weak,nonatomic) UIViewController *vc;

-(instancetype)init:(NSString *)url title:(NSString *)title desc:(NSString *)desc thum:(NSString *)thum;
-(UIAlertController *)showSheet;



@end
