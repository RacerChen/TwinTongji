//
//  LoginApi.m
//  TwinTongji
//
//  Created by 陈嘉捷 on 2020/12/30.
//

#import "LoginApi.h"

@interface LoginApi()

@end

@implementation LoginApi

@synthesize return_code;
@synthesize semaphore;

-(id) init
{
    if(self = [super init])
    {
        return_code = LOGIN_FAIL_NETWORK;
        semaphore = dispatch_semaphore_create(0);
    }
    return self;
}

-(void) login_request:(NSString *) userID password: (NSString *) password
{
    NSString *str_httpUrl = [NSString stringWithFormat:@"http://123.60.11.249:8080/user/UserLogin?email=%@&password=%@", userID, password];
    NSLog(@"%@",str_httpUrl);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:str_httpUrl]];
    request.timeoutInterval = 5;
    request.HTTPMethod = @"POST";
    
    
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:str_httpUrl]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                if (data == nil || error != nil)
                {
                    NSLog(@"error: %@", error);
                    self.return_code = LOGIN_FAIL_NETWORK;
                }
                else
                {
                    // NSString *data = @"{\"return_code\" : 1}";
                    NSDictionary *return_json_dic = [NSJSONSerialization JSONObjectWithData:data
                                                                            options:NSJSONReadingMutableContainers
                                                                              error:nil];
                    NSLog(@"%@", return_json_dic);
                    NSLog(@"Return Code: %@", [return_json_dic objectForKey:@"email"]);
                    NSString *cur_email = [return_json_dic objectForKey:@"email"];
                    NSLog(@"%@", cur_email);
                    if (![cur_email isEqual:[NSNull null]])
                        self.return_code = LOGIN_SUCCESS;
                    else
                        self.return_code = LOGIN_WRONG_CODE;
                }
                dispatch_semaphore_signal(self->semaphore);
           }] resume];
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
}

@end

