//
//  BABaseViewController.h
//  demoTest
//
//  Created by 博爱 on 16/4/9.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>

//#pragma mark - ***** 设置navi



@interface BABaseViewController : UIViewController



#pragma mark - ***** 网络判断
/*!
 *  网络判断
 *
 *  @param viewController viewController
 */
- (void)networkChangeWith:(UIViewController *)viewController;

#pragma mark 网络不可用点击UI的回调
/*!
 *  网络不可以用时点击UI的回调-默认点击是打开系统系统设置页面
 */
- (void)goNetNotUse;


#pragma mark - ***** VC的基本设置
/*!
 *  设置VC的背景颜色
 *
 *  @param vcBgColor vcBgColor
 */
- (void)setVCBgColor:(UIColor *)vcBgColor;

#pragma mark - ***** VC的navi设置
/*!
 *  是否隐藏naviBar
 *
 *  @param hidden YES：隐藏，NO：显示
 */
- (void)BA_setNavbarBackgroundHidden:(BOOL)hidden;





#pragma mark - ***** VC的其他设置
/*!
 *  开启樱花动画（CAEmitterLayer动画）
 */
- (void)BA_starYingHuaCoreAnimation;

/*!
 *  开启雪花动画（CADisplayLink动画）
 */
- (void)BA_starXueHuaCoreAnimation;

/*!
 *  暂停雪花动画
 */
- (void)BA_stopXueHuaCoreAnimation;

/*!
 *  开启烟花动画（CAEmitterLayer动画）
 */
- (void)BA_starYanHuaCoreAnimation;

/*!
 *  gif动画
 *
 *  @param gifImageName gifImageName
 *  @param imgFrame     imgFrame
 */
- (void)BA_useGIFImageViewWithGifImageName:(NSString *)gifImageName frame:(CGRect)imgFrame;


@end
