//
//  LeftViewController.m
//  BaseProject
//
//  Created by ios－54 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LeftViewController.h"
#import <NSString+Icons.h>
#import "RankListViewController.h"
#import "TuWanViewController.h"
#import "DuoWanTabBarController.h"

@interface LeftViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *itemNames;

@end

@implementation LeftViewController

- (NSArray *)itemNames
{
    return @[@"游戏资讯", @"喜马拉雅", @"英雄联盟", @"个人设置"];
}
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.tableFooterView = [UIView new];
        _tableView.backgroundColor = [UIColor clearColor];
//   去除分割线
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(kWindowW/2, kWindowH/2));
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(0);
        }];
    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.itemNames.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.accessoryType = 1;
    cell.textLabel.text = self.itemNames[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            [self.sideMenuViewController setContentViewController:[TuWanViewController standardTuWanNavi] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
            
        case 1:
            [self.sideMenuViewController setContentViewController:[RankListViewController defaultNavi] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
        case 2:
            [self.sideMenuViewController setContentViewController:[DuoWanTabBarController standardInstance] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
            
        default:
            break;
    }
}
@end
