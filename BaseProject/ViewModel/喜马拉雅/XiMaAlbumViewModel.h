//
//  XiMaAlbumViewModel.h
//  BaseProject
//
//  Created by ios－54 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "XMLYNetManager.h"

@interface XiMaAlbumViewModel : BaseViewModel

/** 当页行数 */
@property (nonatomic, assign) NSInteger rowNumber;

/** 返回当前行的图片URL */
- (NSURL *)iconURLForRow:(NSInteger)row;

/** 返回当前行的描述 */
- (NSString *)descForRow:(NSInteger)row;

/** 返回当前行唱片名 */
- (NSString *)AlbumNameForRow:(NSInteger)row;

/** 返回当前行的播放量 */
- (NSString *)playTimesForRow:(NSInteger)row;

/** 返回当前行的关注数 */
- (NSString *)likesNumberForRow:(NSInteger)row;

/** 评论数 */
- (NSString *)commentsForRow:(NSInteger)row;

/** 返回当前行播放时长*/
- (NSString *)durationForRow:(NSInteger)row;

/** 返回当前行发布时间 */
- (NSString *)createdAtForRow:(NSInteger)row;

/** 音乐地址 */
- (NSURL *)musicURLForRow:(NSInteger)row;

- (instancetype)initWithAlbumId:(NSNumber *)albumId;

@property (nonatomic, strong) NSNumber *albumId;
@property (nonatomic, assign) NSInteger pageId;
@property (nonatomic, assign) NSInteger maxPageId;

@property (nonatomic, getter=isHasMore) BOOL hasMore;

/** 返回当前行的描述 */

@end
