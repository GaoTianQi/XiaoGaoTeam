//
//  TuWanListViewController.h
//  BaseProject
//
//  Created by ios－54 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TuWanListViewController : UITableViewController

/** 定义一个属性，接受外部参数类型，决定当前控制器显示哪种类型的信息 */
@property (nonatomic, strong) NSNumber *TuWanType;

@end
