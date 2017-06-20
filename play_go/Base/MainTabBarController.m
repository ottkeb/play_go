//
//  MainTabBarController.m
//  play_go
//
//  Created by xuwj on 16/7/26.
//  Copyright © 2016年 风影. All rights reserved.
//

#import "MainTabBarController.h"
#import "BaseNavigationController.h"
#import "HomeViewController.h"
#import "MessageViewController.h"
#import "MainDataViewController.h"
#import "FinderViewController.h"
#import "MeViewController.h"
@interface MainTabBarController ()<UITabBarControllerDelegate>

@end

@implementation MainTabBarController

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setChildViewControllers];

        self.delegate = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    
}

- (void) setChildViewControllers
{
    HomeViewController *homeVC = [[HomeViewController alloc]init];
    [self setupChildViewController:homeVC vcTitle:@"首页" imageName:@"space" andSelectImageName:@"space_select"];
   
    MessageViewController *messageVC = [[MessageViewController alloc]init];
    [self setupChildViewController:messageVC vcTitle:@"消息" imageName:@"newmessage" andSelectImageName:@"newmessage_select"];

    MainDataViewController *mainDataVC = [[MainDataViewController alloc]init];
    [self setupChildViewController:mainDataVC vcTitle:@"" imageName:@"center" andSelectImageName:@"center_select"];
    
    FinderViewController *findVC = [[FinderViewController alloc]init];
    [self setupChildViewController:findVC vcTitle:@"发现" imageName:@"find" andSelectImageName:@"find_select"];

    MeViewController *meVC = [[MeViewController alloc]init];
    [self setupChildViewController:meVC vcTitle:@"我" imageName:@"i" andSelectImageName:@"i_select"];
    
}

- (void)setupChildViewController :(UIViewController *)vc vcTitle :(NSString *)title imageName :(NSString*)imageName andSelectImageName :(NSString *) selectedImageName
{
    vc.tabBarItem.title= title;
    vc.tabBarItem.image = [[UIImage imageNamed:imageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    BaseNavigationController *navc = [[BaseNavigationController alloc]initWithRootViewController:vc];

    [self addChildViewController:navc];
}

#pragma mark - UITabBarControllerDelegate




- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    viewController.tabBarItem.badgeValue = nil;
    NSLog(@"点击了%@",viewController.tabBarItem.title);
    
    
    if ([viewController.tabBarItem.title isEqualToString:@"首页"]) {
          [[NSNotificationCenter defaultCenter]postNotificationName:@"reloadHomeWeb" object:nil userInfo:nil];
    }
}
@end
