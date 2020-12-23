//
//  LoginVC.m
//  TwinTongji
//
//  Created by 陈嘉捷 on 2020/12/22.
//

#import "LoginVC.h"

@interface LoginVC () <UITextFieldDelegate>

@end

@implementation LoginVC

@synthesize textField_Lg_ID;
@synthesize textField_lg_password;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    textField_Lg_ID.delegate = self;
    textField_lg_password.delegate = self;
}


-(IBAction) btn_login
{
    [self.view endEditing:YES];
    if ([textField_Lg_ID.text isEqualToString: @"cjj"] && [textField_lg_password.text isEqualToString: @"cjj"] )
    {
        NSLog(@"Login: ID:%@ and password:%@. Successfully", textField_Lg_ID.text, textField_lg_password.text);
        [UI_tools navigator:self.navigationController showDetailOf:@"TabVC" inStoryBoard:@"Main"];
        return;
    }
    else
    {
        NSString * returnCode = @"用户名或密码错误";
        [self presentViewController:[UI_tools alert_withName:@"提示" andMessage:returnCode] animated:true completion:nil];
        return;
    }
    
}

-(IBAction) btn_register
{
    NSLog(@"Register");
    [self.view endEditing:YES];
}

//当用户按下return键或者按回车键，keyboard消失
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [self btn_login];
    return YES;
}

//当用户按下空白处，keyboard消失
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
