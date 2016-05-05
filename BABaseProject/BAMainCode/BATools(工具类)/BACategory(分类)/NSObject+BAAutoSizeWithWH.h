//
//  NSObject+BAAutoSizeWithWH.h
//  BABaseProject
//
//  Created by 博爱 on 16/5/5.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (BAAutoSizeWithWH)

/*!
 *  自适应label的高度
 *
 *  @param text  内容
 *  @param font  字体大小
 *  @param width 宽度
 *
 *  @return label的高度
 */
+ (CGFloat)BA_AutoSizeOfHeghtWithText:(NSString *)text font:(UIFont *)font width:(CGFloat)width;

/*!
 *  自适应label的宽度
 *
 *  @param text  内容
 *  @param font  字体大小
 *  @param width 高度
 *
 *  @return label的宽度
 */
+ (CGFloat)BA_AutoSizeOfWidthWithText:(NSString *)text font:(UIFont *)font height:(CGFloat)height;

@end
