//
//  STImageView.h
//  OldHome
//
//  Created by Stereo on 2016/11/3.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STImageView : UIImageView


//加载图片
-(void)setMediaIdLoadImg:(NSString *)mediaid filesize:(NSString *)size;
-(void)setRadius;//设置圆角
-(void)loadUrlImg:(NSString *)imgUrl;
-(void)loadUrlImgWithSave:(NSURL *)url filename:(NSString *)filename;
@end
