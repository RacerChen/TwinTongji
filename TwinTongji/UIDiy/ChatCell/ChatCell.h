//
//  ChatCell.h
//  TwinTongji
//
//  Created by 陈嘉捷 on 2021/1/12.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ChatCell : UITableViewCell//该类继承于UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *portrait;
@property (strong, nonatomic) IBOutlet UIImageView *messageAlarm;
@property (strong, nonatomic) IBOutlet UILabel *nickname;
@property (strong, nonatomic) IBOutlet UILabel *schoolName;
@property (strong, nonatomic) IBOutlet UILabel *messageTime;
@property (strong, nonatomic) IBOutlet UILabel *messageContent;

@end
