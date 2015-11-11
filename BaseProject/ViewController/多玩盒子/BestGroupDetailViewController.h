//
//  BestGroupDetailViewController.h
//  BaseProject
//
//  Created by ios－54 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

/**
 *  数据的传入：通过在BestGroupViewController中任意的cell。获取到对应的BestGroupModel类型对象
 *  整体是一个tableView，是group风格的，两个section
 *  有两种类型的Cell，一种负责显示团队简介，一种负责显示每个角色的简介
 *  Cell选中以后是浅黄色，色值需要自己手动量取；
 */


#import <UIKit/UIKit.h>

@interface BestGroupDetailViewController : UIViewController

- (instancetype)initWithHeroImages:(NSArray *)iconURLs title:(NSString *)title descArr:(NSArray *)descArr;
@property (nonatomic, strong) NSArray *iconURLs;
@property (nonatomic, strong) NSString *titleName;
@property (nonatomic, strong) NSArray *descArr;

@end
