//
//  BaseViewController.m
//  play_go
//
//  Created by xuwj on 16/7/26.
//  Copyright © 2016年 风影. All rights reserved.
//

#import "BaseViewController.h"

typedef void(^ActionBlock)(UIButton *butn);

@interface BaseViewController()

@property (nonatomic,copy)UIButton *navagationButn;

@property (nonatomic,strong) ActionBlock actionBlock;

@end

@implementation BaseViewController

- (instancetype)init
{
   self= [super init];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
        self.automaticallyAdjustsScrollViewInsets = NO;
    }

    return self;

}

- (void)setTitle:(NSString *)title {
    [super setTitle:title];

    UILabel *titleText = [[UILabel alloc] initWithFrame: CGRectMake((KWidth-120)/2, 0, 120, 50)];
    titleText.textAlignment = NSTextAlignmentCenter;
    titleText.backgroundColor = [UIColor clearColor];
    titleText.textColor=[UIColor whiteColor];
    [titleText setFont:[UIFont systemFontOfSize:20.0]];
    titleText.text =title;
    self.navigationItem.titleView=titleText;
    
}

- (UIButton *)navagationButn {
    if (!_navagationButn) {
        
        _navagationButn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
        [_navagationButn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_navagationButn addTarget:self action:@selector(actionClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _navagationButn;

}

- (void)setNavigationBarRightItemWithTitle:(NSString *)title actionClickBlock:(void (^)(UIButton *button))actionClickBlock{
    
    [self.navagationButn setTitle:title forState:UIControlStateNormal];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:self.navagationButn];
    self.navigationItem.rightBarButtonItem = rightItem;
    self.actionBlock = actionClickBlock;
}

- (void)actionClick:(UIButton *)butn {
    
      self.actionBlock(butn);
}
     

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

}

@end
