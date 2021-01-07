//
//  TwinTongji.h
//  TwinTongji
//
//  Created by 陈嘉捷 on 2021/1/6.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface TwinTongji : UIViewController

@property (strong, nonatomic) IBOutlet UIView *first_containView;
@property (strong, nonatomic) IBOutlet UIView *second_containView;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segment_controll;


- (IBAction)click_seg_controll:(id)sender;

@end
