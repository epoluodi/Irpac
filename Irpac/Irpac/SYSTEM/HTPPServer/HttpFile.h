//
//  HttpFile.h
//  SuEhome
//
//  Created by Stereo on 2016/11/8.
//  Copyright © 2016年 Suypower. All rights reserved.
//

#import "BaseHttp.h"
#import "AppCommon.h"
#define DOWNFILE [NSString stringWithFormat:@"%@media/download",AppUrl]
#define UPLOADFILE [NSString stringWithFormat:@"%@upload",AppUrl]

#define CONTENT_TYPE_FORM_DATA @"multipart/form-data"
#define CONTENT_TYPE_JPG @"image/jpg"
#define CONTENT_TYPE_AUDIO @"audio/vnd.dlna.adts"





typedef enum : NSUInteger {
    JPG,
    AAC,
    AMR,

} FILETYPE;

@interface HttpFile : BaseHttp
{
    FILETYPE _fileType;
}


-(instancetype)init:(FILETYPE) filetype;

//下载文件
-(NSData *)downloadFile:(NSString *)mediaid fileSize:(NSString *)filesize;

//上传文件 通过mediaid 上传
-(ReturnData *)uploadFile:(NSString *)mediaid mediaType:(NSString *)mediaType  imageType:(NSString *)imageType;

//上传文件直接通过 data上传
-(ReturnData *)uploadFileData:(NSData *)filedata mediaType:(NSString *)mediaType  imageType:(NSString *)imageType;


@end
