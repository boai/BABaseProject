
/*!
 *  @header BAKit.h
 *          BABaseProject
 *
 *  @brief  BAKit
 *
 *  @author 博爱
 *  @copyright    Copyright © 2016年 博爱. All rights reserved.
 *  @version    V1.0
 */

//                            _ooOoo_
//                           o8888888o
//                           88" . "88
//                           (| -_- |)
//                            O\ = /O
//                        ____/`---'\____
//                      .   ' \\| |// `.
//                       / \\||| : |||// \
//                     / _||||| -:- |||||- \
//                       | | \\\ - /// | |
//                     | \_| ''\---/'' | |
//                      \ .-\__ `-` ___/-. /
//                   ___`. .' /--.--\ `. . __
//                ."" '< `.___\_<|>_/___.' >'"".
//               | | : `- \`.;`\ _ /`;.`/ - ` : | |
//                 \ \ `-. \_ __\ /__ _/ .-` / /
//         ======`-.____`-.___\_____/___.-`____.-'======
//                            `=---='
//
//         .............................................
//                  佛祖镇楼                  BUG辟易
//          佛曰:
//                  写字楼里写字间，写字间里程序员；
//                  程序人员写程序，又拿程序换酒钱。
//                  酒醒只在网上坐，酒醉还来网下眠；
//                  酒醉酒醒日复日，网上网下年复年。
//                  但愿老死电脑间，不愿鞠躬老板前；
//                  奔驰宝马贵者趣，公交自行程序员。
//                  别人笑我忒疯癫，我笑自己命太贱；
//                  不见满街漂亮妹，哪个归得程序员？

/*
 
 *********************************************************************************
 *
 * 在使用BAKit的过程中如果出现bug请及时以以下任意一种方式联系我，我会及时修复bug
 *
 * QQ     : 可以添加ios开发技术群 479663605 在这里找到我(博爱1616【137361770】)
 * 微博    : 博爱1616
 * Email  : 137361770@qq.com
 * GitHub : https://github.com/boai
 * 博客    : http://boaihome.com
 
 *********************************************************************************
 
 */


#import <Foundation/Foundation.h>


#define BAKit_Current_Calendar [NSCalendar currentCalendar]
#define BAKit_Current_Date     [NSDate date]

@interface NSDate (BAKit)

@property (nonatomic, readonly) NSInteger year;
@property (nonatomic, readonly) NSInteger month;
@property (nonatomic, readonly) NSInteger day;
@property (nonatomic, readonly) NSInteger nearestHour;
@property (nonatomic, readonly) NSInteger hour;
@property (nonatomic, readonly) NSInteger minute;
@property (nonatomic, readonly) NSInteger second;
@property (nonatomic, readonly) NSInteger nanosecond;
@property (nonatomic, readonly) NSInteger weekday;
//PRC 中国
@property (nonatomic, readonly) NSInteger weekdayPRC;
@property (nonatomic, readonly) NSInteger weekdayOrdinal;
@property (nonatomic, readonly) NSInteger weekOfMonth;
@property (nonatomic, readonly) NSInteger weekOfYear;
@property (nonatomic, readonly) NSInteger yearForWeekOfYear;
@property (nonatomic, readonly) NSInteger quarter;

/**
 确定每个月是否为闰月
 */
@property (nonatomic, readonly) BOOL isLeapMonth;

/**
 确定每个月是否为闰年
 */
@property (nonatomic, readonly) BOOL isLeapYear;

/**
 是否是今天
 */
@property (nonatomic, readonly) BOOL isToday;

/**
 是否是昨天
 */
@property (nonatomic, readonly) BOOL isYesterday;
@property (nonatomic, readonly) BOOL isTomorrow;
@property (nonatomic, readonly) BOOL isThisWeek;
@property (nonatomic, readonly) BOOL isNextWeek;
@property (nonatomic, readonly) BOOL isLastWeek;
@property (nonatomic, readonly) BOOL isThisMonth;
@property (nonatomic, readonly) BOOL isThisYear;
@property (nonatomic, readonly) BOOL isNextYear;
@property (nonatomic, readonly) BOOL isLastYear;
@property (nonatomic, readonly) BOOL isInFuture;
@property (nonatomic, readonly) BOOL isInPast;

@property (nonatomic, readonly) BOOL isTypicallyWorkday;
@property (nonatomic, readonly) BOOL isTypicallyWeekend;


/*!
 *  计算上报时间差: 几分钟前，几天前，传入 NSDate，自动解析
 *
 *  @return 计算上报时间差: 几分钟前，几天前
 */
- (NSString *)ba_dateFormattedWithDate;

/*!
 *  计算上报时间差: 几分钟前，几天前，传入 NSString 类型的 date，如：@"2017-04-25 11:18:01"，自动解析
 *
 *  @return 计算上报时间差: 几分钟前，几天前
 */
+ (NSString *)ba_dateCreated_at:(NSString *)date;

/*!
 *  获得一个比当前时间大n年的时间，格式为 yyyy-MM-dd
 */
+ (NSString *)ba_dateAfterYears:(NSInteger)count;

/*!
 *  返回一个只有年月日的时间
 */
- (NSDate *)ba_dateWithYMD;

- (NSDate *)ba_dateWithYM;

/*!
 *  获得与当前时间的差距
 */
- (NSDateComponents *)ba_dateDeltaWithNow;

/**
 距离当前的时间间隔描述

 @return 时间间隔描述
 */
