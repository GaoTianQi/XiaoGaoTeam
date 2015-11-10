//
//  XiMaAlbumCell.h
//  BaseProject
//
//  Created by ios－54 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"

@interface XiMaAlbumCell : UITableViewCell

/** 歌曲头像图 */
@property (nonatomic, strong) TRImageView *iconIV;
/** 歌曲描述 */
@property (nonatomic, strong) UILabel *descLb;
/** 发布时间 */
@property (nonatomic, strong) UILabel *publishTimeLb;
/** 音乐的专辑名 */
@property (nonatomic, strong) UILabel *nickNameLb;
/** 播放次数 */
@property (nonatomic, strong) UILabel *playTimesLb;

/** 关注数 */
@property (nonatomic, strong) UILabel *linkesLb;
@property (nonatomic, strong) TRImageView *linkesIV;
/** 评论数 */
@property (nonatomic, strong) UILabel *commentsLb;
@property (nonatomic, strong) TRImageView *commentsIV;
/** 播放时间 */
@property (nonatomic, strong) UILabel *durationLb;


/** 下载按钮 */
@property (nonatomic, strong) UIButton *downloadBtn;


@end
