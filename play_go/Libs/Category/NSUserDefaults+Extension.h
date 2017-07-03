//
//  NSUserDefaults+Extension.h
//  play_go
//
//  Created by xuwj on 17/6/21.
//  Copyright © 2017年 风影. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (Extension)

//存储
+ (void)setValue:(id)object forKey:(NSString *)key;

//获取
+ (id)objectForKey:(NSString *)key;

//清除
+ (void)clearLocationDataForKey:(NSString *)key;


@end
