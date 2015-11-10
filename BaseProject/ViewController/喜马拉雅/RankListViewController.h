//
//  RankListViewController.h
//  BaseProject
//
//  Created by ios－54 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RankListViewController : UIViewController

/** 制作单利的原因，侧边栏需要经常切换内容，内容页不应该随着切换而被释放，每次切换应该是同一内存地址 */
+ (UINavigationController *)defaultNavi;

@end
