//
//  TuWanHtmlViewController.m
//  BaseProject
//
//  Created by ios－54 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanHtmlViewController.h"

@interface TuWanHtmlViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation TuWanHtmlViewController

- (UIWebView *)webView
{
    if (!_webView) {
        _webView = [[UIWebView alloc]init];
        [_webView loadRequest:[NSURLRequest requestWithURL:_URL]];
        _webView.delegate = self;
    }
    return _webView;
}
- (instancetype)initWithURL:(NSURL *)URL
{
    if (self = [super init]) {
        self.URL = URL;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.webView];
    [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    [Factory addBackItemToVC:self];
    
}

#pragma mark - 
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self showProgress]; // 旋转提示
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self hideProgress];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self hideProgress];
}



@end
