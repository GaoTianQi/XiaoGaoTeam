//
//  SearchViewController.m
//  BaseProject
//
//  Created by ios－54 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchDetailViewController.h"

#define kSearchPath @"http://lolbox.duowan.com/phone/playerSearchNew.php?lolboxAction=toInternalWebView"

@interface SearchViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation SearchViewController

//http://lolbox.duowan.com/phone/playerSearchNew.php?lolboxAction=toInternalWebView

- (UIWebView *)webView {
    if(_webView == nil) {
        _webView = [[UIWebView alloc] init];
        NSURL *url = [NSURL URLWithString:kSearchPath];
        [_webView loadRequest:[NSURLRequest requestWithURL:url]];
        _webView.delegate = self;
    }
    return _webView;
}

- (instancetype)init
{
    if (self = [super init]) {
        self.title = @"召唤师查询";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [Factory addMenuItemToVC:self];
    [self.view addSubview:self.webView];
    [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

#pragma mark - UIWebViewDelegate

// 点击web中的任意页，跳转到下一页 , 如果返回NO就不会加载请求
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
//  如果当前web加载的不是当前页面，返回NO（表示在推出页面加载），否则返回YES（表示在当页加载）；
    if (![request.URL.absoluteString isEqualToString:kSearchPath]) {
        SearchDetailViewController *vc = [[SearchDetailViewController alloc]initWithRequest:request];
        [self.navigationController pushViewController:vc animated:YES];
        return NO;
    }
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self showProgress]; // 旋转提示
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self hideProgress]; // 隐藏旋转
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self hideProgress];
}


@end
