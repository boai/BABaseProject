//
//  NSString+BAKit.m
//  BAKit
//
//  Created by boai on 2017/6/7.
//  Copyright © 2017年 boai. All rights reserved.
//


#import "NSString+BAKit.h"

@implementation NSString (BAKit)

/**
 *  转换自身为开头大写字符串.
 *  例如: "This is a Test" 将返回 "This is a test"
 "this is a test"  将返回 "This is a test"
 */
- (NSString *)ba_stringSentenceCapitalizedString
{
    if(![self length])
    {
        return [NSString string];
    }
    NSString *uppercase = [[self substringToIndex:1] uppercaseString];
    NSString *lowercase = [[self substringFromIndex:1] lowercaseString];
    
    return [uppercase stringByAppendingString:lowercase];
}

/* 自编码成编码的URL字符串 */
- (NSString *)ba_stringUrlEncode
{
    NSMutableString *output = [NSMutableString string];
    const unsigned char *source = (const unsigned char *)[self UTF8String];
    int sourceLen = (int)strlen((const char *)source);
    for(int i = 0; i < sourceLen; ++i)
    {
        const unsigned char thisChar = source[i];
        
        if(thisChar == ' ')
        {
            [output appendString:@"+"];
        }
        else if(thisChar == '.' || thisChar == '-' || thisChar == '_' || thisChar == '~' || (thisChar >= 'a' && thisChar <= 'z') || (thisChar >= 'A' && thisChar <= 'Z') || (thisChar >= '0' && thisChar <= '9'))
        {
            [output appendFormat:@"%c", thisChar];
        }
        else
        {
            [output appendFormat:@"%%%02X", thisChar];
        }
    }
    
    return output;
}

+ (NSString *)ba_stringNamed:(NSString *)name
{
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@""];
    NSString *str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    if (!str) {
        path = [[NSBundle mainBundle] pathForResource:name ofType:@"txt"];
        str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    }
    return str;
}

/**
 string Data 格式化

 @return Data
 */
- (NSData *)ba_stringDataValue
{
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

/**
 搜索两个字符之间的字符串【注意：搜索的字符串必须只能是英文】

 @param string 需要搜索的字符串
 @param start 起点索引字符【英文字母】
 @param end 结束索引字符【英文字母】
 @return 两个字符之间的字符串
 */
+ (NSString *)ba_stringSearchInString:(NSString *)string
                            charStart:(char)start
                              charEnd:(char)end
{
    int inizio = 0, stop = 0;
    for(int i = 0; i < [string length]; i++)
    {
        // 定位起点索引字符
        if([string characterAtIndex:i] == start)
        {
            inizio = i+1;
            i += 1;
        }
        // 定位结束索引字符
        if([string characterAtIndex:i] == end)
        {
            stop = i;
            break;
        }
    }
    stop -= inizio;
    // 裁剪字符串
    NSString *string2 = [[string substringFromIndex:inizio-1] substringToIndex:stop+1];
    return string2;
}

/**
 搜索两个字符之间的字符串

 @param start 开始的字符
 @param end 结束的字符
 @return 两个字符之间的字符串
 */
- (NSString *)ba_stringSearchCharStart:(char)start
                               charEnd:(char)end
{
    int inizio = 0, stop = 0;
    for(int i = 0; i < [self length]; i++)
    {
        if([self characterAtIndex:i] == start)
        {
            inizio = i+1;
            i += 1;
        }
        if([self characterAtIndex:i] == end)
        {
            stop = i;
            break;
        }
    }
    stop -= inizio;
    NSString *string = [[self substringFromIndex:inizio-1] substringToIndex:stop+1];
    
    return string;
}

/**
 判断 string 是否为空

 @return YES：不为空，NO：为空
 */
- (BOOL)ba_stringIsNotBlank
{
    NSCharacterSet *blank = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    for (NSInteger i = 0; i < self.length; ++i) {
        unichar c = [self characterAtIndex:i];
        if (![blank characterIsMember:c]) {
            return YES;
        }
    }
    return NO;
}

/**
 从身份证号码里提取 生日，默认：@"yyyy-MM-dd"

 @return 生日
 */
- (NSDate *)ba_stringExtractBirthdayFromIDNumber
{
    NSString *result = @"";
    NSDate *date;
    if (self.length == 15)
    {
        result = [NSString stringWithFormat:@"19%@", [self substringWithRange:NSMakeRange(6, 6)]];
    }
    else if (self.length == 18)
    {
        result = [self substringWithRange:NSMakeRange(6, 8)];
    }
    date = [result ba_time_dateWithFormat:@"yyyyMMdd" timezoneName:@"Asia/Shanghai"];
    return date;
}

/**
 从身份证号码里提取 性别

 @return 性别
 */
- (NSString *)ba_stringExtractGenderFromIDNumber
{
    if (![BAKit_RegularExpression ba_regularIsIdCardNumberQualified:self])
    {
        return nil;
    }
    
    if (self.length == 15)
    {
        return [[self substringFromIndex:14] intValue] % 2 > 0 ? @"男" : @"女";
    }
    else if (self.length == 18)
    {
        return [[self substringWithRange:NSMakeRange(16, 1)] intValue] % 2 > 0 ? @"男" : @"女";
    }
    
    return @"";
}

/**
 从身份证号码里提取 年龄

 @return 年龄
 */
- (NSUInteger)ba_stringExtractAgeFromIDNumber
{
    if (self.length != 15 && self.length != 18)
    {
        return 0;
    }
    
    NSDate *birthday;
    if (self.length == 15)
    {
        // FIRST GENERATION ID
        birthday = [[NSString stringWithFormat:@"19%@", [self substringWithRange:NSMakeRange(6, 6)]] ba_time_dateWithFormat:@"yyyyMMdd" timezoneName:@"Asia/Shanghai"];
    }
    else if (self.length == 18)
    {
        // SECOND GENERATION ID
        birthday = [[self substringWithRange:NSMakeRange(6, 8)] ba_time_dateWithFormat:@"yyyyMMdd" timezoneName:@"Asia/Shanghai"];
    }
    
    NSDateComponents *cpBirthday = [[NSCalendar currentCalendar] components:(NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear) fromDate:birthday];
    NSDateComponents *cpToday = [[NSCalendar currentCalendar] components:(NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear) fromDate:[NSDate date]];
    
    NSUInteger age = cpToday.year - cpBirthday.year - 1;
    if ((cpToday.month > cpBirthday.month) || (cpToday.month == cpBirthday.month && cpToday.day >= cpBirthday.day)) {
        age++;
    }
    
    return age;
}


@end
