//
//  BAAlert_Config.h
//  BAAlert
//
//  Created by boai on 2017/5/13.
//  Copyright © 2017年 boai. All rights reserved.
//

#ifndef BAAlert_Config_h
#define BAAlert_Config_h


/*! 背景高斯模糊枚举 默认：1 */
typedef NS_ENUM(NSInteger, BAAlertBlurEffectStyle) {
    /*! 较亮的白色模糊 */
    BAAlertBlurEffectStyleExtraLight = 1,
    /*! 一般亮的白色模糊 */
    BAAlertBlurEffectStyleLight,
    /*! 深色背景模糊 */
    BAAlertBlurEffectStyleDark
} NS_ENUM_AVAILABLE_IOS(7_0);

/*! 进出场动画枚举 默认：1 */
typedef NS_ENUM(NSUInteger, BAAlertAnimatingStyle) {
    /*! 缩放显示动画 */
    BAAlertAnimatingStyleScale = 1,
    /*! 晃动动画 */
    BAAlertAnimatingStyleShake,
    /*! 天上掉下动画 / 上升动画 */
    BAAlertAnimatingStyleFall
};

///*! BAActionSheet 样式 */
//typedef NS_ENUM(NSUInteger, BAActionSheetStyle) {
//    /*!
//     *  普通样式
//     */
//    BAActionSheetStyleNormal = 1,
//    /*!
//     *  带标题样式
//     */
//    BAActionSheetStyleTitle,
//    /*!
//     *  带图片和标题样式
//     */
//    BAActionSheetStyleImageAndTitle,
//    /*!
//     *  带图片样式
//     */
//    BAActionSheetStyleImage
//};

/*! BAActionSheet 类型，默认：1 */
typedef NS_ENUM(NSUInteger, BAActionSheetType) {
    BAActionSheetTypeNormal = 1,
    BAActionSheetTypeCustom,
    BAActionSheetTypeExpand
};

typedef void(^BAAlert_ButtonActionBlock)(NSInteger index);

#define SCREENWIDTH    [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT   [UIScreen mainScreen].bounds.size.height

#pragma mark - weak / strong
#define BAKit_WeakSelf        @BAKit_Weakify(self);
#define BAKit_StrongSelf      @BAKit_Strongify(self);

/*! RGB色值 */
#define BAAlert_Color_RGBA(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#define BAAlert_Color_Translucent     [UIColor colorWithRed:0.3f green:0.3f blue:0.3f alpha:0.5f]
#define BAAlert_Color_gray11          BAAlert_Color_RGBA(248, 248, 248, 1.0)
#define BAAlert_Color_gray7           BAAlert_Color_RGBA(173, 180, 190, 1.0)

/*！
 * 强弱引用转换，用于解决代码块（block）与强引用self之间的循环引用问题
 * 调用方式: `@BAKit_Weakify`实现弱引用转换，`@BAKit_Strongify`实现强引用转换
 *
 * 示例：
 * @BAKit_Weakify
 * [obj block:^{
 * @strongify_self
 * self.property = something;
 * }];
 */
#ifndef BAKit_Weakify
#if DEBUG
#if __has_feature(objc_arc)
#define BAKit_Weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define BAKit_Weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define BAKit_Weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define BAKit_Weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

/*！
 * 强弱引用转换，用于解决代码块（block）与强引用对象之间的循环引用问题
 * 调用方式: `@BAKit_Weakify(object)`实现弱引用转换，`@BAKit_Strongify(object)`实现强引用转换
 *
 * 示例：
 * @BAKit_Weakify(object)
 * [obj block:^{
 * @BAKit_Strongify(object)
 * strong_object = something;
 * }];
 */
#ifndef BAKit_Strongify
#if DEBUG
#if __has_feature(objc_arc)
#define BAKit_Strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define BAKit_Strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define BAKit_Strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define BAKit_Strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif

#ifndef __OPTIMIZE__
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...){}
#endif

#endif /* BAAlert_Config_h */
