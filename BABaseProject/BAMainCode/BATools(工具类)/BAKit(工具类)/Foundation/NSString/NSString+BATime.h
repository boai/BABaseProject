
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

NS_ASSUME_NONNULL_BEGIN

@interface NSString (BATime)

#pragma mark - 获取系统当前日期和时间
/**
 *  获取系统当前日期和时间【YYYY-MM-dd HH:mm:ss】
 *
 *  @return 系统当前日期和时间
 */
+ (NSString *)ba_time_getSystermCurrentDateYMDHMS;

/**
 获取系统当前日期和时间 【自定义 formatString】
 
 @param formatString formatString
 @return 系统当前日期和时间
 */
+ (NSString *)ba_time_getSystermCurrentDateWithFormatString:(NSString *)formatString;

#pragma mark - 时间戳转换时间
#pragma mark 时间戳转换时间【YYYY-MM-dd HH:mm:ss】
/**
 *  时间戳转换时间【YYYY-MM-dd HH:mm:ss】
 *
 *  @param timeStamp 时间戳
 *
 *  @return 时间戳转换【YYYY-MM-dd HH:mm:ss】
 */
+ (NSString *)ba_time_getDateWithTimeStampYMDHMS:(NSString *)timeStamp;

#pragma mark 时间戳转换【YYYY-MM-dd】
/**
 *  时间戳转换时间【YYYY-MM-dd】
 *
 *  @param timeStamp 时间戳
 *
 *  @return 时间戳转换【YYYY-MM-dd】
 */
+ (NSString *)ba_time_getDateWithTimeStampYMD:(NSString *)timeStamp;

#pragma mark 时间戳转换【HH:mm】
/**
 *  时间戳转换时间【HH:mm】
 *
 *  @param timeStamp 时间戳
 *
 *  @return 时间戳转换【HH:mm】
 */
+ (NSString *)ba_time_getDateWithTimeStampHM:(NSString *)timeStamp;

/**
 时间戳转换时间【自定义 formatString】
 
 @param timeStamp 时间戳
 @param formatString formatString
 @return 时间
 */
+ (NSString *)ba_time_getDateWithTimeStamp:(NSString *)timeStamp
                              formatString:(NSString *)formatString;

#pragma mark - 当前时间转换成时间戳
/**
 *  当前时间【YYYY-MM-dd HH:mm:ss】转换成时间戳【10位数，如：1492672164】
 *
 *  @return 时间戳【10位数，如：1492672164】
 */
+ (NSString *)ba_time_getCurrentDateTransformTimeStampYMDHMS;

#pragma mark 根据日期提取当前 星期几【返回 周一...周日】
/*!
 *  根据日期提取当前 星期几【返回 周一...周日】
 *
 *  @param date 需要提取的日期
 *
 *  @return 返回 周一...周日
 */
+ (NSString *)ba_time_getWeekdayWithDate:(NSDate *)date;

#pragma mark 计算 指定日期 与 当前时间 的时间差
/**
 计算 指定日期 与 当前时间 的时间差
 
 @param date 指定日期
 @return 时间差
 */
+ (NSString *)ba_time_getIntervalSinceNowWithDate:(NSDate *)date;

/**
 判断当前时间是否在 fromHour 和 toHour 之间。如。fromHour=8，toHour=23时。即为推断当前时间是否在8:00-23:00之间【一般应用程序设置这一组的存在，比如夜间模式，如果你。从8：00-23：00。在这个当前的时间是如何推断出期间。主要的困难在于如何使用NSDate生成8：00时间和23：00时间。然后用当前时间，也许有足够的时间，以使控制。】
 
 @param fromHour 开始时间
 @param toHour 结束时间
 @return YES，NO
 */
- (BOOL)ba_time_isBetweenFromHour:(NSInteger)fromHour
                           toHour:(NSInteger)toHour;

/*!
 * 生成当天的某个点（返回的是伦敦时间，可直接与当前时间[NSDate date]比較）
 *
 * @param hour 如hour为“8”。就是上午8:00（本地时间）
 */
- (NSDate *)ba_time_getCustomDateWithHour:(NSInteger)hour;

/*!
 *  计算上报时间差: 几分钟前，几天前，传入时间戳，自动解析，注意：具体情况在 NSDate+BAKit.h 中也有详细说明
 *
 *  @return 计算上报时间差: 几分钟前，几天前
 */
+ (NSString *)ba_time_formatWithTimeStamp:(NSString *)timeStamp;

/**
 解析新浪微博中的日期【判断日期是今天，昨天还是明天】
 
 @param dateString dateString
 @return 今天，昨天还是明天
 */
+ (NSString *)ba_time_formatWithDateString:(NSString *)dateString;

/**
 字符串时间转 NSDate
 
 @param formatString 转换格式
 @return NSDate
 */
- (NSDate *)ba_time_dateWithFormatString:(NSString *)formatString;

/**
 字符串转换时间对象
 
 @param formatString 转换格式
 @param timezoneName 时区标识符
 @return 时间对象结果
 */
- (NSDate *)ba_time_dateWithFormat:(NSString *)formatString
                      timezoneName:(NSString *)timezoneName;

- (NSDate *)ba_time_dateWithFormat:(NSString *)formatString
                         dateStyle:(NSDateFormatterStyle)dateStyle;


@end
NS_ASSUME_NONNULL_END
