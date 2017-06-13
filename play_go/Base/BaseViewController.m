//
//  BaseViewController.m
//  play_go
//
//  Created by xuwj on 16/7/26.
//  Copyright © 2016年 风影. All rights reserved.
//

#import "BaseViewController.h"

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

- (void)customeNavagationTitle :(NSString *)title
{
    UILabel *titleText = [[UILabel alloc] initWithFrame: CGRectMake((KWidth-120)/2, 0, 120, 50)];
    titleText.textAlignment = NSTextAlignmentCenter;
    titleText.backgroundColor = [UIColor clearColor];
    titleText.textColor=[UIColor whiteColor];
    [titleText setFont:[UIFont systemFontOfSize:20.0]];
    titleText.text =title;
    self.navigationItem.titleView=titleText;
    
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
