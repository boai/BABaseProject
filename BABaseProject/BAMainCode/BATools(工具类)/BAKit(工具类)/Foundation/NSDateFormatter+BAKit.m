
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

//iOS-NSDateFormatter格式说明：
//G: 公元时代，例如AD公元
//yy: 年的后2位
//yyyy: 完整年
//MM: 月，显示为1-12
//MMM: 月，显示为英文月份简写,如 Jan
//MMMM: 月，显示为英文月份全称，如 Janualy
//dd: 日，2位数表示，如02
//d: 日，1-2位显示，如 2
//EEE: 简写星期几，如Sun
//EEEE: 全写星期几，如Sunday
//aa: 上下午，AM/PM
//H: 时，24小时制，0-23
//K：时，12小时制，0-11
//m: 分，1-2位
//mm: 分，2位
//s: 秒，1-2位
//ss: 秒，2位
//S: 毫秒
//Z：GMT


#import "NSDateFormatter+BAKit.h"

@implementation NSDateFormatter (BAKit)

+ (id)ba_dateFormatter
{
    return [[self alloc] init];
}

+ (id)ba_dateFormatterWithFormatString:(NSString *)dateFormatString
{
    if (dateFormatString == nil || ![dateFormatString isKindOfClass:[NSString class]] || [dateFormatString isEqualToString:@""])
    {
        return nil;
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = dateFormatString;
    
    return dateFormatter;
}

+ (id)ba_dateFormatterWithFormatString:(NSString *)dateFormatString timezoneName:(NSString *)timezoneName
{
    NSDateFormatter *dateFormatter = [NSDateFormatter ba_dateFormatterWithFormatString:dateFormatString];
    
    if (timezoneName != nil && [timezoneName isKindOfClass:[NSString class]] && ![timezoneName isEqualToString:@""]) {
        dateFormatter.timeZone = [NSTimeZone timeZoneWithName:timezoneName];
    }
    return dateFormatter;
}

+ (id)ba_dateFormatterWithFormatString:(NSString *)dateFormatString dateStyle:(NSDateFormatterStyle)dateStyle
{
    
    NSDateFormatter *dateFormatter = [NSDateFormatter ba_dateFormatterWithFormatString:dateFormatString];

    dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US"];
    dateFormatter.dateStyle = dateStyle;
    
    return dateFormatter;
}

+ (id)ba_setupDateFormatterWithYMDHMS
{
    return [self ba_dateFormatterWithFormatString:BAKit_FormatString_YMDHMS];
}

+ (id)ba_setupDateFormatterWithYMDEHMS
{
    return [self ba_dateFormatterWithFormatString:BAKit_FormatString_YMDEHMS];
}

+ (id)ba_setupDateFormatterWithYMD
{
    return [self ba_dateFormatterWithFormatString:BAKit_FormatString_YMD];
}

+ (id)ba_setupDateFormatterWithYM
{
    return [self ba_dateFormatterWithFormatString:BAKit_FormatString_YM];
}

+ (id)ba_setupDateFormatterWithYY
{
    return [self ba_dateFormatterWithFormatString:BAKit_FormatString_Y];
}

+ (id)ba_setupDateFormatterWithHM
{
    return [self ba_dateFormatterWithFormatString:BAKit_FormatString_HM];
}

+ (id)ba_setupDateFormatterWithHMS
{
    return [self ba_dateFormatterWithFormatString:BAKit_FormatString_YMDHMS];
}


@end
