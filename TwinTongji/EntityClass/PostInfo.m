//
//  PostInfo.m
//  TwinTongji
//
//  Created by 陈嘉捷 on 2021/1/11.
//


#import "PostInfo.h"

@interface PostInfo ()

@end

@implementation PostInfo

@synthesize latitude, longitude, post_pic1, post_pic2, post_pic3, audio_path, web_url;

- (id) init
{
    if(self = [super init])
    {
        latitude = 31.286113;
        longitude = 121.215403;
        post_pic1 = nil;
        post_pic2 = nil;
        post_pic3 = nil;
        audio_path = [NSMutableString stringWithCapacity:16];
        web_url = [NSMutableString stringWithCapacity:16];
    }
    return self;
}

@end
