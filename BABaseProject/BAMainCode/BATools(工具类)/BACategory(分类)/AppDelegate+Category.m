//
//  AppDelegate+Category.m
//  BABaseProject
//
//  Created by apple on 16/1/13.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "AppDelegate+Category.h"
#import <AFNetworkActivityIndicatorManager.h>

@implementation AppDelegate (Category)

- (void)test
{
    /*! 1、获取APP的名字 */
    NSString *appName = [NSString stringWithFormat:@"1、获取APP的名字：%@", BA_APP_Name];
    
    /*! 2、获取APP的版本号 */
    NSString *appVersion = [NSString stringWithFormat:@"2、获取APP的版本号：%@", BA_APP_Version];
    
    /*! 3、获取App短式版本号 */
    NSString *appVersionShort = [NSString stringWithFormat:@"3、获取App短式版本号：%@", BA_APP_VersionShort];
    
    /*! 4、使用BALocalizedString检索本地化字符串 */
    // 详见首页VC
    
    /*! 5、获取iOS版本 */
    NSString *systemVersion = [NSString stringWithFormat:@"5、获取iOS版本：%@", IOS_VERSION];
    
    /*! 6、返回平台设备 */
    NSString *devicePlatform = [NSString stringWithFormat:@"6、返回平台设备：%@", [UIDevice devicePlatform]];
    
    
    BALog(appName);
    BALog(appVersion);
    BALog(appVersionShort);
    BALog(systemVersion);
    BALog(devicePlatform);
    
}


- (void)initializeWithApplication:(UIApplication *)application
{
//    // 注册DDLog
//    [DDLog addLogger:[DDASLLogger sharedInstance]];
//    [DDLog addLogger:[DDTTYLogger sharedInstance]];
//    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    
    // 当使用AF发送网络请求时,只要有网络操作,那么在状态栏(电池条)wifi符号旁边显示  菊花提示
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    // 能够检测当前网络是wifi,蜂窝网络,没有网
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
      
        switch (status)
        {
            case AFNetworkReachabilityStatusReachableViaWiFi:
                BALog(@"当前是WiFi环境！");
                [self BA_showAlert:@"当前是WiFi环境！"];
                break;
            case AFNetworkReachabilityStatusNotReachable:
                BALog(@"当前无网络！");
                [self BA_showAlert:@"当前无网络！"];
                break;
            case AFNetworkReachabilityStatusUnknown:
                BALog(@"当前网络未知！");
                [self BA_showAlert:@"当前网络未知！"];
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                BALog(@"当前是蜂窝网络！");
                [self BA_showAlert:@"当前是蜂窝网络！"];
                break;
                
            default:
                break;
        }
    }];
    
    // 开启网络检测
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    // 网络活动发生变化时,会发送下方key 的通知, 可以在通知中心中添加检测
    // AFNetworkingReachabilityDidChangeNotification
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:nil name:AFNetworkingReachabilityDidChangeNotification object:nil];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {

    BALog(@"程序即将进入后台！");

}

- (void)applicationDidEnterBackground:(UIApplication *)application {

    BALog(@"程序已进入后台！");

}

- (void)applicationWillEnterForeground:(UIApplication *)application {

    BALog(@"程序已进入前台！");

}

- (void)applicationDidBecomeActive:(UIApplication *)application {

    
}

- (void)applicationWillTerminate:(UIApplication *)application {

    
}



@end
