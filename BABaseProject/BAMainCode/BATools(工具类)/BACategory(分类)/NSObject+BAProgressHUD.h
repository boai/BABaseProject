//
//  NSObject+BAProgressHUD.h
//  demoTest
//
//  Created by 博爱 on 16/4/20.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MBProgressHUD.h>

@interface NSObject (BAProgressHUD)

/** 弹出文字提示 */
- (void)BA_showAlert:(NSString *)text;

/** 显示忙 */
- (void)BA_showBusy;

/** 隐藏提示 */
- (void)BA_hideProgress;

@end
