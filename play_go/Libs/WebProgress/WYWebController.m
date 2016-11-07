//
//  WLWebController.m
//  WangliBank
//
//  Created by 王启镰 on 16/6/21.
//  Copyright © 2016年 iSoftstone infomation Technology (Group) Co.,Ltd. All rights reserved.
//

#import "WYWebController.h"
#import "WYWebProgressLayer.h"
#import "UIView+Frame.h"

@interface WYWebController ()<UIWebViewDelegate>

@end

@implementation WYWebController
{
    UIWebView *_webView;
    
    WYWebProgressLayer *_progressLayer; ///< 网页加载进度条
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
}


- (void)setupUI {
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    _webView.delegate = self;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
    [_webView loadRequest:request];
    _webView.opaque = NO;
    _webView.backgroundColor = [UIColor whiteColor];
   
    [self.view addSubview:_webView];
}


#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView {
    [_progressLayer startLoad];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self finishOrFailLoad];
    
    //解决内存泄露
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"WebKitCacheModelPreferenceKey"];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"WebKitDiskImageCacheEnabled"];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"WebKitOfflineWebApplicationCacheEnabled"];
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
-(void)viewWillAppear:(BOOL)animated
{
    _progressLayer = [[WYWebProgressLayer alloc]init];
    _progressLayer.frame = CGRectMake(0, 42, SCREEN_WIDTH, 2);
    
    [self.navigationController.navigationBar.layer addSublayer:_progressLayer];

}

@end
