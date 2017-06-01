//
//  SearchView.h
//  SuEhome
//
//  Created by Stereo on 2016/11/24.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define viewOffset 64

@interface SearchView : NSObject<UISearchBarDelegate>
{
    UIBlurEffect *beffect ;
    UIVisualEffectView *_backview;
    BOOL IsSearchMode;
    
}
-(instancetype)init:(UIView *)view;
-(UIVisualEffectView *)getBackView;
@end
