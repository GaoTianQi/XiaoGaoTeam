//
//  TuWanListViewController.m
//  BaseProject
//
//  Created by ios－54 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanListViewController.h"
#import "TuWanViewModel.h"
#import "TuWanListCell.h"
#import "iCarousel.h"
#import "TuWanHtmlViewController.h"

#import "TuWanImageCell.h"

@interface TuWanListViewController ()<iCarouselDelegate, iCarouselDataSource>

@property (nonatomic, strong) TuWanViewModel *TuWanVM;

@end

@implementation TuWanListViewController
{// 添加成员变量
    iCarousel *_ic;
    UIPageControl *_pageControl;
    UILabel *_titleLb;
//  定时器
    NSTimer *_timer;
}

/** 头部滚动栏 */
- (UIView *)headerView
{
    [_timer invalidate];
//  判断头部视图是否存在
    if (!self.TuWanVM.isExistIndexPic) {
        return nil;
    }
//  头部视图 origin无效，宽度无效，肯定与title同宽
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, kWindowW/750*500 - 35)];
//  添加底部视图
    UIView *bottomView = [[UIView alloc]init];
    [headerView addSubview:bottomView];
    bottomView.backgroundColor = kRGBColor(240, 240, 240);
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(35);
    }];
    _titleLb = [UILabel new];
    [bottomView addSubview:_titleLb];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    
    _pageControl = [UIPageControl new];
    _pageControl.numberOfPages = self.TuWanVM.indexPicNumber;
    [bottomView addSubview:_pageControl];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.width.mas_lessThanOrEqualTo(60);
        make.width.mas_greaterThanOrEqualTo(40);
        make.left.mas_equalTo(_titleLb.mas_right).mas_equalTo(-10);
    }];
    _titleLb.text = [self.TuWanVM titleForRowInList:0];
    
//  添加滚动栏
    _ic = [iCarousel new];
    [headerView addSubview:_ic];
    [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.bottom.mas_equalTo(bottomView.mas_top).mas_equalTo(0);
    }];
    _ic.delegate = self;
    _ic.dataSource = self;
    _ic.pagingEnabled = YES;
    _ic.scrollSpeed = 1;
    
//  如果只有一张图，不显示小圆点
    _pageControl.hidesForSinglePage = YES;
//  如果只有一张图，则不可以滚动
    _ic.scrollEnabled = self.TuWanVM.indexPicNumber != 1;
    
    _pageControl.userInteractionEnabled = NO; // 不允许交互
    _pageControl.pageIndicatorTintColor = [UIColor greenSeaColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    
    if (self.TuWanVM.indexPicNumber > 1) {
        _timer = [NSTimer bk_scheduledTimerWithTimeInterval:3 block:^(NSTimer *timer) {
            [_ic scrollToItemAtIndex:_ic.currentItemIndex+1 animated:YES];
        } repeats:YES];
    }
    
    return headerView;
}

- (TuWanViewModel *)TuWanVM
{
    if (!_TuWanVM) {
        _TuWanVM = [[TuWanViewModel alloc]initWithType:self.TuWanType.integerValue];
    }
    return _TuWanVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[TuWanListCell class] forCellReuseIdentifier:@"ListCell"];
    [self.tableView registerClass:[TuWanImageCell class] forCellReuseIdentifier:@"imageCell"];
    
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.TuWanVM refreshDataCompletionHandle:^(NSError *error) {
            self.tableView.tableHeaderView = [self headerView];
            [self.tableView reloadData];
            [self.tableView.header endRefreshing];
        }];
    }];
    [self.tableView.header beginRefreshing];
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.TuWanVM getMoreDataCompletionHandle:^(NSError *error) {
            self.tableView.tableHeaderView = [self headerView];
            [self.tableView reloadData];
            [self.tableView.footer endRefreshing];
        }];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.TuWanVM.rowNumber;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self.TuWanVM containImages:indexPath.row]) {
        TuWanImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"imageCell"];
        cell.titleLabel.text = [self.TuWanVM titleForRowInList:indexPath.row];
        cell.clicksLabel.text = [self.TuWanVM clicksForRowInList:indexPath.row];
        [cell.iconIV0.imageView setImageWithURL:[self.TuWanVM iconURLSForRowInList:indexPath.row].firstObject placeholderImage:[UIImage imageNamed:@"coolStart_male_n"]];
        [cell.iconIV1.imageView setImageWithURL:[self.TuWanVM iconURLSForRowInList:indexPath.row][1] placeholderImage:[UIImage imageNamed:@"coolStart_male_n"]];
        [cell.iconIV2.imageView setImageWithURL:[self.TuWanVM iconURLSForRowInList:indexPath.row].lastObject placeholderImage:[UIImage imageNamed:@"coolStart_male_n"]];
        return cell;
    }
    TuWanListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell" forIndexPath:indexPath];
    
    cell.titleLabel.text = [self.TuWanVM titleForRowInList:indexPath.row];
    [cell.iconIV.imageView setImageWithURL:[self.TuWanVM iconURLForRowInList:indexPath.row] placeholderImage:[UIImage imageNamed:@"coolStart_male_n"]];
    cell.descLabel.text = [self.TuWanVM descForRowInList:indexPath.row];
    cell.clicksNumLabel.text = [self.TuWanVM clicksForRowInList:indexPath.row];
    
    return cell;
}

/** 去掉分割线左侧缝隙 */
kRemoveCellSeparator;

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ([self.TuWanVM isHtmlInListForRow:indexPath.row]) {
        TuWanHtmlViewController *vc = [[TuWanHtmlViewController alloc]initWithURL:[self.TuWanVM detailURLForRowInList:indexPath.row]];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

// cell高度设置
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.TuWanVM containImages:indexPath.row] ? 150:90;
}


#pragma mark - iCarouselDelegate, iCarouselDataSource
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return self.TuWanVM.indexPicNumber;
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    if (!view) {
        view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, kWindowW/750*500 - 70)];
        UIImageView *imageView = [UIImageView new];
        [view addSubview:imageView];
        imageView.tag = 100;
        imageView.contentMode = 2;
        view.clipsToBounds = YES;
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    UIImageView *imageView = (UIImageView *)[view viewWithTag:100];
    [imageView setImageWithURL:[self.TuWanVM iconURLForRowInIndexPic:index] placeholderImage:[UIImage imageNamed:@"10941686_0800"]];
    return view;
}

// 允许循环滚动
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionWrap) {
        return YES;
    }
    return value;
}

- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel
{
    //    NSLog(@"%ld", carousel.currentItemIndex);
    _titleLb.text = [self.TuWanVM titleForRowInIndexPic:carousel.currentItemIndex];
    _pageControl.currentPage = carousel.currentItemIndex;
}

/** 滚动栏中被选中触发 */
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    if ([self.TuWanVM isHtmlInListForRow:index]) {
        TuWanHtmlViewController *vc = [[TuWanHtmlViewController alloc]initWithURL:[self.TuWanVM detailURLForRowInIndexPic:index]];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
