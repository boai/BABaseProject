//
//  AppDelegate.m
//  BABaseProject
//
//  Created by 博爱 on 16/5/3.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+BACategory.h"

@interface AppDelegate ()


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    /*! 是否使用自定义TabVC * YES:使用，NO:使用RDVTabVC */
    [self isBATabVC:YES];
    
    /*！把各种初始化操作,固定的操作 写入到类别中 */
    [self BA_initializeWithApplication:application];

    /*! 友盟分享/登陆 */
    [self BA_YMShareSetting];
    
    return YES;
}


@end
