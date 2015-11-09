//
//  XiMaCategoryCell.m
//  BaseProject
//
//  Created by ios－54 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XiMaCategoryCell.h"

@implementation XiMaCategoryCell

- (UILabel *)orderLb
{
    if (!_orderLb) {
        _orderLb = [[UILabel alloc]init];
        _orderLb.font = [UIFont boldSystemFontOfSize:17];
        _orderLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_orderLb];
    }
    return _orderLb;
}
- (TRImageView *)IconIV
{
    if (!_IconIV) {
        _IconIV = [[TRImageView alloc]init];
        [self.contentView addSubview:_IconIV];
    }
    return _IconIV;
}
- (UILabel *)titleLb
{
    if (!_titleLb) {
        _titleLb = [[UILabel alloc]init];
        _titleLb.font = [UIFont boldSystemFontOfSize:18];
        [self.contentView addSubview:_titleLb];
    }
    return _titleLb;
}
- (UILabel *)descLb
{
    if (!_descLb) {
        _descLb = [[UILabel alloc]init];
        _descLb.font = [UIFont systemFontOfSize:15];
        _descLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_descLb];
    }
    return _descLb;
}
- (UILabel *)numberLb
{
    if (!_numberLb) {
        _numberLb = [[UILabel alloc]init];
        _numberLb.font = [UIFont systemFontOfSize:12];
        _numberLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_numberLb];
    }
    return _numberLb;
}
- (TRImageView *)numberIV
{
    if (!_numberIV) {
        _numberIV = [[TRImageView alloc]init];
        _numberIV.imageView.image = [UIImage imageNamed:@"album_tracks"];
        [self.contentView addSubview:_numberIV];
    }
    return _numberIV;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//    右箭头模式
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//   添加依赖，一定要按照顺序，从左到右，从上向下；
        [self.orderLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(10);
            make.width.mas_equalTo(20);
        }];
        [self.IconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(65, 65));
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(self.orderLb.mas_right).mas_equalTo(0);
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
