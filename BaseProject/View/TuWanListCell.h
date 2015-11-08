//
//  TuWanListCell.h
//  BaseProject
//
//  Created by ios－54 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"

@interface TuWanListCell : UITableViewCell

/** 左侧图片 */
@property (nonatomic, strong) TRImageView *iconIV;

/** 题目标签 */
@property (nonatomic, strong) UILabel *titleLabel;

/** 描述题目标签 */
@property (nonatomic, strong) UILabel *descLabel;

/** 点击数标签 */
@property (nonatomic, strong) UILabel *clicksNumLabel;

/***/
@end
