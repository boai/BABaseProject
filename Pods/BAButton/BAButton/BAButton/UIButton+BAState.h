//
//  UIButton+BAState.h
//  BAButton
//
//  Created by 任子丰 on 17/5/25.
//  Copyright © 2017年 boai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface UIButton (BAState)
/**
 * 获取当前borderColor
 */
@property(nonatomic, readonly, strong) UIColor *ba_currentBorderColor;

/**
 * 获取当前backgroundColor
 */
@property(nonatomic, readonly, strong) UIColor *ba_currentBackgroundColor;

/**
 * 获取当前titleLabelFont
 */
@property(nonatomic, readonly, strong) UIFont *ba_currentTitleLabelFont;

/**
 * 切换按钮状态时,执行动画的时间,默认0.25s(只有动画执行完毕后,才能会执行下一个点击事件)
 */
@property (nonatomic, assign) NSTimeInterval ba_animatedDuration;

/** 
 * 设置不同状态下的borderColor(支持动画效果) 
 */
- (void)ba_buttonSetborderColor:(UIColor *)borderColor forState:(UIControlState)state animated:(BOOL)animated;

/** 
 * 设置不同状态下的backgroundColor(支持动画效果)
 */
- (void)ba_buttonSetBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state animated:(BOOL)animated;

/** 
 * 设置不同状态下的titleLabelFont 
 */
- (void)ba_buttonSetTitleLabelFont:(UIFont *)titleLabelFont forState:(UIControlState)state;

/** 
 * 获取某个状态的borderColor 
 */
- (UIColor *)ba_buttonBorderColorForState:(UIControlState)state;

/** 
 * 获取某个状态的backgroundColor 
 */
- (UIColor *)ba_buttonBackgroundColorForState:(UIControlState)state;

/** 
 * 获取某个状态的titleLabelFont 
 */
- (UIFont *)ba_buttonTitleLabelFontForState:(UIControlState)state;

#pragma mark - 使用key-value方式设置

/** 
 * key:@(UIControlState枚举)
 * 注：此方式无动画
 */
- (void)ba_buttonConfigBorderColors:(NSDictionary <NSNumber *,UIColor *>*)borderColors;

/** 
 * key:@(UIControlState枚举)
 * 注：此方式无动画
 */
- (void)ba_buttonConfigBackgroundColors:(NSDictionary <NSNumber *,UIColor *>*)backgroundColors;

/** 
 * key:@(UIControlState枚举)
 */
- (void)ba_buttonConfigTitleLabelFont:(NSDictionary <NSNumber *,UIFont *>*)titleLabelFonts;

@end

NS_ASSUME_NONNULL_END
