//
//  HomeViewController.m
//  play_go
//
//  Created by xuwj on 16/7/26.
//  Copyright © 2016年 风影. All rights reserved.
//

#import "HomeViewController.h"
#import "WYWebProgressLayer.h"
@interface HomeViewController()<UIWebViewDelegate>
{
    UIWebView *_webView;
    
    WYWebProgressLayer *_progressLayer; ///< 网页加载进度条
    NSInteger count;
    
}
@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"首页";
    [self initWebView];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(initWebView)name:@"reloadHomeWeb" object:nil];
   
}

- (void)initWebView {
    if (!_webView) {
        _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 64, KWidth, KHeight - 64 - 44)];
    }
    _webView.delegate = self;
    _webView.opaque = NO;
    _webView.backgroundColor = [UIColor whiteColor];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
    _webView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_webView];
}

- (void)initProgressLayer
{
    _progressLayer = [[WYWebProgressLayer alloc]init];
    _progressLayer.frame = CGRectMake(0, 42, KWidth, 2);
    _progressLayer.backgroundColor = [UIColor clearColor].CGColor;
    [self.navigationController.navigationBar.layer addSublayer:_progressLayer];
}


#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView {
    [_progressLayer startLoad];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self finishOrFailLoad];
    
    //解决网页内存泄露
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"WebKitCacheModelPreferenceKey"];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"WebKitDiskImageCacheEnabled"];//自己添加的，原文没有提到。
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"WebKitOfflineWebApplicationCacheEnabled"];//自己添加的，原文没有提到。
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [self finishOrFailLoad];

}

- (void)finishOrFailLoad
{
    [_progressLayer finishedLoad];
    [_progressLayer closeTimer];
    [_progressLayer removeFromSuperlayer];

}

#pragma mark - 生命周期
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self initProgressLayer];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"reloadHomeWeb" object:nil];

}

@end
