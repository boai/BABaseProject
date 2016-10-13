
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
 * 简书    : http://www.jianshu.com/users/95c9800fdf47/latest_articles
 * 简书专题 : http://www.jianshu.com/collection/072d578bf782
 
 *********************************************************************************
 
 */


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSMutableAttributedString (BAKit)

/*! 完全自定义样式 */
- (void)ba_changeAttributeDict:(NSDictionary *)dict range:(NSRange)range;

/*! 改变某位置的颜色 */
- (void)ba_changeColor:(UIColor *)color range:(NSRange)range;

/*! 设置字体所在区域背景颜色，取值为 UIColor对象，默认值为nil, 透明色 */
- (void)ba_changeBackgroundColor:(UIColor *)color range:(NSRange)range;

///*! 设置连体属性，取值为NSNumber 对象(整数)，0 表示没有连体字符，1 表示使用默认的连体字符，  //  2 表示使用所有连体符号，默认值为 1（iOS 不支持 2） */
//- (void)ba_changeLigatureWithValue:(int)value range:(NSRange)range;

/*! 改变某位置的普通字号 */
- (void)ba_changeSystemFont:(UIFont *)font range:(NSRange)range;

/*! 设置字形倾斜度，取值为 NSNumber（float）,正值右倾，负值左倾   */
- (void)ba_changeObliquenessValue:(NSNumber *)value range:(NSRange)range;

/*! 设置文字排版方向，取值为 NSNumber 对象(整数)，0 表示横排文本，1 表示竖排文本 */
- (void)ba_changeVerticalGlyphFormValue:(NSNumber *)value range:(NSRange)range;

/*! 设置文字书写方向，从左向右书写或者从右向左书写 */
- (void)ba_changeWritingDirectionStyle:(NSWritingDirection)style;

/*! 改变某位置的行距 */
- (void)ba_changeLineSpacing:(CGFloat)spacing
                        from:(NSInteger)loc
                       length:(NSInteger)length;

/*! 改变某位置的段落距离 */
- (void)ba_changeParagraphSpacing:(CGFloat)spacing
                              from:(NSInteger)loc
                             length:(NSInteger)length;

/*! 改变段的顶部和文本内容的开头之间的距离 */
- (void)ba_changeBeforeLparagraphSpacing:(CGFloat)spacing
                                   from:(NSInteger)loc
                                  length:(NSInteger)length;

/*! 设置下划线样式：根据枚举选择 */
- (void)ba_changeUnderlineStyle:(NSUnderlineStyle)style color:(UIColor *)color Range:(NSRange)range;
/*! 全部加下划线 设置下划线样式：根据枚举选择 */
- (void)ba_changeUnderlineAtAllStyle:(NSUnderlineStyle)style color:(UIColor *)color;

/*! 设置删除线样式：根据枚举选择 */
- (void)ba_changeStrikethroughStyle:(NSUnderlineStyle)style color:(UIColor *)color Range:(NSRange)range;
/*! 全部添加删除线 设置删除线样式：根据枚举选择 */
- (void)ba_changeStrikethroughAtAllStyle:(NSUnderlineStyle)style color:(UIColor *)color;

/*! 设定字符间距，取值为 NSNumber 对象（整数），正值间距加宽，负值间距变窄  */
- (void)ba_changeKernWithValue:(NSNumber *)value Range:(NSRange)range;

/*! 根据位置设置文本横向拉伸属性，取值为 NSNumber （float）,正值横向拉伸文本，负值横向压缩文本 */
- (void)ba_changeExpansionWithValue:(NSNumber *)value Range:(NSRange)range;
#pragma mark

/*! 根据位置添加阴影效果 */
- (void)ba_changeShadowWithShadow:(NSShadow *)shadow Range:(NSRange)range;

/*! 根据位置修改描边颜色 */
- (void)ba_changeStrokeColorWithColor:(UIColor *)strokeColor
                             strokeWidth:(NSNumber *)strokeWidth
                                   Range:(NSRange)range;

/*!
 *
 *   实例化 NSMutableAttributedString 字符串
 *
 *  @param texts      用于存储所需设置字符串的数组(根据所需自定义类型分组)
 *  @param attrsArray 富文本属性样式的集合(数组元素是texts的相应文本的属性--字典)
 *  @param space      texts文本之间的间距数组 1 代表一个空格的距离
 *
 *  @return NSMutableAttributedString实例
 */
- (instancetype)initWithStrings:(NSArray <NSString *>*)texts
                attributesArray:(NSArray <NSDictionary<NSString *,id>*>*)attrsArray
                      space:(NSArray <NSNumber *>*)space;

@end
