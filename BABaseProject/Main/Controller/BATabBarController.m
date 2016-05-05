//
//  BATabBarController.m
//  博爱微博
//
//  Created by 孙博岩 on 15/7/26.
//  Copyright © 2015年 boai. All rights reserved.
//

#import "BATabBarController.h"
#import "BATabBar.h"

#import "BAHomeViewController.h"
#import "BAMessageViewController.h"
#import "BADiscoverViewController.h"
#import "BAProfileViewController.h"

#import "BANavigationController.h"

//#import "BAUserTool.h"
//#import "BAUserResult.h"

#import <objc/message.h>

/*
 封装思想：如果项目中，有相同的功能，抽取一个类，封装好。
 如何封装：自己的事情全部交给自己管理
 
 抽取方法：一般一个功能抽一个方法
 */

@interface BATabBarController () <BATabBarDelegate>

@property (nonatomic, strong) NSMutableArray            *items;

@property (nonatomic, weak  ) BAHomeViewController      *home;
@property (nonatomic, weak  ) BAMessageViewController   *message;
@property (nonatomic, weak  ) BADiscoverViewController  *discover;
@property (nonatomic, weak  ) BAProfileViewController   *profile;


@end

@implementation BATabBarController

- (NSMutableArray *)items
{
    if (_items == nil) {
        
        _items = [NSMutableArray array];
        
    }
    return _items;
}

// 什么时候调用：程序一启动时就会把所有的类加载进内存
// 作用：加载类的时候调用
//+ (void)load
//{
//    NSLog(@"%s",__func__);
//}

// 当第一次使用这个类或者子类的时候调用
// 作用：初始化类

// appearance 只要一个类遵守一个UIAppearance协议，就能获取全局的外观，UIView

- (void)viewDidLoad {
    [super viewDidLoad];

    // 添加所有子控制器
    [self setUpAllChildViewController];
    
    // 自定义tabBar
    [self setUpTabBar];
    
    // 每隔一段时间请求未读数
//    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(requestUnread) userInfo:nil repeats:YES];
}

// 请求未读数
//- (void)requestUnread
//{
//    // 请求微博的未读数
//    [BAUserTool unreadWithSuccess:^(BAUserResult *result) {
////        NSLog(@"%d", result.status);
//        // 设置首页未读数
//        _home.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d", result.status];
//        
//        // 设置消息未读数
//        _message.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d", result.status];
//        
//        // 设置我的未读数
//        _profile.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d", result.status];
//        
//        // 设置应用程序所有的未读数
//        [UIApplication sharedApplication].applicationIconBadgeNumber = result.totoalCount;
//        
//    } failure:^(NSError *error) {
//        
//    }];
//}

#pragma mark - 设置tabBar
- (void)setUpTabBar
{
    // 自定义tabBar
    BATabBar *tabBar = [[BATabBar alloc] initWithFrame:self.tabBar.bounds];
    tabBar.backgroundColor = [UIColor whiteColor];
    
    // 设置代理
    tabBar.delegate = self;
    
    // 给tabBar传递tabBarItem模型
    tabBar.items = self.items;
    
    // 添加自定义tabBar
    [self.tabBar addSubview:tabBar];
    
    
}

#pragma mark - 当点击tabBar上的按钮调用
- (void)tabBar:(BATabBar *)tabBar didClickButton:(NSInteger)index
{
//    if (index == 0 && self.selectedIndex == index)
//    {
//        // 点击首页刷新
//        [_home refresh];
//    }
    
    self.selectedIndex = index;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 移除系统自带的tabBarButton
    for (UIView *tabBarButton in self.tabBar.subviews)
    {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")])
        {
            [tabBarButton removeFromSuperview];
        }
        
    } 
}

// Item : 是苹果的模型的命名规范
// tabBarItem：决定tabBars上的按钮的内容
// 如果通过模型设置空间的文字颜色，只能通过文本属性（副文本，颜色，字体，阴影，空心，图文混排）

// 在iOS7 之后，默认会把uitabBar上的系统图片渲染成蓝色
#pragma mark - 添加所有的子控制器
- (void)setUpAllChildViewController
{
    // 首页
    BAHomeViewController *home = [[BAHomeViewController alloc] init];
    
    [self setUpOneChildViewController:home image:[UIImage imageNamed:@"tabbar_home"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_home_selected"] title:@"首页"];
    _home = home;
    
    
    // 消息
    BAMessageViewController *message = [[BAMessageViewController alloc] init];
    [self setUpOneChildViewController:message image:[UIImage imageNamed:@"tabbar_message_center"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_message_center_selected"] title:@"消息"];
    _message = message;
    
    // 发现
    BADiscoverViewController *discover = [[BADiscoverViewController alloc] init];
    [self setUpOneChildViewController:discover image:[UIImage imageNamed:@"tabbar_discover"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_discover_selected"] title:@"发现"];
    _discover = discover;
    
    
    // 我
    BAProfileViewController *profile = [[BAProfileViewController alloc] init];
    [self setUpOneChildViewController:profile image:[UIImage imageNamed:@"tabbar_profile"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_profile_selected"] title:@"我"];
    _profile = profile;
}

#pragma mark - 添加一个子控制器
- (void)setUpOneChildViewController:(UIViewController *)vc image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title
{
    //    // navigationItem模型
    //    vc.navigationItem.title = title;
    //
    //    // 设置子控件对应tabBarItem的模型属性
    //    vc.tabBarItem.title = title;
    vc.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectedImage;
    
    // 保存tabBarItem模型到数组
    [self.items addObject:vc.tabBarItem];
    
    BANavigationController *nav = [[BANavigationController alloc] initWithRootViewController:vc];
    
    [self addChildViewController:nav];
}




@end
