//
//  AppDelegate+BAUMengAnalytics.m
//  BABaseProject
//
//  Created by 博爱 on 2016/11/2.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "AppDelegate+BAUMengAnalytics.h"
#import "UMMobClick/MobClick.h"

@implementation AppDelegate (BAUMengAnalytics)

- (void)ba_setuUMengAnalytics
{
    UMConfigInstance.appKey    = BA_UMengAnalyticskey;
    UMConfigInstance.channelId = @"App Store";
    /*! 仅适用于游戏场景，应用统计不用设置 */
//    UMConfigInstance.eSType = E_UM_GAME;

    /*! 配置以上参数后调用此方法初始化SDK！ */
    [MobClick startWithConfigure:UMConfigInstance];
    
    /*! 以App打包时的Build号作为应用程序的版本标识，不能通过友盟SDK或友盟后台配置。 */
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    [MobClick setAppVersion:version];
}


@end
