//
//  SecondSegVC.m
//  TwinTongji
//
//  Created by 陈嘉捷 on 2021/1/7.
//

#import "SecondSegVC.h"
#import "UI_tools.h"

@interface SecondSegVC () 

@end

@implementation SecondSegVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(IBAction) btn_canteen_enter
{
    NSLog(@"%@", [self return_cur_time]);
    _lbl_canteen_lasttime.text = [self return_cur_time];
    [self presentViewController:[UI_tools alert_withName:@"提示" andMessage:@"进入食堂成功" clickDoFunction:nil] animated:TRUE completion:nil];
}

-(IBAction) btn_school_enter
{
    NSLog(@"%@", [self return_cur_time]);
    _lbl_school_lasttime.text = [self return_cur_time];
    [self presentViewController:[UI_tools alert_withName:@"提示" andMessage:@"进入学院成功" clickDoFunction:nil] animated:TRUE completion:nil];
}

-(IBAction) btn_dorm_enter
{
    NSLog(@"%@", [self return_cur_time]);
    _lbl_dorm_lasttime.text = [self return_cur_time];
    [self presentViewController:[UI_tools alert_withName:@"提示" andMessage:@"进入宿舍成功" clickDoFunction:nil] animated:TRUE completion:nil];
}

-(IBAction) btn_basketball_enter
{
    NSLog(@"%@", [self return_cur_time]);
    _lbl_basketball_lasttime.text = [self return_cur_time];
    [self presentViewController:[UI_tools alert_withName:@"提示" andMessage:@"进入篮球场成功" clickDoFunction:nil] animated:TRUE completion:nil];
}

-(IBAction) btn_canteen_leave
{
    NSLog(@"%@", [self return_cur_time]);
    _lbl_canteen_lasttime.text = [self return_cur_time];
    [self presentViewController:[UI_tools alert_withName:@"提示" andMessage:@"离开食堂成功" clickDoFunction:nil] animated:TRUE completion:nil];
}

-(IBAction) btn_school_leave
{
    NSLog(@"%@", [self return_cur_time]);
    _lbl_school_lasttime.text = [self return_cur_time];
    [self presentViewController:[UI_tools alert_withName:@"提示" andMessage:@"离开学院成功" clickDoFunction:nil] animated:TRUE completion:nil];
}

-(IBAction) btn_dorm_leave
{
    NSLog(@"%@", [self return_cur_time]);
    _lbl_dorm_lasttime.text = [self return_cur_time];
    [self presentViewController:[UI_tools alert_withName:@"提示" andMessage:@"离开宿舍成功" clickDoFunction:nil] animated:TRUE completion:nil];
}

-(IBAction) btn_basketball_leave
{
    NSLog(@"%@", [self return_cur_time]);
    _lbl_basketball_lasttime.text = [self return_cur_time];
    [self presentViewController:[UI_tools alert_withName:@"提示" andMessage:@"离开篮球场成功" clickDoFunction:nil] animated:TRUE completion:nil];
}

-(NSString *) return_cur_time
{
    NSDate* cur_time = [NSDate date];
    NSDateFormatter* formattor = [[NSDateFormatter alloc]init];
    formattor.dateFormat=@"yyyy-MM-dd hh:mm:ss";
    return [formattor stringFromDate:cur_time];
}

@end
