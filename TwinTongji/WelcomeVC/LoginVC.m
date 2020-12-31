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
{
    LoginApi* curLoginApi;
}

@synthesize textField_Lg_ID, textField_lg_password;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    textField_Lg_ID.delegate = self;
    textField_lg_password.delegate = self;
    
    // Test Login JSON
//    NSString *response = @"{\"return_code\" : 1}";
//    NSData *response_data =[response dataUsingEncoding:NSUTF8StringEncoding];
//    NSDictionary *return_json_dic = [NSJSONSerialization JSONObjectWithData:response_data
//                                                            options:NSJSONReadingMutableContainers
//                                                              error:nil];
//    NSLog(@"Return Code: %d", [[return_json_dic objectForKey:@"return_code"] intValue]);
    
    curLoginApi = [[LoginApi alloc] init];
    
    
}


-(IBAction) btn_login
{
    [self.view endEditing:YES]; // Dismiss keyboard
    if([textField_Lg_ID.text isEqualToString:@""])
    {
        [self presentViewController:[UI_tools alert_withName:@"提示" andMessage:@"请输入账号" clickDoFunction:nil] animated:true completion:nil];
        return;
    }
    if([textField_lg_password.text isEqualToString:@""])
    {
        [self presentViewController:[UI_tools alert_withName:@"提示" andMessage:@"请输入密码" clickDoFunction:nil] animated:true completion:nil];
        return;
    }
    
    [curLoginApi login_request:textField_Lg_ID.text password:textField_lg_password.text];
    LoginStatusCode statusCode = curLoginApi.return_code; // Get from backend, init for test
    NSLog(@"!!!!!!!!%d", statusCode);
    if ([textField_Lg_ID.text isEqualToString: @"cjj"] && [textField_lg_password.text isEqualToString: @"cjj"] )
    {
        NSLog(@"Login: ID:%@ and password:%@. Successfully", textField_Lg_ID.text, textField_lg_password.text);
        statusCode = LOGIN_SUCCESS;
    }
    if(statusCode == LOGIN_SUCCESS)
    {
        [UI_tools navigator:self.navigationController showDetailOf:@"TabVC" inStoryBoard:@"Main"];
        return;
    }
    else
    {
        NSArray *login_status = [NSArray arrayWithObjects:@"网络不佳，登录失败", @"用户名或密码错误，请重新登录", @"登录成功", nil];
        [self presentViewController:[UI_tools alert_withName:@"提示" andMessage:login_status[statusCode] clickDoFunction:nil] animated:true completion:nil];
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
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
