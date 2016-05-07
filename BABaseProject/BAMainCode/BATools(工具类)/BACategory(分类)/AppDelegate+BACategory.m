//
//  AppDelegate+BACategory.m
//  BABaseProject
//
//  Created by 博爱 on 16/5/7.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "AppDelegate+BACategory.h"
#import <AFNetworkActivityIndicatorManager.h>

#import "BANavigationController.h"
#import "BATabBarController.h"

/*! 用RDVTabBarController，使用此头文件 */
#import "RDVTabBarController.h"
#import "RDVTabBarItem.h"

#import "BAHomeViewController.h"
#import "BAMessageViewController.h"
#import "BADiscoverViewController.h"
#import "BAProfileViewController.h"

@implementation AppDelegate (BACategory)

#pragma mark - ***** TabVC 设置
/*!
 *  是否使用自定义TabVC
 *
 *  @param is YES:使用，NO:使用RDVTabVC
 */
- (void)isBATabVC:(BOOL)is
{
    // 创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    if (is)
    {
        /*! 此处使用自定义TabBarController */
        self.window.rootViewController = [BATabBarController new];
    }
    else
    {
        /*! 此处使用RDVTabBarController */
            [self setupViewControllers];
            self.window.rootViewController = self.viewController;
    }

    
    [self.window makeKeyAndVisible];
    
}

#pragma mark - ***** 设备各种信息获取 设置
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


#pragma mark - ***** 网络监测 设置
- (void)BA_initializeWithApplication:(UIApplication *)application
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

#pragma mark - ***** 友盟分享/登陆 设置
- (void)BA_YMShareSetting
{

}

#pragma mark - ***** 使用RDVTabBarController 设置
#pragma mark 初始化各个ViewController
- (void)setupViewControllers
{
    UIViewController *firstViewController = [[BAHomeViewController alloc] init];
    UIViewController *firstNavigationController = [[BANavigationController alloc]
                                                   initWithRootViewController:firstViewController];
    
    UIViewController *secondViewController = [[BAMessageViewController alloc] init];
    UIViewController *secondNavigationController = [[BANavigationController alloc]
                                                    initWithRootViewController:secondViewController];
    
    UIViewController *thirdViewController = [[BADiscoverViewController alloc] init];
    UIViewController *thirdNavigationController = [[BANavigationController alloc]
                                                   initWithRootViewController:thirdViewController];
    UIViewController *fourViewController = [[BAProfileViewController alloc] init];
    UIViewController *fourNavigationController = [[BANavigationController alloc]
                                                  initWithRootViewController:fourViewController];
    
    RDVTabBarController *tabBarController = [[RDVTabBarController alloc] init];
    [tabBarController setViewControllers:@[firstNavigationController, secondNavigationController, thirdNavigationController, fourNavigationController]];
    self.viewController = tabBarController;
    
    [self customizeTabBarForController:tabBarController];
}

- (void)customizeTabBarForController:(RDVTabBarController *)tabBarController
{
    NSArray *tabBarItemImages = @[@"tabbar_home", @"tabbar_message_center", @"tabbar_discover", @"tabbar_profile"];
    NSArray *titlesArray = @[@"首页", @"消息", @"发现", @"我的",];
    
    NSInteger index = 0;
    NSDictionary *textAttributes = nil;
    for (RDVTabBarItem *item in [[tabBarController tabBar] items]) {
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",
                                                      [tabBarItemImages objectAtIndex:index]]];
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@",
                                                        [tabBarItemImages objectAtIndex:index]]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        item.title = [titlesArray objectAtIndex:index];
        textAttributes = @{
                           NSFontAttributeName: [UIFont systemFontOfSize:18],
                           NSForegroundColorAttributeName: [UIColor orangeColor],
                           };
        [item setSelectedTitleAttributes:textAttributes];
        
        index++;
    }
}

- (void)customizeInterface
{
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    
    UIImage *backgroundImage = nil;
    NSDictionary *textAttributes = nil;
    
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
        backgroundImage = [UIImage imageNamed:@"navigationbar_background_tall"];
        
        textAttributes = @{
                           NSFontAttributeName: [UIFont boldSystemFontOfSize:18],
                           NSForegroundColorAttributeName: [UIColor blackColor],
                           };
    }
    
    [navigationBarAppearance setBackgroundImage:backgroundImage
                                  forBarMetrics:UIBarMetricsDefault];
    [navigationBarAppearance setTitleTextAttributes:textAttributes];
}

#pragma mark - ***** 其他

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
