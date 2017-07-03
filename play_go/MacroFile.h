//
//  MacroFile.h
//  play_go
//
//  Created by xuwj on 17/6/19.
//  Copyright © 2017年 风影. All rights reserved.
//

#ifndef MacroFile_h
#define MacroFile_h


//----------------------打印日志---------------------------
#ifdef DEBUG
# define DULog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
# define DLog(...)
#endif

#ifdef DEBUG
# define ULog(fmt, ...)  { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%s\n [Line %d] ", __PRETTY_FUNCTION__, __LINE__] message:[NSString stringWithFormat:fmt, ##__VA_ARGS__]  delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]; [alert show]; NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);}

#else
# define ULog(...)
#endif

//----------------------常用的宏定义---------------------------
#define KWidth  ([UIScreen mainScreen].bounds.size.width)
#define KHeight ([UIScreen mainScreen].bounds.size.height)
#define kWindow [UIApplication sharedApplication].keyWindow
#define FRAME(f,r,m,e)  CGRectMake(f, r, m, e)
#define FONT(F)  [UIFont systemFontOfSize:F]
#define WeakSelf  __weak typeof(self) weakSelf = self;

//----------------------颜色类---------------------------
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define RGB(r, g, b)    [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

//主题色
#define kNavBgColor [UIColor colorWithRed:14.0/255.0 green:163.0/255.0 blue:243.0/255.0 alpha:1.0]


//----------------------数据库相关---------------------------
//Documents
#define kDB_PATH [NSHomeDirectory() stringByAppendingString:@"/Documents/"]

//play_go.db
#define kDB_PATH_NAME [kDB_PATH stringByAppendingFormat:@"play_go.db"]


//是否为iOS7
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
//是否为iOS8及以上系统
#define iOS8 ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0)

//----------------------汉字或字符替换---------------------------
#define incompleteImagation  @"请输入用户名或密码"
#define loginFail            @"登录失败"



#endif /* MacroFile_h */
