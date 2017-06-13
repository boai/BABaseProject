//
//  NSString+BANSNumber.m
//  BAKit
//
//  Created by boai on 2017/6/7.
//  Copyright © 2017年 boai. All rights reserved.
//


#import "NSString+BANSNumber.h"

@implementation NSString (BANSNumber)

#pragma mark - ***** 手机号码格式化样式：344【中间空格】，示例：13855556666 --> 138 5555 6666
+ (NSString *)ba_phoneNumberFormatterSpace:(NSString *)phoneNumber
{
    NSString *phone = phoneNumber;
    
    while (phone.length > 0)
    {
        NSString *subString = [phone substringToIndex:MIN(phone.length, 3)];
        if (phone.length >= 7 )
        {
            subString = [subString stringByAppendingString:@" "];
            subString = [subString stringByAppendingString:[phone substringWithRange:NSMakeRange(3, 4)]];
        }
        if ( phone.length == 11 )
        {
            subString = [subString stringByAppendingString:@" "];
            subString = [subString stringByAppendingString:[phone substringWithRange:NSMakeRange(7, 4)]];
            phone = subString;
            break;
        }
    }
    
    return phone;
}

#pragma mark - ***** 手机号码格式化样式：3*4【中间4位为*】，示例：13855556666 --> 138****6666
+ (NSString *)ba_phoneNumberFormatterCenterStar:(NSString *)phoneNumber
{
    NSString *phone = phoneNumber;
    
    while (phone.length > 0)
    {
        phone = [phone stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
        break;
    }
    
    return phone;
}

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
//    NSString *numString = numberString;
//    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
//    NSNumber *number = [formatter numberFromString:numString];
//    formatter.numberStyle = NSNumberFormatterDecimalStyle;
//    NSString *string = [formatter stringFromNumber:number];
    
    /*! 输出结果示例：numberFormatter == 12,345,678.89 */
    return [NSString ba_stringFormatterWithStyle:NSNumberFormatterDecimalStyle numberString:numberString];
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

#pragma mark - ***** 格式化为货币ISO代码样式样式，示例：123456889.86 --> CNY123,456,889.86
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

#pragma mark - 保留纯数字
- (NSString *)ba_removeStringSaveNumber
{
    NSCharacterSet *setToRemove = [[ NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet ];
    return [[self componentsSeparatedByCharactersInSet:setToRemove] componentsJoinedByString:@""];
}

#pragma mark - 点赞数处理：2.1千，3.4万
/**
 点赞数处理：2.1千，3.4万

 @param string 传入的 string 类型的 数字
 @return 2.1千，3.4万
 */
+ (NSString *)ba_stringTransformNumberWithString:(NSString *)string
{
    float number = [string integerValue];
    
    NSString *numberString = @"";
    if (number < 1000)
    {
        numberString = [NSString stringWithFormat:@"%.0f", number];
    }
    else
        if (number / 1000 && number / 10000 < 1)
        {
            numberString = [NSString stringWithFormat:@"%.1f千", number/1000];
        }
        else
        {
            numberString = [NSString stringWithFormat:@"%.1f万", number/10000];
        }
    
    return numberString;
}

#pragma mark - 判断是否为 int 类型
/**
 判断是否为 int 类型

 @param string 传入的 string 类型的 数字
 @return YES、NO
 */
+ (BOOL)ba_stringIsInt:(NSString*)string
{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

#pragma mark - 判断是否为 float 类型
/**
 判断是否为 float 类型

 @param string 传入的 string 类型的 数字
 @return YES、NO
 */
+ (BOOL)ba_stringIsFloat:(NSString*)string
{
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}

@end
