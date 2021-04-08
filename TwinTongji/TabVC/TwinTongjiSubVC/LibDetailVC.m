//
//  LibDetailVC.m
//  TwinTongji
//
//  Created by 陈嘉捷 on 2021/4/6.
//

#import <Foundation/Foundation.h>
#import "LibFloorCell.h"
#import "LibDetailVC.h"
#import "FloorCellInfo.h"


@interface LibDetailVC ()<UITableViewDataSource, UITableViewDelegate>
{
    int floorNum;
    NSMutableArray *marr_floorList;
}

@end

@implementation LibDetailVC

@synthesize tbl_lib_floors;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    marr_floorList = [NSMutableArray arrayWithCapacity:11];
    [self init_tablelist];
}

- (void) init_tablelist
{
    floorNum = 11;
    tbl_lib_floors.separatorStyle = YES;
    tbl_lib_floors.rowHeight = 179;
    FloorCellInfo *floorInfo1 = [[FloorCellInfo alloc] initWithFloorStruct:[UIImage imageNamed:@"1.png"] andFloorNum:@"1" andCrowded:@"33%" andNoise:@"43dB"];
    FloorCellInfo *floorInfo2 = [[FloorCellInfo alloc] initWithFloorStruct:[UIImage imageNamed:@"2.png"] andFloorNum:@"2" andCrowded:@"67%" andNoise:@"40dB"];
    FloorCellInfo *floorInfo3 = [[FloorCellInfo alloc] initWithFloorStruct:[UIImage imageNamed:@"3.png"] andFloorNum:@"3" andCrowded:@"45%" andNoise:@"39dB"];
    FloorCellInfo *floorInfo4 = [[FloorCellInfo alloc] initWithFloorStruct:[UIImage imageNamed:@"4.png"] andFloorNum:@"4" andCrowded:@"23%" andNoise:@"22dB"];
    FloorCellInfo *floorInfo5 = [[FloorCellInfo alloc] initWithFloorStruct:[UIImage imageNamed:@"5.png"] andFloorNum:@"5" andCrowded:@"12%" andNoise:@"32dB"];
    FloorCellInfo *floorInfo6 = [[FloorCellInfo alloc] initWithFloorStruct:[UIImage imageNamed:@"6.png"] andFloorNum:@"6" andCrowded:@"77%" andNoise:@"48dB"];
    FloorCellInfo *floorInfo7 = [[FloorCellInfo alloc] initWithFloorStruct:[UIImage imageNamed:@"7.png"] andFloorNum:@"7" andCrowded:@"69%" andNoise:@"45dB"];
    FloorCellInfo *floorInfo8 = [[FloorCellInfo alloc] initWithFloorStruct:[UIImage imageNamed:@"8.png"] andFloorNum:@"8" andCrowded:@"43%" andNoise:@"34dB"];
    FloorCellInfo *floorInfo9 = [[FloorCellInfo alloc] initWithFloorStruct:[UIImage imageNamed:@"9.png"] andFloorNum:@"9" andCrowded:@"23%" andNoise:@"32dB"];
    FloorCellInfo *floorInfo10 = [[FloorCellInfo alloc] initWithFloorStruct:[UIImage imageNamed:@"10.png"] andFloorNum:@"10" andCrowded:@"21%" andNoise:@"21dB"];
    FloorCellInfo *floorInfo11 = [[FloorCellInfo alloc] initWithFloorStruct:[UIImage imageNamed:@"14.png"] andFloorNum:@"14" andCrowded:@"9%" andNoise:@"13dB"];
    [marr_floorList addObject:floorInfo1];
    [marr_floorList addObject:floorInfo2];
    [marr_floorList addObject:floorInfo3];
    [marr_floorList addObject:floorInfo4];
    [marr_floorList addObject:floorInfo5];
    [marr_floorList addObject:floorInfo6];
    [marr_floorList addObject:floorInfo7];
    [marr_floorList addObject:floorInfo8];
    [marr_floorList addObject:floorInfo9];
    [marr_floorList addObject:floorInfo10];
    [marr_floorList addObject:floorInfo11];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return floorNum;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellTableIndentifier = @"floor_Cell";
    //单元格ID
    //重用单元格
    LibFloorCell * libFloorCell = [tableView dequeueReusableCellWithIdentifier:CellTableIndentifier];
    //初始化单元格
    if(libFloorCell == nil)
    {
        NSArray * nib = [[NSBundle mainBundle] loadNibNamed:@"LibFloorCell" owner:self options:nil];
        libFloorCell = [nib objectAtIndex:0];
    }
    
    libFloorCell.imgv_floorstruct.image = [(FloorCellInfo *)[marr_floorList objectAtIndex:indexPath.row] floor_structure];
//    libFloorCell.lbl_floornum.text = [(FloorCellInfo *)[marr_floorList objectAtIndex:indexPath.row] floor_num];
    libFloorCell.lbl_noise.text = [(FloorCellInfo *)[marr_floorList objectAtIndex:indexPath.row] noise_index];
    libFloorCell.lbl_crowed.text = [(FloorCellInfo *)[marr_floorList objectAtIndex:indexPath.row] crowded_index];
    
    return libFloorCell;
}


@end
