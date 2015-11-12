//
//  BestGroupDetailCell.m
//  BaseProject
//
//  Created by ios－54 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BestGroupDetailCell.h"

@implementation BestGroupDetailCell

- (TRImageView *)heroIV {
    if(_heroIV == nil) {
        CGFloat width = (kWindowW - 6*13)/5.0;
        _heroIV = [[TRImageView alloc] init];
        [self.contentView addSubview:_heroIV];
        [_heroIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(width, width));
        }];
    }
    return _heroIV;
}

- (UILabel *)descLb {
    if(_descLb == nil) {
        _descLb = [[UILabel alloc] init];
        _descLb.font = [UIFont systemFontOfSize:18];
        _descLb.numberOfLines = 0;
        [self.contentView addSubview:_descLb];
        [_descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.heroIV.mas_right).mas_equalTo(8);
            make.topMargin.mas_equalTo(self.heroIV);
            make.bottom.mas_equalTo(-10);
            make.right.mas_equalTo(-10);
        }];
    }
    return _descLb;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIView *view = [UIView new];
        view.backgroundColor = kRGBColor(250, 244, 231);
        self.selectedBackgroundView = view;
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
