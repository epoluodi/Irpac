//
//  WXApiManager.m
//  SDKSample
//
//  Created by Jeason on 15/7/14.
//
//

#import "WXApi.h"
#import "WXApiRequestHandler.h"


@implementation WXApiRequestHandler

#pragma mark - Public Methods


+ (BOOL)sendLinkURL:(NSString *)urlString
            TagName:(NSString *)tagName
              Title:(NSString *)title
        Description:(NSString *)description
         ThumbImage:(UIImage *)thumbImage
            InScene:(enum WXScene)scene {
    WXWebpageObject *ext = [WXWebpageObject object];
    ext.webpageUrl = urlString;

    WXMediaMessage *message = [[WXMediaMessage alloc] init];
    message.mediaObject = ext;
    message.title =title;
    message.description = description;
    [message setThumbImage:thumbImage];
    message.mediaTagName =tagName;
    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    req.message = message;
    req.bText=NO;
    req.scene  =scene;
    if ([WXApi isWXAppInstalled])
        return [WXApi sendReq:req];
    return NO;
}
@end
