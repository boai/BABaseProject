
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

@interface NSString (BAKit)

/**
 *  转换自身为开头大写字符串.
 *  例如: "This is a Test" 将返回 "This is a test" 
         "this is a test"  将返回 "This is a test"
 */
- (NSString *)ba_stringSentenceCapitalizedString;

/**
 *  自编码成编码的URL字符串
 */
- (NSString *)ba_stringUrlEncode;

/**
 *   Create a string from the file in main bundle (similar to [UIImage imageNamed:]).
 *
 *  @param name The file name (in main bundle).
 *
 *  @return A new string create from the file in UTF-8 character encoding.
 */
+ (NSString *)ba_stringNamed:(nullable NSString *)name;

/**
 string Data 格式化
 
 @return Data
 */
- (NSData *)ba_stringDataValue;

/**
 搜索两个字符之间的字符串【注意：搜索的字符串必须只能是英文】
 
 @param string 需要搜索的字符串
 @param start 起点索引字符【英文字母】
 @param end 结束索引字符【英文字母】
 @return 两个字符之间的字符串
 */
+ (NSString *)ba_stringSearchInString:(NSString *)string
                            charStart:(char)start
                              charEnd:(char)end;

/**
 搜索两个字符之间的字符串
 
 @param start 开始的字符
 @param end 结束的字符
 @return 两个字符之间的字符串
 */
- (NSString *)ba_stringSearchCharStart:(char)start
                               charEnd:(char)end;

/**
 判断 string 是否为空
 
 @return YES：不为空，NO：为空
 */
- (BOOL)ba_stringIsNotBlank;

/**
 从身份证号码里提取 生日，默认：@"yyyy-MM-dd"
 
 @return 生日
 */
- (NSDate *)ba_stringExtractBirthdayFromIDNumber;

/**
 从身份证号码里提取 性别
 
 @return 性别
 */
- (NSString *)ba_stringExtractGenderFromIDNumber;

/**
 从身份证号码里提取 年龄
 
 @return 年龄
 */
- (NSUInteger)ba_stringExtractAgeFromIDNumber;

@end

NS_ASSUME_NONNULL_END
