
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
- (void)ba_changeAttributeDict:(NSDictionary *)dict range:(NSRange)range
{
    [self addAttributes:dict range:range];
}

#pragma mark 设置字体颜色，取值为 UIColor，默认为黑色
- (void)ba_changeColor:(UIColor *)color range:(NSRange)range
{
    [self addAttribute:NSForegroundColorAttributeName value:color range:range];
}

#pragma mark 设置字体所在区域背景颜色，取值为 UIColor对象，默认值为nil, 透明色
#warning NSForegroundColorAttributeName 和 NSBackgroundColorAttributeName 的低位是相等的，跟前面介绍的 textColor 一样，哪个属性最后一次赋值，就会冲掉前面的效果
- (void)ba_changeBackgroundColor:(UIColor *)color range:(NSRange)range
{
    [self addAttribute:NSBackgroundColorAttributeName value:color range:range];
}

//#pragma mark 设置连体属性，取值为NSNumber 对象(整数)，0 表示没有连体字符，1 表示使用默认的连体字符，  //  2 表示使用所有连体符号，默认值为 1（iOS 不支持 2）
//- (void)ba_changeLigatureWithValue:(int)value range:(NSRange)range
//{
//    [self addAttribute:NSLigatureAttributeName value:[NSNumber numberWithInt: value] range:range];
//    // return range;
//}

#pragma mark 改变某位置 设置字体属性，默认值：字体：Helvetica(Neue) 字号：12
- (void)ba_changeSystemFont:(UIFont *)font range:(NSRange)range
{
    [self addAttribute:NSFontAttributeName value:font range:range];
}

#pragma mark 设置字形倾斜度，取值为 NSNumber（float）,正值右倾，负值左倾
- (void)ba_changeObliquenessValue:(NSNumber *)value range:(NSRange)range
{
    [self addAttribute:NSObliquenessAttributeName value:value range:range];
}

#pragma mark NSVerticalGlyphFormAttributeName  设置文字排版方向，取值为 NSNumber 对象(整数)，0 表示横排文本，1 表示竖排文本 在 iOS 中，总是使用横排文本，0 以外的值都未定义
- (void)ba_changeVerticalGlyphFormValue:(NSNumber *)value range:(NSRange)range
{
    [self addAttribute:NSVerticalGlyphFormAttributeName value:value range:range];
}

#pragma mark NSWritingDirectionAttributeName 设置文字书写方向，从左向右书写或者从右向左书写
- (void)ba_changeWritingDirectionStyle:(NSWritingDirection)style
{
    [self addAttribute:NSWritingDirectionAttributeName value:@[@(NSWritingDirectionRightToLeft)] range:NSMakeRange(0, self.length)];
}

#pragma mark 改变某位置的行距
- (void)ba_changeLineSpacing:(CGFloat)spacing
                           from:(NSInteger)loc
                          length:(NSInteger)length
{
    NSRange range = NSMakeRange(loc, length);
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    /*! 行距 */
    style.lineSpacing = spacing;
    [self addAttribute:NSParagraphStyleAttributeName value:style range:range];
}

/*! 改变某位置的段落距离 */
- (void)ba_changeParagraphSpacing:(CGFloat)spacing
                                 from:(NSInteger)loc
                                length:(NSInteger)length
{
    NSRange range = NSMakeRange(loc, length);
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    /*! 段落距离 */
    style.paragraphSpacing = spacing;
    [self addAttribute:NSParagraphStyleAttributeName value:style range:range];
}

#pragma mark 改变段落的顶部和文本内容的开头之间的距离
- (void)ba_changeBeforeLparagraphSpacing:(CGFloat)spacing
                                      from:(NSInteger)loc
                                     length:(NSInteger)length
{
    NSRange range = NSMakeRange(loc, length);
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    /*! 段落的顶部和文本内容的开头之间的距离 */
    style.paragraphSpacingBefore = spacing;
    [self addAttribute:NSParagraphStyleAttributeName value:style range:range];
}

#pragma mark 设置下划线样式：根据枚举选择
- (void)ba_changeUnderlineStyle:(NSUnderlineStyle)style color:(UIColor *)color Range:(NSRange)range
{
    [self addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:style] range:range];
    [self addAttribute:NSUnderlineColorAttributeName value:color range:range];
}

