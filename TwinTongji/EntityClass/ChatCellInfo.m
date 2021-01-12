//
//  ChatCellInfo.m
//  TwinTongji
//
//  Created by 陈嘉捷 on 2021/1/12.
//

#import "ChatCellInfo.h"

@interface ChatCellInfo ()

@end

@implementation ChatCellInfo

@synthesize portrait, nickname, schoolName, chatcellTime, chatcellContent;

- (id) initWithPortrait:(UIImage *) thePortrait andNickname:(NSString *) theNickname andSchoolName:(NSString *) theSchoolName andChatCellTime:(NSString *) theChatCellTime andChatCellContent:(NSString *) theChatCellContent
{
    if(self = [super init])
    {
        portrait = thePortrait;
        nickname = theNickname;
        schoolName = theSchoolName;
        chatcellTime = theChatCellTime;
        chatcellContent = theChatCellContent;
    }
    return self;
}

@end
