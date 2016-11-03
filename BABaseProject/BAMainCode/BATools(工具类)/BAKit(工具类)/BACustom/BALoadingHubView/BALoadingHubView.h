//
//  iKYLoadingHubView.h
//  iKYLoadingHub
//
//  Created by 郑钦洪 on 15/10/6.
//  Copyright (c) 2015年 Kingsly. All rights reserved.
//

#import <UIKit/UIKit.h>

/*! 基于源码 https://github.com/iKingsly/iKYLoadingHUb 修改！ */

@interface BALoadingHubView : UIView

/** 球的颜色 */
@property (nonatomic,strong) UIColor *ballColor;

/** 展示加载动画*/
- (void)showHub;

/**
 *  关闭加载动画
 */
- (void)dismissHub;

@end
