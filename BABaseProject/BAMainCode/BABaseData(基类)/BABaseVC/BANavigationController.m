//
//  BANavigationController.m
//  QJdouguoView
//
//  Created by Justin on 16/3/19.
//  Copyright © 2016年 Justin. All rights reserved.
//

#import "BANavigationController.h"
#import "UIBarButtonItem+Item.h"
#import "BANavigationBar.h"
#import "BATabBar.h"

@interface BANavigationController ()<UINavigationControllerDelegate>

@property (nonatomic, strong) id popDelegate;

@end

@implementation BANavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

    _popDelegate = self.interactivePopGestureRecognizer.delegate;
    // 实现滑动返回功能
    // 清空滑动返回手势代理
    self.interactivePopGestureRecognizer.delegate = nil;
    self.delegate = self;

//    BANavigationBar * bar = self.navigationBar;
//    [bar setBackgroundImage:[UIImage imageNamed:@"005.jpg"] forBarMetrics:UIBarMetricsCompactPrompt];
//    [bar setBarTintColor:BA_White_Color];
    
    BANavigationBar *bar = [[BANavigationBar alloc]initWithFrame:CGRectMake(0, 20, BA_SCREEN_WIDTH, 44)];
    [self setValue:bar forKey:@"navigationBar"];
//    [bar setBarTintColor:BA_White_Color];
    [bar setTranslucent:NO]; // 半透明
    
    self.navigationBar.barTintColor = BA_Green_Color;

    // 去掉导航分割线
    [bar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [bar setShadowImage:[[UIImage alloc] init]];

    // 设置导航条按钮的文字颜色
    NSMutableDictionary *titleAttr = [NSMutableDictionary dictionary];
    titleAttr[NSForegroundColorAttributeName] = BA_Red_Color;
    titleAttr[NSFontAttributeName] = BA_FontSize(18);
    
    [bar setTitleTextAttributes:titleAttr];
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

// 导航控制器跳转完成的时候调用
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //    BALog(@"%@", self.viewControllers[0]);
    if (viewController == self.viewControllers[0])
    {
        // 实现滑动返回功能
        // 清空滑动返回手势代理

        self.interactivePopGestureRecognizer.delegate = nil;
    }
    else
    {
        // 显示根控制器
        // 返回滑动返回手势代理
        self.interactivePopGestureRecognizer.delegate = _popDelegate;
    }
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // 设置非根控制器导航条内容
    if (self.viewControllers.count)
    {
        viewController.hidesBottomBarWhenPushed = YES;

        // 设置导航条的内容
        // 设置导航条左边 右边
        // 左边
        UIBarButtonItem *left = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_back"] highImage:[UIImage imageNamed:@"navigationbar_back_highlighted"] target:self action:@selector(backToPre) forControlEvents:UIControlEventTouchUpInside];
        // 设置导航条的按钮
        viewController.navigationItem.leftBarButtonItem = left;
        
        // 右边
//        UIBarButtonItem *right = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_more"] highImage:[UIImage imageNamed:@"navigationbar_more_highlighted"] target:self action:@selector(backToRoot) forControlEvents:UIControlEventTouchUpInside];
//        viewController.navigationItem.rightBarButtonItem = right;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)backToPre
{
    [self popViewControllerAnimated:YES];
}

- (void)backToRoot
{
    [self popToRootViewControllerAnimated:YES];
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    UITabBarController *tabBarVc = (UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    
    // 删除系统自带的tabBarButton
    for (UIView *tabBarButton in tabBarVc.tabBar.subviews) {
        if (![tabBarButton isKindOfClass:[BATabBar class]]) {
            [tabBarButton removeFromSuperview];
        }
    }
    
}


/**
 *  导航控制器 统一管理状态栏颜色
 *  @return 状态栏颜色
 */
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

/*! 
 
 iOS加载启动图的时候隐藏statusbar
 
 只需需要在info.plist中加入Status bar is initially hidden 设置为YES就好
 
 */

/*! 另一种简单写法，看个人喜好（此写法是系统navi，返回按钮带字）
 - (void)viewDidLoad {
 [super viewDidLoad];
 //    if( ([[UIDevice currentDevice].systemVersion floatValue]>=7.0)) {
 //        self.edgesForExtendedLayout=UIRectEdgeNone;//下移64
 //        self.navigationBar.translucent = NO;
 //    }
 self.navigationBar.barTintColor = [UIColor redColor];
 //返回按钮颜色
 UIImage *backButtonImage = [[UIImage imageNamed:@"navigator_btn_back"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 30, 0, 0)];
 [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
 
 self.navigationBar.tintColor = [UIColor whiteColor];
 self.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:17.0],NSFontAttributeName ,nil];
 }
 -(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
 if (self.viewControllers.count) {
 viewController.hidesBottomBarWhenPushed = YES;
 }
 [super pushViewController:viewController animated:animated];
 }
 */

@end
