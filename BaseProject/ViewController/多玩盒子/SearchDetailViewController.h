//
//  SearchDetailViewController.h
//  BaseProject
//
//  Created by ios－54 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchDetailViewController : UIViewController

- (instancetype)initWithRequest:(NSURLRequest *)request;
@property (nonatomic, strong) NSURLRequest *request;

@end
