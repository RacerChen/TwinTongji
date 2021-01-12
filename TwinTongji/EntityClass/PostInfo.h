//
//  PostInfo.h
//  TwinTongji
//
//  Created by 陈嘉捷 on 2021/1/11.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PostInfo : NSObject

@property float latitude;
@property float longitude;
@property NSString *content;
@property NSString *poster;
@property UIImage *post_pic1;
@property UIImage *post_pic2;
@property UIImage *post_pic3;
@property NSMutableString *audio_path;
@property NSMutableString *web_url;

@end
