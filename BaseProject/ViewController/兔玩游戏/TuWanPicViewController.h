//
//  TuWanPicViewController.h
//  BaseProject
//
//  Created by ios－54 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TuWanPicViewController : UIViewController

/** 此页面内容要根据aid来决定 */
- (_Nonnull instancetype)initWithAid:( NSString * _Nonnull )aid;
@property (nonatomic, strong, nonnull) NSString * aid;

@end
