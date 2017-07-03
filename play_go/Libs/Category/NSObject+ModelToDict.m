//
//  NSObject+ModelToDict.m
//
//
//  Created by xiejinke on 16/7/29.
//  Copyright © 2016年 Sun Beibei. All rights reserved.
//

#import "NSObject+ModelToDict.h"
#import <objc/runtime.h>
@implementation NSObject (ModelToDict)

- (void)setPropertyWithDictionary:(NSDictionary *)data {
    if (data == nil) {
        return;
    }
    
    NSArray *dicKey = [data allKeys];
    for (int i = 0; i < dicKey.count; i ++) {
        NSString *propertyName = dicKey[i];
        if (propertyName.length > 0) {
            NSString *firstStr = [propertyName substringToIndex:1];
            firstStr = firstStr.uppercaseString;
            propertyName = [propertyName stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:firstStr];
        }
        
        propertyName = [NSString stringWithFormat:@"set%@:", propertyName];
        SEL setSel = NSSelectorFromString(propertyName);
        if ([self respondsToSelector:setSel]) {
            id value = data[dicKey[i]];
            [self performSelectorOnMainThread:setSel
                                   withObject:value
                                waitUntilDone:[NSThread isMainThread]];
        }
    }
    
}

#pragma mark -
- (NSDictionary *)getPropertyToDictionary {
    NSMutableDictionary *mutableDictionary = [NSMutableDictionary dictionary];
    unsigned int nCount = 0;
    objc_property_t *popertylist = class_copyPropertyList([self class], &nCount);
    for (int i = 0; i < nCount; i++) {
        objc_property_t property = popertylist[i];
        NSString *attr_name = [NSString stringWithUTF8String:property_getName(property)];
        SEL selector = NSSelectorFromString(attr_name);
        if ([self respondsToSelector:selector]) {
            [mutableDictionary setValue:[self performSelector:selector] forKey:attr_name];
        }
    }
    return [NSDictionary dictionaryWithDictionary:mutableDictionary];
}


- (void)reSetModel {
    unsigned int nCount = 0;
    objc_property_t *popertylist = class_copyPropertyList([self class], &nCount);
    for (int i = 0; i < nCount; i++) {
        objc_property_t property = popertylist[i];
        NSString *propertyName = [NSString stringWithUTF8String:property_getName(property)];
        if (propertyName.length > 0) {
            NSString *firstStr = [propertyName substringToIndex:1];
            firstStr = firstStr.uppercaseString;
            propertyName = [propertyName stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:firstStr];
        }
        propertyName = [NSString stringWithFormat:@"set%@:", propertyName];
        SEL setSel = NSSelectorFromString(propertyName);
        if ([self respondsToSelector:setSel]) {
            [self performSelectorOnMainThread:setSel
                                   withObject:nil
                                waitUntilDone:[NSThread isMainThread]];
        }
        
    }

}

@end
