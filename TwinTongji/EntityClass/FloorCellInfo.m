//
//  FloorCellInfo.m
//  TwinTongji
//
//  Created by 陈嘉捷 on 2021/4/8.
//

#import "FloorCellInfo.h"

@interface FloorCellInfo ()

@end

@implementation FloorCellInfo

@synthesize floor_structure, floor_num, crowded_index, noise_index;

- (id) initWithFloorStruct:(UIImage *) theFloorStruct andFloorNum:(NSString *) theFloorNum andCrowded:(NSString *) theCrowded andNoise:(NSString *) theNoise
{
    if(self = [super init])
    {
        floor_structure = theFloorStruct;
        floor_num = theFloorNum;
        crowded_index = theCrowded;
        noise_index = theNoise;
    }
    return self;
}

@end
