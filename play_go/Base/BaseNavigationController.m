//
//  BaseNavigationController.m
//  play_go
//
//  Created by Dascom_X on 16/7/26.
//  Copyright © 2016年 Dascom. All rights reserved.
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


#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
//    NSInteger count = self.viewControllers.count;
//    
//    MainTabBarController *mainTBC = (MainTabBarController *)self.tabBarController;
//    
//    if (count == 1)
//    {
//        //显示tabBar
//        [UIView animateWithDuration:0.3 animations:^{
//            mainTBC.tabBar.hidden  = NO;
//            
//        }];
//    }
//
//    else if (count == 2)
//    {
//        //隐藏tabBar
//        [UIView animateWithDuration:0.3 animations:^{
//            mainTBC.tabBar.hidden  = YES;
//          
//        }];
//        
//    }
}

@end
