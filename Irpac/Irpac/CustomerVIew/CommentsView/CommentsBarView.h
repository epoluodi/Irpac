//
//  CommentsBarView.h
//  SuEhome
//
//  Created by Stereo on 2016/11/16.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CommentsDelegate

-(void)clickbtnReturn;
-(void)clickbtnLike:(NSNumber *)state;
-(void)clickbtnFav:(NSNumber *)state;
-(void)clickNum;
-(void)clickComments;

@end


@interface CommentsBarView : UIView
{
    UIButton *btnlike,*btnfav,*btnnum;
    UIView *_comment;
    UIImageView *_img1;
    UILabel *_lab1;
    UILabel *labnum;
    int barbuttncount;
    
    NSNumber * islike,*isfav;
}

@property (weak, nonatomic) IBOutlet UIButton *btnreturn;
@property (weak,nonatomic)UIViewController<CommentsDelegate> * delegate;



//初始化评论bar 显示 收藏，点赞，评论数
-(void)setBarView:(NSNumber *)showcomment shownum:(NSNumber *)shownum showlike:(NSNumber *)showlike showfav:(NSNumber *)showfav;

-(void)setNum:(NSString *)num;
-(void)setLikeState:(NSNumber *)state;
-(void)setFavState:(NSNumber *)state;


- (IBAction)clickReturn:(id)sender;





@end
