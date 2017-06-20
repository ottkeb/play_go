//
//  MessageViewController.m
//  play_go
//
//  Created by xuwj on 16/7/26.
//  Copyright © 2016年 风影. All rights reserved.
//

#import "MessageViewController.h"
#import "WYWebController.h"

@implementation MessageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"消息";
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    label.backgroundColor = [UIColor redColor];
    [self.view addSubview:label];
    UIButton *butn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [butn setTitle:@"测试" forState:UIControlStateNormal];
    [butn setBackgroundColor:[UIColor yellowColor]];
    [butn addTarget:self action:@selector(butnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:butn];
    
}

- (void)butnClick
{
    NSLog(@"消息");
    
    WYWebController *webVC = [[WYWebController alloc]init];
    webVC.url = @"https://www.baidu.com";

    [self.navigationController pushViewController:webVC animated:YES];
}

@end
