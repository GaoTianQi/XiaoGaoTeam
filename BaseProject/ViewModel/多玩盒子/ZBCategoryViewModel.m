//
//  ZBCategoryViewModel.m
//  BaseProject
//
//  Created by ios－54 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ZBCategoryViewModel.h"

@implementation ZBCategoryViewModel

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [DuoWanNetManager getZBCategoryModelCompletionHandle:^(NSArray<ZBCategoryModel *> *models, NSError *error) {
        self.dataArr = [models copy];
        completionHandle(error);
    }];
}
- (NSInteger)rowNumber
{
    return self.dataArr.count;
}
- (ZBCategoryModel *)getModelForRow:(NSInteger)row
{
    return self.dataArr[row];
}

- (NSString *)titleForRow:(NSInteger)row
{
    return [self getModelForRow:row].text;
}
- (NSString *)tagForRow:(NSInteger)row
{
    return [self getModelForRow:row].tag;
}

@end
