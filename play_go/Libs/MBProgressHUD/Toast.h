//
//  Toast.h
//  VIPClub
//
//  Created by Wu Yifan on 12-5-18.
//  Copyright (c) 2012年 BUPT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Toast : NSObject

+ (void)show:(NSString*)message;
+ (void)show1:(NSString*)message;
+ (void)show2:(NSString *)message;
+ (void)shows:(NSString*)message detailMessage:(NSString*)detailmessage;
+ (void)showActiveMessage:(NSString *)message withBackground:(BOOL)backG;
+ (void)hideActiveHud;
+ (void)show:(NSString*)message inView:(UIView *)view;
+ (void)show:(NSString*)message inViews:(UIView *)view;
+ (void)showActiveMessage1:(NSString *)message withBackground:(BOOL)backG;
+ (void)showCheckmarkViewWithMessage:(NSString *)message detailMessage:(NSString*)detailmessage  inView:(UIView *)view;

@end
