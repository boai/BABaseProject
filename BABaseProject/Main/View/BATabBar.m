//
//  BATabBar.m
//  博爱微博
//
//  Created by 孙博岩 on 15/7/27.
//  Copyright © 2015年 boai. All rights reserved.
//

#import "BATabBar.h"
#import "BATabBarButton.h"

@interface BATabBar ()

@property (nonatomic, weak) UIButton *plusButton;

@property (nonatomic, strong) NSMutableArray *buttons;

@property (nonatomic, weak) UIButton *selectedButton;

@end

@implementation BATabBar

- (NSMutableArray *)buttons
{
    if (!_buttons)
    {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

- (void)setItems:(NSArray *)items
{
    _items = items;
    
    // 遍历模型数组，创建对应tabBarButton
    for (UITabBarItem *item in _items)
    {
        BATabBarButton *btn = [BATabBarButton buttonWithType:UIButtonTypeCustom];
        
        // 给按钮赋值模型，按钮的内容由模型对应决定
        btn.item = item;
        
        btn.tag = self.buttons.count;
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        
        if (btn.tag == 0)
        {
            // 选中第0个
            [self btnClick:btn];
        }
        [self addSubview:btn];
        
        // 把按钮添加到按钮数组
        [self.buttons addObject:btn];
    }
}

// 点击tabBarButton调用
- (void)btnClick:(UIButton *)button
{
    _selectedButton.selected = NO;
    button.selected = YES;
    _selectedButton = button;
    
    // 通知tabBarVc切换控制器，
    if ([_delegate respondsToSelector:@selector(tabBar:didClickButton:)])
    {
        [_delegate tabBar:self didClickButton:button.tag];
    }
}

- (UIButton *)plusButton
{
    if (!_plusButton)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_background_icon_add"] forState:UIControlStateHighlighted];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        
        // 默认按钮的尺寸和背景图一样大
        // sizeToFit ： 默认会根据按钮的背景图片活着image 和文字计算出按钮的最适合的尺寸
        [btn sizeToFit];
        
        _plusButton = btn;
        [self addSubview:_plusButton];
    }
    return _plusButton;
}

// 调整子控件的位置
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    CGFloat W = self.bounds.size.width;
    CGFloat H = self.bounds.size.height;
    
    CGFloat btn_X = 0;
    CGFloat btn_Y = 0;
    CGFloat btn_W = W / (self.items.count + 1);
    CGFloat btn_H = self.bounds.size.height;
    
//    int i = 0;
//    // 设置tabBarButton的frame
//    for (UIView *tabBarButton in self.buttons) {
//        if (i == 2) {
//            i = 3;
//        }
//        btnX = i * btnW;
//        tabBarButton.frame = CGRectMake(btnX, btnY, btnW, btnH);
//        i++;
//    }
    
    
    int i = 0;
    // 调整系统自带的tabBar上的按钮位置frame
    for (UIView *tabBarButton in self.buttons)
    {
        if (i == 2)
        {
            i = 3;
        }
        btn_X = i * btn_W;
        
        tabBarButton.frame = CGRectMake(btn_X, btn_Y, btn_W, btn_H);
        
        i++;
    }
    
    // 设置添加按钮的位置
    self.plusButton.center = CGPointMake(W * 0.5, H * 0.5);
//    self.plusButton.bounds = CGRectMake(0, 0, self.plusButton.currentBackgroundImage.size.width, self.plusButton.currentBackgroundImage.size.height);
//    
}




@end
