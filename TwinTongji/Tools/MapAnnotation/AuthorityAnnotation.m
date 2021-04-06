//
//  AuthorityAnnotation.m
//  TwinTongji
//
//  Created by 陈嘉捷 on 2021/4/6.
//

#import "AuthorityAnnotation.h"

@implementation AuthorityAnnotation

@synthesize coordinate, title, subtitle;

- (id) initWithCoordinate: (CLLocationCoordinate2D) theCoordinate andTile:(NSString *) theTitle andTheSubtitle:(NSString *) theSubTitle;
{
    if(self = [super init])
    {
        coordinate = theCoordinate;
        title = theTitle;
        subtitle = theSubTitle;
    }
    return self;
}

@end

