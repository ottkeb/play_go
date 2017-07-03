//
//  NSUserDefaults+Extension.m
//  play_go
//
//  Created by xuwj on 17/6/21.
//  Copyright © 2017年 风影. All rights reserved.
//

#import "NSUserDefaults+Extension.h"

@implementation NSUserDefaults (Extension)
/*
 NSUserDefaults支持的数据格式有：NSNumber（Integer、Float、Double），NSString，NSData，NSArray，NSDictionary，BOOL类型
 */
+ (void)setValue:(id)object forKey:(NSString *)key {

    NSUserDefaults *userDefalut = [NSUserDefaults standardUserDefaults];
    
    [userDefalut setValue:object forKey:key];
    
    [userDefalut synchronize];
}

+ (id)objectForKey:(NSString *)key {
    
    NSUserDefaults *userDefalut = [NSUserDefaults standardUserDefaults];
        
    return [userDefalut objectForKey:key];
}

+ (void)clearLocationDataForKey:(NSString *)key {

    NSUserDefaults *userDefalut = [NSUserDefaults standardUserDefaults];
    [userDefalut removeObjectForKey:key];

}


@end
