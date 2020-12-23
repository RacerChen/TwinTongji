//
//  RegisterVC.m
//  TwinTongji
//
//  Created by 陈嘉捷 on 2020/12/23.
//

#import "RegisterVC.h"

@interface RegisterVC ()

@end

@implementation RegisterVC

@synthesize textfield_mailnum;
@synthesize textfeild_password;
@synthesize textfeild_password_again;
@synthesize textfeild_verifyCode;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(IBAction) btn_sendVerifyCode
{
    
}

-(IBAction) btn_register
{
    
}

-(BOOL) check2password:(NSString *) password and:(NSString *) passwordAgain
{
    if([password isEqualToString:passwordAgain])
    {
        return true;
    }
    else
    {
        NSString *returnCode = @"两次密码输入不一致，请检查";
        [self presentViewController:[UI_tools alert_withName:@"提示" andMessage:returnCode] animated:false completion:nil];
        return false;
    }
}

@end
