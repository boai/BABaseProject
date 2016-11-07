//
//  NSString+NSNumber.m
//  testDemo
//
//  Created by 博爱 on 2016/11/7.
//  Copyright © 2016年 DS-Team. All rights reserved.
//

#import "NSString+NSNumber.h"

@implementation NSString (NSNumber)

#pragma mark - ***** 数字格式化样式，示例：12345678.89 --> 12,345,678.89
+ (NSString *)ba_stringFormatterWithStyle:(NSNumberFormatterStyle)numberStyle numberString:(NSString *)numberString
{
    NSString *numString = numberString;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSNumber *number = [formatter numberFromString:numString];
    formatter.numberStyle = numberStyle;
    NSString *string = [formatter stringFromNumber:number];
    
    return string;
}

#pragma mark - ***** 格式化为带小数点的数字，示例：12345678.89 --> 12,345,678.89
+ (NSString *)ba_stringFormatterWithDecimalStyleWithNumberString:(NSString *)numberString
{
//    NSString *numString = [NSString stringWithFormat:@"%@",@"12345678.89"];
    NSString *numString = numberString;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSNumber *number = [formatter numberFromString:numString];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSString *string = [formatter stringFromNumber:number];
    
    /*! 输出结果示例：numberFormatter == 12,345,678.89 */
    return string;
}

#pragma mark - ***** 格式化为货币样式，示例：12345678.89 --> $12,345,678.89
+ (NSString *)ba_stringFormatterWithCurrencyStyleWithNumberString:(NSString *)numberString
{
    NSString *numString = numberString;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSNumber *number = [formatter numberFromString:numString];
    formatter.numberStyle = NSNumberFormatterCurrencyStyle;
    NSString *string = [formatter stringFromNumber:number];
    
    /*! 输出结果示例：numberFormatter == 12,345,678.89 */
    return string;
}

#pragma mark - ***** 格式化为百分比样式，示例：12345678.89 --> 1,234,567,889%
+ (NSString *)ba_stringFormatterWithPercentStyleWithNumberString:(NSString *)numberString
{
    NSString *numString = numberString;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSNumber *number = [formatter numberFromString:numString];
    formatter.numberStyle = NSNumberFormatterPercentStyle;
    NSString *string = [formatter stringFromNumber:number];
    
    /*! 输出结果示例：numberFormatter == 1,234,567,889% */
    return string;
}

#pragma mark - ***** 格式化为科学计数样式，示例：12345678.89 --> 1.234567889E7
+ (NSString *)ba_stringFormatterWithScientificStyleWithNumberString:(NSString *)numberString
{
    NSString *numString = numberString;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSNumber *number = [formatter numberFromString:numString];
    formatter.numberStyle = NSNumberFormatterScientificStyle;
    NSString *string = [formatter stringFromNumber:number];
    
    /*! 输出结果示例：numberFormatter == 1.234567889E7 */
    return string;
}

#pragma mark - ***** 格式化为英文输出样式（注：此处根据系统语言输出），示例：12345678.89 --> 一千二百三十四万五千六百七十八点八九
+ (NSString *)ba_stringFormatterWithSpellOutStyleWithNumberString:(NSString *)numberString
{
    NSString *numString = numberString;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSNumber *number = [formatter numberFromString:numString];
    formatter.numberStyle = NSNumberFormatterSpellOutStyle;
    NSString *string = [formatter stringFromNumber:number];
    
    /*! 输出结果示例：numberFormatter == twelve million three hundred forty-five thousand six hundred seventy-eight point eight nine */
    return string;
}

#pragma mark - ***** 格式化为序数样式，示例：12345678.89 --> 第1234,5679
+ (NSString *)ba_stringFormatterWithOrdinalStyleWithNumberString:(NSString *)numberString
{
    NSString *numString = numberString;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSNumber *number = [formatter numberFromString:numString];
    formatter.numberStyle = NSNumberFormatterOrdinalStyle;
    NSString *string = [formatter stringFromNumber:number];
    
    /*! 输出结果示例：numberFormatter == 第1234,5679 */
    return string;
}

#pragma mark - ***** 格式化为货币ISO代码样式样式，示例：12345678.89 --> 12,345,679
+ (NSString *)ba_stringFormatterWithCurrencyISOCodeStyleWithNumberString:(NSString *)numberString
{
    NSString *numString = numberString;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSNumber *number = [formatter numberFromString:numString];
    formatter.numberStyle = NSNumberFormatterCurrencyISOCodeStyle;
    NSString *string = [formatter stringFromNumber:number];
    
    /*! 输出结果示例：numberFormatter == 12,345,679 */
    return string;
}

#pragma mark - ***** 格式化为货币多样式，示例：12345678.89 --> USD 12,345,678.89
+ (NSString *)ba_stringFormatterWithCurrencyPluralStyleWithNumberString:(NSString *)numberString
{
    NSString *numString = numberString;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSNumber *number = [formatter numberFromString:numString];
    formatter.numberStyle = NSNumberFormatterCurrencyPluralStyle;
    NSString *string = [formatter stringFromNumber:number];
    
    /*! 输出结果示例：numberFormatter == USD 12,345,678.89 */
    return string;
}

#pragma mark - ***** 格式化为货币会计样式，示例：12345678.89 --> 12,345,678.89美元
+ (NSString *)ba_stringFormatterWithCurrencyAccountingStyleWithNumberString:(NSString *)numberString
{
    NSString *numString = numberString;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSNumber *number = [formatter numberFromString:numString];
    formatter.numberStyle = NSNumberFormatterCurrencyAccountingStyle;
    NSString *string = [formatter stringFromNumber:number];
    
    /*! 输出结果示例：numberFormatter == 12,345,678.89美元 */
    return string;
}



@end
