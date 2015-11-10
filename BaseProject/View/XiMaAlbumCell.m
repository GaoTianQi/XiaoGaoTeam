//
//  XiMaAlbumCell.m
//  BaseProject
//
//  Created by ios－54 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XiMaAlbumCell.h"

@interface XiMaAlbumCell ()

@property (nonatomic, strong) TRImageView *playTimesIV;
@property (nonatomic, strong) TRImageView *durationIV;

@end

@implementation XiMaAlbumCell

- (TRImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[TRImageView alloc] init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(55, 55));
            make.top.mas_equalTo(12.5);
            make.left.mas_equalTo(10);
        }];
        _iconIV.userInteractionEnabled = YES;
        _iconIV.layer.cornerRadius = 27.5;
//        添加播放标志
        UIButton *playTV = [UIButton buttonWithType:0];
        [playTV setBackgroundImage:[UIImage imageNamed:@"find_album_play"] forState:UIControlStateNormal];
        //UIImageView *playTV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"find_album_play"]];
        [_iconIV addSubview:playTV];
        [playTV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(_iconIV);
        }];
    }
    return _iconIV;
}

- (UILabel *)descLb {
    if(_descLb == nil) {
        _descLb = [[UILabel alloc] init];
        _descLb.font = [UIFont boldFlatFontOfSize:20];
        _descLb.numberOfLines = 0;
        [self.contentView addSubview:_descLb];
        [_descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.topMargin.mas_equalTo(self.iconIV.mas_topMargin).mas_equalTo(-10);
            make.right.mas_equalTo(self.publishTimeLb.mas_left).mas_equalTo(-10);
            make.height.mas_lessThanOrEqualTo(85);
            make.height.mas_greaterThanOrEqualTo(27);
        }];
    }
    return _descLb;
}

- (UILabel *)publishTimeLb {
    if(_publishTimeLb == nil) {
        _publishTimeLb = [[UILabel alloc] init];
        _publishTimeLb.font = [UIFont systemFontOfSize:12];
        _publishTimeLb.textColor = [UIColor lightGrayColor];
        _publishTimeLb.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_publishTimeLb];
        [_publishTimeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.descLb.mas_topMargin).mas_equalTo(0);
            make.right.mas_equalTo(-10);
            make.width.mas_equalTo(50);
        }];
    }
    return _publishTimeLb;
}

- (UILabel *)nickNameLb {
    if(_nickNameLb == nil) {
        _nickNameLb = [[UILabel alloc] init];
        _nickNameLb.font = [UIFont systemFontOfSize:15];
        _nickNameLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_nickNameLb];
        [_nickNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.descLb.mas_leftMargin);
            make.top.mas_equalTo(self.descLb.mas_bottom).mas_equalTo(10);
            make.bottom.mas_equalTo(self.playTimesLb.mas_top).mas_equalTo(-10);
        }];
    }
    return _nickNameLb;
}

- (TRImageView *)playTimesIV {
    if(_playTimesIV == nil) {
        _playTimesIV = [[TRImageView alloc] init];
        _playTimesIV.imageView.image = [UIImage imageNamed:@"sound_playtimes"];
        [self.contentView addSubview:_playTimesIV];
        [_playTimesIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.descLb.mas_leftMargin);
            make.bottom.mas_equalTo(-10);
            make.size.mas_equalTo(CGSizeMake(15, 15));
        }];
    }
    return _playTimesIV;
}
- (UILabel *)playTimesLb {
    if(_playTimesLb == nil) {
        _playTimesLb = [[UILabel alloc] init];
        _playTimesLb.font = [UIFont systemFontOfSize:14];
        _playTimesLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_playTimesLb];
        [_playTimesLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.playTimesIV.mas_right).mas_equalTo(0);
            //make.top.mas_equalTo(self.nickNameLb.mas_bottom).mas_equalTo(10);
            make.bottom.mas_equalTo(-10);
            make.centerY.mas_equalTo(self.playTimesIV);
            //make.width.mas_lessThanOrEqualTo(60);
        }];
    }
    return _playTimesLb;
}
- (UILabel *)commentsLb {
    if(_commentsLb == nil) {
        _commentsLb = [[UILabel alloc] init];
        _commentsLb.textColor = [UIColor lightGrayColor];
        _commentsLb.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_commentsLb];
        [_commentsLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.commentsIV.mas_right).mas_equalTo(0);
            make.height.mas_equalTo(17);
            make.centerY.mas_equalTo(self.playTimesIV);
        }];
    }
    return _commentsLb;
}

