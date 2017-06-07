//
//  HttpFile.m
//  SuEhome
//
//  Created by Stereo on 2016/11/8.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import "HttpFile.h"
#import <Common/FileCommon.h>
@implementation HttpFile


-(instancetype)init:(FILETYPE)filetype
{
    _fileType = filetype;
    self = [super init];
    return self;
}


-(NSData *)downloadFile:(NSString *)mediaid fileSize:(NSString *)filesize
{
    _http.WebServiceUrl = DOWNFILE;

    
    [_http addParamsString:@"mediaId" values:mediaid];
    [_http addParamsString:@"imgSize" values:filesize];
    NSData *data = [_http httprequest:[_http getDataForArrary]];
    if (!data )
        return nil;
    if (data.length <= 50)
        return nil;

    NSFileManager *filenamger = [NSFileManager defaultManager];
    NSString *path = [FileCommon getCacheDirectory];
    NSString *strfiletype;
    switch (_fileType) {
        case JPG:
            strfiletype = @".jpg";
            break;
            
        case AAC:
            strfiletype = @".aac";
            break;
        case AMR:
            strfiletype = @".amr";
            break;
    }
    
    NSString* _filename = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@%@%@",mediaid,filesize,  strfiletype]];
    NSLog(@"下载文件存储: %@",_filename);
    [filenamger createFileAtPath:_filename contents:data attributes:nil];
    return data;
}


-(ReturnData *)uploadFile:(NSString *)mediaid mediaType:(NSString *)mediaType imageType:(NSString *)imageType
{
    _http.WebServiceUrl = UPLOADFILE;

    
    [_http addHeadString:@"mediaType" value:mediaType];
    [_http addHeadString:@"imageType" value:imageType];
    
    NSString *contenttype;
    
    NSString *strfiletype;
    switch (_fileType) {
        case JPG:
            strfiletype = @"jpg";
            contenttype = CONTENT_TYPE_JPG;
            break;
            
        case AAC:
            strfiletype = @"aac";
            contenttype = CONTENT_TYPE_AUDIO;
            break;
    }
  
 
    
    NSString *path = [FileCommon getCacheDirectory];
    NSString *filepath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",mediaid,strfiletype]];
    
    NSData *filedata=  [NSData dataWithContentsOfFile:filepath];
    
    if (!filedata)
        return nil;
    NSData * data = [_http UploadFile:mediaid FileData:filedata contenttype:contenttype filetype:strfiletype];
    ReturnData *rd = [ReturnData getReturnDatawithData:data dataMode:YES];

    NSLog(@"上传返回 %@",    rd.returnData);
    
    return rd;
}



-(ReturnData *)uploadFileData:(NSData *)filedata mediaType:(NSString *)mediaType imageType:(NSString *)imageType
{
    _http.WebServiceUrl = UPLOADFILE;
    [_http addHeadString:@"mediaType" value:mediaType];
    [_http addHeadString:@"imageType" value:imageType];
    
    NSString *contenttype;
    NSString *strfiletype;
    
    switch (_fileType) {
        case JPG:
            strfiletype = @"jpg";
            contenttype = CONTENT_TYPE_JPG;
            break;
            
        case AAC:
            strfiletype = @"aac";
            contenttype = CONTENT_TYPE_AUDIO;
            break;
    }

    NSData * data = [_http UploadFile:@"uploadfile" FileData:filedata contenttype:contenttype filetype:strfiletype];
    ReturnData *rd = [ReturnData getReturnDatawithData:data dataMode:YES];
    NSLog(@"上传返回 %@",    rd.returnData);
    return rd;
}
@end
