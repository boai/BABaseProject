
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
 * 博客园  : http://www.cnblogs.com/boai/
 * 博客    : http://boai.github.io
 
 *********************************************************************************
 
 */

#import <Foundation/Foundation.h>

#define D_MINUTE	60
#define D_HOUR		3600
#define D_DAY		86400
#define D_WEEK		604800
#define D_YEAR		31556926
/*!
 *  给NSDate类添加许多有用的方法
 */
@interface NSDate (BAKit)

/**
 *  是否为今天
 */
- (BOOL)isToday;
/**
 *  是否为昨天
 */
- (BOOL)isYesterday;
/**
 *  是否为今年
 */
- (BOOL)isThisYear;

/**
 *  返回一个只有年月日的时间
 */
- (NSDate *)dateWithYMD;

/**
 *  获得与当前时间的差距
 */
- (NSDateComponents *)deltaWithNow;

/**
 *  获取时间与现在的时间差，并返回类似微博发送时间
 */
+ (NSString *)created_at:(NSString *)date;

/**
 *  获得一个比当前时间大n年的时间，格式为yyyyMMdd
 */
+ (NSString *)dateAfterYears:(NSInteger)count;

- (NSString *)timeIntervalDescription;//距离当前的时间间隔描述
- (NSString *)minuteDescription;/*精确到分钟的日期描述*/
- (NSString *)formattedTime;
- (NSString *)formattedDateDescription;//格式化日期描述
- (double)timeIntervalSince1970InMilliSecond;
+ (NSDate *)dateWithTimeIntervalInMilliSecondSince1970:(double)timeIntervalInMilliSecond;
+ (NSString *)formattedTimeFromTimeInterval:(long long)time;

// Relative dates from the current date
+ (NSDate *) dateTomorrow;
+ (NSDate *) dateYesterday;
+ (NSDate *) dateWithDaysFromNow: (NSInteger) days;
+ (NSDate *) dateWithDaysBeforeNow: (NSInteger) days;
+ (NSDate *) dateWithHoursFromNow: (NSInteger) dHours;
+ (NSDate *) dateWithHoursBeforeNow: (NSInteger) dHours;
+ (NSDate *) dateWithMinutesFromNow: (NSInteger) dMinutes;
+ (NSDate *) dateWithMinutesBeforeNow: (NSInteger) dMinutes;

// Comparing dates
- (BOOL) isEqualToDateIgnoringTime: (NSDate *) aDate;
- (BOOL) isTomorrow;
- (BOOL) isSameWeekAsDate: (NSDate *) aDate;
- (BOOL) isThisWeek;
- (BOOL) isNextWeek;
- (BOOL) isLastWeek;
- (BOOL) isSameMonthAsDate: (NSDate *) aDate;
- (BOOL) isThisMonth;
- (BOOL) isSameYearAsDate: (NSDate *) aDate;
- (BOOL) isNextYear;
- (BOOL) isLastYear;
- (BOOL) isEarlierThanDate: (NSDate *) aDate;
- (BOOL) isLaterThanDate: (NSDate *) aDate;
- (BOOL) isInFuture;
- (BOOL) isInPast;

// Date roles
- (BOOL) isTypicallyWorkday;
- (BOOL) isTypicallyWeekend;

// Adjusting dates
- (NSDate *) dateByAddingDays: (NSInteger) dDays;
- (NSDate *) dateBySubtractingDays: (NSInteger) dDays;
- (NSDate *) dateByAddingHours: (NSInteger) dHours;
- (NSDate *) dateBySubtractingHours: (NSInteger) dHours;
- (NSDate *) dateByAddingMinutes: (NSInteger) dMinutes;
- (NSDate *) dateBySubtractingMinutes: (NSInteger) dMinutes;
- (NSDate *) dateAtStartOfDay;

// Retrieving intervals
- (NSInteger) minutesAfterDate: (NSDate *) aDate;
- (NSInteger) minutesBeforeDate: (NSDate *) aDate;
- (NSInteger) hoursAfterDate: (NSDate *) aDate;
- (NSInteger) hoursBeforeDate: (NSDate *) aDate;
- (NSInteger) daysAfterDate: (NSDate *) aDate;
- (NSInteger) daysBeforeDate: (NSDate *) aDate;
- (NSInteger)distanceInDaysToDate:(NSDate *)anotherDate;

// Decomposing dates
@property (readonly) NSInteger nearestHour;
@property (readonly) NSInteger hour;
@property (readonly) NSInteger minute;
@property (readonly) NSInteger seconds;
@property (readonly) NSInteger day;
@property (readonly) NSInteger month;
@property (readonly) NSInteger week;
@property (readonly) NSInteger weekday;
@property (readonly) NSInteger nthWeekday; // e.g. 2nd Tuesday of the month == 2
@property (readonly) NSInteger year;











