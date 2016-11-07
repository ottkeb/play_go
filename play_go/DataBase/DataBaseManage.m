//
//  DataBaseManage.m
//  play_go
//
//  Created by xuwj on 16/7/27.
//  Copyright © 2016年 风影. All rights reserved.
//

#import "DataBaseManage.h"

@implementation DataBaseManage

static DataBaseManage *shareDataBaseManage = nil;

+ (DataBaseManage *)sharedManager
{
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        shareDataBaseManage = [[self alloc] init];
    });
    return shareDataBaseManage;
}


- (void)createDataBase
{
    NSMutableArray *sqlDataArr = [NSMutableArray array];
    
    NSString *table_version = [[NSString alloc] initWithFormat:@"create table if not exists database_version (version float null)"];
    
    [sqlDataArr addObject:table_version];
    
    FMDatabase *db = [FMDatabase databaseWithPath:kDB_PATH_NAME];
    if ([db open]) {
        [db setShouldCacheStatements:YES];
        [db beginTransaction];
    for (NSString *tableStr in sqlDataArr) {
        if ([db executeQuery:tableStr]){
            DULog(@"create table successed!");
        }
        else
            DULog(@"create table faile!\n%@",tableStr);
       }
        [db commit];
        [db close];
    }
}

- (void)updateBase
{




}
@end