- (NSString *)ba_dateTimeIntervalDescription;

/**
 精确到分钟的日期描述

 @return 日期描述
 */
- (NSString *)ba_dateMinuteDescription;

/**
 标准时间日期描述

 @return 标准时间日期描述
 */
- (NSString *)ba_dateFormattedTime;

/**
 当前日期 距离 1970 时间间隔毫秒

 @return 当前日期 距离 1970 时间间隔毫秒
 */
- (double)ba_dateTimeIntervalSince1970InMilliSecond;

/**
 距离 时间间隔毫秒 后的日期

 @param timeIntervalInMilliSecond 时间间隔毫秒
 @return 距离 时间间隔毫秒 后的日期
 */
+ (NSDate *)ba_dateWithTimeIntervalInMilliSecondSince1970:(double)timeIntervalInMilliSecond;

/**
 时间间隔格式化

 @param time 时间间隔
 @return 时间格式化
 */
+ (NSString *)ba_dateFormattedTimeFromTimeInterval:(long long)time;

#pragma mark UTC
//UTC世界统一时间
- (NSNumber *)ba_dateGetUtcTimeIntervalSince1970;
- (NSNumber *)ba_dateGetUtcTimeIntervalIntSince1970;
- (NSString *)ba_dateTimeIntervalStringSince1970;

#pragma mark - 距离当前日期最近的日期
+ (NSDate *)ba_dateTomorrow;
+ (NSDate *)ba_dateYesterday;
+ (NSDate *)ba_dateWithDaysFromNow:(NSInteger)days;
+ (NSDate *)ba_dateWithDaysBeforeNow:(NSInteger)days;
+ (NSDate *)ba_dateWithHoursFromNow:(NSInteger)dHours;
+ (NSDate *)ba_dateWithHoursBeforeNow:(NSInteger)dHours;
+ (NSDate *)ba_dateWithMinutesFromNow:(NSInteger)dMinutes;
+ (NSDate *)ba_dateWithMinutesBeforeNow:(NSInteger)dMinutes;

#pragma mark - 比较日期
- (BOOL)ba_dateIsEqualToDateIgnoringTime:(NSDate *)aDate;
- (BOOL)ba_dateIsSameWeekAsDate:(NSDate *)aDate;
- (BOOL)ba_dateIsSameMonthAsDate:(NSDate *)aDate;
- (BOOL)ba_dateIsSameYearAsDate:(NSDate *)aDate;
- (BOOL)ba_dateIsEarlierThanDate:(NSDate *)aDate;
- (BOOL)ba_dateIsLaterThanDate:(NSDate *)aDate;

#pragma mark - 调整日期
- (NSDate *)ba_dateByAddingDays:(NSInteger)dDays;
- (NSDate *)ba_dateBySubtractingDays:(NSInteger)dDays;
- (NSDate *)ba_dateByAddingHours:(NSInteger)dHours;
- (NSDate *)ba_dateBySubtractingHours:(NSInteger)dHours;
- (NSDate *)ba_dateByAddingMinutes:(NSInteger)dMinutes;
- (NSDate *)ba_dateBySubtractingMinutes:(NSInteger)dMinutes;
- (NSDate *)ba_dateAtStartOfDay;
- (NSDateComponents *)ba_dateComponentsWithOffsetFromDate:(NSDate *)aDate;

#pragma mark - 时间间隔
- (NSInteger)ba_dateMinutesAfterDate:(NSDate *)aDate;
- (NSInteger)ba_dateMinutesBeforeDate:(NSDate *)aDate;
- (NSInteger)ba_dateHoursAfterDate:(NSDate *)aDate;
- (NSInteger)ba_dateHoursBeforeDate:(NSDate *)aDate;
- (NSInteger)ba_dateDaysAfterDate:(NSDate *)aDate;
- (NSInteger)ba_dateDaysBeforeDate:(NSDate *)aDate;
- (NSInteger)ba_dateDistanceInDaysToDate:(NSDate *)anotherDate;
/**
 多少天之后
 */
- (NSDate *)ba_dateGetAfterYear:(int)year OrMonth:(int)month OrDay:(int)day;

#pragma mark - 一年有多少周
+ (NSString *)ba_dateGetWeekInyearOrMouth:(BOOL)inYear WithDate:(NSDate *)date;
// 2015、2009、004、1998 这四年是 53 周（目前已知），其余均是52周
+ (NSInteger)ba_dateGetWeekNumbersOfYear:(NSInteger)year;

@end

/**
 *  中国农历
 */

@interface NSDate (LunarCalendar)

/**
 * 例如 : 2016丙申年四月初一
 */

- (NSInteger)lunarShortYear;  // 农历年份,数字表示  2016

- (NSString *)lunarLongYear;  // 农历年份,干支表示  丙申年

- (NSInteger)lunarShortMonth; // 农历月份,数字表示  4

- (NSString *)lunarLongMonth; // 农历月份,汉字表示  四月

- (NSInteger)lunarShortDay;   // 农历日期,数字表示  1

- (NSString *)lunarLongDay;   // 农历日期,汉字表示  初一

- (NSString *)lunarSolarTerms;// 农历节气 (立春 雨水 惊蛰 春分...)

/** 传入阳历的年月日返回当天的农历节气 */
+ (NSString *)getLunarSolarTermsWithYear:(int)iYear Month:(int)iMonth Day:(int)iDay;

@end
