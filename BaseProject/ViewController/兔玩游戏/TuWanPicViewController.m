//
//  TuWanPicViewController.m
//  BaseProject
//
//  Created by ios－54 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanPicViewController.h"
#import "TuWanPicViewModel.h"

@interface TuWanPicViewController ()<MWPhotoBrowserDelegate>

@property (nonatomic, strong) TuWanPicViewModel *tuwanPicVM;

@end

@implementation TuWanPicViewController

- (TuWanPicViewModel *)tuwanPicVM
{
    if (!_tuwanPicVM) {
        _tuwanPicVM = [[TuWanPicViewModel alloc]initWithAid:_aid];
    }
    return _tuwanPicVM;
}

- (instancetype)initWithAid:(NSString *)aid
{
    if (self = [super init]) {
        self.aid = aid;
    }
    return self;
}

- (instancetype)init
{
    if (self = [super init]) {
        NSAssert1(NO, @"%s 必须使用initWithAid：方法初始化", __func__);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//  非xib，storyboard，背景色是透明
    self.view.backgroundColor = [UIColor whiteColor];
//  请求时要由正在操作的提示
    [self showProgress];
//  添加返回按钮
    [Factory addBackItemToVC:self];
    
    [self.tuwanPicVM getDataFromNetCompleteHandle:^(NSError *error) {
        [self showProgress];
//  创建图片展示页面，gitHub上排名很高的图片展示类控件
        MWPhotoBrowser *photoB = [[MWPhotoBrowser alloc]initWithDelegate:self];
        [self.navigationController pushViewController:photoB animated:YES];
//  图片展示页面不应该是当前页推出的，而应该是取代当前页在导航中的位置
        NSMutableArray *naviVCs = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
//      删除最后一个控制器，即当前的白色控制器
        [naviVCs removeLastObject];
//   把图片控制器添加到最后
        [naviVCs addObject:photoB];
//   把新的控制器数组赋值给导航控制器
        self.navigationController.viewControllers = naviVCs;
    }];
}

#pragma mark - MWPhotoBrowser
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser
{
    return self.tuwanPicVM.rowNumber;
}
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index
{
    MWPhoto *photo = [MWPhoto photoWithURL:[self.tuwanPicVM picURLForRow:index]];
    return photo;
}

@end
