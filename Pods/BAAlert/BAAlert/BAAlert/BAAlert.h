
/*!
 *  @brief      BAAlert
 *
 *  @author     BAHome
 *  @copyright  Copyright © 2016年 BAHome. All rights reserved.
 *  @version    V1.1.0
 */


#import <UIKit/UIKit.h>
#import "BAAlert_Config.h"

@class BAAlert;

typedef void(^BAAlert_ConfigBlock)(BAAlert *tempView);

@interface BAAlert : UIView

/*! 背景颜色 默认：半透明*/
@property (nonatomic, strong) UIColor *bgColor;

/*! 是否开启边缘触摸隐藏 alert 默认：NO */
@property (nonatomic, assign) BOOL isTouchEdgeHide;

/*! 背景图片名字 默认：没有图片*/
@property (nonatomic, strong) NSString *bgImageName;

/*! 是否开启进出场动画 默认：NO，如果 YES ，并且同步设置进出场动画枚举为默认值：1 */
@property (nonatomic, assign, getter=isShowAnimate) BOOL showAnimate;

/*! 进出场动画枚举 默认：1 ，并且默认开启动画开关 */
@property (nonatomic, assign) BAAlertAnimatingStyle animatingStyle;

/*! 背景高斯模糊枚举 默认：没有模糊效果 */
@property (nonatomic, assign) BAAlertBlurEffectStyle blurEffectStyle;

/*!
 *  创建一个完全自定义的 alertView，注意：【自定义 alert 只适用于竖屏状态！】
 *
 *  @param customView    自定义 View
 *  @param configuration 属性配置：如 bgColor、buttonTitleColor、isTouchEdgeHide...
 */
+ (void)ba_alertShowCustomView:(UIView *)customView
                 configuration:(BAAlert_ConfigBlock) configuration;

/*!
 *  创建一个类似于系统的alert
 *
 *  @param title         标题：可空
 *  @param message       消息内容：可空
 *  @param image         图片：可空
 *  @param buttonTitleArray  按钮标题：不可空
 *  @param buttonTitleColorArray  按钮标题颜色：可空，默认蓝色
 *  @param configuration 属性配置：如 bgColor、buttonTitleColor、isTouchEdgeHide...
 *  @param actionBlock        按钮的点击事件处理
 */
+ (void)ba_alertShowWithTitle:(NSString *)title
                      message:(NSString *)message
                        image:(UIImage *)image
             buttonTitleArray:(NSArray <NSString *>*)buttonTitleArray
        buttonTitleColorArray:(NSArray <UIColor *>*)buttonTitleColorArray
                configuration:(BAAlert_ConfigBlock)configuration
                  actionBlock:(BAAlert_ButtonActionBlock)actionBlock;

/*!
 *  视图消失
 */
- (void)ba_alertHidden;


@end
