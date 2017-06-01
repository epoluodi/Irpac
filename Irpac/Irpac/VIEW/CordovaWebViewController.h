//
//  CordovaWebViewController.h
//  SuEhome
//
//  Created by Stereo on 2016/11/8.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CDV.h"
#import "AppCommon.h"
#import "Plugins.h"
#import "CommentsBarView.h"
#import "CommentsInputView.h"
#import "ShareSheet.h"

//基类view 模式
typedef enum : NSUInteger {
    TABVIEWCONTROLLERMODE,//tab 模式
    VIEWCONTROLLERMODE,//独立view模式

} VIEWMODE;

typedef enum : NSUInteger {
    BUTTON,
    LIST,
} BARRIGHTENUM;

@interface CordovaWebViewController : CDVViewController<CommentsDelegate,CommentsInputViewDelegate,UIImagePickerControllerDelegate>
{
    @private
    BOOL isHideNavBar;
    NSString  * _webtitle;
    NSMutableArray<NSString *> * _JSLIst; //右上角 按钮点击回调列表
    BARRIGHTENUM _barrightmode; //右上角 模式

 
    NSMutableArray *menuname ;
    NSMutableArray *menuicon ;

    CommentsBarView * _commentsbarview;
    CommentsInputView *_commentsintputview;
    
    __block NSString *_callbackcommentsjs;
    __block NSString *_callbackcommentsnumjs;
    UIImagePickerController *pickerview;
    
    @public
    VIEWMODE _viewmode;
    UIBarButtonItem *btnright;
    UIButton *_buttonright;
    NSString *_callbackid;
    
    ShareSheet *sharesheet;

    
}
@property (assign) BOOL IsUserWebTitle;
@property (assign)BOOL IsHideNavBar;
@property (copy,nonatomic) NSString *webTitle;


//设置url
-(void)setLoadUrl:(NSString *)url;

-(void)callJS:(NSString *)js;

-(void)webSelectPhoneBook:(NSString *)selects;
@end
