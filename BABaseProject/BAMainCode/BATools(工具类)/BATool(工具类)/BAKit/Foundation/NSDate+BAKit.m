
/*!
 *  @header BAKit
 *          demoTest
 *
 *  @brief  BAKit
 *
 *  @author 博爱
 *  @copyright    Copyright © 2016年 博爱. All rights reserved.
 *  @version    V1.0
 */

/*!
 *
 *          ┌─┐       ┌─┐
 *       ┌──┘ ┴───────┘ ┴──┐
 *       │                 │
 *       │       ───       │
 *       │  ─┬┘       └┬─  │
 *       │                 │
 *       │       ─┴─       │
 *       │                 │
 *       └───┐         ┌───┘
 *           │         │
 *           │         │
 *           │         │
 *           │         └──────────────┐
 *           │                        │
 *           │                        ├─┐
 *           │                        ┌─┘
 *           │                        │
 *           └─┐  ┐  ┌───────┬──┐  ┌──┘
 *             │ ─┤ ─┤       │ ─┤ ─┤
 *             └──┴──┘       └──┴──┘
 *                 神兽保佑
 *                 代码无BUG!
 */

/*
 
 *********************************************************************************
 *
 * 在使用BAKit的过程中如果出现bug请及时以以下任意一种方式联系我，我会及时修复bug
 *
 * QQ     : 可以添加SDAutoLayout群 497140713 在这里找到我(博爱1616【137361770】)
 * 微博    : 博爱1616
 * Email  : 137361770@qq.com
 * GitHub : https://github.com/boai
 * 博客园  : http://www.cnblogs.com/boai/
 *********************************************************************************
 
 */

#import "NSDate+BAKit.h"
//#import "BAApp.h"

@implementation NSDate (BAKit)

/* 获取年 */
+ (NSDate *)yesterday
{
    STDateInformation inf = [[NSDate date] dateInformation];
    inf.day--;
    return [self dateFromDateInformation:inf];
}

/* 获取月 */
+ (NSDate *)month
{
    return [[NSDate date] month];
}

/* 获取月 */
- (NSDate *)month
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comp = [gregorian components:(NSCalendarUnitYear | NSCalendarUnitMonth) fromDate:self];
    [comp setDay:1];
    NSDate *date = [gregorian dateFromComponents:comp];
    return date;
}

/*  */
- (NSInteger)weekday
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [gregorian components:(NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitWeekday) fromDate:self];
    NSInteger weekday = [comps weekday];
    return weekday;
}

/*  */
- (NSString *)dayFromWeekday
{
//    switch([self weekday])
//    {
//        case 1:
//            return STLocalizedString(@"SUNDAY", @"");
//            break;
//        case 2:
//            return STLocalizedString(@"MONDAY", @"");
//            break;
//        case 3:
//            return STLocalizedString(@"TUESDAY", @"");
//            break;
//        case 4:
//            return STLocalizedString(@"WEDNESDAY", @"");
//            break;
//        case 5:
//            return STLocalizedString(@"THURSDAY", @"");
//            break;
//        case 6:
//            return STLocalizedString(@"FRIDAY", @"");
//            break;
//        case 7:
//            return STLocalizedString(@"SATURDAY", @"");
//            break;
//        default:
//            break;
//    }
    
    return @"";
}

/*  */
- (NSDate *)timelessDate
{
    NSDate *day = self;
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comp = [gregorian components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:day];
    return [gregorian dateFromComponents:comp];
}

/*  */
- (NSDate *)monthlessDate
{
    NSDate *day = self;
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comp = [gregorian components:(NSCalendarUnitYear | NSCalendarUnitMonth) fromDate:day];
    return [gregorian dateFromComponents:comp];
}

/*  */
- (BOOL)isSameDay:(NSDate *)anotherDate
{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components1 = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self];
    NSDateComponents* components2 = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:anotherDate];
    return ([components1 year] == [components2 year] && [components1 month] == [components2 month] && [components1 day] == [components2 day]);
}

/*  */
- (NSInteger)monthsBetweenDate:(NSDate *)toDate
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *components = [gregorian components:NSCalendarUnitMonth
                                                fromDate:[self monthlessDate]
                                                  toDate:[toDate monthlessDate]
                                                 options:0];
    NSInteger months = [components month];
    return abs((int)months);
}

/*  */
- (NSInteger)daysBetweenDate:(NSDate *)toDate
{
    NSTimeInterval time = [self timeIntervalSinceDate:toDate];
    return fabs(time / 60 / 60 / 24);
}

/*  */
- (BOOL)isToday
{
    return [self isSameDay:[NSDate date]];
}

/*  */
- (NSDate *)dateByAddingDays:(NSUInteger)days
{
    NSDateComponents *c = [[NSDateComponents alloc] init];
    c.day = days;
    return [[NSCalendar currentCalendar] dateByAddingComponents:c toDate:self options:0];
}

/*  */
+ (NSDate *)dateWithDatePart:(NSDate *)aDate andTimePart:(NSDate *)aTime
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
    NSString *datePortion = [dateFormatter stringFromDate:aDate];
    
    [dateFormatter setDateFormat:@"HH:mm"];
    NSString *timePortion = [dateFormatter stringFromDate:aTime];
    
    [dateFormatter setDateFormat:@"dd/MM/yyyy HH:mm"];
    NSString *dateTime = [NSString stringWithFormat:@"%@ %@",datePortion,timePortion];
    return [dateFormatter dateFromString:dateTime];
}

/*  */
- (NSString *)monthString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMMM"];
    return [dateFormatter stringFromDate:self];
}

