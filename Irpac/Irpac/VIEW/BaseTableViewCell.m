//
//  BaseTableViewCell.m
//  OldHome
//
//  Created by Stereo on 2016/11/1.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell
@synthesize nowVC;
- (void)awakeFromNib {
    [super awakeFromNib];
//    selectview = [[UIView alloc] init];
//    selectview.frame = self.contentView.frame;
//    self.selectedBackgroundView = selectview;
//    selectview.backgroundColor = [UIColor redColor];
//    self.contentView.backgroundColor= [UIColor whiteColor];
//    self.selectionStyle = UITableViewCellSelectionStyleNone;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    if (selected){
//        
//        selectview.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.03];
//
//    }
//    else{
//     
//        selectview.backgroundColor = [UIColor clearColor];
//    
//    }
    [super setSelected:selected animated:animated];

    if (selected){
    //选中后过一会设置为不选中
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self setSelected:NO animated:NO];
        });
    }
    // Configure the view for the selected state
}

@end
