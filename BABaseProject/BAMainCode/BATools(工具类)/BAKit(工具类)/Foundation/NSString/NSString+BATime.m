//
//  NSString+BATime.m
//  BAKit
//
//  Created by boai on 2017/6/7.
//  Copyright © 2017年 boai. All rights reserved.
//


#import "NSString+BATime.h"
#import "NSDate+BAKit.h"

@implementation NSString (BATime)

#pragma mark - 获得系统当前日期和时间

/**
 *  获取系统当前日期和时间【YYYY-MM-dd HH:mm:ss】
 *
 *  @return 系统当前日期和时间
 */
+ (NSString *)ba_time_getSystermCurrentDateYMDHMS
{
    NSString *resultString = [NSString ba_time_getSystermCurrentDateWithFormatString:BAKit_FormatString_YMDHMS];
    return resultString;
}

/**
 获取系统当前日期和时间 【自定义 formatString】

 @param formatString formatString
 @return 系统当前日期和时间
 */
+ (NSString *)ba_time_getSystermCurrentDateWithFormatString:(NSString *)formatString
{
    //获得系统日期
    NSDate *senddate = [NSDate date];
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    
    [dateformatter setDateFormat:formatString];
    NSString *resultString = [dateformatter stringFromDate:senddate];
    
    return resultString;
}

#pragma mark - 时间戳转换时间
#pragma mark 时间戳转换时间【YYYY-MM-dd HH:mm:ss】
/**
 *  时间戳转换时间【YYYY-MM-dd HH:mm:ss】
 *
 *  @param timeStamp 时间戳
 *
 *  @return 时间戳转换【YYYY-MM-dd HH:mm:ss】
 */
+ (NSString *)ba_time_getDateWithTimeStampYMDHMS:(NSString *)timeStamp
{
    return [NSString ba_time_getDateWithTimeStamp:timeStamp formatString:BAKit_FormatString_YMDHMS];
}

#pragma mark 时间戳转换【YYYY-MM-dd】
/**
 *  时间戳转换时间【YYYY-MM-dd】
 *
 *  @param timeStamp 时间戳
 *
 *  @return 时间戳转换【YYYY-MM-dd】
 */
+ (NSString *)ba_time_getDateWithTimeStampYMD:(NSString *)timeStamp
{
    return [NSString ba_time_getDateWithTimeStamp:timeStamp formatString:BAKit_FormatString_YMD];
}

#pragma mark 时间戳转换【HH:mm】
/**
 *  时间戳转换时间【HH:mm】
 *
 *  @param timeStamp 时间戳
 *
 *  @return 时间戳转换【HH:mm】
 */
+ (NSString *)ba_time_getDateWithTimeStampHM:(NSString *)timeStamp
{
    return [NSString ba_time_getDateWithTimeStamp:timeStamp formatString:BAKit_FormatString_HM];
}

/**
 时间戳转换时间【自定义 formatString】

 @param timeStamp 时间戳
 @param formatString formatString
 @return 时间
 */
+ (NSString *)ba_time_getDateWithTimeStamp:(NSString *)timeStamp
                              formatString:(NSString *)formatString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:formatString];
    // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    // 时间戳转换
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[timeStamp intValue]];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    
    return confromTimespStr;
}

#pragma mark - 当前时间转换成时间戳
/**
 *  当前时间【YYYY-MM-dd HH:mm:ss】转换成时间戳【10位数，如：1492672164】
 *
 *  @return 时间戳【10位数，如：1492672164】
 */
+ (NSString *)ba_time_getCurrentDateTransformTimeStampYMDHMS
{
    NSDate *datenow = [NSDate date];
    // 时间转时间戳的方法:
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
    
    return timeSp;
}

#pragma mark 根据日期提取当前 星期几【返回 周一...周日】
/*!
 *  根据日期提取当前 星期几【返回 周一...周日】
 *
 *  @param date 需要提取的日期
 *
 *  @return 返回 周一...周日
 */
+ (NSString *)ba_time_getWeekdayWithDate:(NSDate *)date
{
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"周天", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:date];
    
    return [weekdays objectAtIndex:theComponents.weekday];
}

