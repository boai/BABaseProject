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

- (void)test;

/*！把各种初始化操作,固定的操作 写入到类别中 */
- (void)BA_initializeWithApplication:(UIApplication *)application;

/*! 友盟分享/登陆 */
- (void)BA_YMShareSetting;

/*! 键盘处理 */
- (void)BA_KeyboardSetting;


@end
