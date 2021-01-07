//
//  FirstSegVC.m
//  TwinTongji
//
//  Created by 陈嘉捷 on 2021/1/7.
//

#import "FirstSegVC.h"

@interface FirstSegVC () <CLLocationManagerDelegate>

@end

@implementation FirstSegVC

@synthesize locationManager;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self init_map_region];
//    [self startStandardUpdates];
}

-(void) init_map_region
{
    [self.mapview setRegion:MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(31.291873, 121.220631), 3000, 3000)];
    self.mapview.showsUserLocation = YES;
}


# pragma get_user_location
- (void)startStandardUpdates{
    // Create the location manager if this object does not
    // already have one.
    if (nil == locationManager)
        locationManager = [[CLLocationManager alloc] init];
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0){
        [locationManager requestWhenInUseAuthorization];
    }
    if(![CLLocationManager locationServicesEnabled]){
        NSLog(@"请开启定位:设置 > 隐私 > 位置 > 定位服务");
    }
    if([locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        [locationManager requestAlwaysAuthorization]; // 永久授权
        [locationManager requestWhenInUseAuthorization]; //使用中授权
    }
    [locationManager startUpdatingLocation];
    
}

@end