#pragma mark 计算 指定日期 与 当前时间 的时间差
/**
 计算 指定日期 与 当前时间 的时间差

 @param date 指定日期
 @return 时间差
 */
+ (NSString *)ba_time_getIntervalSinceNowWithDate:(NSDate *)date
{
    NSTimeInterval late = [date timeIntervalSince1970]*1;
    
    NSDate *dat = [NSDate date];
    NSTimeInterval now = [dat timeIntervalSince1970]*1;
    
    NSTimeInterval cha = now -late;
    NSString *timeString=[NSString stringWithFormat:@"%f",cha];
    
    return timeString;
}

/**
 判断当前时间是否在 fromHour 和 toHour 之间。如。fromHour=8，toHour=23时。即为推断当前时间是否在8:00-23:00之间【一般应用程序设置这一组的存在，比如夜间模式，如果你。从8：00-23：00。在这个当前的时间是如何推断出期间。主要的困难在于如何使用NSDate生成8：00时间和23：00时间。然后用当前时间，也许有足够的时间，以使控制。】
 
 @param fromHour 开始时间
 @param toHour 结束时间
 @return YES，NO
 */
- (BOOL)ba_time_isBetweenFromHour:(NSInteger)fromHour
                           toHour:(NSInteger)toHour
{
    NSDate *date8 = [self ba_time_getCustomDateWithHour:8];
    NSDate *date23 = [self ba_time_getCustomDateWithHour:23];
    
    NSDate *currentDate = [NSDate date];
    
    if ([currentDate compare:date8]==NSOrderedDescending && [currentDate compare:date23]==NSOrderedAscending)
    {
        NSLog(@"该时间在 %ld:00-%ld:00 之间！", (long)fromHour, (long)toHour);
        return YES;
    }
    return NO;
}

/**
 * @brief 生成当天的某个点（返回的是伦敦时间，可直接与当前时间[NSDate date]比較）
 * @param hour 如hour为“8”。就是上午8:00（本地时间）
 */
- (NSDate *)ba_time_getCustomDateWithHour:(NSInteger)hour
{
    // 获取当前时间
    NSDate *currentDate = [NSDate date];
    NSCalendar *currentCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *currentComps = [[NSDateComponents alloc] init];
    
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    currentComps = [currentCalendar components:unitFlags fromDate:currentDate];
    
    // 设置当天的某个点
    NSDateComponents *resultComps = [[NSDateComponents alloc] init];
    [resultComps setYear:[currentComps year]];
    [resultComps setMonth:[currentComps month]];
    [resultComps setDay:[currentComps day]];
    [resultComps setHour:hour];
    
    NSCalendar *resultCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    return [resultCalendar dateFromComponents:resultComps];
}

/*!
 *  计算上报时间差: 几分钟前，几天前，传入时间戳，自动解析
 *
 *  @return 计算上报时间差: 几分钟前，几天前
 */
+ (NSString *)ba_time_formatWithTimeStamp:(NSString *)timeStamp
{
    NSDateFormatter *dateFormatter = [NSDateFormatter ba_setupDateFormatterWithYMD];
    NSString *theDay = [NSString ba_time_getDateWithTimeStampYMDHMS:timeStamp];
    NSDate *theDate = [NSDate dateWithTimeIntervalSince1970:[timeStamp integerValue]];
    // 当前年月日
    NSString *currentDay = [dateFormatter stringFromDate:[NSDate date]];
    
    NSInteger timeInterval = -[theDate timeIntervalSinceNow];
    
    if (timeInterval < 0)
    {
        // 超过当前时间
        NSDateFormatter *dateFormatter = [NSDateFormatter ba_setupDateFormatterWithYMDHMS];
        return [dateFormatter stringFromDate:theDate];
    }
    else if (timeInterval < 60)
    {
        return @"刚刚";
    }
    else if (timeInterval < 3600)
    {
        // 1小时内
        return [NSString stringWithFormat:@"%zd分钟前", timeInterval / 60];
    }
    else if (timeInterval < 21600)
    {
        // 6小时内
        return [NSString stringWithFormat:@"%zd小时内", timeInterval / 3600];
    }
    else if ([theDay isEqualToString:currentDay])
    {
        // 当天
        [dateFormatter setDateFormat:BAKit_FormatString_HMS];
        return [NSString stringWithFormat:@"今天 %@", [dateFormatter stringFromDate:theDate]];
    }
    else if ([[dateFormatter dateFromString:currentDay] timeIntervalSinceDate:[dateFormatter dateFromString:theDay]] == 86400)
    {
        // 昨天
        [dateFormatter setDateFormat:BAKit_FormatString_HM];
        return [NSString stringWithFormat:@"昨天 %@", [dateFormatter stringFromDate:theDate]];
    }
    else
    {
        //以前
        NSDateFormatter *dateFormatter = [NSDateFormatter ba_setupDateFormatterWithYMDHMS];
        return [dateFormatter stringFromDate:theDate];
    }
}

