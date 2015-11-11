//
//  BestGroupViewController.m
//  BaseProject
//
//  Created by ios－54 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BestGroupViewController.h"
#import "BestGroupCell.h"
#import "BestGroupViewModel.h"
#import "BestGroupDetailViewController.h"

@interface BestGroupViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) BestGroupViewModel *BestGroupVM;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation BestGroupViewController

- (BestGroupViewModel *)BestGroupVM
{
    if (!_BestGroupVM) {
        _BestGroupVM = [[BestGroupViewModel alloc]init];
    }
    return _BestGroupVM;
}
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[BestGroupCell class] forCellReuseIdentifier:@"Cell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.BestGroupVM getDataFromNetCompleteHandle:^(NSError *error) {
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


#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.BestGroupVM.rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BestGroupCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.titleLb.text = [self.BestGroupVM titleForRow:indexPath.row];
    cell.descLb.text = [self.BestGroupVM descForRow:indexPath.row];
    for (int i = 0; i < 5; i++) {
        TRImageView *IV = cell.heroHeaders[i];
        [IV.imageView setImageWithURL:[self.BestGroupVM iconURLArrForRow:indexPath.row][i] placeholderImage:[UIImage imageNamed:@"sctshare_default"]];
    }
//    NSArray *arr = @[cell.heroIV1, cell.heroIV2, cell.heroIV3, cell.heroIV4, cell.heroIV5];
//    [arr enumerateObjectsUsingBlock:^(TRImageView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        [obj.imageView setImageWithURL:[self.BestGroupVM iconURLArrForRow:indexPath.row][idx] placeholderImage:[UIImage imageNamed:@"sctshare_default"]];
//    }];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BestGroupDetailViewController *vc = [[BestGroupDetailViewController alloc]initWithHeroImages:[self.BestGroupVM iconURLArrForRow:indexPath.row] title:[self.BestGroupVM titleForRow:indexPath.row] descArr:[self.BestGroupVM descArrForRow:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
