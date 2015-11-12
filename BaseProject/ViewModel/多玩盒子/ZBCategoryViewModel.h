//
//  ZBCategoryViewModel.h
//  BaseProject
//
//  Created by ios－54 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"

@interface ZBCategoryViewModel : BaseViewModel

@property (nonatomic, assign) NSInteger rowNumber;

- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)tagForRow:(NSInteger)row;

@end
