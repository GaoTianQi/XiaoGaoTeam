//
//  ToolMenuViewModel.h
//  BaseProject
//
//  Created by ios－54 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"
/** 此处为type定义枚举类型，有web和native两种类型 */
typedef NS_ENUM(NSUInteger, ToolMenuType) {
    ToolMenuTypeWeb,
    ToolMenuTypeNative
};

@interface ToolMenuViewModel : BaseViewModel

/** 一共有多少行 */
@property (nonatomic, assign) NSInteger rowNumber;

/** 某行的图标URL */
- (NSURL *)iconURLForRow:(NSInteger)row;

/** 某行的title */
- (NSString *)titleForRow:(NSInteger)row;

/** 某行的数据类型--枚举类型 */
- (ToolMenuType)modelTypeForRow:(NSInteger)row;

/** 某行的tag值 */
- (NSString *)tagForRow:(NSInteger)row;

/** 网页类型的链接地址 */
- (NSURL *)webURLForRow:(NSInteger)row;

@end
