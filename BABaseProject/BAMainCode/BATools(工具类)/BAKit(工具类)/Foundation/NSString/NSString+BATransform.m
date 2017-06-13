//
//  NSString+BATransform.m
//  BAKit
//
//  Created by boai on 2017/6/7.
//  Copyright © 2017年 boai. All rights reserved.
//


#import "NSString+BATransform.h"

@implementation NSString (BATransform)

/**
 将 一串数字 1001 转换成 一零零一
 
 @param number 输入的数字
 @return 转换后的文字
 */
+ (NSString *)ba_stringTransformNumberToString:(NSInteger)number
{
    NSString *str = [NSString stringWithFormat:@"%ld", (long)number];
    
    NSRange range;
    range.length = 1;
    
    NSString *finalStr = [NSString string];
    
    for (NSUInteger i = 0; i < [str length]; i++)
    {
        range.location = i;
        NSString *subStr = [str substringWithRange:range];
        NSInteger subNum = [subStr integerValue];
        
        switch (subNum) {
            case 0:
                subStr = [NSString ba_replaceNewString:@"零" range:range oldString:str];
                break;
            case 1:
                subStr = [NSString ba_replaceNewString:@"一" range:range oldString:str];
                break;
            case 2:
                subStr = [NSString ba_replaceNewString:@"二" range:range oldString:str];
                break;
            case 3:
                subStr = [NSString ba_replaceNewString:@"三" range:range oldString:str];
                break;
            case 4:
                subStr = [NSString ba_replaceNewString:@"四" range:range oldString:str];
                break;
            case 5:
                subStr = [NSString ba_replaceNewString:@"五" range:range oldString:str];
                break;
            case 6:
                subStr = [NSString ba_replaceNewString:@"六" range:range oldString:str];
                break;
            case 7:
                subStr = [NSString ba_replaceNewString:@"七" range:range oldString:str];
                break;
            case 8:
                subStr = [NSString ba_replaceNewString:@"八" range:range oldString:str];
                break;
            case 9:
                subStr = [NSString ba_replaceNewString:@"九" range:range oldString:str];
                break;
            default:
                break;
        }
        finalStr = [finalStr stringByAppendingString:subStr];
    }
    return finalStr;
}

/**
 将旧的字符替换成指定的新的字符

 @param newString 替换后的字符
 @param range 替换的 range
 @param oldString 需要替换的旧的字符
 @return 替换后的字符
 */
+ (NSString *)ba_replaceNewString:(NSString *)newString
                            range:(NSRange)range
                        oldString:(NSString *)oldString
{
    NSString *subStr = @"";
    
    if (oldString.length == 1)
    {
        subStr = newString;
    }
    else if (oldString.length == 2)
    {
        if (range.location == 0)
        {
            subStr = [NSString stringWithFormat:@"%@十", newString];
        }
        else if (range.location == 1)
        {
            subStr = newString;
        }
    }
    else if (oldString.length == 3)
    {
        if (range.location == 0)
        {
            subStr = [NSString stringWithFormat:@"%@百", newString];
        }
        else if (range.location == 1)
        {
            subStr = [NSString stringWithFormat:@"%@十", newString];
        }
        else if (range.location == 2)
        {
            subStr = newString;
        }
    }
    return subStr;
}

@end
