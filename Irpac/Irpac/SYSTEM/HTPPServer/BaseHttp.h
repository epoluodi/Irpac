//
//  BaseHttp.h
//  SuEhome
//
//  Created by Stereo on 2016/11/4.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServerInfo.h"


@interface BaseHttp : NSObject
{

    HttpClass *_http;
    NSString *_weburl;
}

-(NSData *)getPost:(NSDictionary *)postdata url:(NSString *)url;

-(void)setPoseData:(NSString *)data Key:(NSString *)key;
-(void)clearPostData;

@end
