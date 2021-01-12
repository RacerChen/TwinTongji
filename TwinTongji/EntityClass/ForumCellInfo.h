//
//  ForumCell.h
//  TwinTongji
//
//  Created by 陈嘉捷 on 2021/1/12.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ForumCellInfo : NSObject

@property UIImage *portrait;
@property NSString *nickname;
@property NSString *schoolName;
@property NSString *postTime;
@property NSString *postContent;
@property UIImage *post1stImage;

- (id) initWithPortrait:(UIImage *) thePortrait andNickname:(NSString *) theNickname andSchoolName:(NSString *) theSchoolName andPostTime:(NSString *) thePostTime andPostContent:(NSString *) thePostContent andPost1stImage:(UIImage *) thePost1stImage;

@end
