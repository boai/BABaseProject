
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

/*! 改变某位置的颜色 */
- (NSRange)ba_changeColor:(UIColor *)color range:(NSRange)range;

/*! 改变某位置的颜色 */
- (NSRange)ba_changeColor:(UIColor *)color
                 from:(NSInteger)loc
                length:(NSInteger)length;

/*! 改变某位置的普通字号 */
- (NSRange)ba_changeSystemFontFloat:(CGFloat)fontFloat range:(NSRange)range;

/*! 改变某位置的普通字号*/
- (NSRange)ba_changeSystemFontFloat:(CGFloat)fontFloat
                            from:(NSInteger)loc
                           length:(NSInteger)length;

/*! 改变某位置的粗体字号 */
- (NSRange)ba_changeBoldFontFloat:(CGFloat)fontFloat range:(NSRange)range;

/*! 改变某位置的粗体字号 */
- (NSRange)ba_changeBoldFontFloat:(CGFloat)fontFloat
                         from:(NSInteger)loc
                        length:(NSInteger)length;

/*! 改变某位置的行距 */
- (NSRange)ba_changeLineSpacing:(CGFloat)spacing
                        from:(NSInteger)loc
                       length:(NSInteger)length;

/*! 改变某位置的段落距离 */
- (NSRange)ba_changeParagraphSpacing:(CGFloat)spacing
                              from:(NSInteger)loc
                             length:(NSInteger)length;

/*! 改变段的顶部和文本内容的开头之间的距离 */
-(NSRange)ba_changeBeforeLparagraphSpacing:(CGFloat)spacing
                                   from:(NSInteger)loc
                                  length:(NSInteger)length;

/*! 根据位置加下划线 */
- (NSRange)ba_changeUnderlineWitRange:(NSRange)range;
/*! 根据位置加下划线 */
- (NSRange)ba_changeUnderlineFrom:(NSInteger)loc length:(NSInteger)length;
/*! 全部加下划线 */
- (void)ba_changeUnderlineAtAll;

/*! 根据位置加删除线 */
- (NSRange)ba_changeStrikethroughWitRange:(NSRange)range;
/*! 根据位置加删除线 */
- (NSRange)ba_changeStrikethroughFrom:(NSInteger)loc length:(NSInteger)length;
/*! 全部加删除线 */
- (void)ba_changeStrikethroughAtAll;


@end
