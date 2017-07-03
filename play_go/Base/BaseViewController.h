//
//  BaseViewController.h
//  play_go
//
//  Created by xuwj on 16/7/26.
//  Copyright © 2016年 风影. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BaseViewController : UIViewController


//设置右边按钮

- (void)setNavigationBarRightItemWithTitle:(NSString *)title actionClickBlock:(void (^)(UIButton *button))actionClickBlock;


@end





