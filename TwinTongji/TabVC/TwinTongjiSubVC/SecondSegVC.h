//
//  SecondSegVC.h
//  TwinTongji
//
//  Created by 陈嘉捷 on 2021/1/7.
//

#import <UIKit/UIKit.h>

@interface SecondSegVC : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *lbl_canteen_lasttime;
@property (strong, nonatomic) IBOutlet UILabel *lbl_school_lasttime;
@property (strong, nonatomic) IBOutlet UILabel *lbl_dorm_lasttime;
@property (strong, nonatomic) IBOutlet UILabel *lbl_basketball_lasttime;


-(IBAction) btn_canteen_enter;
-(IBAction) btn_school_enter;
-(IBAction) btn_dorm_enter;
-(IBAction) btn_basketball_enter;

-(IBAction) btn_canteen_leave;
-(IBAction) btn_school_leave;
-(IBAction) btn_dorm_leave;
-(IBAction) btn_basketball_leave;

@end
