
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
#import "BAKitManager.h"

/**
 *  Direction of flip animation
 */
typedef NS_ENUM(NSInteger, UIViewAnimationFlipDirection)
{
    /**
     *  Flip animation from top
     */
    UIViewAnimationFlipDirectionFromTop = 0,
    /**
     *  Flip animation from left
     */
    UIViewAnimationFlipDirectionFromLeft,
    /**
     *  Flip animation from right
     */
    UIViewAnimationFlipDirectionFromRight,
    /**
     *  Flip animation from bottom
     */
    UIViewAnimationFlipDirectionFromBottom
};

/**
 *  Direction of the translation
 */
typedef NS_ENUM(NSInteger, UIViewAnimationTranslationDirection)
{
    /**
     *  Translation from left to right
     */
    UIViewAnimationTranslationDirectionFromLeftToRight = 0,
    /**
     *  Translation from right to left
     */
    UIViewAnimationTranslationDirectionFromRightToLeft
};

/**
 *  Direction of the linear gradient
 */
typedef NS_ENUM(NSInteger, UIViewLinearGradientDirection)
{
    /**
     *  Linear gradient vertical
     */
    UIViewLinearGradientDirectionVertical = 0,
    /**
     *  Linear gradient horizontal
     */
    UIViewLinearGradientDirectionHorizontal,
    /**
     *  Linear gradient from left to right and top to down
     */
    UIViewLinearGradientDirectionDiagonalFromLeftToRightAndTopToDown,
    /**
     *  Linear gradient from left to right and down to top
     */
    UIViewLinearGradientDirectionDiagonalFromLeftToRightAndDownToTop,
    /**
     *  Linear gradient from right to left and top to down
     */
    UIViewLinearGradientDirectionDiagonalFromRightToLeftAndTopToDown,
    /**
     *  Linear gradient from right to left and down to top
     */
    UIViewLinearGradientDirectionDiagonalFromRightToLeftAndDownToTop
};



@interface UIView (BAKit)

@property (nonatomic          ) CGPoint        viewOrigin;
@property (nonatomic          ) CGSize         viewSize;

@property (nonatomic          ) CGFloat        x;
@property (nonatomic          ) CGFloat        y;
@property (nonatomic          ) CGFloat        width;
@property (nonatomic          ) CGFloat        height;

@property (nonatomic          ) CGFloat        top;
@property (nonatomic          ) CGFloat        bottom;
@property (nonatomic          ) CGFloat        left;
@property (nonatomic          ) CGFloat        right;

@property (nonatomic          ) CGFloat        centerX;
@property (nonatomic          ) CGFloat        centerY;

/*----------------------
 * Relative coordinate *
 ----------------------*/

@property (nonatomic, readonly) CGFloat        middleX;
@property (nonatomic, readonly) CGFloat        middleY;
@property (nonatomic, readonly) CGPoint        middlePoint;

@property (nonatomic          ) BAKitManager  *bakit_manager;


/**
 *  1.设置颜色
 */
- (UIView *(^)(UIColor *color)) setColor;

/**
 *  2.设置框架
 */
- (UIView *(^)(CGRect frame)) setFrame;

/**
 *  3.设置尺寸
 */
- (UIView *(^)(CGSize size)) setSize;

/**
 *  4.设置中心点
 */
- (UIView *(^)(CGPoint point)) setCenter;

/**
 *  5.设置标签值
 */
- (UIView *(^)(NSInteger tag)) setTag;

/**
 *  1.给UIView添加点击事件
 */
- (void)addTarget:(id)target
           action:(SEL)action;

/**
 *  2.UIView的类初始化
 */
+ (UIView *)viewWithFrame:(CGRect)frame
          backgroundColor:(UIColor *)backgroundColor;

/**
 *  3.创建边框
 */
- (void)setBordersWithColor:(UIColor *)color
            andCornerRadius:(CGFloat)radius
                   andWidth:(CGFloat)width;

/**
 *  4.删除边框
 */
- (void)removeBorders;

/**
 *  5.创建阴影
 */
- (void)setRectShadowWithOffset:(CGSize)offset
                        opacity:(CGFloat)opacity
                         radius:(CGFloat)radius;

/**
 *  6.删除阴影
 */
- (void)removeShadow;

/**
 *  7.创建圆角半径阴影
 */
- (void)setCornerRadiusShadowWithCornerRadius:(CGFloat)cornerRadius
                                       offset:(CGSize)offset
                                      opacity:(CGFloat)opacity
                                       radius:(CGFloat)radius;



/**
 *  8.设置圆角半径
 */
- (void)setCornerRadius:(CGFloat)radius;

/**
 *  9.摇摆动画
 */
- (void)shakeView;

/**
 *  10.脉冲动画
 */
- (void)pulseViewWithTime:(CGFloat)seconds;

/**
 *  添加子View
 *
 *  @param array 添加子的ViewArray
 */
- (void)BA_AddSubViewsWithArray:(NSArray *)array;

/**
 *  获取当前View的VC
 *
 *  @return 获取当前View的VC
 */
- (UIViewController *)getCurrentViewController;

/*!
 *  显示警告框
 *
 *  @param title   title description
 *  @param message message description
 */
- (void)ba_showAlertView:(NSString *)title message:(NSString *)message;

/*!
 *  自适应label的高度
 *
 *  @param text  内容
 *  @param font  字体大小
 *  @param width 宽度
 *
 *  @return label的高度
 */
+ (CGFloat)BA_AutoSizeOfHeghtWithText:(NSString *)text font:(UIFont *)font width:(CGFloat)width;

/*!
 *  自适应label的宽度
 *
 *  @param text  内容
 *  @param font  字体大小
 *  @param width 高度
 *
 *  @return label的宽度
 */
+ (CGFloat)BA_AutoSizeOfWidthWithText:(NSString *)text font:(UIFont *)font height:(CGFloat)height;

///*!
// *  BAKitManager
// *
// *  @return BAKitManager
// */
//- (BAKitManager *)bakit_manager;

@end
