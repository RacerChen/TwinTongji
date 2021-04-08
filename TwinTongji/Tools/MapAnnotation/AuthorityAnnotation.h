//
//  AuthorityAnnotation.h
//  TwinTongji
//
//  Created by 陈嘉捷 on 2021/4/6.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface AuthorityAnnotation : NSObject<MKAnnotation>

@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic,copy) NSString * title;
@property (nonatomic,copy) NSString * subtitle;

- (id) initWithCoordinate: (CLLocationCoordinate2D) theCoordinate andTile:(NSString *) theTitle andTheSubtitle:(NSString *) theSubTitle;

@end

