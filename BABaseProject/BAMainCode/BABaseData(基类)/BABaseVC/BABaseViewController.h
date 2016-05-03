//
//  BABaseViewController.h
//  demoTest
//
//  Created by 博爱 on 16/4/9.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>


#pragma mark - ***** 设置navi
@protocol BABaseViewControllerNaviDataSource <NSObject>

/*! 设置navi标题 */
- (NSMutableAttributedString *)set_Title;

/*! 设置navi leftButton */
- (UIButton *)set_leftButton;

/*! 设置navi rightButton */
- (UIButton *)set_rightButton;

/*! 设置navi 的背景颜色 */
- (UIColor *)set_naviBackgroundColor;

/*! 设置navi的高度 */
//- (CGFloat)set_navigationHeight;

/*! 设置底部view */
- (UIView *)set_bottomView;

/*! 设置navi的背景图片 */
- (UIImage *)set_navBackgroundImage;

/*! 设置navi leftButton的图片 */
- (UIImage *)set_leftBarButtonItemWithImage;

/*! 设置navi rightButton的图片 */
- (UIImage *)set_rightBarButtonItemWithImage;

@end

#pragma mark - ***** navi点击事件回调
@protocol BABaseViewControllerNaviDelegate <NSObject>

@optional
- (void)leftButton_Click:(UIButton*)sender;
- (void)rightButton_Click:(UIButton*)sender;
- (void)titleButton_Click:(UIView*)sender;

@end


@interface BABaseViewController : UIViewController
<
    BABaseViewControllerNaviDataSource,
    BABaseViewControllerNaviDelegate
>

@property (nonatomic, strong) UIColor *vcBgColor;


/*!
 *  设置VC的背景颜色
 *
 *  @param vcBgColor vcBgColor
 */
- (void)setVCBgColor:(UIColor *)vcBgColor;

/*!
 *  是否隐藏naviBar
 *
 *  @param hidden YES：隐藏，NO：显示
 */
- (void)BA_setNavbarBackgroundHidden:(BOOL)hidden;

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
