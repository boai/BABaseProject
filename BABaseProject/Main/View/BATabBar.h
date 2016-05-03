//
//  BATabBar.h
//  BABaseProject
//
//  Created by 博爱 on 16/5/3.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BATabBar;

@protocol BATabBarDelegate <NSObject>

@optional
- (void)tabBar:(BATabBar *)tabBar didClickButton:(NSInteger)index;

/**
 *  点击加号按钮的时候调用
 *

 */
- (void)tabBarDidClickPlusButton:(BATabBar *)tabBar;

@end


@interface BATabBar : UIView

//@property (nonatomic, assign) NSUInteger tabBarButtonCount;

// items:保存每一个按钮对应tabBarItem模型
@property (nonatomic, strong) NSArray *items;

@property (nonatomic, weak) id<BATabBarDelegate> delegate;

@end
