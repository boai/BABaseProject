//
//  AppDelegate.m
//  BABaseProject
//
//  Created by 博爱 on 16/5/3.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "AppDelegate.h"
#import "BATabBarController.h"
#import "AppDelegate+Category.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    BATabBarController *tabVC = [[BATabBarController alloc] init];
    self.window.rootViewController = tabVC;
    [self.window makeKeyAndVisible];
    
    [self initializeWithApplication:application];

    
    return YES;
}




@end