/*  */
+ (NSString *)monthStringWithMonthNumber:(NSInteger)month
{
//    switch(month)
//    {
//        case 1:
//            return STLocalizedString(@"JANUARY", @"");
//            break;
//        case 2:
//            return STLocalizedString(@"FEBRUARY", @"");
//            break;
//        case 3:
//            return STLocalizedString(@"MARCH", @"");
//            break;
//        case 4:
//            return STLocalizedString(@"APRIL", @"");
//            break;
//        case 5:
//            return STLocalizedString(@"MAY", @"");
//            break;
//        case 6:
//            return STLocalizedString(@"JUNE", @"");
//            break;
//        case 7:
//            return STLocalizedString(@"JULY", @"");
//            break;
//        case 8:
//            return STLocalizedString(@"AUGUST", @"");
//            break;
//        case 9:
//            return STLocalizedString(@"SEPTEMBER", @"");
//            break;
//        case 10:
//            return STLocalizedString(@"OCTOBER", @"");
//            break;
//        case 11:
//            return STLocalizedString(@"NOVEMBER", @"");
//            break;
//        case 12:
//            return STLocalizedString(@"DECEMBER", @"");
//            break;
//        default:
//            return nil;
//            break;
//    }
    return @"";
}

/*  */
- (NSString *)yearString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy"];
    return [dateFormatter stringFromDate:self];
}

/*  */
- (STDateInformation)dateInformationWithTimeZone:(NSTimeZone *)timezone
{
    STDateInformation info;
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [gregorian setTimeZone:timezone];
    NSDateComponents *comp = [gregorian components:(NSCalendarUnitMonth | NSCalendarUnitMinute | NSCalendarUnitYear | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitSecond) fromDate:self];
    info.day = [comp day];
    info.month = [comp month];
    info.year = [comp year];
    
    info.hour = [comp hour];
    info.minute = [comp minute];
    info.second = [comp second];
    
    
    info.weekday = [comp weekday];
    
    return info;
}

/*  */
- (STDateInformation)dateInformation
{
    STDateInformation info;
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comp = [gregorian components:(NSCalendarUnitMonth | NSCalendarUnitMinute | NSCalendarUnitYear | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitSecond) fromDate:self];
    info.day = [comp day];
    info.month = [comp month];
    info.year = [comp year];
    
    info.hour = [comp hour];
    info.minute = [comp minute];
    info.second = [comp second];
    
    info.weekday = [comp weekday];
    
    return info;
}

/*  */
+ (NSDate *)dateFromDateInformation:(STDateInformation)info timeZone:(NSTimeZone *)timezone
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [gregorian setTimeZone:timezone];
    NSDateComponents *comp = [gregorian components:(NSCalendarUnitYear | NSCalendarUnitMonth) fromDate:[NSDate date]];
    
    [comp setDay:info.day];
    [comp setMonth:info.month];
    [comp setYear:info.year];
    [comp setHour:info.hour];
    [comp setMinute:info.minute];
    [comp setSecond:info.second];
    [comp setTimeZone:timezone];
    
    return [gregorian dateFromComponents:comp];
}

/*  */
+ (NSDate *)dateFromDateInformation:(STDateInformation)info
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comp = [gregorian components:(NSCalendarUnitYear | NSCalendarUnitMonth) fromDate:[NSDate date]];
    
    [comp setDay:info.day];
    [comp setMonth:info.month];
    [comp setYear:info.year];
    [comp setHour:info.hour];
    [comp setMinute:info.minute];
    [comp setSecond:info.second];
    //[comp setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    
    return [gregorian dateFromComponents:comp];
}

/*  */
+ (NSString *)dateInformationDescriptionWithInformation:(STDateInformation)info
{
    return [NSString stringWithFormat:@"%02li/%02li/%04li %02li:%02li:%02li", (long)info.month, (long)info.day, (long)info.year, (long)info.hour, (long)info.minute, (long)info.second];
}

/**
 *  是否为今天
 */
- (BOOL)isTodays
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth |  NSCalendarUnitYear;
    
    // 1.获得当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    // 2.获得self的年月日
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    return
    (selfCmps.year == nowCmps.year) &&
    (selfCmps.month == nowCmps.month) &&
    (selfCmps.day == nowCmps.day);
}

/**
 *  是否为昨天
 */
- (BOOL)isYesterday
{
    // 2014-05-01
    NSDate *nowDate = [[NSDate date] dateWithYMD];
    
    // 2014-04-30
    NSDate *selfDate = [self dateWithYMD];
    
    // 获得nowDate和selfDate的差距
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *cmps = [calendar components:NSCalendarUnitDay fromDate:selfDate toDate:nowDate options:0];
    return cmps.day == 1;
}

- (NSDate *)dateWithYMD
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    NSString *selfStr = [fmt stringFromDate:self];
    return [fmt dateFromString:selfStr];
}

/**
 *  是否为今年
 */
- (BOOL)isThisYear
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitYear;
    
    // 1.获得当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    // 2.获得self的年月日
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    
    return nowCmps.year == selfCmps.year;
}

- (NSDateComponents *)deltaWithNow
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    return [calendar components:unit fromDate:self toDate:[NSDate date] options:0];
}

/*! 时间戳转换成日期 */
+ (NSDate *)NSDateTransformWithNSDateTimeSp:(NSString *)timeSp
{
    NSTimeInterval time = [timeSp doubleValue] + 28800;//因为时差问题要加8小时 == 28800 sec
    NSDate *currentTime = [NSDate dateWithTimeIntervalSince1970:time];
    return currentTime;
}

@end
