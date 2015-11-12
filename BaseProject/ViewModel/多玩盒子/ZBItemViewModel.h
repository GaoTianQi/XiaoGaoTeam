//
//  ZBItemViewModel.h
//  BaseProject
//
//  Created by ios－54 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface ZBItemViewModel : BaseViewModel

- (instancetype)initWithTag:(NSString *)tag;
@property (nonatomic, strong) NSString *tag;

@property (nonatomic, assign) NSInteger rowNumber;

- (NSInteger)identifyForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSURL *)iconURLForRow:(NSInteger)row;

@end