///**
// *  简化日期结构
// */
//struct BADateInformation {
//    NSInteger day;      // 日
//    NSInteger month;    // 月
//    NSInteger year;     // 年
//    
//    NSInteger weekday;  // 星期
//    
//    NSInteger minute;   // 分钟
//    NSInteger hour;     // 小时
//    NSInteger second;   // 秒数
//    
//};
//
//typedef struct BADateInformation BADateInformation;
//
///**
// *  给NSDate类添加许多有用的方法
// */
//@interface NSDate (BAKit)
//
///**
// *  Create a NSDate with the yesterday date
// *
// *  @return Return a NSDate with the yesterday date
// */
//+ (NSDate *)yesterday;
//
///**
// *  Get the month from today
// *
// *  @return Return the month
// */
//+ (NSDate *)month;
//
///**
// *  Get the month from self
// *
// *  @return Return the month
// */
//- (NSDate *)month;
//
///**
// *  Get the weekday number from self
// *
// *  @return Return weekday number
// *  [1 - Sunday]
// *  [2 - Monday]
// *  [3 - Tuerday]
// *  [4 - Wednesday]
// *  [5 - Thursday]
// *  [6 - Friday]
// *  [7 - Saturday]
// */
//- (NSInteger)weekday;
//
///**
// *  Get the weekday as a localized string from self
// *
// *  @return Return weekday as a localized string
// *  [1 - Sunday]
// *  [2 - Monday]
// *  [3 - Tuerday]
// *  [4 - Wednesday]
// *  [5 - Thursday]
// *  [6 - Friday]
// *  [7 - Saturday]
// */
//- (NSString *)dayFromWeekday;
//
///**
// *  Compare self with another date
// *
// *  @param anotherDate The another date to compare as NSDate
// *
// *  @return Return YES if is same day, NO if not
// */
//- (BOOL)isSameDay:(NSDate *)anotherDate;
//
///**
// *  Get the months number between self and another date
// *
// *  @param toDate The another date
// *
// *  @return Return the months between the two dates
// */
//- (NSInteger)monthsBetweenDate:(NSDate *)toDate;
//
///**
// *  Get the days number between self and another date
// *
// *  @param toDate The another date
// *
// *  @return Return the days between the two dates
// */
//- (NSInteger)daysBetweenDate:(NSDate *)toDate;
//
///**
// *  Return if self is today
// *
// *  @return Return if self is today
// */
//- (BOOL)isToday;
//
///**
// *  Add days to self
// *
// *  @param days The number of days to add
// *
// *  @return Return self by adding the gived days number
// */
//- (NSDate *)dateByAddingDays:(NSUInteger)days;
//
///**
// *  Create an NSDate with other two NSDate objects.
// *  Taken from the first date: day, month and year.
// *  Taken from the second date: hours and minutes.
// *
// *  @param aDate The first date for date
// *  @param aTime The second date for time
// *
// *  @return Return the created NSDate
// */
//+ (NSDate *)dateWithDatePart:(NSDate *)aDate
//                 andTimePart:(NSDate *)aTime;
//
///**
// *  Get the month string from self
// *
// *  @return Return the month string
// */
//- (NSString *)monthString;
//
///**
// *  Get the year string from self
// *
// *  @return Return the year string
// */
//- (NSString *)yearString;
//
///**
// *  Get the month as a localized string from the given month number
// *
// *  @param month The month to be converted in string
// *  [1 - January]
// *  [2 - February]
// *  [3 - March]
// *  [4 - April]
// *  [5 - May]
// *  [6 - June]
// *  [7 - July]
// *  [8 - August]
// *  [9 - September]
// *  [10 - October]
// *  [11 - November]
// *  [12 - December]
// *
// *  @return Return the given month as a localized string
// */
//+ (NSString *)monthStringWithMonthNumber:(NSInteger)month;
//
///**
// *  Get self as a BADateInformation structure
// *
// *  @return Return self as a BADateInformation structure
// */
//- (BADateInformation)dateInformation;
//
///**
// *  Get self as a BADateInformation structure with a given time zone
// *
// *  @return Return self as a BADateInformation structure with a given time zone
// */
//- (BADateInformation)dateInformationWithTimeZone:(NSTimeZone *)timezone;
//
///**
// *  Return a date from a given BADateInformation structure
// *
// *  @param info The BADateInformation to be converted
// *
// *  @return Return a NSDate from a given BADateInformation structure
// */
//+ (NSDate *)dateFromDateInformation:(BADateInformation)info;
//
///**
// *  Return a date from a given BADateInformation structure with a given time zone
// *
// *  @param info The BADateInformation to be converted
// *
// *  @return Return a NSDate from a given BADateInformation structure with a given time zone
// */
//+ (NSDate *)dateFromDateInformation:(BADateInformation)info
//                           timeZone:(NSTimeZone *)timezone;
//
///**
// *  Get the given BADateInformation structure as a formatted string
// *
// *  @param info The BADateInformation to be formatted
// *
// *  @return Return a NSString in the following format:
// *  D/M/Y H:M:S
// *  Example: 15/10/2013 10:38:43
// */
//+ (NSString *)dateInformationDescriptionWithInformation:(BADateInformation)info;
//
///**
// *  是否为今天
// */
//- (BOOL)isTodays;
///**
// *  是否为昨天
// */
//- (BOOL)isYesterday;
///**
// *  是否为今年
// */
//- (BOOL)isThisYear;
//
///**
// *  返回一个只有年月日的时间
// */
//- (NSDate *)dateWithYMD;
//
///**
// *  获得与当前时间的差距
// */
//- (NSDateComponents *)deltaWithNow;
//
///*! 时间戳转换成日期 */
//+ (NSDate *)ba_NSDateTransformWithNSDateTimeSp:(NSString *)timeSp;





@end
