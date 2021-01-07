//
//  FirstSegVC.h
//  TwinTongji
//
//  Created by 陈嘉捷 on 2021/1/7.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface FirstSegVC : UIViewController

@property (strong, nonatomic) IBOutlet MKMapView *mapview;

@property (strong, nonatomic) CLLocationManager *locationManager;

@end