#pragma mark 全部加下划线 设置下划线样式：根据枚举选择
- (void)ba_changeUnderlineAtAllStyle:(NSUnderlineStyle)style color:(UIColor *)color
{
    NSRange range = NSMakeRange(0, self.length);
    [self ba_changeUnderlineStyle:style color:color Range:range];
}

#pragma mark 设置删除线样式：根据枚举选择
- (void)ba_changeStrikethroughStyle:(NSUnderlineStyle)style color:(UIColor *)color Range:(NSRange)range
{
    [self addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:style] range:range];
    [self addAttribute:NSStrikethroughColorAttributeName value:color range:range];
}

#pragma mark 全部添加删除线 设置删除线样式：根据枚举选择
- (void)ba_changeStrikethroughAtAllStyle:(NSUnderlineStyle)style color:(UIColor *)color
{
    NSRange range = NSMakeRange(0, self.length);
    [self ba_changeStrikethroughStyle:style color:color Range:range];
}

#pragma mark 设定字符间距，取值为 NSNumber 对象（整数），正值间距加宽，负值间距变窄 
- (void)ba_changeKernWithValue:(NSNumber *)value Range:(NSRange)range
{
    [self addAttribute:NSKernAttributeName value:value range:range];
}

#pragma mark 根据位置设置文本横向拉伸属性，取值为 NSNumber （float）,正值横向拉伸文本，负值横向压缩文本
- (void)ba_changeExpansionWithValue:(NSNumber *)value Range:(NSRange)range
{
    [self addAttribute:NSExpansionAttributeName value:value range:range];
}

#pragma mark 根据位置添加阴影效果
- (void)ba_changeShadowWithShadow:(NSShadow *)shadow Range:(NSRange)range
{
    [self addAttribute:NSShadowAttributeName value:shadow range:range];
    /*! 排版 */
    [self addAttribute:NSVerticalGlyphFormAttributeName value:@(0) range:range];
}

#pragma mark 根据位置修改描边颜色 垂直标志符号形式
- (void)ba_changeStrokeColorWithColor:(UIColor *)strokeColor
                             strokeWidth:(NSNumber *)strokeWidth
                                   Range:(NSRange)range
{
    [self addAttribute:NSStrokeColorAttributeName value:strokeColor range:range];
    [self addAttribute:NSStrokeWidthAttributeName value:strokeWidth range:range];
}

- (instancetype)initWithStrings:(NSArray <NSString *>*)texts
                attributesArray:(NSArray <NSDictionary<NSString *,id>*>*)attrsArray
                          space:(NSArray <NSNumber *>*)space
{
    if (self = [super init])
    {
        
    }
    return [self go:texts andAttributesArray:attrsArray space:space];
}

- (instancetype)go:(NSArray *)textArray andAttributesArray:(NSArray *)attrsArray space:(NSArray<NSNumber *> *)space
{
    __block NSMutableAttributedString *string = [[NSMutableAttributedString alloc]init];
    
    __weak typeof(self)weakSelf = self;
    [textArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        NSUInteger attrsCount = attrsArray.count;
        if (idx <= (attrsCount-1) )
        {
            [string appendAttributedString:[strongSelf initWithString:obj attributes:attrsArray[idx]]];
        }
        else
        {
            [string appendAttributedString:[strongSelf initWithString:obj attributes:attrsArray[attrsCount-1]]];
        }
        
        if (idx != textArray.count-1 && idx <= space.count-1)
        {
            [string appendAttributedString:[self spaceWidthWithNumberBlackSpace:space[idx]]];
        }
        else
        {
            [string appendAttributedString:[self spaceWidthWithNumberBlackSpace:0]];
        }
    }];
    
    return string;
}

- (NSMutableAttributedString *)spaceWidthWithNumberBlackSpace:(NSNumber *)number
{
    NSString *string = @"";
    NSUInteger count = [number integerValue];
    for (NSUInteger i = 0;i < count ; i++)
    {
        string = [string stringByAppendingFormat:@" "];
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:string];
    return attributedString;
}

@end
