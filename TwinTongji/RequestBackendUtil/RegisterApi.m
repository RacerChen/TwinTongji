//
//  RegisterApi.m
//  TwinTongji
//
//  Created by 陈嘉捷 on 2020/12/31.
//

#import "RegisterApi.h"

@interface RegisterApi()

@end

@implementation RegisterApi

@synthesize register_return_code, verify_return_code;

-(id) init
{
    if (self = [super init])
    {
        register_return_code = RIG_FAIL_NETWORK;
        verify_return_code = @"wrong"; // Will not be passed by checking
    }
    return self;
}

-(void) requestVerifyCode:(NSString *) email_account
{
    NSString *str_httpUrl = [NSString stringWithFormat:@"https://api_url/id=%@", email_account];
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
                    NSLog(@"%@", error);
                    self.verify_return_code = @"wrong";
                }
                else
                {
                    // NSString *data = @"{\"return_code\" : 1}";
                    NSDictionary *return_json_dic = [NSJSONSerialization JSONObjectWithData:data
                                                                            options:NSJSONReadingMutableContainers
                                                                              error:nil];
                    NSLog(@"Return Code: %@", [return_json_dic objectForKey:@"verify_return_code"]);
                    self.verify_return_code = [return_json_dic objectForKey:@"verify_return_code"];
                }
           }] resume];
}

-(void) registerWithEmail:(NSString *) email_account andPassword:(NSString *) password andVerifyCode:(NSString *) verifyCode
{
    NSString *str_httpUrl = [NSString stringWithFormat:@"https://api_url/id=%@&page=%@&verifycode=%@", email_account, password, verifyCode];
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
                    NSLog(@"%@", error);
                    self.register_return_code = RIG_FAIL_NETWORK;
                }
                else
                {
                    // NSString *data = @"{\"return_code\" : 1}";
                    NSDictionary *return_json_dic = [NSJSONSerialization JSONObjectWithData:data
                                                                            options:NSJSONReadingMutableContainers
                                                                              error:nil];
                    NSLog(@"Return Code: %d", [[return_json_dic objectForKey:@"register_return_code"] intValue]);
                    self.register_return_code = [[return_json_dic objectForKey:@"register_return_code"] intValue];
                }
           }] resume];
}

@end
