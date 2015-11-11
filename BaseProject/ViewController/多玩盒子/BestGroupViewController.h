//
//  BestGroupViewController.h
//  BaseProject
//
//  Created by ios－54 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

/**
 * 创建BaseGroupViewModel， 只需要实现getData就可以，没有分页,model只提供了英雄英文名，需要拼入链接地址才可以；
 * 创建BestGroupCell
 * 头像的大小固定，间距是（屏幕宽度-头像宽度总和）/6;Cell中题目最多一行，详情简介最多两行
 * BestGroupViewController制作cell的高度
 */


#import <UIKit/UIKit.h>

@interface BestGroupViewController : UIViewController

@end
