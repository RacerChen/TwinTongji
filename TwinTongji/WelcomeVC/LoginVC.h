//
//  LoginVC.h
//  TwinTongji
//
//  Created by 陈嘉捷 on 2020/12/22.
//

#import <UIKit/UIKit.h>
#import "UI_tools.h"

@interface LoginVC : UIViewController

@property(strong, nonatomic) IBOutlet UITextField *textField_Lg_ID;
@property(strong, nonatomic) IBOutlet UITextField *textField_lg_password;

-(IBAction) btn_login;
-(IBAction) btn_register;

@end
