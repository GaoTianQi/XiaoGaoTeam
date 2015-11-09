//
//  TuWanViewModel.h
//  BaseProject
//
//  Created by ios－54 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "TuWanNetManager.h"

@interface TuWanViewModel : BaseViewModel

/** 当前页面的索引值 */
@property (nonatomic, assign) NSInteger start;

/** 当前的行数 */
@property (nonatomic, assign) NSInteger rowNumber;

/** 兔玩游戏界面的请求类型,所以要自定义初始化方法 */
- (instancetype)initWithType:(TuWanDataType)type;
@property (nonatomic, assign) TuWanDataType type;

/** 判断每一行数据是否有图 */
- (BOOL)containImages:(NSInteger)row;

/** 返回列表中某行数据题目 */
- (NSString *)titleForRowInList:(NSInteger)row;
/** 返回列表中某行数据的图片 */
- (NSURL *)iconURLForRowInList:(NSInteger)row;
/** 返回列表中某行数据的描述 */
- (NSString *)descForRowInList:(NSInteger)row;
/** 返回列表中某行数据的浏览人数 */
- (NSString *)clicksForRowInList:(NSInteger)row;

/** 滚动展示栏的文字 */
- (NSString *)titleForRowInIndexPic:(NSInteger)row;
/** 滚动展示栏的图片 */
- (NSURL *)iconURLForRowInIndexPic:(NSInteger)row;
/** 滚动展示栏的图片数量 */
@property (nonatomic, assign) NSInteger indexPicNumber;

/** 获取列表中某行数据对应的HTML5链接 */
- (NSURL *)detailURLForRowInList:(NSInteger)row;
/** 获取列表中滚动展示栏对应的HTML5链接 */
- (NSURL *)detailURLForRowInIndexPic:(NSInteger)row;

/** 用于存放头部滚动栏 */
@property (nonatomic, strong) NSArray *indexPicArr;
/** 是否有头部滚动栏 */
@property (nonatomic, getter=isExistIndexPic) BOOL existIndexPic;

/** 通过行数返回此行中对应的图片链接数组 */
- (NSArray *)iconURLSForRowInList:(NSInteger)row;


/** 当前数据类型是视频 */
- (BOOL)isVideoInListForRow:(NSInteger)row;
- (BOOL)isVideoInIndexPicForRow:(NSInteger)row;
/** 当前数据类型是图片 */
- (BOOL)isPicInListForRow:(NSInteger)row;
- (BOOL)isPicInIndexPicForRow:(NSInteger)row;
/** 当前数据类型是html */
- (BOOL)isHtmlInListForRow:(NSInteger)row;
- (BOOL)isHtmlInIndexPicForRow:(NSInteger)row;

/** 返回某行数据的aid */
- (NSString *)aidInListForRow:(NSInteger)row;
- (NSString *)aidInIndexPicForRow:(NSInteger)row;
@end
