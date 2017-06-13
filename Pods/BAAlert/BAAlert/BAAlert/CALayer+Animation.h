
/*!
 *  @brief      BAAlert
 *
 *  @author     BAHome
 *  @copyright  Copyright © 2016年 BAHome. All rights reserved.
 *  @version    V1.1.0
 */


#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface CALayer (MyAnimation)
/*!
 *  晃动动画
 *
 *  @param duration 一次动画用时
 *  @param radius   晃动角度0-180
 *  @param repeat   重复次数
 *  @param finish   动画完成
 */
- (void )shakeAnimationWithDuration:(NSTimeInterval )duration
                       shakeRadius:(CGFloat )radius
                            repeat:(NSUInteger )repeat
                   finishAnimation:(void(^)()) finish;

/*!
 *  根据路径执行动画
 *
 *  @param duration 一次动画用时
 *  @param path     路径CGPathRef
 *  @param repeat   重复次数
 *  @param finish   动画完成
 */
- (void )pathAnimationWithDuration:(NSTimeInterval )duration
                             path:(CGPathRef )path
                           repeat:(NSUInteger )repeat
                  finishAnimation:(void(^)()) finish;


/*! 这两个动画只适合本项目 */
/*! 天上掉下 */
- (void )fallAnimationWithDuration:(NSTimeInterval )duration
                  finishAnimation:(void(^)()) finish;
/*! 上升 */
- (void )floatAnimationWithDuration:(NSTimeInterval )duration
                   finishAnimation:(void(^)()) finish;
@end


@interface UIView (MyAnimation)
/*!
 *  缩放显示动画
 *
 *  @param finish 动画完成
 */

- (void )scaleAnimationShowFinishAnimation:(void(^)()) finish;
/*!
 *  缩放隐藏动画
 *
 *  @param finish 动画完成
 */
- (void )scaleAnimationDismissFinishAnimation:(void(^)()) finish;

@end
