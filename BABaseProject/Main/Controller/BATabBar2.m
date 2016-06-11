//
//  BATabBar2.m
//  BABaseProject
//
//  Created by 博爱之家 on 16/6/11.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BATabBar2.h"
#import "BANavigationController2.h"
#import "BAPublishViewController.h"

@interface BATabBar2()

/*! 发布按钮 */
@property (nonatomic, weak) UIButton *publishButton;

@end

@implementation BATabBar2

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        // 设置tabbar的背景图片
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
        
        // 添加发布按钮
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [publishButton setImage:[UIImage imageNamed:@"tabbar_compose_background_icon_add"] forState:UIControlStateHighlighted];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        
        // 默认按钮的尺寸跟背景图片一样大
        // sizeToFit:默认会根据按钮的背景图片或者image和文字计算出按钮的最合适的尺寸
        [publishButton sizeToFit];
        /*! 监听按钮的点击 */
        [publishButton addTarget:self action:@selector(publishButtonClick) forControlEvents:UIControlEventTouchUpInside];
        _publishButton = publishButton;
        
        [self addSubview:publishButton];

    }
    return self;
}

//- (UIButton *)publishButton
//{
//    if (!_publishButton)
//    {
//        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        [publishButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
//        [publishButton setImage:[UIImage imageNamed:@"tabbar_compose_background_icon_add"] forState:UIControlStateHighlighted];
//        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
//        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
//        
//        // 默认按钮的尺寸跟背景图片一样大
//        // sizeToFit:默认会根据按钮的背景图片或者image和文字计算出按钮的最合适的尺寸
//        [publishButton sizeToFit];
//        /*! 监听按钮的点击 */
//        [publishButton addTarget:self action:@selector(publishButtonClick) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:publishButton];
//        self.publishButton = publishButton;
//    }
//    return _publishButton;
//}

- (void)publishButtonClick
{
    BAPublishViewController *postWord = [[BAPublishViewController alloc] init];
    
//     这里不能使用self来弹出其他控制器, 因为self执行了dismiss操作
    UIViewController *root = [UIApplication sharedApplication].keyWindow.rootViewController;
    BANavigationController2 *nav = [[BANavigationController2 alloc] initWithRootViewController:postWord];
    [root presentViewController:nav animated:YES completion:nil];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat width = self.width;
    CGFloat height = self.height;
    
    // 设置发布按钮的frame
    self.publishButton.center = CGPointMake(width * 0.5, height * 0.5);
    
    // 设置其他UITabBarButton的frame
    CGFloat buttonY = 0;
    CGFloat buttonW = width / 5;
    CGFloat buttonH = height;
    NSInteger index = 0;
    for (UIView *button in self.subviews) {
        if (![button isKindOfClass:[UIControl class]] || button == self.publishButton) continue;
        
        // 计算按钮的x值
        CGFloat buttonX = buttonW * ((index > 1)?(index + 1):index);
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        // 增加索引
        index++;
    }
}


@end
