//
//  LibFloorCell.h
//  TwinTongji
//
//  Created by 陈嘉捷 on 2021/4/6.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LibFloorCell : UITableViewCell//该类继承于UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *imgv_floorstruct;
@property (strong, nonatomic) IBOutlet UILabel *lbl_floornum;
@property (strong, nonatomic) IBOutlet UILabel *lbl_crowed;
@property (strong, nonatomic) IBOutlet UILabel *lbl_noise;


@end
