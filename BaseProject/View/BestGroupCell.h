//
//  BestGroupCell.h
//  BaseProject
//
//  Created by ios－54 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"


@interface BestGroupCell : UITableViewCell

/** 团队标题 */
@property (nonatomic, strong) UILabel *titleLb;

/** 英雄头像数组 */
@property (nonatomic, strong) NSArray *heroHeaders;
@property (nonatomic, strong) TRImageView *heroIV1;
@property (nonatomic, strong) TRImageView *heroIV2;
@property (nonatomic, strong) TRImageView *heroIV3;
@property (nonatomic, strong) TRImageView *heroIV4;
@property (nonatomic, strong) TRImageView *heroIV5;


/** 团队简介 */
@property (nonatomic, strong) UILabel *descLb;

@end
