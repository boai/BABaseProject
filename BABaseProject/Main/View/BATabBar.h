//
//  BATabBar.h
//  博爱微博
//
//  Created by 孙博岩 on 15/7/27.
//  Copyright © 2015年 boai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BATabBar;

@protocol BATabBarDelegate <NSObject>

@optional
- (void)tabBar:(BATabBar *)tabBar didClickButton:(NSInteger)index;

@end

@interface BATabBar : UIView

// items:保存每一个按钮对应tabBarItem模型
@property (nonatomic, strong) NSArray *items;

@property (nonatomic, weak) id<BATabBarDelegate> delegate;



@end
