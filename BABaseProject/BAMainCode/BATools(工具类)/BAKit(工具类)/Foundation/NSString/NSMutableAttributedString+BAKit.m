
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


#import "NSMutableAttributedString+BAKit.h"

@implementation NSMutableAttributedString (BAKit)

#pragma mark 完全自定义样式
- (NSRange)ba_changeAttributeDict:(NSDictionary *)dict range:(NSRange)range
{
    [self addAttributes:dict range:range];
    return range;
}

#pragma mark 改变某位置的颜色
- (NSRange)ba_changeColor:(UIColor *)color range:(NSRange)range
{
    [self addAttribute:NSForegroundColorAttributeName value:color range:range];
    return range;
}

/*! 改变某位置的颜色 */
- (NSRange)ba_changeColor:(UIColor *)color
                     from:(NSInteger)loc
                    length:(NSInteger)length
{
    NSRange range = NSMakeRange(loc, length);
    [self ba_changeColor:color range:range];
    return range;
}

#pragma mark 改变某位置的普通字号
- (NSRange)ba_changeSystemFontFloat:(CGFloat)fontFloat range:(NSRange)range
{
    [self addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontFloat] range:range];
    return range;
}

/*! 改变某位置的普通字号*/
- (NSRange)ba_changeSystemFontFloat:(CGFloat)fontFloat
                               from:(NSInteger)loc
                              length:(NSInteger)length
{
    NSRange range = NSMakeRange(loc, length);
    [self ba_changeSystemFontFloat:fontFloat range:range];
    return range;
}

#pragma mark 改变某位置的粗体字号
- (NSRange)ba_changeBoldFontFloat:(CGFloat)fontFloat range:(NSRange)range
{
    [self addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:fontFloat] range:range];
    return range;
}

/*! 改变某位置的粗体字号 */
- (NSRange)ba_changeBoldFontFloat:(CGFloat)fontFloat
                             from:(NSInteger)loc
                            length:(NSInteger)length
{
    NSRange range = NSMakeRange(loc, length);
    [self ba_changeBoldFontFloat:fontFloat range:range];
    return range;
}

#pragma mark 改变某位置的行距
- (NSRange)ba_changeLineSpacing:(CGFloat)spacing
                           from:(NSInteger)loc
                          length:(NSInteger)length
{
    NSRange range = NSMakeRange(loc, length);
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    /*! 行距 */
    style.lineSpacing = spacing;
    [self addAttribute:NSParagraphStyleAttributeName value:style range:range];
    return range;
}

/*! 改变某位置的段落距离 */
- (NSRange)ba_changeParagraphSpacing:(CGFloat)spacing
                                 from:(NSInteger)loc
                                length:(NSInteger)length
{
    NSRange range = NSMakeRange(loc, length);
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    /*! 段落距离 */
    style.paragraphSpacing = spacing;
    [self addAttribute:NSParagraphStyleAttributeName value:style range:range];
    return range;
}

#pragma mark 改变段落的顶部和文本内容的开头之间的距离
-(NSRange)ba_changeBeforeLparagraphSpacing:(CGFloat)spacing
                                      from:(NSInteger)loc
                                     length:(NSInteger)length
{
    NSRange range = NSMakeRange(loc, length);
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    /*! 段落的顶部和文本内容的开头之间的距离 */
    style.paragraphSpacingBefore = spacing;
    [self addAttribute:NSParagraphStyleAttributeName value:style range:range];
    return range;
}

#pragma mark 根据位置、长度加下划线
- (NSRange)ba_changeUnderlineWithRange:(NSRange)range
{
    [self addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:range];
    return range;
}

/*! 根据位置加下划线 */
- (NSRange)ba_changeUnderlineFrom:(NSInteger)loc length:(NSInteger)length
{
    NSRange range = NSMakeRange(loc, length);
    [self ba_changeUnderlineWithRange:range];
    return range;
}

#pragma mark 全部加下划线
- (void)ba_changeUnderlineAtAll
{
    NSRange range = NSMakeRange(0, self.length);
    [self ba_changeUnderlineWithRange:range];
}

#pragma mark 根据位置加删除线
- (NSRange)ba_changeStrikethroughWithRange:(NSRange)range
{
    [self addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:range];
    return range;
}

/*! 根据位置加删除线 */
- (NSRange)ba_changeStrikethroughFrom:(NSInteger)loc length:(NSInteger)length
{
    NSRange range = NSMakeRange(loc, length);
    [self ba_changeStrikethroughWithRange:range];
    return range;
}

#pragma mark 全部加删除线
- (void)ba_changeStrikethroughAtAll
{
    NSRange range = NSMakeRange(0, self.length);
    [self ba_changeStrikethroughWithRange:range];
}

#pragma mark 根据位置修改默认字距 0表示禁用字距调整
- (NSRange)ba_changeKernWithInteger:(CGFloat)value Range:(NSRange)range
{
    [self addAttribute:NSKernAttributeName value:[NSNumber numberWithFloat:value] range:range];
    return range;
}

#pragma mark 根据位置修改描边颜色 垂直标志符号形式
- (NSRange)ba_changeStrokeColorWithColor:(UIColor *)strokeColor
                             strokeWidth:(CGFloat)strokeWidth
                                   Range:(NSRange)range
{
    [self addAttribute:NSStrokeColorAttributeName value:strokeColor range:range];
    [self addAttribute:NSStrokeWidthAttributeName value:[NSNumber numberWithFloat:strokeWidth] range:range];
    return range;
}

@end
