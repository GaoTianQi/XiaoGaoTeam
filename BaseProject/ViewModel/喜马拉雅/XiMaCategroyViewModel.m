//
//  XiMaCategroyViewModel.m
//  BaseProject
//
//  Created by ios－54 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XiMaCategroyViewModel.h"

@implementation XiMaCategroyViewModel

- (NSInteger)rowNumber
{
    return self.dataArr.count;
}
- (BOOL)isHasMore
{
    return _PageId <= _maxPageId;
}
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle
{
    _PageId = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle
{
//  如果当前页数已经是最大页数了，就没有必要再发送获取更多请求了，这样会造成用户流量
    if (!self.isHasMore) {
        NSError *err = [NSError errorWithDomain:@"" code:999 userInfo:@{NSLocalizedDescriptionKey:@"没有更多数据了"}];
        completionHandle(err);
        return;
    }
    _PageId += 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [XMLYNetManager getRankingListOfPageId:_PageId CompletionHandle:^(RankingModel *model, NSError *error) {
        if (!error) {
            if (_PageId == 1) {
                [self.dataArr removeAllObjects];
            }
            [self.dataArr addObjectsFromArray:model.list];
            _maxPageId = model.maxPageId;
        }
        completionHandle(error);
    }];
}

- (RankingListModel *)modelForRow:(NSInteger)row
{
    return self.dataArr[row];
}

- (NSURL *)iconURLForRow:(NSInteger)row
{
    NSURL *url = [NSURL URLWithString:[self modelForRow:row].albumCoverUrl290];
    return url;
}
- (NSString *)titleForRow:(NSInteger)row
{
    return [self modelForRow:row].title;
}
- (NSString *)descForRow:(NSInteger)row
{
    return [self modelForRow:row].intro;
}
- (NSString *)numberForRow:(NSInteger)row
{
    return [NSString stringWithFormat:@"%@集", @([self modelForRow:row].tracks)];
}
- (NSNumber *)albumIdForRow:(NSInteger)row
{
    return @([self modelForRow:row].albumId);
}

@end
