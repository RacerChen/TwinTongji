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
{
    RegisterApi *curRegisterApi;
}

@synthesize textfield_mailnum, textfeild_password, textfeild_password_again, textfeild_verifyCode;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    curRegisterApi = [[RegisterApi alloc] init];
}

-(IBAction) btn_sendVerifyCode
{
    if([self isValidateEmail:textfield_mailnum.text])
    {
        NSLog(@"Verify Code sended!");
        [curRegisterApi requestVerifyCode:textfield_mailnum.text];
        if(![curRegisterApi.verify_return_code isEqualToString:@"wrong"])
        {
            [self presentViewController:[UI_tools alert_withName:@"提示" andMessage:@"验证码已经发送到您的邮箱，请查验" clickDoFunction:nil] animated:true completion:nil];
        }
        else
        {
            [self presentViewController:[UI_tools alert_withName:@"提示" andMessage:@"验证码发送失败，请重试" clickDoFunction:nil] animated:true completion:nil];
        }
    }
    else
    {
        [self presentViewController:[UI_tools alert_withName:@"提示" andMessage:@"请输入正确的邮箱号" clickDoFunction:nil] animated:true completion:nil];
    }
}

-(IBAction) btn_register
{
    if([self isValidateEmail:textfield_mailnum.text]
       && [self check2password:textfeild_password.text and:textfeild_password_again.text]
       && [self isValidateVerifyCode:textfeild_verifyCode.text])
    {
        [curRegisterApi registerWithEmail:textfield_mailnum.text andPassword:textfeild_password.text andVerifyCode:textfeild_verifyCode.text]; // Get from backend
        RegisterStatusCode statusCode = curRegisterApi.register_return_code;
        NSArray *register_status = [NSArray arrayWithObjects: @"网络不佳，注册失败", @"验证码错误，注册失败", @"注册成功", nil];
        ClickDoFunction cf;
        if(statusCode == RIG_SUCCESS)
            cf = ^void(){
                [self.navigationController popViewControllerAnimated:false];
                };
        else
            cf = nil;
        [self presentViewController:[UI_tools alert_withName:@"提示" andMessage:register_status[statusCode] clickDoFunction:cf] animated:true completion:nil];
    }
}

-(BOOL) check2password:(NSString *) password and:(NSString *) passwordAgain
{
    BOOL password_correct = true;
    if([password isEqualToString:@""] || [passwordAgain isEqual:@""])
    {
        [self presentViewController:[UI_tools alert_withName:@"提示" andMessage:@"请填写两次密码" clickDoFunction:nil] animated:true completion:nil];
        password_correct = false;
    }
    else if(![password isEqualToString:passwordAgain])
    {
        [self presentViewController:[UI_tools alert_withName:@"提示" andMessage:@"两次密码输入不一致，请检查" clickDoFunction:nil] animated:true completion:nil];
        password_correct = false;
    }
    return password_correct;
}

-(BOOL)isValidateEmail:(NSString *)email
{

    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    bool valid = [emailTest evaluateWithObject:email];
    if(!valid)
    {
        [self presentViewController:[UI_tools alert_withName:@"提示" andMessage:@"请检查邮箱是否输入正确" clickDoFunction:nil] animated:true completion:nil];
    }
    return valid;
}

-(BOOL)isValidateVerifyCode:(NSString *)verifyCode
{

    NSString *verifyCodeRegex = @"[0-9]{4}";
    NSPredicate *verifyCodeTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", verifyCodeRegex];
    bool valid = [verifyCodeTest evaluateWithObject:verifyCode];
    if(!valid)
    {
        [self presentViewController:[UI_tools alert_withName:@"提示" andMessage:@"请检查验证码是否输入正确(4位数字)" clickDoFunction:nil] animated:true completion:nil];
        return false;
    } // Format check
    
    if([textfeild_verifyCode.text isEqualToString:curRegisterApi.verify_return_code]) // Value check
    {
        return true;
    }
    else
    {
        [self presentViewController:[UI_tools alert_withName:@"提示" andMessage:@"请检查验证码不匹配" clickDoFunction:nil] animated:true completion:nil];
        return false;
    }
}


@end