- (TRImageView *)commentsIV {
    if(_commentsIV == nil) {
        _commentsIV = [[TRImageView alloc] init];
        _commentsIV.imageView.image = [UIImage imageNamed:@"sound_comments"];
        [self.contentView addSubview:_commentsIV];
        [_commentsIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.playTimesLb.mas_right).mas_equalTo(10);
            make.centerY.mas_equalTo(self.playTimesIV);
            make.size.mas_equalTo(CGSizeMake(15, 15));
        }];
    }
    return _commentsIV;
}

- (UILabel *)linkesLb {
    if(_linkesLb == nil) {
        _linkesLb = [[UILabel alloc] init];
        _linkesLb.font = [UIFont systemFontOfSize:14];
        _linkesLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_linkesLb];
        [_linkesLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.linkesIV.mas_right).mas_equalTo(0);
            make.height.mas_equalTo(17);
            make.centerY.mas_equalTo(self.playTimesIV);
        }];
    }
    return _linkesLb;
}

- (TRImageView *)linkesIV {
    if(_linkesIV == nil) {
        _linkesIV = [[TRImageView alloc] init];
        _linkesIV.imageView.image = [UIImage imageNamed:@"sound_likes"];
        [self.contentView addSubview:_linkesIV];
        [_linkesIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.commentsLb.mas_right).mas_equalTo(10);
            make.centerY.mas_equalTo(self.playTimesIV);
            make.size.mas_equalTo(CGSizeMake(20, 15));
        }];
    }
    return _linkesIV;
}

- (TRImageView *)durationIV {
    if(_durationIV == nil) {
        _durationIV = [[TRImageView alloc] init];
        _durationIV.imageView.image = [UIImage imageNamed:@"sound_duration"];
        [self.contentView addSubview:_durationIV];
        [_durationIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.linkesLb.mas_right).mas_equalTo(10);
            make.centerY.mas_equalTo(self.playTimesIV);
            make.size.mas_equalTo(CGSizeMake(15, 15));
        }];
    }
    return _durationIV;
}
- (UILabel *)durationLb {
    if(_durationLb == nil) {
        _durationLb = [[UILabel alloc] init];
        _durationLb.font = [UIFont systemFontOfSize:14];
        _durationLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_durationLb];
        [_durationLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.durationIV.mas_right).mas_equalTo(0);
            make.height.mas_equalTo(17);
            make.centerY.mas_equalTo(self.playTimesIV);
            //make.width.mas_equalTo(40);
        }];
    }
    return _durationLb;
}

- (UIButton *)downloadBtn {
    if(_downloadBtn == nil) {
        _downloadBtn = [UIButton buttonWithType:0];
        //_downloadBtn.backgroundColor = [UIColor redColor];
        [_downloadBtn setBackgroundImage:[UIImage imageNamed:@"cell_download"] forState:UIControlStateNormal];
        [self.contentView addSubview:_downloadBtn];
        [_downloadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.bottom.mas_equalTo(-10);
            make.size.mas_equalTo(CGSizeMake(24, 24));
        }];
    }
    return _downloadBtn;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.separatorInset = UIEdgeInsetsMake(0, 65, 0, 0);
//      cell被选中后的背景色
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = kRGBColor(243, 255, 254);
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
