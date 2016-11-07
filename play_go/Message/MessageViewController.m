//
//  MessageViewController.m
//  play_go
//
//  Created by Dascom_X on 16/7/26.
//  Copyright © 2016年 Dascom. All rights reserved.
//

#import "MessageViewController.h"
#import "WYWebController.h"
#import "WYWebProgressLayer.h"
@implementation MessageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self customeNavagationTitle:@"消息"];

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
    webVC.hidesBottomBarWhenPushed = YES;

    [self.navigationController pushViewController:webVC animated:YES];
}

@end
