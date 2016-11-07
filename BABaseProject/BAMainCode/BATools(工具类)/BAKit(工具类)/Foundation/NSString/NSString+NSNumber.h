//
//  NSString+NSNumber.h
//  testDemo
//
//  Created by 博爱 on 2016/11/7.
//  Copyright © 2016年 DS-Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NSNumber)

/*! 
 注意：中英文输出样式不一样，如果有国际化的请注意输出样式，
      本样式为中文输出环境，模拟器可能输出为英文样式
 */

#pragma mark - ***** 数字格式化样式，示例：12345678.89 --> 12,345,678.89
+ (NSString *)ba_stringFormatterWithStyle:(NSNumberFormatterStyle)numberStyle numberString:(NSString *)numberString;

#pragma mark - ***** 格式化为带小数点的数字，示例：12345678.89 --> 12,345,678.89
+ (NSString *)ba_stringFormatterWithDecimalStyleWithNumberString:(NSString *)numberString;

#pragma mark - ***** 格式化为货币样式，示例：12345678.89 --> 12,345,678.89
+ (NSString *)ba_stringFormatterWithCurrencyStyleWithNumberString:(NSString *)numberString;

#pragma mark - ***** 格式化为百分比样式，示例：12345678.89 --> 1,234,567,889%
+ (NSString *)ba_stringFormatterWithPercentStyleWithNumberString:(NSString *)numberString;

#pragma mark - ***** 格式化为科学计数样式，示例：12345678.89 --> 1.234567889E7
+ (NSString *)ba_stringFormatterWithScientificStyleWithNumberString:(NSString *)numberString;

#pragma mark - ***** 格式化为英文输出样式（注：此处根据系统语言输出），示例：12345678.89 --> 一千二百三十四万五千六百七十八点八九
+ (NSString *)ba_stringFormatterWithSpellOutStyleWithNumberString:(NSString *)numberString;

#pragma mark - ***** 格式化为序数样式，示例：12345678.89 --> 第1234,5679
+ (NSString *)ba_stringFormatterWithOrdinalStyleWithNumberString:(NSString *)numberString;

#pragma mark - ***** 格式化为四舍五入样式，示例：12345678.89 --> 12,345,679
+ (NSString *)ba_stringFormatterWithCurrencyISOCodeStyleWithNumberString:(NSString *)numberString;

#pragma mark - ***** 格式化为货币多样式，示例：12345678.89 --> USD 12,345,678.89
+ (NSString *)ba_stringFormatterWithCurrencyPluralStyleWithNumberString:(NSString *)numberString;



@end
