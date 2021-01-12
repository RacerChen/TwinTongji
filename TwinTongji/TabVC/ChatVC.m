//
//  ChatVC.m
//  TwinTongji
//
//  Created by 陈嘉捷 on 2021/1/12.
//

#import "ChatVC.h"
#import "ChatCell.h"
#import "ChatCellInfo.h"

@interface ChatVC () <UITableViewDataSource, UITableViewDelegate>
{
    int chatsNum;
    NSMutableArray *marr_chatsList;
}
@end

@implementation ChatVC

@synthesize ChatsTablelist;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    marr_chatsList = [NSMutableArray arrayWithCapacity:16];
    [self init_tablelist];
}

- (void) init_tablelist
{
    chatsNum = 16;
    ChatsTablelist.rowHeight = 75;
    ChatsTablelist.separatorStyle = NO;
    ChatCellInfo *cellInfo1 = [[ChatCellInfo alloc] initWithPortrait:nil andNickname:@"LXJ" andSchoolName:@"电信学院" andChatCellTime:@"14:33" andChatCellContent:@"你们的项目开始了吗？"];
    ChatCellInfo *cellInfo2 = [[ChatCellInfo alloc] initWithPortrait:nil andNickname:@"SKA" andSchoolName:@"轨交学院" andChatCellTime:@"12:44" andChatCellContent:@"昨天的饭菜怎么样？"];
    ChatCellInfo *cellInfo3 = [[ChatCellInfo alloc] initWithPortrait:nil andNickname:@"CKS" andSchoolName:@"经管学院" andChatCellTime:@"14:33" andChatCellContent:@"学校那个讲堂怎么样？"];
    ChatCellInfo *cellInfo4 = [[ChatCellInfo alloc] initWithPortrait:nil andNickname:@"WFL" andSchoolName:@"汽车学院" andChatCellTime:@"14:23" andChatCellContent:@"我是汽车学院的WFL"];
    ChatCellInfo *cellInfo5 = [[ChatCellInfo alloc] initWithPortrait:nil andNickname:@"XYH" andSchoolName:@"机械学院" andChatCellTime:@"01:33" andChatCellContent:@"Hello"];
    ChatCellInfo *cellInfo6 = [[ChatCellInfo alloc] initWithPortrait:nil andNickname:@"DAJ" andSchoolName:@"电信学院" andChatCellTime:@"15:33" andChatCellContent:@"你好啊"];
    ChatCellInfo *cellInfo7 = [[ChatCellInfo alloc] initWithPortrait:nil andNickname:@"LSI" andSchoolName:@"电信学院" andChatCellTime:@"19:33" andChatCellContent:@"好的"];
    ChatCellInfo *cellInfo8 = [[ChatCellInfo alloc] initWithPortrait:nil andNickname:@"OOS" andSchoolName:@"轨交学院" andChatCellTime:@"19:33" andChatCellContent:@"在吗？"];
    ChatCellInfo *cellInfo9 = [[ChatCellInfo alloc] initWithPortrait:nil andNickname:@"SFK" andSchoolName:@"轨交学院" andChatCellTime:@"19:33" andChatCellContent:@"在吗？"];
    ChatCellInfo *cellInfo10 = [[ChatCellInfo alloc] initWithPortrait:nil andNickname:@"OWF" andSchoolName:@"轨交学院" andChatCellTime:@"19:33" andChatCellContent:@"在吗？"];
    ChatCellInfo *cellInfo11 = [[ChatCellInfo alloc] initWithPortrait:nil andNickname:@"PFS" andSchoolName:@"电信学院" andChatCellTime:@"19:33" andChatCellContent:@"在吗？"];
    ChatCellInfo *cellInfo12 = [[ChatCellInfo alloc] initWithPortrait:nil andNickname:@"MFW" andSchoolName:@"电信学院" andChatCellTime:@"19:33" andChatCellContent:@"在吗？"];
    ChatCellInfo *cellInfo13 = [[ChatCellInfo alloc] initWithPortrait:nil andNickname:@"EFO" andSchoolName:@"轨交学院" andChatCellTime:@"19:33" andChatCellContent:@"在吗？"];
    ChatCellInfo *cellInfo14 = [[ChatCellInfo alloc] initWithPortrait:nil andNickname:@"FWS" andSchoolName:@"汽车学院" andChatCellTime:@"19:33" andChatCellContent:@"在吗？"];
    ChatCellInfo *cellInfo15 = [[ChatCellInfo alloc] initWithPortrait:nil andNickname:@"FFS" andSchoolName:@"汽车学院" andChatCellTime:@"19:33" andChatCellContent:@"在吗？"];
    ChatCellInfo *cellInfo16 = [[ChatCellInfo alloc] initWithPortrait:nil andNickname:@"FKE" andSchoolName:@"轨交学院" andChatCellTime:@"19:33" andChatCellContent:@"在吗？"];
    [marr_chatsList addObject:cellInfo1];
    [marr_chatsList addObject:cellInfo2];
    [marr_chatsList addObject:cellInfo3];
    [marr_chatsList addObject:cellInfo4];
    [marr_chatsList addObject:cellInfo5];
    [marr_chatsList addObject:cellInfo6];
    [marr_chatsList addObject:cellInfo7];
    [marr_chatsList addObject:cellInfo8];
    [marr_chatsList addObject:cellInfo9];
    [marr_chatsList addObject:cellInfo10];
    [marr_chatsList addObject:cellInfo11];
    [marr_chatsList addObject:cellInfo12];
    [marr_chatsList addObject:cellInfo13];
    [marr_chatsList addObject:cellInfo14];
    [marr_chatsList addObject:cellInfo15];
    [marr_chatsList addObject:cellInfo16];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return chatsNum;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellTableIndentifier = @"chat_Cell";
    //单元格ID
    //重用单元格
    ChatCell * chatCell = [tableView dequeueReusableCellWithIdentifier:CellTableIndentifier];
    //初始化单元格
    if(chatCell == nil)
    {
        NSArray * nib = [[NSBundle mainBundle] loadNibNamed:@"ChatCell" owner:self options:nil];
        chatCell = [nib objectAtIndex:0];
    }
//    chatCell.portrait = [(ChatCell *)[marr_chatsList objectAtIndex:indexPath.row] portrait];
    chatCell.messageAlarm.hidden = true;
    chatCell.nickname.text = [(ChatCellInfo *)[marr_chatsList objectAtIndex:indexPath.row] nickname];
    chatCell.schoolName.text = [(ChatCellInfo *)[marr_chatsList objectAtIndex:indexPath.row] schoolName];
    chatCell.messageTime.text = [(ChatCellInfo *)[marr_chatsList objectAtIndex:indexPath.row] chatcellTime];
    chatCell.messageContent.text = [(ChatCellInfo *)[marr_chatsList objectAtIndex:indexPath.row] chatcellContent];
    
    // get avatar from avatar url
    // apiCell.img_avatar.image = [myWebUtil requestAvatarFromUrl:[(ApiInfo *)[marr_githubData objectAtIndex:indexPath.row] avatarUrl]];
    
    return chatCell;
}
@end
