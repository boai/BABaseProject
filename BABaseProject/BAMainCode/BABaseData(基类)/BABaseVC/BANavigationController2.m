//
//  BANavigationController2.m
//  BABaseProject
//
//  Created by 博爱之家 on 16/6/11.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BANavigationController2.h"
#import "UIBarButtonItem+Item.h"

@interface BANavigationController2 ()<UINavigationControllerDelegate>

@property (nonatomic, strong) id popDelegate;

@end

@implementation BANavigationController2

/**
 * 当第一次使用这个类的时候会调用一次
 */
+ (void)initialize
{
    // 当导航栏用在XMGNavigationController中, appearance设置才会生效
    //    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:[self class], nil];
//    UINavigationBar *bar = [UINavigationBar appearance];
//    [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _popDelegate = self.interactivePopGestureRecognizer.delegate;
    // 实现滑动返回功能
    // 清空滑动返回手势代理
    self.interactivePopGestureRecognizer.delegate = nil;
    self.delegate = self;
}

/**
 * 可以在这个方法中拦截所有push进来的控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count)
    {
        // 不是根控制器
        viewController.hidesBottomBarWhenPushed = YES;
        
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"nav-back"] highImage:[UIImage imageNamed:@"nav-back"] target:self action:@selector(backToPre) forControlEvents:UIControlEventTouchUpInside];
    }
    
    // 这句super的push要放在后面, 让viewController可以覆盖上面设置的leftBarButtonItem
    [super pushViewController:viewController animated:animated];
    
}

- (void)backToPre
{
    [self popViewControllerAnimated:YES];
}

/*! 当用户刷时,导航控制器的navigationBar会隐藏或显示 */
- (void)setNavigationBarHidden:(BOOL)navigationBarHidden
{
    if (navigationBarHidden)
    {
        self.hidesBarsOnSwipe = YES;
    }
    else
    {
        self.hidesBarsOnSwipe = NO;
    }
    
}

@end
