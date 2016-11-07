//
//  DataBaseManage.h
//  play_go
//
//  Created by xuwj on 16/7/27.
//  Copyright © 2016年 风影. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataBaseManage : NSObject

+ (DataBaseManage *)sharedManager;

- (void)createDataBase;

- (void)updateBase;

@end
