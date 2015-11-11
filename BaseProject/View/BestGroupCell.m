//
//  BestGroupCell.m
//  BaseProject
//
//  Created by ios－54 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BestGroupCell.h"

#define kMargin  (kWindowW - 52 * 5)/6

@implementation BestGroupCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIView *view = [UIView new];
        view.backgroundColor = kRGBColor(250, 244, 231);
        self.selectedBackgroundView = view;
    }
    return self;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = [UIFont boldFlatFontOfSize:18];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(8);
            make.right.mas_equalTo(-15);
        }];
    }
    return _titleLb;
}

- (NSArray *)heroHeaders
{
    if (!_heroHeaders) {
        NSMutableArray *arr = [NSMutableArray new];
        UIView *lastView = nil;
        for (int i = 0; i < 5; i++) {
            TRImageView *imageView = [[TRImageView alloc]init];
            CGFloat margin = (kWindowW - 5*50)/6.0;
            [self.contentView addSubview:imageView];
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                if (i == 0) {
                    make.left.mas_equalTo(margin);
                }else{
                    make.left.mas_equalTo(lastView.mas_right).mas_equalTo(margin);
                }
                make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(10);
                make.bottom.mas_equalTo(self.descLb.mas_top).mas_equalTo(-10);
                make.size.mas_equalTo(CGSizeMake(50, 50));
                if (i == 4) {
                    make.right.mas_equalTo(-margin);
                }
            }];
            lastView = imageView;
            [arr addObject:imageView];
        }
        _heroHeaders = [arr copy];
    }
    return _heroHeaders;
}


- (UILabel *)descLb {
    if(_descLb == nil) {
        _descLb = [[UILabel alloc] init];
        _descLb.numberOfLines = 0;
        _descLb.textColor = [UIColor lightGrayColor];
        _descLb.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_descLb];
        [_descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.titleLb);
            make.bottom.right.mas_equalTo(-10);
            make.height.mas_equalTo(40);
        }];
    }
    return _descLb;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
