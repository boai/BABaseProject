
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

@interface NSString (BAEncrypt)

/**
 *  创建一个MD5字符串
 */
- (NSString *)ba_stringMD5;

/**
 *  创建一个SHA1字符串
 */
- (NSString *)ba_stringSHA1;

/**
 *  创建一个SHA256字符串
 */
- (NSString *)ba_stringSHA256;

/**
 *  创建一个SHA512字符串
 */
- (NSString *)ba_stringSHA512;

/**
 *  检查自身是否追加字符串
 */
- (BOOL)ba_stringIsHasString:(NSString *)substring;

/**
 Base64 编码

 @param string 需要编码的 string
 @return Base64 编码后的 string
 */
+ (NSString *)ba_stringEncodeToBase64:(NSString *)string;

/**
 Base64 编码

 @return Base64 编码后的 string
 */
- (NSString *)ba_stringEncodeToBase64;

/**
 Base64 解码

 @param string 需要解码的 string
 @return Base64 解码后的 string
 */
+ (NSString *)ba_stringDecodeBase64:(NSString *)string;

/**
 Base64 解码
 
 @return Base64 解码后的 string
 */
- (NSString *)ba_stringDecodeBase64;

@end
NS_ASSUME_NONNULL_END
