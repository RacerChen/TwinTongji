//
//  MapAnnotation.h
//  TwinTongji
//
//  Created by 陈嘉捷 on 2021/1/12.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapAnnotation : NSObject<MKAnnotation>
//大头针的位置
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
//大头针标题
@property (nonatomic, copy) NSString *title;
//大头针的子标题
@property (nonatomic, copy) NSString *subtitle;

@property(nonatomic) MKPinAnnotationColor pinColor;

- (id) initWithCoordinate: (CLLocationCoordinate2D) theCoordinate andTile:(NSString *) theTitle andTheSubtitle:(NSString *) theSubTitle;

@end
