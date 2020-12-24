//
//  ProfileVC.h
//  TwinTongji
//
//  Created by 陈嘉捷 on 2020/12/23.
//

#import <UIKit/UIKit.h>
#import<SDCycleScrollView.h>

@interface ProfileVC : UIViewController

@property(strong, nonatomic) IBOutlet UIImageView *imgview_portrait;
@property(strong, nonatomic) IBOutlet SDCycleScrollView *cycerView_photos;

-(IBAction) btn_click_imgview_portrait;

@end
