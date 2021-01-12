//
//  ChatCellInfo.h
//  TwinTongji
//
//  Created by 陈嘉捷 on 2021/1/12.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ChatCellInfo : NSObject

@property UIImage *portrait;
@property NSString *nickname;
@property NSString *schoolName;
@property NSString *chatcellTime;
@property NSString *chatcellContent;

- (id) initWithPortrait:(UIImage *) thePortrait andNickname:(NSString *) theNickname andSchoolName:(NSString *) theSchoolName andChatCellTime:(NSString *) theChatCellTime andChatCellContent:(NSString *) theChatCellContent;

@end
