//
//  AlbumDetailViewController.h
//  BaseProject
//
//  Created by ios－54 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumDetailViewController : UIViewController

@property (nonatomic, strong) NSNumber *albumId;

- (instancetype)initWithAlbumId:(NSNumber *)albumId;

@end
