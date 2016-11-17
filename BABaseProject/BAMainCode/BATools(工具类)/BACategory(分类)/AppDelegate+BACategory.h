//
//  AppDelegate+BACategory.h
//  BABaseProject
//
//  Created by 博爱 on 16/5/7.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (BACategory)

/*!
 *  是否使用自定义TabVC
 *
 *  @param is YES:使用，NO:使用RDVTabVC
 */
- (void)isBATabVC:(BOOL)is;

- (void)isBATabVC2:(BOOL)is;

/*!
 *  设置3DTouch
 *
 *  @param application application
 */
- (void)ba_setup3DTouch;

- (void)test;

/*！
 *  设置默认缓存大小
 */
- (void)ba_setNSURLCache;

/*！把各种初始化操作,固定的操作 写入到类别中 */
- (void)BA_initializeWithApplication:(UIApplication *)application;

/*! 友盟分享/登陆 */
- (void)BA_YMShareSetting;

/*! 键盘处理 */
- (void)BA_KeyboardSetting;

/*!
 *  获取当前屏幕的控制器
 *
 *  @return 获取当前屏幕的控制器
 */
- (UIViewController *)getCurrentTabViewController;

@end
