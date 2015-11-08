//
//  TuWanImageCell.m
//  BaseProject
//
//  Created by ios－54 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanImageCell.h"

@implementation TuWanImageCell

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        
        _titleLabel.font = [UIFont systemFontOfSize:17];
    }
    return _titleLabel;
}
- (UILabel *)clicksLabel
{
    if (!_clicksLabel) {
        _clicksLabel = [[UILabel alloc]init];
        
        _clicksLabel.textAlignment = NSTextAlignmentRight;
        _clicksLabel.font = [UIFont systemFontOfSize:12];
        _clicksLabel.textColor = [UIColor lightGrayColor];
    }
    return _clicksLabel;
}

- (TRImageView *)iconIV0
{
    if (!_iconIV0) {
        _iconIV0 = [[TRImageView alloc]init];
        
        //_iconIV0.contentMode = 2;
    }
    return _iconIV0;
}

- (TRImageView *)iconIV1
{
    if (!_iconIV1) {
        _iconIV1 = [[TRImageView alloc]init];
        
        //_iconIV1.contentMode = 2;
    }
    return _iconIV1;
}

- (TRImageView *)iconIV2
{
    if (!_iconIV2) {
        _iconIV2 = [[TRImageView alloc]init];
        
        //_iconIV2.contentMode = 2;
    }
    return _iconIV2;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.clicksLabel];
        [self.contentView addSubview:self.iconIV0];
        [self.contentView addSubview:self.iconIV1];
        [self.contentView addSubview:self.iconIV2];
//  title 页面布局
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.right.mas_equalTo(_clicksLabel.mas_left).mas_equalTo(-10);
        }];
//  clicksLabel 布局, 宽最大70像素，最小40像素
        [self.clicksLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(-10);
//         下面两行代码不能合写
            make.width.mas_greaterThanOrEqualTo(40);
            make.width.mas_lessThanOrEqualTo(70);
        }];
//  图片布局,宽高相等，间距5，边缘10, 高度88；
        [self.iconIV0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(88);
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(_titleLabel.mas_bottom).mas_equalTo(5);
        }];
        [self.iconIV1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(_iconIV0);
            make.left.mas_equalTo(_iconIV0.mas_right).mas_equalTo(5);
            make.topMargin.mas_equalTo(_iconIV0);
        }];
        [self.iconIV2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(_iconIV0);
            make.left.mas_equalTo(_iconIV1.mas_right).mas_equalTo(5);
            make.right.mas_equalTo(-10);
            make.topMargin.mas_equalTo(_iconIV0);
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
