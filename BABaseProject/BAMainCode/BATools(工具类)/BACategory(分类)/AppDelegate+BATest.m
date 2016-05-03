//
//  AppDelegate+BATest.m
//  demoTest
//
//  Created by 博爱 on 16/4/1.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "AppDelegate+BATest.h"

@implementation AppDelegate (BATest)

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

@end
