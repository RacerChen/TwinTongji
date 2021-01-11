//
//  FirstSegVC.m
//  TwinTongji
//
//  Created by 陈嘉捷 on 2021/1/7.
//

#import "FirstSegVC.h"

@interface FirstSegVC () <CLLocationManagerDelegate, MKMapViewDelegate, MKOverlay>
{
    CLLocationCoordinate2D bounary_points[15];
}

@end

@implementation FirstSegVC

@synthesize locationManager;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self init_map];
//    [self startStandardUpdates];
}

-(void) init_map
{
    self.mapview.delegate = self;
    [self.mapview setUserInteractionEnabled:YES];
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate=self;
    locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    locationManager.distanceFilter=1000.0f;
    [locationManager startUpdatingLocation];
    [self.mapview setRegion:MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(31.286113, 121.215403), 3000, 3000)];
    self.mapview.showsUserLocation = YES;
    
    // Init Tongji boundary
    CLLocationCoordinate2D coord1 = CLLocationCoordinate2DMake(31.291756, 121.206684);
    CLLocationCoordinate2D coord2 = CLLocationCoordinate2DMake(31.289806, 121.205017);
    CLLocationCoordinate2D coord3 = CLLocationCoordinate2DMake(31.286756, 121.207842);
    CLLocationCoordinate2D coord4 = CLLocationCoordinate2DMake(31.285723, 121.206590);
    CLLocationCoordinate2D coord5 = CLLocationCoordinate2DMake(31.285314, 121.207384);
    CLLocationCoordinate2D coord6 = CLLocationCoordinate2DMake(31.284809, 121.207081);
    CLLocationCoordinate2D coord7 = CLLocationCoordinate2DMake(31.277383, 121.217677);
    CLLocationCoordinate2D coord8 = CLLocationCoordinate2DMake(31.283055, 121.222527);
    CLLocationCoordinate2D coord9 = CLLocationCoordinate2DMake(31.284205, 121.223056);
    CLLocationCoordinate2D coord10 = CLLocationCoordinate2DMake(31.285409, 121.223492);
    CLLocationCoordinate2D coord11 = CLLocationCoordinate2DMake(31.287768, 121.223242);
    CLLocationCoordinate2D coord12 = CLLocationCoordinate2DMake(31.290684, 121.222913);
    CLLocationCoordinate2D coord13 = CLLocationCoordinate2DMake(31.290772, 121.221374);
    CLLocationCoordinate2D coord14 = CLLocationCoordinate2DMake(31.291327, 121.218703);
    CLLocationCoordinate2D coord15 = CLLocationCoordinate2DMake(31.291756, 121.206684);
    bounary_points[0] = coord1;
    bounary_points[1] = coord2;
    bounary_points[2] = coord3;
    bounary_points[3] = coord4;
    bounary_points[4] = coord5;
    bounary_points[5] = coord6;
    bounary_points[6] = coord7;
    bounary_points[7] = coord8;
    bounary_points[8] = coord9;
    bounary_points[9] = coord10;
    bounary_points[10] = coord11;
    bounary_points[11] = coord12;
    bounary_points[12] = coord13;
    bounary_points[13] = coord14;
    bounary_points[14] = coord15;
    //根据点的数组创建一个MKPolyline，并添加这个line作为overlay（可以添加很多overlay，堆栈形式）
    MKPolyline *line = [MKPolyline polylineWithCoordinates:bounary_points count:15];
    [self.mapview addOverlay: line];
}


- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id<MKOverlay>)overlay
{
    if ([overlay isKindOfClass:[MKPolyline class]])
    {
        MKPolylineView *lineview=[[MKPolylineView alloc] initWithOverlay:overlay];
        lineview.strokeColor=[[UIColor blueColor] colorWithAlphaComponent:0.5];
        lineview.lineWidth=6.0;
        lineview.fillColor= [UIColor redColor];
        return lineview;
    }
    return nil;
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

@synthesize boundingMapRect;

@synthesize coordinate;

@end

