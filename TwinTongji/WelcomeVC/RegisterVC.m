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
    if([self isValidateEmail:textfield_mailnum.text])
    {
        NSLog(@"Verify Code sended!");
    }
}

-(IBAction) btn_register
{
    if([self check2password:textfeild_password.text and:textfeild_password_again.text] && [self isValidateEmail:textfield_mailnum.text])
    {
        RegisterStatusCode statusCode = RIG_SUCCESS; // Get from backend
        NSArray *register_status = [NSArray arrayWithObjects:@"注册成功", @"验证码错误，注册失败", @"网络不佳，注册失败", nil];
        [self presentViewController:[UI_tools alert_withName:@"提示" andMessage:register_status[statusCode]] animated:false completion:nil];
        
    }
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

-(BOOL)isValidateEmail:(NSString *)email
{

    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    bool valid = [emailTest evaluateWithObject:email];
    if(!valid)
    {
        [self presentViewController:[UI_tools alert_withName:@"提示" andMessage:@"请检查邮箱是否输入正确"] animated:false completion:nil];
    }
    return valid;

}

@end
