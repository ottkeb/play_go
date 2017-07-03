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
    [self masonryView];
}

- (void)masonryView {

    UIButton *redButn = [[UIButton alloc]init];
    [redButn setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:redButn];
    
    [redButn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.view.mas_width).multipliedBy(0.5);//multipliedBy是倍数的意思
        make.height.mas_equalTo(self.view.mas_height).multipliedBy(0.5).offset(-22);//offset:上减下加
    }];
    
    UIButton *yellowButn = [[UIButton alloc]init];
    [yellowButn setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:yellowButn];
    
    [yellowButn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(redButn.mas_right);
        make.top.mas_equalTo(redButn.mas_top);
        make.width.and.height.mas_equalTo(redButn);
    }];
    
    UIButton *cyanButn = [[UIButton alloc]init];
    [cyanButn setBackgroundColor:[UIColor cyanColor]];
    [self.view addSubview:cyanButn];
    
    [cyanButn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(redButn.mas_bottom);
        make.left.mas_equalTo(redButn.mas_left);
        make.width.and.height.mas_equalTo(redButn);
    }];
    
    UIButton *brownButn = [[UIButton alloc]init];
    [brownButn setBackgroundColor:[UIColor brownColor]];
    [self.view addSubview:brownButn];

    [brownButn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(cyanButn.mas_top);
        make.left.mas_equalTo(cyanButn.mas_right);
        make.width.and.height.mas_equalTo(cyanButn);
    }];
    
}


@end
