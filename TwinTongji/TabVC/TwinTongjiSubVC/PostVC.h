//
//  PostVC.h
//  TwinTongji
//
//  Created by 陈嘉捷 on 2021/1/7.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "UI_tools.h"

@interface PostVC : UIViewController

@property (strong, nonatomic) IBOutlet UITextView *textview_post;
@property (strong, nonatomic) IBOutlet UIImageView *imgview_pic1;
@property (strong, nonatomic) IBOutlet UIImageView *imgview_pic2;
@property (strong, nonatomic) IBOutlet UIImageView *imgview_pic3;
@property (strong, nonatomic) IBOutlet UIImageView *imgview_pic4;
@property (strong, nonatomic) IBOutlet UIImageView *imgview_pic5;
@property (strong, nonatomic) IBOutlet UIImageView *imgview_pic6;
@property (strong, nonatomic) IBOutlet MKMapView *cur_mapview;

- (IBAction)btn_camera;
- (IBAction)btn_gallery;
- (IBAction)btn_addAudio;
- (IBAction)btn_addLink;
- (IBAction)btn_post;


@end
