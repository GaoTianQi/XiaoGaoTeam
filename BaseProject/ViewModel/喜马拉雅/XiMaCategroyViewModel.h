//
//  XiMaCategroyViewModel.h
//  BaseProject
//
//  Created by ios－54 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "XMLYNetManager.h"

@interface XiMaCategroyViewModel : BaseViewModel

/** 数据的条数 */
@property (nonatomic, assign) NSInteger rowNumber;

/** 某条数据的图片URL */
- (NSURL *)iconURLForRow:(NSInteger)row;

/** 某条数据题目title */
- (NSString *)titleForRow:(NSInteger)row;

/** 某条数据的描述 */
- (NSString *)descForRow:(NSInteger)row;

/** 某条数据集数*/
- (NSString *)numberForRow:(NSInteger)row;



/** 当前页数 */
@property (nonatomic, assign) NSInteger PageId;

/** 当前页数对应的数据ID */
- (NSNumber *)albumIdForRow:(NSInteger)row;

/** 当前最大页数 */
@property (nonatomic, assign) NSInteger maxPageId;
@property (nonatomic, getter=isHasMore) BOOL hasMore;

@end
