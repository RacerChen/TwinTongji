//
//  UI_tools.h
//  TwinTongji
//
//  Created by 陈嘉捷 on 2020/12/23.
//

#import <UIKit/UIKit.h>

@interface UI_tools : NSObject

// NavigatorController show detail of a view controller in Storyboard by its' ID
+(void) navigator:(UINavigationController *) NC showDetailOf: (NSString *) VC_id inStoryBoard: (NSString *) storyboardName;
// Show an alert with title and message(content)
+(UIAlertController *) alert_withName: (NSString *) title andMessage: (NSString *) message;

@end
