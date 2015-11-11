//
//  ToolMenuViewModel.m
//  BaseProject
//
//  Created by ios－54 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ToolMenuViewModel.h"

@implementation ToolMenuViewModel

- (NSInteger)rowNumber
{
    return self.dataArr.count;
}
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [DuoWanNetManager getToolMenuModelCompletionHandle:^(NSArray<ToolMenuModel *> *models, NSError *error) {
        if (!error) {
            self.dataArr = [models mutableCopy];
        }
        completionHandle(error);
    }];
}

- (ToolMenuModel *)getModelForRow:(NSInteger)row
{
    return self.dataArr[row];
}

- (NSURL *)iconURLForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self getModelForRow:row].icon];
}
- (NSString *)titleForRow:(NSInteger)row
{
    return [self getModelForRow:row].name;
}
- (NSString *)tagForRow:(NSInteger)row
{
    return [self getModelForRow:row].tag;
}

- (ToolMenuType)modelTypeForRow:(NSInteger)row
{
    return [[self getModelForRow:row].type isEqualToString:@"web"] ? ToolMenuTypeWeb:ToolMenuTypeNative;
}

- (NSURL *)webURLForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self getModelForRow:row].url];
}

@end
