//
//  NSString+MD5.m
//  TwinTongji
//
//  Created by 陈嘉捷 on 2020/12/31.
//

// NSString *ss=@"abcdefgh";
// NSString *ssmd5=[ss MD5];

#import "NSString+MD5.h"

@implementation NSString (MD5)

- (id)MD5
{
    const char *cStr = [self UTF8String];
    unsigned char digest[16];
    unsigned int x=(int)strlen(cStr) ;
    CC_MD5( cStr, x, digest );
    // This is the md5 call
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];

    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];

    return  output;
}

@end
