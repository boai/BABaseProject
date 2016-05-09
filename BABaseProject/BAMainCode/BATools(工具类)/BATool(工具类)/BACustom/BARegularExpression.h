
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
 * QQ     : 可以添加SDAutoLayout群 497140713 在这里找到我(博爱1616【137361770】)
 * 微博    : 博爱1616
 * Email  : 137361770@qq.com
 * GitHub : https://github.com/boai
 * 博客园  : http://www.cnblogs.com/boai/
 * 博客    : http://boai.github.io
 
 *********************************************************************************
 
 */

#import <Foundation/Foundation.h>

@interface BARegularExpression : NSObject

/*!
 *  是否为电话号码
 *
 *  @param pattern 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
+ (BOOL)ba_isPhoneNumber:(NSString *)phoneNum;

/*!
 *  判断具体是哪个运营商的手机号
 *
 *  @param phoneNum 传入需要检测的字符串
 *
 *  @return 返回：中国移动、中国联通、中国电信、未知
 */
+ (NSString *)ba_getPhoneNumType:(NSString *)phoneNum;

/*!
 *  检测是否为邮箱
 *
 *  @param pattern 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
+ (BOOL)ba_isEmailQualified:(NSString *)emailStr;

/*!
 *  检测用户输入密码是否以字母开头，长度在6-18之间，只能包含字符、数字和下划线。
 *
 *  @param pattern 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
+ (BOOL)ba_isPasswordQualified:(NSString *)passwordStr;

/*!
 *  验证身份证号（15位或18位数字）
 *  @param pattern 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
+ (BOOL)ba_isIdCardNumberQualified:(NSString *)idCardNumberStr;

/*!
 *  验证IP地址（15位或18位数字）
 *  @param pattern 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
+ (BOOL)ba_isIPAddress:(NSString *)iPAddressStr;

/*!
 *  验证输入的是否全为数字
 *  @param pattern 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
+ (BOOL)ba_isAllNumber:(NSString *)allNumberStr;

/*!
 *  验证由26个英文字母组成的字符串
 *  @param pattern 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
+ (BOOL)ba_isEnglishAlphabet:(NSString *)englishAlphabetStr;

/*!
 *  验证输入的是否是URL地址
 *  @param pattern 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
+ (BOOL)ba_isUrl:(NSString *)urlStr;

/*!
 *  验证输入的是否是中文
 *  @param pattern 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
+ (BOOL)ba_isChinese:(NSString *)chineseStr;

/*!
 *  验证输入的是否是高亮显示
 *  @param pattern 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
+ (BOOL)ba_isNormalText:(NSString *)normalStr WithHighLightText:(NSString *)HighLightStr;


@end
