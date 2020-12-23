//
//  RegisterVC.h
//  TwinTongji
//
//  Created by 陈嘉捷 on 2020/12/23.
//

#import <UIKit/UIKit.h>
#import "UI_tools.h"

typedef enum _RegisterStatusCode
{
    RIG_SUCCESS = 0,
    RIG_WRONG_CODE = 1,
    RIG_FAIL_NETWORK = 2
} RegisterStatusCode;

@interface RegisterVC : UIViewController

@property(strong, nonatomic) IBOutlet UITextField *textfield_mailnum;
@property(strong, nonatomic) IBOutlet UITextField *textfeild_password;
@property(strong, nonatomic) IBOutlet UITextField *textfeild_password_again;
@property(strong, nonatomic) IBOutlet UITextField *textfeild_verifyCode;

-(IBAction) btn_sendVerifyCode;
-(IBAction) btn_register;

@end
