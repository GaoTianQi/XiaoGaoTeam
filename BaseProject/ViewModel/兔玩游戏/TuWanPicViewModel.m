//
//  TuWanPicViewModel.m
//  BaseProject
//
//  Created by ios－54 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanPicViewModel.h"


@implementation TuWanPicViewModel

- (instancetype)initWithAid:(NSString *)aid
{
    if (self = [super init]) {
        self.aid = aid;
    }
    return self;
}

/** 防御性编程，不允许使用init方法  */
- (instancetype)init
{
    if (self = [super init]) {
        NSAssert1(NO, @"%s 必须使用initWithAid:方法初始化", __func__);
    }
    return self;
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [TuWanNetManager getTuwanPicDataOfAid:_aid CompletionHandle:^(TuWanPicModel *model, NSError *error) {
        self.picModel = model;
        completionHandle(error);
    }];
}

- (NSInteger)rowNumber
{
    return self.picModel.content.count;
}
- (NSURL *)picURLForRow:(NSInteger)row
{
    TuWanPicContentModel *model = self.picModel.content[row];
    return [NSURL URLWithString:model.pic];
}

@end
