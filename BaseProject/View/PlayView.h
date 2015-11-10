//
//  PlayView.h
//  BaseProject
//
//  Created by ios－54 on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface PlayView : UIView

- (void)playWithURL:(NSURL *)musicURL;

+ (PlayView *)sharedInstance;
@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) UIButton *playBtn;

@end
