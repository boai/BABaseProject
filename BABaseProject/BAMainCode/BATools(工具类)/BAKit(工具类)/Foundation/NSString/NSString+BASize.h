
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

@interface NSString (BASize)

/**
 获取文字 size，根据字体大小

 @param maxSize 最大的 size
 @param fontSize 字体大小
 @return 文字 size
 */
- (CGSize)ba_stringGetSizeWithMaxSize:(CGSize)maxSize
                             fontSize:(CGFloat)fontSize;

/**
 获取文字 size，根据字体

 @param maxSize 最大的 size
 @param font 字体
 @return 文字 size
 */
- (CGSize)ba_stringGetSizeWithMaxSize:(CGSize)maxSize
                                 font:(UIFont *)font;

/**
 计算一个字符串的 height，【限定 font、width】

 @param font font
 @param width width
 @return 字符串的 height
 */
- (CGFloat)ba_stringGetHeightWithFont:(UIFont* )font width:(CGFloat)width;

/**
 计算一个字符串的 width，【限定 font、height】

 @param font font
 @param height height
 @return 字符串的 width
 */
- (CGFloat)ba_stringGetWidthWithFont:(UIFont *)font height:(CGFloat)height;

/**
 *  Get the string's height with the fixed width.
 *
 *  @param attribute String's attribute, eg. attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:18.f]}
 *  @param width     Fixed width.
 *
 *  @return String's height.
 */

/**
 计算一个 attributeString 的 height，【限定 attributeDictionary、width】

 @param attributeDictionary attributeDictionary 例如：attributeDictionary = @{NSFontAttributeName: [UIFont systemFontOfSize:18.f]}
 @param width width
 @return attributeString 的 height
 */
- (CGFloat)ba_stringGetHeightWithStringAttributeDictionary:(NSDictionary <NSString *, id> *)attributeDictionary
                                                     width:(CGFloat)width;

/**
 计算一个 attributeString 的 width，【限定 attributeDictionary】
 
 @param attributeDictionary attributeDictionary 例如：attributeDictionary = @{NSFontAttributeName: [UIFont systemFontOfSize:18.f]}
 @return attributeString 的 width
 */
- (CGFloat)ba_widthWithStringAttributeDictionary:(NSDictionary <NSString *, id> *)attributeDictionary;


/**
 *  Get a line of text height.
 *
 *  @param attribute String's attribute, eg. attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:18.f]}
 *
 *  @return String's width.
 */
+ (CGFloat)ba_stringGetOneLineOfTextHeightWithStringAttribute:(NSDictionary <NSString *, id> *)attribute;

@end
