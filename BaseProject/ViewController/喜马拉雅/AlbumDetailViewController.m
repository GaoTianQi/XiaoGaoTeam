//
//  AlbumDetailViewController.m
//  BaseProject
//
//  Created by ios－54 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AlbumDetailViewController.h"
#import "XiMaAlbumViewModel.h"
#import "XiMaAlbumCell.h"
#import "PlayView.h"

@interface AlbumDetailViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) XiMaAlbumViewModel *XiMaAlbumVM;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation AlbumDetailViewController

- (XiMaAlbumViewModel *)XiMaAlbumVM {
    if(_XiMaAlbumVM == nil) {
        _XiMaAlbumVM = [[XiMaAlbumViewModel alloc] initWithAlbumId:_albumId];
    }
    return _XiMaAlbumVM;
}

- (instancetype)initWithAlbumId:(NSNumber *)albumId
{
    if (self = [super init]) {
        self.albumId = albumId;
    }
    return self;
}
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[XiMaAlbumCell class] forCellReuseIdentifier:@"Cell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.XiMaAlbumVM refreshDataCompletionHandle:^(NSError *error) {
            if (error) {
                [self showErrorMsg:error.localizedDescription];
            }else{
                [_tableView reloadData];
                [_tableView.footer resetNoMoreData];
            }
            [_tableView.header endRefreshing];
        }];
    }];
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.XiMaAlbumVM getMoreDataCompletionHandle:^(NSError *error) {
            if (error) {
                [self showErrorMsg:error.localizedDescription];
            }else{
                if (self.XiMaAlbumVM.hasMore) {
                    [_tableView.footer endRefreshing];
                }else{
                    [_tableView.footer endRefreshingWithNoMoreData];
                }
                [_tableView reloadData];
            }
        }];
    }];
    [self.tableView.header beginRefreshing];
    
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
//    self.tableView.estimatedRowHeight = 1000;
    [self.view addSubview:[PlayView sharedInstance]];
    [[PlayView sharedInstance] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.XiMaAlbumVM.rowNumber;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XiMaAlbumCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    [cell.iconIV.imageView setImageWithURL:[self.XiMaAlbumVM iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_download"]];
    cell.descLb.text = [self.XiMaAlbumVM descForRow:indexPath.row];
    cell.nickNameLb.text = [self.XiMaAlbumVM AlbumNameForRow:indexPath.row];
    cell.playTimesLb.text = [self.XiMaAlbumVM playTimesForRow:indexPath.row];
    cell.linkesLb.text = [self.XiMaAlbumVM likesNumberForRow:indexPath.row];
    cell.durationLb.text = [self.XiMaAlbumVM durationForRow:indexPath.row];
    cell.commentsLb.text = [self.XiMaAlbumVM commentsForRow:indexPath.row];
    cell.publishTimeLb.text = [self.XiMaAlbumVM createdAtForRow:indexPath.row];
    [cell downloadBtn];
    return cell;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 120;
//}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[PlayView sharedInstance] playBtn];
    [[PlayView sharedInstance]playWithURL:[self.XiMaAlbumVM musicURLForRow:indexPath.row]];
}

@end
