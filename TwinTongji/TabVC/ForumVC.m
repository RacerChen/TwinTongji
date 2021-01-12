//
//  ForumVC.m
//  TwinTongji
//
//  Created by 陈嘉捷 on 2021/1/12.
//

#import "ForumVC.h"
#import "ForumCell.h"
#import "ForumCellInfo.h"

@interface ForumVC () <UITableViewDataSource, UITableViewDelegate>
{
    int forumsNum;
    NSMutableArray *marr_forumsList;
}

@end

@implementation ForumVC

@synthesize PostsTablelist;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    marr_forumsList = [NSMutableArray arrayWithCapacity:8];
    [self init_tableview];
}

- (void) init_tableview
{
    forumsNum = 8;
    PostsTablelist.rowHeight = 178;
    PostsTablelist.separatorStyle = NO;
    ForumCellInfo *cellInfo1 = [[ForumCellInfo alloc] initWithPortrait:nil andNickname:@"SDF" andSchoolName:@"电信学院" andPostTime:@"12:22" andPostContent:@"今天天气真好啊！" andPost1stImage:nil];
    ForumCellInfo *cellInfo2 = [[ForumCellInfo alloc] initWithPortrait:nil andNickname:@"FRE" andSchoolName:@"机械学院" andPostTime:@"16:22" andPostContent:@"请问今天有去自习的吗" andPost1stImage:nil];
    ForumCellInfo *cellInfo3 = [[ForumCellInfo alloc] initWithPortrait:nil andNickname:@"SDF" andSchoolName:@"汽车学院" andPostTime:@"20:22" andPostContent:@"今天图书馆的空调可太热了！" andPost1stImage:nil];
    ForumCellInfo *cellInfo4 = [[ForumCellInfo alloc] initWithPortrait:nil andNickname:@"FJE" andSchoolName:@"电信学院" andPostTime:@"22:30" andPostContent:@"请问有一起参加比赛的人？" andPost1stImage:nil];
    ForumCellInfo *cellInfo5 = [[ForumCellInfo alloc] initWithPortrait:nil andNickname:@"DSF" andSchoolName:@"经管学院" andPostTime:@"22:31" andPostContent:@"有人有《计量经济学》吗？" andPost1stImage:nil];
    ForumCellInfo *cellInfo6 = [[ForumCellInfo alloc] initWithPortrait:nil andNickname:@"OGK" andSchoolName:@"电信学院" andPostTime:@"22:44" andPostContent:@"请问明天有一起跑步的吗？" andPost1stImage:nil];
    ForumCellInfo *cellInfo7 = [[ForumCellInfo alloc] initWithPortrait:nil andNickname:@"JBK" andSchoolName:@"汽车学院" andPostTime:@"23:01" andPostContent:@"大家晚安！" andPost1stImage:nil];
    ForumCellInfo *cellInfo8 = [[ForumCellInfo alloc] initWithPortrait:nil andNickname:@"TSJ" andSchoolName:@"艺术学院" andPostTime:@"23:11" andPostContent:@"不想学习！" andPost1stImage:nil];
    [marr_forumsList addObject:cellInfo1];
    [marr_forumsList addObject:cellInfo2];
    [marr_forumsList addObject:cellInfo3];
    [marr_forumsList addObject:cellInfo4];
    [marr_forumsList addObject:cellInfo5];
    [marr_forumsList addObject:cellInfo6];
    [marr_forumsList addObject:cellInfo7];
    [marr_forumsList addObject:cellInfo8];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return forumsNum;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellTableIndentifier = @"forum_Cell";
    //单元格ID
    //重用单元格
    ForumCell * forumCell = [tableView dequeueReusableCellWithIdentifier:CellTableIndentifier];
    //初始化单元格
    if(forumCell == nil)
    {
        NSArray * nib = [[NSBundle mainBundle] loadNibNamed:@"ForumCell" owner:self options:nil];
        forumCell = [nib objectAtIndex:0];
    }

    forumCell.nickname.text = [(ForumCellInfo *)[marr_forumsList objectAtIndex:indexPath.row] nickname];
    forumCell.schoolName.text = [(ForumCellInfo *)[marr_forumsList objectAtIndex:indexPath.row] schoolName];
    forumCell.postTime.text = [(ForumCellInfo *)[marr_forumsList objectAtIndex:indexPath.row] postTime];
    forumCell.postContent.text = [(ForumCellInfo *)[marr_forumsList objectAtIndex:indexPath.row] postContent];
    
    // get avatar from avatar url
    // apiCell.img_avatar.image = [myWebUtil requestAvatarFromUrl:[(ApiInfo *)[marr_githubData objectAtIndex:indexPath.row] avatarUrl]];
    
    return forumCell;
}

@end
