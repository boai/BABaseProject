
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

@interface NSString (BATrims)

/*!
 * 清除html标签
 *
 * @return 清除后的结果
 */
- (NSString *)ba_trimStrippingHTMLString;

/*!
 * 清除js脚本
 *
 * @return 清楚js后的结果
 */
- (NSString *)ba_trimScriptsAndStrippingHTMLString;

/*!
 * 去除空格
 *
 * @return 去除空格后的字符串
 */
- (NSString *)ba_trimWhitespace;

/*!
 * 去除字符串与空行
 *
 * @return 去除字符串与空行的字符串
 */
- (NSString *)ba_trimWhitespaceAndNewlines;

/**
 去掉字符串中的 html 标签的方法
 
 @param HTMLString HTMLString
 @return 去掉字符串中的 html 标签后的 string
 */
+ (NSString *)ba_trimfilterHTML:(NSString *)HTMLString;

/*!
 *  去除字符串的特殊字符
 *
 *  @param string 需要处理的字符串（如：NSString *string = @"<f7091300 00000000 830000c4 00002c00 0000c500>";）
 *
 * @return 去除字符串的特殊字符
 */
+ (nullable NSString *)ba_trimWithString:(nullable NSString *)string;

/**
 十六进制转换为普通 string
 
 @param hexString 十六进制 string
 @return 转换后的 string
 */
- (NSString *)ba_stringFromHexString:(NSString *)hexString;

/*!
 *  字典转 json
 *
 *  @param dictionary 传入的字典
 *
 *  @return 返回 json 字符串
 */
+ (NSString *)ba_stringJsonTurnWithDictionary:(NSDictionary *)dictionary;

/**
 获取 string 的长度
 
 @param string string
 @return string 的长度
 */
+ (NSUInteger)ba_stringGetLengthOfString:(NSString*)string;

/**
 重复字符串 N 次
 
 @param repeatString 需要重复的 string
 @param repeatCount 重复次数
 @return 重复后的 string
 */
+ (NSString *)ba_stringWithNeedRepeatString:(NSString *)repeatString
                                repeatCount:(NSInteger)repeatCount;

@end
NS_ASSUME_NONNULL_END
