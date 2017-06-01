//
//  WebPreviewViewController.m
//  SuEhome
//
//  Created by Stereo on 2017/5/9.
//  Copyright © 2017年 Suypower. All rights reserved.
//

#import "WebPreviewViewController.h"
#import <Common/PublicCommon.h>
#import "STImageView.h"
#import "ToastView.h"
@interface WebPreviewViewController ()
{

    UIScrollView *mainscrollview;
    UIScrollView *nowscalescrollview;
    STImageView *nowstimge;
}
@end

@implementation WebPreviewViewController
@synthesize webImgList;
@synthesize index;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    
    mainscrollview = [[UIScrollView alloc] init];
    mainscrollview.frame = CGRectMake(0, 0, [PublicCommon GetALLScreen].size.width, [PublicCommon GetALLScreen].size.height);
    
    
    mainscrollview.pagingEnabled=YES;
    mainscrollview.bounces=YES;
    mainscrollview.delegate = self;
    [self.view addSubview:mainscrollview];
    
    stimgviewlist = [[NSMutableArray alloc] init];
    scrollviewlist = [[NSMutableArray alloc] init];
    imglist = [[NSMutableArray alloc] init];
    
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapexit)];
    [mainscrollview addGestureRecognizer:tap];
    mainscrollview.userInteractionEnabled=YES;
    
    UILongPressGestureRecognizer *longtap = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(saveImg)];
    [mainscrollview addGestureRecognizer:longtap];
    
    [self initImgView];
}

-(void)saveImg
{
    __weak __typeof(self) weakself= self;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"保存图片到相册" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"保存到相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [weakself saveImageFinished:nowstimge.image];
    }];
    [alert addAction:action];
    [alert addAction:action1];
    [self presentViewController:alert animated:YES completion:nil];
    
}


-(void)tapexit
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)initImgView
{

//    webImgList = @"http://www.iconcool.cn/d/file/2016-08-12/b5bd718879e7eb9bdc95f7f63b7d9e2f.png,http://www.iconcool.cn/d/file/2016-08-07/087eb056f0d222b437d820f07696b0b8.png,http://www.iconcool.cn/d/file/2016-07-13/04f8d77301788f96f46c5f39c2df125b.png";
//    index=1;
    NSArray *_arry = [webImgList componentsSeparatedByString:@","];
    mainscrollview.contentSize = CGSizeMake(_arry.count  * [PublicCommon GetALLScreen].size.width, 0);
    int i=0;
    for (NSString *_url in _arry) {
        NSURL *url = [NSURL URLWithString:_url];
        NSRange range =[_url rangeOfString:@"/" options:NSBackwardsSearch];
        NSString *filename = [_url substringFromIndex:range.location + 1];
        [imglist  addObject:filename];
        UIScrollView *scrollview = [[UIScrollView alloc] init];
        scrollview.frame = CGRectMake(i *  [PublicCommon GetALLScreen].size.width, 0, [PublicCommon GetALLScreen].size.width, [PublicCommon GetALLScreen].size.height);
        scrollview.tag = i;
        scrollview.delegate=self;
        //设置最大伸缩比例
        scrollview.maximumZoomScale=2.0;
        //设置最小伸缩比例
        scrollview.minimumZoomScale=1;
        
        STImageView *stimgview = [[STImageView alloc] init];
        [stimgview loadUrlImgWithSave:url filename:filename];
        stimgview.frame =CGRectMake(0, 0, [PublicCommon GetALLScreen].size.width, [PublicCommon GetALLScreen].size.height);
        [scrollview addSubview:stimgview];
        [stimgviewlist addObject:stimgview];
        [scrollviewlist addObject:scrollview];
        [mainscrollview addSubview:scrollview];
        i++;
    }
    
    [mainscrollview setContentOffset:CGPointMake(index * [PublicCommon GetALLScreen].size.width, 0) animated:YES];
    nowstimge = stimgviewlist[index];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"%@",NSStringFromCGPoint(scrollView.contentOffset));
      NSLog(@"%@",NSStringFromCGSize(scrollView.contentSize));

    int i = scrollView.contentOffset.x /  [PublicCommon GetALLScreen].size.width ;
    nowstimge = stimgviewlist[i];
    
    if (nowscalescrollview)
    {
        if ([scrollView isEqual:mainscrollview])
        {
            [nowscalescrollview setZoomScale:1];
        }
    }
}
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    nowscalescrollview = scrollviewlist[scrollView.tag];
    return stimgviewlist[scrollView.tag];
}


- (void)saveImageFinished:(UIImage *)image
{
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), (__bridge void *)self);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    ToastView *toast = [[ToastView alloc] init:self.view Mode:MBProgressHUDModeText];
    [toast setInfo:@"保存成功"];
    [toast showHud:1.3];
//    NSLog(@"image = %@, error = %@, contextInfo = %@", image, error, contextInfo);
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
