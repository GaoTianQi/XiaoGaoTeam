//
//  TuWanViewModel.m
//  BaseProject
//
//  Created by ios－54 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanViewModel.h"

@implementation TuWanViewModel

- (instancetype)initWithType:(TuWanDataType)type
{
    if (self = [super init]) {
        _type = type;
    }
    return self;
}
// 防止使用的人没有使用我们设定的初始化方法
- (instancetype)init
{
    if (self = [super init]) {
// 如果使用这个方法初始化，那么崩溃
        NSAssert1(_type, @"%s必须使用initWithType:初始化方法",__func__);
    }
    return self;
}

- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle
{
    _start = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}

- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle
{
    _start += 11;
   [self getDataFromNetCompleteHandle:completionHandle];
}


- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [TuWanNetManager getTuWanDataType:_type start:_start CompletionHandle:^(TuWanModel *model, NSError *error) {
        if (!error) {
            if (_start == 0) {
                [self.dataArr removeAllObjects];
                self.indexPicArr = nil;
            }
            [self.dataArr addObjectsFromArray:model.data.list];
            self.indexPicArr = model.data.indexpic;
            completionHandle(error);
        }
    }];
}

- (BOOL)isExistIndexPic
{
    return self.indexPicArr != nil && self.indexPicArr.count != 0;
}

- (NSInteger)rowNumber
{
    return self.dataArr.count;
}

- (TuWanDataIndexpicModel *)modelForArr:(NSArray *)arr row:(NSInteger)row
{
    return arr[row];
}

/** 根据showType属性，0代表没有图片，1代表有 */
- (BOOL)containImages:(NSInteger)row
{
    return [[self modelForArr:self.dataArr row:row].showtype isEqualToString:@"1"];
}

- (NSString *)titleForRowInList:(NSInteger)row
{
    return [self modelForArr:self.dataArr row:row].title;
}
- (NSURL *)iconURLForRowInList:(NSInteger)row
{
    NSString *path = [self modelForArr:self.dataArr row:row].litpic;
    return [NSURL URLWithString:path];
}
- (NSString *)descForRowInList:(NSInteger)row
{
    return [self modelForArr:self.dataArr row:row].desc;
}
- (NSString *)clicksForRowInList:(NSInteger)row
{
    return [self modelForArr:self.dataArr row:row].click;
}
- (NSURL *)detailURLForRowInList:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForArr:self.dataArr row:row].html5];
}

- (NSInteger)indexPicNumber
{
    return self.indexPicArr.count;
}

- (NSString *)titleForRowInIndexPic:(NSInteger)row
{
    return [self modelForArr:self.indexPicArr row:row].title;
}
- (NSURL *)iconURLForRowInIndexPic:(NSInteger)row
{
    NSString *path = [self modelForArr:self.indexPicArr row:row].litpic;
    return [NSURL URLWithString:path];
}
- (NSURL *)detailURLForRowInIndexPic:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForArr:self.indexPicArr row:row].html5];
}

- (NSArray *)iconURLSForRowInList:(NSInteger)row
{
    NSArray *arr = [self modelForArr:self.dataArr row:row].showitem;
    NSMutableArray *imageArr = [NSMutableArray array];
    for (int i = 0; i < arr.count; i ++) {
        TuWanDataShowitemModel *model = arr[i];
        [imageArr addObject:[NSURL URLWithString:model.pic]];
    }
    return [imageArr copy];
}

/** 当前数据类型是视频 */
- (BOOL)isVideoInListForRow:(NSInteger)row
{
    return [[self modelForArr:self.dataArr row:row].type isEqualToString:@"video"];
}
- (BOOL)isVideoInIndexPicForRow:(NSInteger)row
{
    return [[self modelForArr:self.indexPicArr row:row].type isEqualToString:@"video"];
}
/** 当前数据类型是图片 */
- (BOOL)isPicInListForRow:(NSInteger)row
{
    return [[self modelForArr:self.dataArr row:row].type isEqualToString:@"pic"];
}
- (BOOL)isPicInIndexPicForRow:(NSInteger)row
{
    return [[self modelForArr:self.indexPicArr row:row].type isEqualToString:@"pic"];
}
/** 当前数据类型是html all*/
- (BOOL)isHtmlInListForRow:(NSInteger)row
{
    return [[self modelForArr:self.dataArr row:row].type isEqualToString:@"all"];
}
- (BOOL)isHtmlInIndexPicForRow:(NSInteger)row
{
    return [[self modelForArr:self.indexPicArr row:row].type isEqualToString:@"all"];
}

- (NSString *)aidInListForRow:(NSInteger)row
{
    return [self modelForArr:self.dataArr row:row].aid;
}
- (NSString *)aidInIndexPicForRow:(NSInteger)row
{
    return [self modelForArr:self.indexPicArr row:row].aid;
}
@end
