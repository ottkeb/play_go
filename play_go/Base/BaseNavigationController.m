//
//  BaseNavigationController.m
//  play_go
//
//  Created by xuwj on 16/7/26.
//  Copyright © 2016年 风影. All rights reserved.
//

#import "BaseNavigationController.h"
#import "MainTabBarController.h"

@interface BaseNavigationController()<UINavigationControllerDelegate>

@end

@implementation BaseNavigationController

 - (instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    self= [super initWithRootViewController:rootViewController];
    if (self) {
        
        self.navigationBar.barTintColor = kNavBgColor;
        self.delegate = self;

    }
    return self;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.viewControllers.count >0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}



#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    
}

@end
