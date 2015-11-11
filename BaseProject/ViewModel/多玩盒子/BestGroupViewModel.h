//
//  BestGroupViewModel.h
//  BaseProject
//
//  Created by ios－54 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"

@interface BestGroupViewModel : BaseViewModel

/** 返回的行数 */
@property (nonatomic, assign) NSInteger rowNumber;

/** 一个存放BestGroup头像的URL的数组 */
- (NSArray *)iconURLArrForRow:(NSInteger)row;

/** BestGroup的title */
- (NSString *)titleForRow:(NSInteger)row;

/** 存放英雄简介的数组 */
- (NSArray *)descArrForRow:(NSInteger)row;

/** BestGropu简介 */
- (NSString *)descForRow:(NSInteger)row;

@end
