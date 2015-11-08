//
//  TuWanListCell.m
//  BaseProject
//
//  Created by ios－54 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanListCell.h"

@implementation TuWanListCell

- (TRImageView *)iconIV
{
    if (!_iconIV) {
        _iconIV = [[TRImageView alloc]init];
/** 图片填充 */
        //_iconIV.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _iconIV;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        
        _titleLabel.font = [UIFont systemFontOfSize:17];
    }
    return _titleLabel;
}

- (UILabel *)descLabel
{
    if (!_descLabel) {
        _descLabel = [[UILabel alloc]init];
        
        _descLabel.font = [UIFont systemFontOfSize:14];
        _descLabel.numberOfLines = 0;
        _descLabel.textColor = [UIColor lightGrayColor];
    }
    return _descLabel;
}

- (UILabel *)clicksNumLabel
{
    if (!_clicksNumLabel) {
        _clicksNumLabel = [[UILabel alloc]init];
        
        _clicksNumLabel.font = [UIFont systemFontOfSize:12];
        _clicksNumLabel.textColor = [UIColor lightGrayColor];
    }
    return _clicksNumLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
#warning contentView研究一下
        [self.contentView addSubview:self.iconIV];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.descLabel];
        [self.contentView addSubview:self.clicksNumLabel];
//  图片 左10，宽高 92. 70， 竖向居中
        [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(92, 70));
            make.centerY.mas_equalTo(0);
        }];
//  题目 距离图片右边缘8，上边缘比图片矮3像素
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_iconIV.mas_right).mas_equalTo(8);
            make.right.mas_equalTo(-10);
            make.topMargin.mas_equalTo(_iconIV.mas_topMargin).mas_equalTo(8);
        }];
//  简介描述 左右边缘和title一样，上边距离title下边缘8个像素
        [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_iconIV.mas_right).mas_equalTo(8);
            make.right.mas_equalTo(-10);
            make.top.mas_equalTo(_titleLabel.mas_bottom).mas_equalTo(8);
        }];
//  浏览人数 下边缘与图片对齐，右边缘和title对齐
        [self.clicksNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottomMargin.mas_equalTo(_iconIV.mas_bottomMargin);
            make.rightMargin.mas_equalTo(_titleLabel.mas_right);
        }];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
