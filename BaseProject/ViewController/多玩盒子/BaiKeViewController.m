//
//  BaiKeViewController.m
//  BaseProject
//
//  Created by ios－54 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaiKeViewController.h"
#import "ToolMenuViewModel.h"
#import "TuWanHtmlViewController.h"
#import "BestGroupViewController.h"
#import "ZBCategroyViewController.h"

@interface ToolMenuCell : UITableViewCell

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLb;

@end

@implementation ToolMenuCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.accessoryType = 1;
    }
    return self;
}

- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:_iconImageView];
        [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(35, 35));
        }];
    }
    return _iconImageView;
}
- (UILabel *)titleLb
{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.font = [UIFont boldFlatFontOfSize:16];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(self.iconImageView.mas_right).mas_equalTo(10);
        }];
    }
    return _titleLb;
}

@end

@interface BaiKeViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) ToolMenuViewModel *ToolMenuVM;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation BaiKeViewController

- (ToolMenuViewModel *)ToolMenuVM
{
    if (!_ToolMenuVM) {
        _ToolMenuVM = [[ToolMenuViewModel alloc]init];
    }
    return _ToolMenuVM;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 55;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:[ToolMenuCell class] forCellReuseIdentifier:@"Cell"];
    }
    return _tableView;
}

- (instancetype)init
{
    if (self = [super init]) {
        self.title = @"游戏百科";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [Factory addMenuItemToVC:self];
    [self showProgress];
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.ToolMenuVM getDataFromNetCompleteHandle:^(NSError *error) {
            if (error) {
                [self showErrorMsg:error.localizedDescription];
            }else{
                [_tableView reloadData];
            }
            [_tableView.header endRefreshing];
        }];
    }];
    [self.tableView.header beginRefreshing];

}


#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.ToolMenuVM.rowNumber;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ToolMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    [cell.iconImageView setImageWithURL:[self.ToolMenuVM iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"ImageError"]];
    cell.titleLb.text = [self.ToolMenuVM titleForRow:indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
kRemoveCellSeparator
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ([self.ToolMenuVM modelTypeForRow:indexPath.row] == ToolMenuTypeWeb) {
        TuWanHtmlViewController *vc = [[TuWanHtmlViewController alloc]initWithURL:[self.ToolMenuVM webURLForRow:indexPath.row]];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        if (indexPath.row == 3) {
            BestGroupViewController *vc = [[BestGroupViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }else if (indexPath.row == 0){
            ZBCategroyViewController *vc = [[ZBCategroyViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}

@end
