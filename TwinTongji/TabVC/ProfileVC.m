//
//  ProfileVC.m
//  TwinTongji
//
//  Created by 陈嘉捷 on 2020/12/23.
//

#import "ProfileVC.h"

@interface ProfileVC () <SDCycleScrollViewDelegate>

@end

@implementation ProfileVC

@synthesize imgview_portrait;
@synthesize cycerView_photos;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self init_cycleScrollView];
    [self init_portrait:@"portrait.jpg"];
}

-(IBAction) btn_click_imgview_portrait
{
    NSLog(@"Click Portrait");
}

-(void) init_cycleScrollView
{
    NSArray *img_arr = [NSArray arrayWithObjects:[UIImage imageNamed:@"scroll_img_1.jpg"], [UIImage imageNamed:@"scroll_img_2.jpg"], [UIImage imageNamed:@"scroll_img_3.jpg"], nil];
    self.cycerView_photos = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero
                                                                delegate:self
                                                        placeholderImage:[UIImage imageNamed:@"tabbar_icon0_normal"]];
            
    self.cycerView_photos.localizationImageNamesGroup = img_arr;
    self.cycerView_photos.autoScrollTimeInterval = 5.;// 自动滚动时间间隔
    self.cycerView_photos.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;// 翻页 右下角
    self.cycerView_photos.titleLabelBackgroundColor = [UIColor clearColor];// 图片对应的标题的 背景色。（因为没有设标题）
}

-(void) init_portrait: (NSString *) imageName
{
    imgview_portrait.image = [UIImage imageNamed:imageName];
    imgview_portrait.layer.cornerRadius = imgview_portrait.frame.size.height / 5;
}

@end

