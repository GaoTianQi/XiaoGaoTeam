//
//  XiMaAlbumViewModel.m
//  BaseProject
//
//  Created by ios－54 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XiMaAlbumViewModel.h"

@implementation XiMaAlbumViewModel

- (instancetype)initWithAlbumId:(NSNumber *)albumId
{
    if (self = [super init]) {
        _albumId = albumId;
    }
    return self;
}
- (instancetype)init
{
    if (self = [super init]) {
        NSAssert1(NO, @"%s 必须使用initWithAlbumId：方法初始化", __func__);
    }
    return self;
}

- (BOOL)isHasMore
{
    return _pageId <= _maxPageId;
}

- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle
{
    _pageId = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle
{
    if (self.isHasMore) {
       _pageId += 1;
       [self getDataFromNetCompleteHandle:completionHandle];
    }else{
        NSError *error = [NSError errorWithDomain:@"" code:999 userInfo:@{NSLocalizedDescriptionKey:@"没有更多数据了"}];
        completionHandle(error);
        return;
    }
    
}
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [XMLYNetManager getAlbumOfAlbumId:_albumId Page:_pageId CompletionHandle:^(AlbumModel *model, NSError *error) {
        if (!error) {
            if (_pageId == 1) {
                [self.dataArr removeAllObjects];
            }
            [self.dataArr addObjectsFromArray:model.tracks.list];
        }
        self.maxPageId = model.tracks.maxPageId;
        completionHandle(error);
    }];
}
- (NSInteger)rowNumber
{
    return self.dataArr.count;
}
- (AlbumListModel *)getModelForRow:(NSInteger)row
{
    return self.dataArr[row];
}
- (NSURL *)iconURLForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self getModelForRow:row].coverSmall];
}
- (NSString *)descForRow:(NSInteger)row
{
    return [self getModelForRow:row].title;
}
- (NSString *)AlbumNameForRow:(NSInteger)row
{
    return [self getModelForRow:row].nickname;
}
- (NSString *)playTimesForRow:(NSInteger)row
{
    CGFloat totalNumber = [self getModelForRow:row].playtimes;
    if (totalNumber >= 10000) {
        totalNumber = totalNumber/10000.0;
        return [NSString stringWithFormat:@"%.1f万",totalNumber];
    }else{
        return @([self getModelForRow:row].playtimes).stringValue;
    }
}
- (NSString *)likesNumberForRow:(NSInteger)row
{
    return @([self getModelForRow:row].likes).stringValue;
}
- (NSString *)durationForRow:(NSInteger)row
{
    NSInteger duration = [self getModelForRow:row].duration;
    long n = duration / 60;
    int m = duration % 60;
    return [NSString stringWithFormat:@"%02ld:%02d", n, m];
}
- (NSString *)commentsForRow:(NSInteger)row
{
    return @([self getModelForRow:row].comments).stringValue;
}
- (NSURL *)musicURLForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self getModelForRow:row].playUrl64];
}

- (NSString *)createdAtForRow:(NSInteger)row
{
    long long s = [self getModelForRow:row].createdAt/1000;
//  获取当前的秒数
    NSTimeInterval currentTime = [[NSDate date] timeIntervalSince1970];
    //NSTimeInterval currentTime = [NSDate timeIntervalSinceReferenceDate];
    NSTimeInterval during = currentTime - s;
   //NSDate *date = [[NSDate alloc]initWithTimeIntervalSince1970:s];
    NSInteger hour = during / 3600;
    if (hour < 24) {
        return [NSString stringWithFormat:@"%ld小时前", (long)hour];
    }else if (hour / 24 < 30){
        return [NSString stringWithFormat:@"%ld天前", hour/24];
    }else{
        return @"1个月前";
    }
}





@end
