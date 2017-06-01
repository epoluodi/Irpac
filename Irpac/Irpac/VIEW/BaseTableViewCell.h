//
//  BaseTableViewCell.h
//  OldHome
//
//  Created by Stereo on 2016/11/1.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STImageView.h"

@interface BaseTableViewCell : UITableViewCell
{
    UIView *selectview ;
}


@property (weak,nonatomic) UIViewController *nowVC;//当前所在宿主viewcontroller
@end
