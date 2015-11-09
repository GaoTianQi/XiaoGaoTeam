//
//  TuWanPicViewModel.h
//  BaseProject
//
//  Created by ios－54 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

#import "TuWanNetManager.h"

@interface TuWanPicViewModel : BaseViewModel

/** aid的赋值应该是非空的 */
- (_Nonnull instancetype)initWithAid:( NSString * _Nonnull )aid;
@property (nonatomic, strong)  NSString * _Nonnull aid;

@property (nonatomic, assign) NSInteger rowNumber;
- (nullable NSURL *)picURLForRow:(NSInteger)row;

@property (nonatomic, strong, nullable) TuWanPicModel *picModel;

@end
