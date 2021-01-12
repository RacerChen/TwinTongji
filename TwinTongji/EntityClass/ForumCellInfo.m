//
//  ForumCell.m
//  TwinTongji
//
//  Created by 陈嘉捷 on 2021/1/12.
//

#import "ForumCellInfo.h"

@interface ForumCellInfo ()

@end

@implementation ForumCellInfo

@synthesize portrait, nickname, schoolName, postTime, postContent, post1stImage;

- (id) initWithPortrait:(UIImage *) thePortrait andNickname:(NSString *) theNickname andSchoolName:(NSString *) theSchoolName andPostTime:(NSString *) thePostTime andPostContent:(NSString *) thePostContent andPost1stImage:(UIImage *) thePost1stImage
{
    if(self = [super init])
    {
        portrait = thePortrait;
        nickname = theNickname;
        schoolName = theSchoolName;
        postTime = thePostTime;
        postContent = thePostContent;
        post1stImage = thePost1stImage;
    }
    return self;
}

@end
