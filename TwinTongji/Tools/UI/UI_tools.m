//
//  UI_tools.m
//  TwinTongji
//
//  Created by 陈嘉捷 on 2020/12/23.
//

#import "UI_tools.h"

@interface UI_tools ()

@end

@implementation UI_tools

+(void) navigator:(UINavigationController *) NC showDetailOf: (NSString *) VC_id inStoryBoard: (NSString *) storyboardName
{
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:[NSBundle mainBundle]];
    UIViewController * VC = [[UIViewController alloc] init];
    //根据storyboard创建控制对象
    VC = [storyboard instantiateViewControllerWithIdentifier:VC_id];
    [NC showDetailViewController:VC sender:nil];
}

+(UIAlertController *) alert_withName: (NSString *) title andMessage: (NSString *) message
{
    //初始化提示框；
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle: UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //点击按钮的响应事件；
    }]];
    return alert;
}

@end
