
/*!
 *  @header BAKit
 *          demoTest
 *
 *  @brief  BAKit
 *
 *  @author 博爱
 *  @copyright    Copyright © 2016年 博爱. All rights reserved.
 *  @version    V1.0
 */

/*!
 *
 *          ┌─┐       ┌─┐
 *       ┌──┘ ┴───────┘ ┴──┐
 *       │                 │
 *       │       ───       │
 *       │  ─┬┘       └┬─  │
 *       │                 │
 *       │       ─┴─       │
 *       │                 │
 *       └───┐         ┌───┘
 *           │         │
 *           │         │
 *           │         │
 *           │         └──────────────┐
 *           │                        │
 *           │                        ├─┐
 *           │                        ┌─┘
 *           │                        │
 *           └─┐  ┐  ┌───────┬──┐  ┌──┘
 *             │ ─┤ ─┤       │ ─┤ ─┤
 *             └──┴──┘       └──┴──┘
 *                 神兽保佑
 *                 代码无BUG!
 */

/*
 
 *********************************************************************************
 *
 * 在使用BAKit的过程中如果出现bug请及时以以下任意一种方式联系我，我会及时修复bug
 *
 * QQ     : 可以添加SDAutoLayout群 497140713 在这里找到我(博爱1616【137361770】)
 * 微博    : 博爱1616
 * Email  : 137361770@qq.com
 * GitHub : https://github.com/boai
 * 博客园  : http://www.cnblogs.com/boai/
 *********************************************************************************
 
 */

#import <UIKit/UIKit.h>
#import "UIFont+BAKit.h"

/**
 *  给UIButton类添加许多有用的方法
 */
@interface UIButton (BAKit)

/**
 *  给定框架创建一个UIButton对象
 */
+ (id)initWithFrame:(CGRect)frame;

/**
 *  给定框架和字符串(字符串字体颜色默认是白色)创建一个UIButton对象
 */
+ (id)initWithFrame:(CGRect)frame
              title:(NSString *)title;

/**
 *  给定框架、字符串和背景图片创建一个UIButton对象
 */
+ (id)initWithFrame:(CGRect)frame
              title:(NSString *)title
    backgroundImage:(UIImage *)backgroundImage;

/**
 *  给定框架、字符串、背景图片和高亮背景图片创建一个UIButton对象
 */
+ (id)initWithFrame:(CGRect)frame
              title:(NSString *)title
    backgroundImage:(UIImage *)backgroundImage
highlightedBackgroundImage:(UIImage *)highlightedBackgroundImage;

/**
 *  给定框架、字符串、颜色创建一个UIButton对象
 */
+ (id)initWithFrame:(CGRect)frame
              title:(NSString *)title
              color:(UIColor *)color;

/**
 *  给定框架、字符串、背景颜色和高亮背景颜色创建一个UIButton对象
 */
+ (id)initWithFrame:(CGRect)frame
              title:(NSString *)title
              color:(UIColor *)color
   highlightedColor:(UIColor *)highlightedColor;

/**
 *  给定框架、颜色创建一个UIButton对象
 */
+ (id)initWithFrame:(CGRect)frame
              color:(UIColor *)color;

/**
 *  给定框架、背景颜色和高亮背景颜色创建一个UIButton对象
 */
+ (id)initWithFrame:(CGRect)frame
              color:(UIColor *)color
   highlightedColor:(UIColor *)highlightedColor;

/**
 *  给定框架和图片创建一个UIButton对象
 */
+ (id)initWithFrame:(CGRect)frame
              image:(UIImage *)image;

/**
 *  给定框架、背景图片和高亮背景图片创建一个UIButton对象 */
+ (id)initWithFrame:(CGRect)frame
              image:(UIImage *)image
   highlightedImage:(UIImage *)highlightedImage;

/**
 *  设置字符字体和大小
 */
- (void)setTitleFont:(FontName)fontName
                size:(CGFloat)size;

/**
 *  设置字符颜色
 */
- (void)setTitleColor:(UIColor *)color;

/**
 *  设置字符颜色和高亮颜色
 */
- (void)setTitleColor:(UIColor *)color
     highlightedColor:(UIColor *)highlightedColor;


@end
