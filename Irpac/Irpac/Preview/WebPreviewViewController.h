//
//  WebPreviewViewController.h
//  SuEhome
//
//  Created by Stereo on 2017/5/9.
//  Copyright © 2017年 Suypower. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebPreviewViewController : UIViewController<UIScrollViewDelegate>
{
    NSMutableArray *stimgviewlist;
    NSMutableArray *scrollviewlist;
    NSMutableArray *imglist;
}
@property(copy,nonatomic)NSString *webImgList;
@property (assign)int index;
@end
