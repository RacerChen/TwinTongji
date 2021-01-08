//
//  PostVC.m
//  TwinTongji
//
//  Created by 陈嘉捷 on 2021/1/7.
//

#import "PostVC.h"

@interface PostVC () <UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    int cur_img_index;
}
@end

@implementation PostVC

bool free_imgview_index[6] = {true, true, true, true, true, true};

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    cur_img_index = 1;
}

- (IBAction)btn_camera
{
    if(![self check_img_index])
        return;
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        imagePickerController.delegate = self; //设置代理
        imagePickerController.allowsEditing = YES;
        imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera; //图片来源
        [self presentViewController:imagePickerController animated:YES completion:nil];
    }
    else
    {
        [self presentViewController:[UI_tools alert_withName:@"提示" andMessage:@"没有检测到摄像头" clickDoFunction:nil] animated:true completion:nil];
    }
}

//当用户取消选择的时候，调用该方法
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:^{}];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{}];
    UIImage *cur_choosed_image = [info objectForKey:UIImagePickerControllerOriginalImage]; //通过key值获取到图片
    switch (cur_img_index)
    {
        case 1:
            self.imgview_pic1.image = cur_choosed_image;
            self.btn_pic1.enabled = true;
            break;
        case 2:
            self.imgview_pic2.image = cur_choosed_image;
            self.btn_pic2.enabled = true;
            break;
        case 3:
            self.imgview_pic3.image = cur_choosed_image;
            self.btn_pic3.enabled = true;
            break;
        case 4:
            self.imgview_pic4.image = cur_choosed_image;
            self.btn_pic4.enabled = true;
            break;
        case 5:
            self.imgview_pic5.image = cur_choosed_image;
            self.btn_pic5.enabled = true;
            break;
        case 6:
            self.imgview_pic6.image = cur_choosed_image;
            self.btn_pic6.enabled = true;
            break;
    }
    free_imgview_index[cur_img_index] = false;
    cur_img_index++;

}

- (IBAction)btn_gallery
{
    if(![self check_img_index])
        return;
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self; //设置代理
    imagePickerController.allowsEditing = YES;
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary; //图片来源
    [self presentViewController:imagePickerController animated:YES completion:nil];

}
- (IBAction)btn_addAudio
{
    NSLog(@"Audio");
}

- (IBAction)btn_addLink
{
    NSLog(@"Click add link");
}

- (IBAction)btn_post
{
    NSLog(@"post");
}

- (BOOL) check_img_index
{
    if (cur_img_index > 6)
    {
        [self presentViewController:[UI_tools alert_withName:@"提示" andMessage:@"最多支持6张照片" clickDoFunction:nil] animated:true completion:nil];
        return false;
    }
    else
        return true;
}
- (IBAction)btn_pic1_cancel
{
    
}
- (IBAction)btn_pic2_cancel
{
    
}
- (IBAction)btn_pic3_cancel
{
    
}
- (IBAction)btn_pic4_cancel
{
    
}
- (IBAction)btn_pic5_cancel
{
    
}
- (IBAction)btn_pic6_cancel
{
    
}
- (int)find_least_free_index
{
    return 0;
}
@end
