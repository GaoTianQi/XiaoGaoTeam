//
//  ZBItemViewModel.m
//  BaseProject
//
//  Created by ios－54 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ZBItemViewModel.h"

@implementation ZBItemViewModel

- (instancetype)initWithTag:(NSString *)tag
{
    if (self = [super init]) {
        _tag = tag;
    }
    return self;
}

- (instancetype)init
{
    if (self = [super init]) {
        NSAssert1(NO, @"%s 必须使用initWithTag：方法初始化", __func__);
    }
    return self;
}

- (NSInteger)rowNumber
{
    return self.dataArr.count;
}
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [DuoWanNetManager getZbItemModelOfTag:_tag CompletionHandle:^(NSArray<ZBItemModel *> *models, NSError *error) {
        self.dataArr = [models copy];
        completionHandle(error);
    }];
}
- (ZBItemModel *)getModelForRow:(NSInteger)row
{
    return self.dataArr[row];
}
- (NSString *)titleForRow:(NSInteger)row
{
    return [self getModelForRow:row].text;
}
- (NSInteger)identifyForRow:(NSInteger)row
{
    return [self getModelForRow:row].identify;
}
- (NSURL *)iconURLForRow:(NSInteger)row
{
    NSString *path = [NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%@_64x64.png", @([self getModelForRow:row].identify)];
    return [NSURL URLWithString:path];
}

@end
