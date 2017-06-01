//
//  CommentsBarView.m
//  SuEhome
//
//  Created by Stereo on 2016/11/16.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import "CommentsBarView.h"
#import <Common/PublicCommon.h>
#import "AppCommon.h"
@implementation CommentsBarView
@synthesize delegate;
@synthesize btnreturn;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)awakeFromNib
{
    [super awakeFromNib];
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = [[[UIColor blackColor] colorWithAlphaComponent:0.3] CGColor];
    
    btnlike = [[UIButton alloc] init];
    [btnlike setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btnlike.frame = CGRectMake([PublicCommon GetALLScreen].size.width -20-30, 7, 30, 30);
    [btnlike  setImage:[UIImage imageNamed:@"icon_like1"] forState:UIControlStateNormal];
    barbuttncount = 1;
    [btnlike addTarget:self action:@selector(clicklike) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btnlike];
    
}

-(void)setBarView:(NSNumber *)showcomment shownum:(NSNumber *)shownum showlike:(NSNumber *)showlike showfav:(NSNumber *)showfav
{
    if ([showfav isEqual:@1])
    {
        barbuttncount ++;
        btnfav = [[UIButton alloc] init];
        [btnfav setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btnfav.frame = CGRectMake([PublicCommon GetALLScreen].size.width -(20 *barbuttncount) -(30 *barbuttncount), 7, 30, 30);
        [btnfav  setImage:[UIImage imageNamed:@"icon_fav1"] forState:UIControlStateNormal];
        [btnfav addTarget:self action:@selector(clickfav) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnfav];
    }
    if ([shownum isEqual:@1])
    {
        barbuttncount ++;
        btnnum = [[UIButton alloc] init];
        [btnnum setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btnnum.frame = CGRectMake([PublicCommon GetALLScreen].size.width -(20 *barbuttncount) -(30 *barbuttncount), 7, 30, 30);
        [btnnum  setImage:[UIImage imageNamed:@"bubble1"] forState:UIControlStateNormal];
        [btnnum addTarget:self action:@selector(clicknum) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnnum];
        
        labnum = [[UILabel alloc] init];
        labnum.font = [UIFont systemFontOfSize:12];
        labnum.frame = CGRectMake(2, 2, btnnum.frame.size.width-4, 20);
        labnum.text = @"";
        labnum.textColor  =APPCOLOR;
        labnum.textAlignment = NSTextAlignmentCenter;
        [btnnum addSubview:labnum];
        
    }
    
    if ([showcomment isEqual:@1])
    {
        _comment = [[UIView alloc] init];
        _comment.frame = CGRectMake(10+26 + 20, 7, [PublicCommon GetScreen].size.width -(10+26 + 20) - barbuttncount *(20 + 30) -20, 30);
        _comment.layer.cornerRadius = 16;
        _comment.layer.borderColor = [[[UIColor blackColor] colorWithAlphaComponent:0.4] CGColor];
        _comment.layer.borderWidth = 0.5;
        _comment.layer.masksToBounds = YES;
        _comment.backgroundColor = [UIColor whiteColor];
        _comment.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickcomment)];
        [_comment addGestureRecognizer:tap];
        [self addSubview:_comment];
        
        
        _img1 = [[UIImageView alloc] init];
        _img1.image  = [UIImage imageNamed:@"pl"];
        _img1.frame = CGRectMake(15, 5, 20, 20);
        [_comment addSubview:_img1];
        _lab1 = [[UILabel alloc] init];
        _lab1.text = @"写评论";
        _lab1.textColor = [UIColor grayColor];
        _lab1.frame = CGRectMake(20+10+10, 5, 60, 20);
        _lab1.font = [UIFont systemFontOfSize:16];
        [_comment addSubview:_lab1];
        
    }
        
}

-(void)setNum:(NSString *)num
{
    if (labnum)
        labnum.text = num;
}



-(void)setLikeState:(NSNumber *)state
{
    islike = state;
    if ([islike isEqual:@1])
        [btnlike  setImage:[UIImage imageNamed:@"icon_like2"] forState:UIControlStateNormal];
    else
        [btnlike  setImage:[UIImage imageNamed:@"icon_like1"] forState:UIControlStateNormal];
}

-(void)setFavState:(NSNumber *)state
{
    isfav= state;
    if ([isfav isEqual:@1])
        [btnfav  setImage:[UIImage imageNamed:@"icon_fav2"] forState:UIControlStateNormal];
    else
        [btnfav  setImage:[UIImage imageNamed:@"icon_fav1"] forState:UIControlStateNormal];
}

- (IBAction)clickReturn:(id)sender {
    [delegate clickbtnReturn];
}




-(void)clicklike
{
    [delegate clickbtnLike:islike];
}

-(void)clickfav
{
    [delegate clickbtnFav:isfav];
}

-(void)clicknum
{
    [delegate clickNum];
}

-(void)clickcomment
{
    [delegate clickComments];
}
@end
