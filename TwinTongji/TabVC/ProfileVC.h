//
//  ProfileVC.h
//  TwinTongji
//
//  Created by 陈嘉捷 on 2020/12/23.
//

#import <UIKit/UIKit.h>
#import<SDCycleScrollView.h>
#import "UI_tools.h"

@interface ProfileVC : UIViewController

@property(strong, nonatomic) IBOutlet UIImageView *imgview_portrait;
@property(strong, nonatomic) IBOutlet UIView *view_contain_scollview;

-(IBAction) btn_click_imgview_portrait;

@end
