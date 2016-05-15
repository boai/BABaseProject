//
//  BANavigationBar.h
//  demoTest
//
//  Created by 博爱 on 16/4/9.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BANavigationBar : UINavigationBar

@property (nonatomic, strong) UIView *bgView;

/** 显示导航条背景颜色 */
- (void)BA_showNaviBar;

/** 隐藏 */
- (void)BA_hiddenNaviBar;

@end
