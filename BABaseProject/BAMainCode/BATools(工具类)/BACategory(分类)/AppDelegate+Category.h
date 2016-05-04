//
//  AppDelegate+Category.h
//  BABaseProject
//
//  Created by apple on 16/1/13.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (Category)

- (void)test;

/** 把各种初始化操作,固定的操作 写入到类别中 */
- (void)initializeWithApplication:(UIApplication *)application;

@end
