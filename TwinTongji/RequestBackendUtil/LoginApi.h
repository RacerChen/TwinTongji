//
//  LoginApi.h
//  TwinTongji
//
//  Created by 陈嘉捷 on 2021/1/6.
//

#import <UIKit/UIKit.h>

typedef enum _LoginStatusCode
{
    LOGIN_FAIL_NETWORK = 0,
    LOGIN_WRONG_CODE = 1,
    LOGIN_SUCCESS = 2
} LoginStatusCode;

@interface LoginApi : NSObject

@property int return_code;
@property dispatch_semaphore_t semaphore;

-(void) login_request:(NSString *) userID password: (NSString *) password;

@end
