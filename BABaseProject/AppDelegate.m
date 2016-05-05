//
//  AppDelegate.m
//  BABaseProject
//
//  Created by 博爱 on 16/5/3.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "RDVTabBarController.h"
#import "RDVTabBarItem.h"
#import "BANavigationController.h"
#import "BATabBarController.h"


#import "BAHomeViewController.h"
#import "BAMessageViewController.h"
#import "BADiscoverViewController.h"
#import "BAProfileViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    /*! 用RDVTabBarController，请打开此注释 */
//    [self setupViewControllers];
//    self.window.rootViewController = self.viewController;
    /*! 此处使用自定义TabBarController */
    self.window.rootViewController = [BATabBarController new];
    
    [self.window makeKeyAndVisible];
    
    [self initializeWithApplication:application];

    
    return YES;
}

#pragma mark - Methods

- (void)setupViewControllers {
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

- (void)customizeInterface {
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




@end
