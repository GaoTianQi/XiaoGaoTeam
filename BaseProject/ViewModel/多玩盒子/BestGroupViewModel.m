//
//  BestGroupViewModel.m
//  BaseProject
//
//  Created by ios－54 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BestGroupViewModel.h"
#define kHeaderPath  @"http://img.lolbox.duowan.com/champions/"

@implementation BestGroupViewModel

- (NSInteger)rowNumber{
    return self.dataArr.count;
}
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [DuoWanNetManager getBestGroupModelCompletionHandle:^(NSArray<BestGroupModel *> *models, NSError *error) {
        if (!error) {
            self.dataArr = [models copy];
        }
        completionHandle(error);
    }];
}

- (BestGroupModel *)getModelForRow:(NSInteger)row
{
    return self.dataArr[row];
}

- (NSArray *)iconURLArrForRow:(NSInteger)row
{
    NSString *path1 = [kHeaderPath stringByAppendingString:[NSString stringWithFormat:@"%@_120x120.jpg", [self getModelForRow:row].hero1]];
    NSURL *url1 = [NSURL URLWithString:path1];
    NSString *path2 = [kHeaderPath stringByAppendingString:[NSString stringWithFormat:@"%@_120x120.jpg", [self getModelForRow:row].hero2]];
    NSURL *url2 = [NSURL URLWithString:path2];
    NSString *path3 = [kHeaderPath stringByAppendingString:[NSString stringWithFormat:@"%@_120x120.jpg", [self getModelForRow:row].hero3]];
    NSURL *url3 = [NSURL URLWithString:path3];
    NSString *path4 = [kHeaderPath stringByAppendingString:[NSString stringWithFormat:@"%@_120x120.jpg", [self getModelForRow:row].hero4]];
    NSURL *url4 = [NSURL URLWithString:path4];
    NSString *path5 = [kHeaderPath stringByAppendingString:[NSString stringWithFormat:@"%@_120x120.jpg", [self getModelForRow:row].hero5]];
    NSURL *url5 = [NSURL URLWithString:path5];
    return @[url1, url2, url3, url4, url5];
}

- (NSArray *)descArrForRow:(NSInteger)row
{
    NSString *des0 = [self getModelForRow:row].des;
    NSString *des1 = [self getModelForRow:row].des1;
    NSString *des2 = [self getModelForRow:row].des2;
    NSString *des3 = [self getModelForRow:row].des3;
    NSString *des4 = [self getModelForRow:row].des4;
    NSString *des5 = [self getModelForRow:row].des5;
    return @[des0, des1, des2, des3, des4, des5];
}

- (NSString *)descForRow:(NSInteger)row
{
    return [self getModelForRow:row].des;
}

- (NSString *)titleForRow:(NSInteger)row
{
    return [self getModelForRow:row].title;
}

@end
