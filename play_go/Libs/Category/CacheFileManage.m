//
//  CacheFileManage.m
//  play_go
//
//  Created by xuwj on 17/6/20.
//  Copyright © 2017年 风影. All rights reserved.
//

#import "CacheFileManage.h"

@implementation CacheFileManage


+ (NSString *)createCachePath:(NSString *)pathStr {

    if (!pathStr ||![pathStr isKindOfClass:[NSString class]]) {
        return nil;
    }
    //沙盒路径
    NSString *AppCachePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches/AppCaches"];
    
    NSString *cacheChildPath =[NSString stringWithFormat:@"%@/%@",AppCachePath,pathStr];
    BOOL isDirectory = YES;
    //判断该路径是否已存在
    if (![[NSFileManager defaultManager]fileExistsAtPath:AppCachePath isDirectory: &isDirectory]) {
        //不存在这个文件夹,创建一个
        [[NSFileManager defaultManager]createDirectoryAtPath:AppCachePath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    if (![[NSFileManager defaultManager]fileExistsAtPath:cacheChildPath]) {
        [[NSFileManager defaultManager]createFileAtPath:cacheChildPath contents:nil attributes:nil];
    }
    return cacheChildPath;
}


+ (BOOL)addDataToLocationCaches:(NSString*)locationPath WithTheData:(id)data {

    NSString  *midString = [data JSONString];
    NSError   *error;
    if (!locationPath) {
        return NO;
    }
    [midString writeToFile:locationPath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    if (!error) {
        return YES;
    }else{
        return NO;
    }
}


+ (id)getCachesLcationData:(NSString*)locationPath {

    if (![[NSFileManager  defaultManager]fileExistsAtPath:locationPath]) {
        return nil;
    }
    NSString   *midString = [NSString  stringWithContentsOfFile:locationPath encoding:NSUTF8StringEncoding error:nil];
    return midString;
}

+ (void)clearDataForCachesToFilePath:(NSString*)filePath{
    
    if ([[NSFileManager defaultManager]fileExistsAtPath:filePath]) {
        [[NSFileManager defaultManager]removeItemAtPath:filePath error:nil];
    }
}


@end
