//
//  NSObject+ModelToDict.h
//
//
//  Created by xiejinke on 16/7/29.
//  Copyright © 2016年 Sun Beibei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ModelToDict)



/**
 *  字典value复制给model属性
 *
 *  @param data 字典
 *
 */
- (void)setPropertyWithDictionary:(NSDictionary *)data;


/**
 *  model转为字典，model属性名对应字典的key，属性值对应字典的value
 *
 *  @return 字典
 */
- (NSDictionary *)getPropertyToDictionary;


- (void)reSetModel;



@end
