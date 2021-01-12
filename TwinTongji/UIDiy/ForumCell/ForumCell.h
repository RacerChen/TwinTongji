//
//  ForumCell.h
//  TwinTongji
//
//  Created by 陈嘉捷 on 2021/1/12.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ForumCell : UITableViewCell//该类继承于UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *portrait;
@property (strong, nonatomic) IBOutlet UILabel *nickname;
@property (strong, nonatomic) IBOutlet UILabel *schoolName;
@property (strong, nonatomic) IBOutlet UILabel *postTime;
@property (strong, nonatomic) IBOutlet UITextView *postContent;
@property (strong, nonatomic) IBOutlet UIImageView *post1stImage;

@end
