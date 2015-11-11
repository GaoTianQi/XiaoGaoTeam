//
//  BestGroupDetailViewController.m
//  BaseProject
//
//  Created by ios－54 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BestGroupDetailViewController.h"
#import "BestGroupCell.h"
#import "BestGroupDetailCell.h"


@interface BestGroupDetailViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation BestGroupDetailViewController

- (instancetype)initWithHeroImages:(NSArray *)iconURLs title:(NSString *)title descArr:(NSArray *)descArr
{
    if (self = [super init]) {
        _iconURLs = iconURLs;
        _titleName = title;
        _descArr = descArr;
    }
    return self;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[BestGroupCell class] forCellReuseIdentifier:@"Cell"];
        [_tableView registerClass:[BestGroupDetailCell class] forCellReuseIdentifier:@"DetailCell"];
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
    self.title = @"阵容详情";
    [self.tableView reloadData];
    [Factory addBackItemToVC:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return (section == 0) ? 1:5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        BestGroupCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        for (int i = 0; i < 5; i++) {
            TRImageView *IV = cell.heroHeaders[i];
            [IV.imageView setImageWithURL:self.iconURLs[i] placeholderImage:[UIImage imageNamed:@"sctshare_default"]];
        }
        cell.titleLb.text = self.titleName;
        cell.descLb.text = self.descArr[0];
    return cell;
    }else{
        BestGroupDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailCell"];
        [cell.heroIV.imageView setImageWithURL:self.iconURLs[indexPath.row] placeholderImage:[UIImage imageNamed:@"d_shiwang"]];
        cell.descLb.text = self.descArr[indexPath.row + 1];
        return cell;
    }
    return nil;
    
}
kRemoveCellSeparator
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

@end
