//
//  TuWanOthersModel.m
//  BaseProject
//
//  Created by ios－54 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanOthersModel.h"

@implementation TuWanOthersModel

+ (NSDictionary *)objectClassInArray{
    return @{@"content" : [TuWanContentModel class], @"relevant" : [TuWanRelevantModel class]};
}

@end

@implementation TuWanContentModel

@end


@implementation TuWanRelevantModel

@end


