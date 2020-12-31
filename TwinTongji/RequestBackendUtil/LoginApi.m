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

-(id) init
{
    if(self = [super init])
    {
        return_code = LOGIN_FAIL_NETWORK;
    }
    return self;
}

-(void) login_request:(NSString *) userID password: (NSString *) password
{
    NSString *str_httpUrl = [NSString stringWithFormat:@"https://api_url/id=%@&page=%@", userID, password];
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
                    self.return_code = LOGIN_FAIL_NETWORK;
                }
                else
                {
                    // NSString *data = @"{\"return_code\" : 1}";
                    NSDictionary *return_json_dic = [NSJSONSerialization JSONObjectWithData:data
                                                                            options:NSJSONReadingMutableContainers
                                                                              error:nil];
                    NSLog(@"Return Code: %d", [[return_json_dic objectForKey:@"return_code"] intValue]);
                    self.return_code = [[return_json_dic objectForKey:@"return_code"] intValue];
                }
           }] resume];
}

@end

