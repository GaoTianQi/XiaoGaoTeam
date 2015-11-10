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
        _orderLb.font = [UIFont boldSystemFontOfSize:18];
        _orderLb.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_orderLb];
// 使用KVO-键值观察，如果text被赋值为1，颜色是。。。
//        下发方法表示：如果_orderLb的text属性被赋予新值，则触发task；
        [_orderLb bk_addObserverForKeyPath:@"text" options:NSKeyValueObservingOptionNew task:^(id obj, NSDictionary *change) {
            NSString *value = change[@"new"];
            if ([value isEqualToString:@"1"]) {
                _orderLb.textColor = [UIColor redColor];
            }else if ([value isEqualToString:@"2"]){
                _orderLb.textColor = [UIColor blueColor];
            }else if ([value isEqualToString:@"3"]){
                _orderLb.textColor = [UIColor greenColor];
            }else{
                _orderLb.textColor = [UIColor lightGrayColor];
            }
        }];
        
        
        //   添加依赖，一定要按照顺序，从左到右，从上向下；
        [self.orderLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(5);
            make.width.mas_equalTo(25);
        }];
    }
    return _orderLb;
}
- (TRImageView *)IconIV
{
    if (!_IconIV) {
        _IconIV = [[TRImageView alloc]init];
        [self.contentView addSubview:_IconIV];
        [self.IconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(65, 65));
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(self.orderLb.mas_right).mas_equalTo(5);
        }];
    }
    return _IconIV;
}
- (UILabel *)titleLb
{
    if (!_titleLb) {
        _titleLb = [[UILabel alloc]init];
        _titleLb.font = [UIFont boldSystemFontOfSize:18];
        [self.contentView addSubview:_titleLb];
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.IconIV.mas_topMargin).mas_equalTo(3);
            make.left.mas_equalTo(self.IconIV.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
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
        [self.descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(self.IconIV.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
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
        [self.numberLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.numberIV.mas_right).mas_equalTo(0);
            make.right.mas_equalTo(-10);
            make.bottomMargin.mas_equalTo(self.IconIV.mas_bottomMargin).mas_equalTo(-3);
            make.centerY.mas_equalTo(self.numberIV);
        }];
    }
    return _numberLb;
}
- (TRImageView *)numberIV
{
    if (!_numberIV) {
        _numberIV = [[TRImageView alloc]init];
        _numberIV.imageView.image = [UIImage imageNamed:@"album_tracks"];
        [self.contentView addSubview:_numberIV];
        [self.numberIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.IconIV.mas_right).mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(10, 10));
        }];
    }
    return _numberIV;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//    右箭头模式
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
//     分割线左间距调整
        self.separatorInset = UIEdgeInsetsMake(0, 110, 0, 0);
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
