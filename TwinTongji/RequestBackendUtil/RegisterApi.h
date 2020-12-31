//
//  RegisterApi.h
//  TwinTongji
//
//  Created by 陈嘉捷 on 2020/12/31.
//

// Use both in register and change password

#import <Foundation/Foundation.h>

typedef enum _RegisterStatusCode
{
    RIG_FAIL_NETWORK = 0,
    RIG_WRONG_CODE = 1,
    RIG_SUCCESS = 2
} RegisterStatusCode;

@interface RegisterApi : NSObject

@property int register_return_code;
@property NSString* verify_return_code;

-(void) requestVerifyCode:(NSString *) email_account;
-(void) registerWithEmail:(NSString *) email_account andPassword:(NSString *) password andVerifyCode:(NSString *) verifyCode;

@end
