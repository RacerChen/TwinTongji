//
//  TwinTongji.m
//  TwinTongji
//
//  Created by 陈嘉捷 on 2021/1/6.
//

#import "TwinTongji.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapNaviKit/AMapNaviKit.h>


@interface TwinTongji ()

@end

@implementation TwinTongji

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ///地图需要v4.5.0及以上版本才必须要打开此选项（v4.5.0以下版本，需要手动配置info.plist）
    [AMapServices sharedServices].enableHTTPS = YES;
        
    ///初始化地图
    MAMapView *_mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    _mapView.showsIndoorMap = YES;
        
    ///把地图添加至view
    [self.view addSubview:_mapView];
}


@end
