//
//  LibDetailVC.m
//  TwinTongji
//
//  Created by 陈嘉捷 on 2021/4/6.
//

#import <Foundation/Foundation.h>

#import "LibDetailVC.h"

@interface LibDetailVC ()<UITableViewDataSource, UITableViewDelegate>
{
    int floorNum;
    NSMutableArray *marr_floorList;
}

@end

@implementation LibDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    marr_floorList = [NSMutableArray arrayWithCapacity:14];
}


@end
