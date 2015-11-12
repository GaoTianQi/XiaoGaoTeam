//
//  ZBItemViewController.h
//  BaseProject
//
//  Created by ios－54 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZBItemViewController : UIViewController

- (instancetype)initWithTag:(NSString *)tag name:(NSString *)name;
@property (nonatomic, strong) NSString *tag;
@property (nonatomic, strong) NSString *name;

@end
