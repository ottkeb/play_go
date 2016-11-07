//
//  main.m
//  play_go
//
//  Created by xuwj on 16/7/26.
//  Copyright © 2016年 风影. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @try {
        @autoreleasepool {
            return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        }
    } @catch (NSException *exception) {
        //捕获异常
        NSLog(@"main----------->%@",[exception reason]);
    }
   
}
