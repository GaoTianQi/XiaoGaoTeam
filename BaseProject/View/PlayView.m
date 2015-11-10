//
//  PlayView.m
//  BaseProject
//
//  Created by ios－54 on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "PlayView.h"

@implementation PlayView

+ (PlayView *)sharedInstance
{
    static PlayView *p = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        p = [PlayView new];
    });
    return p;
}

- (instancetype)init
{
    if (self = [super init]) {
        //self.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

- (UIButton *)playBtn {
    if(_playBtn == nil) {
        _playBtn = [UIButton buttonWithType:0];
        _playBtn.backgroundColor = [UIColor greenSeaColor];
        [_playBtn setBackgroundImage:[UIImage imageNamed:@"PlayButtonOverlayLarge"] forState:UIControlStateNormal];
        [_playBtn setBackgroundImage:[UIImage imageNamed:@"btn_record_pause"] forState:UIControlStateSelected];
        [self addSubview:_playBtn];
        [_playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [_playBtn bk_addEventHandler:^(UIButton *sender) {
//   按钮的selected YES：在播放 NO：暂停
            if (sender.selected) {
                [_player pause];
            }else{
                [_player play]; 
            }
            sender.selected = !sender.selected;
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _playBtn;
}
- (void)playWithURL:(NSURL *)musicURL
{
//  支持后台播放
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
//  激活
    [[AVAudioSession sharedInstance] setActive:YES error:nil];
    _player = [AVPlayer playerWithURL:musicURL];
    [_player play];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
