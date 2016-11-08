
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

@interface NSString (NSNumber)
/*! 
 
 封装说明：
    所有 数字 类型的字符处理类，包含：手机号码格式化、数字格式化等
 
 */


/*! 
 注意：中英文输出样式不一样，如果有国际化的请注意输出样式，
      本样式为中文输出环境，模拟器可能输出为英文样式
 */

/*! 手机号码格式化样式：344【中间空格】，示例：13855556666 --> 138 5555 6666 */
+ (NSString *)ba_phoneNumberFormatterSpace:(NSString *)phoneNumber;

/*! 手机号码格式化样式：3*4【中间4位为*】，示例：13855556666 --> 138****6666 */
+ (NSString *)ba_phoneNumberFormatterCenterStar:(NSString *)phoneNumber;

/*! 数字格式化样式，示例：12345678.89 --> 12,345,678.89 */
+ (NSString *)ba_stringFormatterWithStyle:(NSNumberFormatterStyle)numberStyle numberString:(NSString *)numberString;

/*! 格式化为带小数点的数字，示例：12345678.89 --> 12,345,678.89 */
+ (NSString *)ba_stringFormatterWithDecimalStyleWithNumberString:(NSString *)numberString;

/*! 格式化为货币样式，示例：12345678.89 --> 12,345,678.89 */
+ (NSString *)ba_stringFormatterWithCurrencyStyleWithNumberString:(NSString *)numberString;

/*! 格式化为百分比样式，示例：12345678.89 --> 1,234,567,889% */
+ (NSString *)ba_stringFormatterWithPercentStyleWithNumberString:(NSString *)numberString;

/*! 格式化为科学计数样式，示例：12345678.89 --> 1.234567889E7 */
+ (NSString *)ba_stringFormatterWithScientificStyleWithNumberString:(NSString *)numberString;

/*! 格式化为英文输出样式（注：此处根据系统语言输出），示例：12345678.89 --> 一千二百三十四万五千六百七十八点八九 */
+ (NSString *)ba_stringFormatterWithSpellOutStyleWithNumberString:(NSString *)numberString;

/*! 格式化为序数样式，示例：12345678.89 --> 第1234,5679 */
+ (NSString *)ba_stringFormatterWithOrdinalStyleWithNumberString:(NSString *)numberString;

/*! 格式化为四舍五入样式，示例：12345678.89 --> 12,345,679 */
+ (NSString *)ba_stringFormatterWithCurrencyISOCodeStyleWithNumberString:(NSString *)numberString;

/*! 格式化为货币多样式，示例：12345678.89 --> USD 12,345,678.89 */
+ (NSString *)ba_stringFormatterWithCurrencyPluralStyleWithNumberString:(NSString *)numberString;

/*! 保留纯数字 */
- (NSString *)ba_removeStringSaveNumber;

@end
