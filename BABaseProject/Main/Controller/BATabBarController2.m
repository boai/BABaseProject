//
//  BATabBarController2.m
//  BABaseProject
//
//  Created by 博爱之家 on 16/6/11.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BATabBarController2.h"
#import "BATabBar2.h"
#import "BANavigationController.h"

#import "BAHomeViewController.h"
#import "BAMessageViewController.h"
#import "BADiscoverViewController.h"
#import "BAProfileViewController.h"
#import "BAPublishViewController.h"

@interface BATabBarController2 ()

//@property (nonatomic, weak  ) BAHomeViewController      *home;
//@property (nonatomic, weak  ) BAMessageViewController   *message;
//@property (nonatomic, weak  ) BADiscoverViewController  *discover;
//@property (nonatomic, weak  ) BAProfileViewController   *profile;

@end

@implementation BATabBarController2

+ (void)initialize
{
    // 通过appearance统一设置所有UITabBarItem的文字属性
    // 后面带有UI_APPEARANCE_SELECTOR的方法, 都可以通过appearance对象来统一设置
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 更换tabBar
    [self setValue:[[BATabBar2 alloc] init] forKeyPath:@"tabBar"];
    
//    // 移除系统自带的tabBarButton
//    for (UIView *tabBarButton in self.tabBar.subviews)
//    {
//        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")])
//        {
//            [tabBarButton removeFromSuperview];
//        }
//    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    /*! 添加所有子控制器 */
    [self setUpChildViewController];
    
}

/*! 添加所有子控制器 */
- (void)setUpChildViewController
{
    // 首页
    BAHomeViewController *homeVC = [[BAHomeViewController alloc] init];
    [self setupChildVc:homeVC title:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
//    _home = homeVC;
    
    // 消息
    BAMessageViewController *messageVC = [[BAMessageViewController alloc] init];
    [self setupChildVc:messageVC title:@"消息" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
//    _message = messageVC;
    
    // 发现
    BADiscoverViewController *discoverVC = [[BADiscoverViewController alloc] init];
    [self setupChildVc:discoverVC title:@"发现" image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
//    _discover = discoverVC;
    
    // 我
    BAProfileViewController *profileVC = [[BAProfileViewController alloc] init];
    [self setupChildVc:profileVC title:@"我的" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
//    _profile = profileVC;


}

#pragma mark - 添加一个子控制器
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置文字和图片
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    // 包装一个导航控制器, 添加导航控制器为tabbarcontroller的子控制器
    BANavigationController *nav = [[BANavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"tabBar"];
}



@end
