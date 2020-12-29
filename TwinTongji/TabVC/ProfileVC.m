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

@synthesize imgview_gender_index, imgview_portrait, view_contain_scollview, is_female, arr_photos;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Get from backend
    [self init_cycleScrollView];
    [self init_portrait:@"portrait.jpg"];
    is_female = false;
}

-(IBAction) btn_click_imgview_portrait
{
    NSLog(@"Click Portrait");
    [ZJImageMagnification scanBigImageWithImageView:imgview_portrait alpha:0.8];
}

-(void) init_cycleScrollView
{
    arr_photos = [NSMutableArray arrayWithObjects:@"scroll_img_1.jpg", @"scroll_img_2.jpg", @"portrait.jpg", nil];
    // 本地加载 --- 创建不带标题的图片轮播器[same size and position with view_contain_scollview]
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(view_contain_scollview.frame.origin.x, view_contain_scollview.frame.origin.y - UI_TOOLS_NAVI_BAR_HEIGTH, view_contain_scollview.frame.size.width, view_contain_scollview.frame.size.height) shouldInfiniteLoop:YES imageNamesGroup:arr_photos];
    cycleScrollView.delegate = self;
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    cycleScrollView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    [view_contain_scollview addSubview:cycleScrollView];
}

-(void) init_portrait: (NSString *) imageName
{
    imgview_portrait.image = [UIImage imageNamed:imageName];
    imgview_portrait.layer.cornerRadius = imgview_portrait.frame.size.height / 2;
    if(self.is_female)
        imgview_gender_index.image = [UIImage imageNamed:@"female_index.png"];
    else
        imgview_gender_index.image = [UIImage imageNamed:@"male_index.png"];
}

#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
}

@end

