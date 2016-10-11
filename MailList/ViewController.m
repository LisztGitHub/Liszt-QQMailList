//
//  ViewController.m
//  MailList
//
//  Created by Lester on 16/9/12.
//  Copyright © 2016年 Lester-iOS开发:98787555. All rights reserved.
//

#import "ViewController.h"
#import "ContactsGroupModel.h"
#import "ContactsListHeader.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,ContactsListHeaderDelegate>{
    /** 分组信息*/
    NSMutableArray *contactsListData;
}
/** tableView*/
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.tableView];
}

- (NSArray *)contactsListData{
    if(!contactsListData){
        contactsListData = [NSMutableArray new];
        NSArray *names = @[@"全部好友",@"阿里巴巴",@"腾讯集团",@"百度",@"迅雷",@"优土",@"爱奇艺"];
        
        for(NSInteger i = 0; i < [names count]; i ++){
            ContactsGroupModel *tempModel = [[ContactsGroupModel alloc]init];
            tempModel.name = names[i];
            tempModel.personNumber = [NSString stringWithFormat:@"%li/%li",i*arc4random_uniform(50),i*arc4random_uniform(100)+50];
            [contactsListData addObject:tempModel];
        }
    }
    return contactsListData;
}

#pragma mark - 懒加载
- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _tableView.tableFooterView = [UIView new];
        _tableView.sectionHeaderHeight = 44.f;
    }
    return _tableView;
}

#pragma mark - TableView DataSource and Delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.contactsListData.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    ContactsGroupModel *model = self.contactsListData[section];
    return model.isOpen?15:0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Lester_lz@163.com";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    [self configureTableViewCell:cell indexPath:indexPath];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[[UIAlertView alloc] initWithTitle:@"点击了好友列表" message:@"Lester邀请您加入iOS高级研发群:98787555" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil] show];
}
- (void)configureTableViewCell:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath{
    cell.textLabel.text = @"         马云";
    cell.textLabel.font = [UIFont systemFontOfSize:15.f];
    cell.detailTextLabel.text = @"         阿里巴巴集团";
    cell.detailTextLabel.font =  [UIFont systemFontOfSize:12.f];
    cell.detailTextLabel.textColor = [UIColor lightGrayColor];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    ContactsListHeader *headView = [ContactsListHeader headerView:tableView];
    headView.delegate = self;
    headView.groupModel = self.contactsListData[section];
    headView.contentView.backgroundColor = [UIColor whiteColor];
    return headView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44.f;
}

#pragma mark - 代理方法的实现
- (void)didSelectTableViewHeaderFooterView
{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
