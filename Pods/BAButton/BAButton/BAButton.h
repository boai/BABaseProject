//
//  BAButton.h
//  demoTest
//
//  Created by 博爱 on 16/3/31.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>

/*! 自定义按钮1: */
@interface BAButton : UIButton

/**
 *  Create an UIButton with a fade animation from image to highlightedImage on touch
 *
 *  @param frame            Button's frame
 *  @param image            Button's image
 *  @param highlightedImage Button's highlighted image
 *  @param fadeDuration     Fade duration
 *
 *  @return Returns the created BFButton, subclass of UIButton
 */

- (instancetype _Nonnull)initWithFrame:(CGRect)frame
                                 image:(UIImage * _Nonnull)image
                      highlightedImage:(UIImage * _Nonnull)highlightedImage
                          fadeDuration:(CGFloat)fadeDuration;

@end

/*! 自定义按钮2：多种button自定义 */
/*! 图标在上，文本在下按钮的图文间隔比例（0-1），默认0.8 */
#define BA_ButtonTopRadio 0.8

/*! 图标在下，文本在上按钮的图文间隔比例（0-1），默认0.5 */
#define BA_ButtonBottomRadio 0.5

typedef enum{
    BAAligenmentStatusNormal, // 默认
    BAAligenmentStatusLeft, // 左对齐
    BAAligenmentStatusCenter, // 居中对齐
    BAAligenmentStatusRight, // 右对齐
    BAAligenmentStatusTop, // 图标在上，文本在下(居中)
    BAAligenmentStatusBottom, // 图标在下，文本在上(居中)
}BAAligenmentStatus;

@interface BACustomButton : UIButton

/** 设置样式 */
@property (nonatomic, assign) BAAligenmentStatus buttonStatus;
/** 设置圆角 */
@property (nonatomic, assign) CGFloat buttonCornerRadius;

/*! 外界通过设置按钮的status属性，创建不同类型的按钮 */
+ (instancetype _Nonnull)BA_ShareButton;

- (instancetype _Nonnull)initWitAligenmentStatus:(BAAligenmentStatus)status;


@end

