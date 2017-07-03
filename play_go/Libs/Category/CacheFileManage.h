//
//  CacheFileManage.h
//  play_go
//
//  Created by xuwj on 17/6/20.
//  Copyright © 2017年 风影. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 该类主要是使用NSFileManager进行保存数据等
 
 */
@interface CacheFileManage : NSObject

//1.创建路径
+ (NSString *)createCachePath:(NSString *)pathStr;

//2、存入数据(可以是字符串，字典，数组类型)
+ (BOOL)addDataToLocationCaches:(NSString*)locationPath WithTheData:(id)data;

//3、获取存储的数据
+ (id)getCachesLcationData:(NSString*)locationPath;

//4、删除某一路径下的数据
+ (void)clearDataForCachesToFilePath:(NSString*)filePath;


@end
