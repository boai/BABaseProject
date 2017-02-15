//
//  NSObject+BAProgressHUD.h
//  demoTest
//
//  Created by 博爱 on 16/4/20.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

@interface NSObject (BAProgressHUD)

/*!
*  弹出文字提示（菊花转动）
*
*  @param text 提示内容
*/
- (void)BA_showAlert:(NSString *)text;

/*!
 *  弹出文字提示，自定义显示时间(默认1.5秒)
 *
 *  @param text 提示内容
 */
- (void)BA_showAlertWithTitle:(NSString *)text;

/*!
 *  显示忙
 */
- (void)BA_showBusy;

/*!
 *  隐藏提示
 */
- (void)BA_hideProgress;

@end