/**
 解析新浪微博中的日期【判断日期是今天，昨天还是明天】
 
 @param dateString dateString
 @return 今天，昨天还是明天
 */
+ (NSString *)ba_time_formatWithDateString:(NSString *)dateString
{
    // 日期格式字符串
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateFormat = @"EEE MMM d HH:mm:ss Z yyyy";
    
    // 设置格式本地化,日期格式字符串需要知道是哪个国家的日期，才知道怎么转换
    format.locale = [NSLocale localeWithLocaleIdentifier:@"en_us"];
    
    NSDate *created_at = [format dateFromString:dateString];
    
    if (created_at.isThisYear)
    { // 今年
        if (created_at.isToday)
        {
            // 今天
            // 计算跟当前时间差距
            NSDateComponents *cmp = [created_at ba_dateDeltaWithNow];
            
            if (cmp.hour >= 1)
            {
                return [NSString stringWithFormat:@"%ld小时之前",cmp.hour];
            }
            else if (cmp.minute > 1)
            {
                return [NSString stringWithFormat:@"%ld分钟之前",cmp.minute];
            }
            else
            {
                return @"刚刚";
            }
        }
        else if (created_at.isYesterday)
        { // 昨天
            format.dateFormat = @"昨天 HH:mm";
            return  [format stringFromDate:created_at];
        }
        else
        { // 前天
            format.dateFormat = BAKit_FormatString_MDHM;
            return  [format stringFromDate:created_at];
        }
    }
    else
    { // 不是今年
        format.dateFormat = BAKit_FormatString_YMDHM;
        return [format stringFromDate:created_at];
    }
    
    return dateString;
}

/**
 字符串时间转 NSDate
 
 @param formatString 转换格式
 @return NSDate
 */
- (NSDate *)ba_time_dateWithFormatString:(NSString *)formatString
{
    if (self == nil || [self isEqualToString:@""] || formatString == nil || [formatString isEqualToString:@""])
    {
        return nil;
    }
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = formatString;
    
    return [fmt dateFromString:self];
}

/**
 字符串转换时间对象
 
 @param formatString 转换格式
 @param timezoneName 时区标识符
 @return 时间对象结果
 */
- (NSDate *)ba_time_dateWithFormat:(NSString *)formatString
                      timezoneName:(NSString *)timezoneName
{
    if (self == nil || [self isEqualToString:@""] || formatString == nil || [formatString isEqualToString:@""])
    {
        return nil;
    }
    NSDateFormatter *fmt = [NSDateFormatter ba_dateFormatterWithFormatString:formatString timezoneName:timezoneName];

    NSDate *date= [fmt dateFromString:self];
    return date;

}

- (NSDate *)ba_time_dateWithFormat:(NSString *)formatString
                         dateStyle:(NSDateFormatterStyle)dateStyle
{
    if (self == nil || [self isEqualToString:@""] || formatString == nil || [formatString isEqualToString:@""])
    {
        return nil;
    }
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.locale = [NSLocale localeWithLocaleIdentifier:@"en_US"];
    fmt.dateStyle = dateStyle;
    fmt.dateFormat = formatString;
    
    return [fmt dateFromString:self];
}


@end
