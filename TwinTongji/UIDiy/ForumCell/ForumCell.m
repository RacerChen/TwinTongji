//
//  ForumCell.m
//  TwinTongji
//
//  Created by 陈嘉捷 on 2021/1/12.
//

#import <Foundation/Foundation.h>

#import "ForumCell.h"

@implementation ForumCell

@synthesize portrait, nickname, schoolName, postTime, postContent, post1stImage;

-(id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        
    }
    return self;
}

-(void) setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
