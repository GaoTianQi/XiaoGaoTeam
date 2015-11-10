//
//  RankListViewController.m
//  BaseProject
//
//  Created by ios－54 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "RankListViewController.h"
#import "XiMaCategoryCell.h"
#import "XiMaCategroyViewModel.h"
#import "AlbumDetailViewController.h"

@interface RankListViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) XiMaCategroyViewModel *XiMaVM;

@end

@implementation RankListViewController

+ (UINavigationController *)defaultNavi
{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        RankListViewController *vc = [RankListViewController new];
        navi = [[UINavigationController alloc]initWithRootViewController:vc];
    });
    return navi;
}

- (XiMaCategroyViewModel *)XiMaVM
{
    if (!_XiMaVM) {
        _XiMaVM = [[XiMaCategroyViewModel alloc]init];
    }
    return _XiMaVM;
}


- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[XiMaCategoryCell class] forCellReuseIdentifier:@"XMCell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
    self.title = @"音乐任我行";
    
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.XiMaVM refreshDataCompletionHandle:^(NSError *error) {
            if (error) {
                [self showErrorMsg:error];
            }else{
                [_tableView reloadData];
                [_tableView.footer resetNoMoreData];
            }
            [_tableView.header endRefreshing];
        }];
    }];
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.XiMaVM getMoreDataCompletionHandle:^(NSError *error) {
            if (error) {
                [self showErrorMsg:error.localizedDescription];
            }else{
                [_tableView reloadData];
                if ([self.XiMaVM isHasMore]) {
                    [_tableView.footer endRefreshing];
                }else{
                    [self.tableView.footer endRefreshingWithNoMoreData];
                }
            }
            
        }];
    }];
    [self.tableView.header beginRefreshing];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.XiMaVM.rowNumber;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XiMaCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XMCell"];
    cell.titleLb.text = [self.XiMaVM titleForRow:indexPath.row];
    cell.descLb.text = [self.XiMaVM descForRow:indexPath.row];
    cell.orderLb.text = @(indexPath.row+1).stringValue;
    cell.numberLb.text = [self.XiMaVM numberForRow:indexPath.row];
    [cell.IconIV.imageView setImageWithURL:[self.XiMaVM iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_download"]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    AlbumDetailViewController *vc = [[AlbumDetailViewController alloc]initWithAlbumId:[self.XiMaVM albumIdForRow:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85;
}

@end
