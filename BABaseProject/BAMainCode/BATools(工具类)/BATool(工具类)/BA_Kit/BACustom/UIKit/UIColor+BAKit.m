
/*!
 *  @header BAKit
 *          demoTest
 *
 *  @brief  BAKit
 *
 *  @author 博爱
 *  @copyright    Copyright © 2016年 博爱. All rights reserved.
 *  @version    V1.0
 */

/*!
 *
 *          ┌─┐       ┌─┐
 *       ┌──┘ ┴───────┘ ┴──┐
 *       │                 │
 *       │       ───       │
 *       │  ─┬┘       └┬─  │
 *       │                 │
 *       │       ─┴─       │
 *       │                 │
 *       └───┐         ┌───┘
 *           │         │
 *           │         │
 *           │         │
 *           │         └──────────────┐
 *           │                        │
 *           │                        ├─┐
 *           │                        ┌─┘
 *           │                        │
 *           └─┐  ┐  ┌───────┬──┐  ┌──┘
 *             │ ─┤ ─┤       │ ─┤ ─┤
 *             └──┴──┘       └──┴──┘
 *                 神兽保佑
 *                 代码无BUG!
 */

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
 *********************************************************************************
 
 */

#import "UIColor+BAKit.h"

@implementation UIColor (BAKit)

/*  从HEX字符串得到一个UIColor对象 */
+ (UIColor *)colorWithHexString:(NSString *)hexString
{
    // 获取目标字符串，替换字符并转换成大写字符串
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString:@"#"
                                                                  withString:@""] uppercaseString];
    CGFloat alpha, red, blue, green;
    switch([colorString length])
    {
        case 3: // #RGB
            alpha = 1.0f;
            red   = [self colorComponentFrom:colorString
                                       start:0
                                      length:1];
            green = [self colorComponentFrom:colorString
                                       start:1
                                      length:1];
            blue  = [self colorComponentFrom:colorString
                                       start:2
                                      length:1];
            break;
        case 4: // #ARGB
            alpha = [self colorComponentFrom:colorString
                                       start:0
                                      length:1];
            red   = [self colorComponentFrom:colorString
                                       start:1
                                      length:1];
            green = [self colorComponentFrom:colorString
                                       start:2
                                      length:1];
            blue  = [self colorComponentFrom:colorString
                                       start:3
                                      length:1];
            break;
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = [self colorComponentFrom:colorString
                                       start:0
                                      length:2];
            green = [self colorComponentFrom:colorString
                                       start:2
                                      length:2];
            blue  = [self colorComponentFrom:colorString
                                       start:4
                                      length:2];
            break;
        case 8: // #AARRGGBB
            alpha = [self colorComponentFrom:colorString
                                       start:0
                                      length:2];
            red   = [self colorComponentFrom:colorString
                                       start:2
                                      length:2];
            green = [self colorComponentFrom:colorString
                                       start:4
                                      length:2];
            blue  = [self colorComponentFrom:colorString
                                       start:6
                                      length:2];
            break;
        default: // 抛出异常
            [NSException raise:@"无效的颜色值"
                        format:@"颜色值%@是无效的. 正确的格式是#RBG、#ARGB、#RRGGBB或#AARRGGBB", hexString];
            break;
    }
    return [UIColor colorWithRed:red
                           green:green
                            blue:blue
                           alpha:alpha];
}

/* 获取字符，转换数据类型 */
+ (CGFloat)colorComponentFrom:(NSString *)string
                        start:(NSUInteger)start
                       length:(NSUInteger)length
{
    // 截取字符
    NSString *substring = [string substringWithRange:NSMakeRange(start, length)];
    NSString *doubleSubstring = [NSString stringWithFormat:@"%@%@", substring, substring];
    NSString *fullHex = (length == 2 ? substring : doubleSubstring);
    unsigned hexComponent;
    // 字符转成hex，可选前缀为“0x”或“ 0X ”
    [[NSScanner scannerWithString:fullHex] scanHexInt:&hexComponent];
    
    return hexComponent / 255.0;
}

/*  从HEX数值得到一个UIColor对象 */
+ (id)colorWithHex:(unsigned int)hex
{
    return [UIColor colorWithHex:hex
                           alpha:1.0];
}

/*  从HEX数值和Alpha数值得到一个UIColor对象 */
+ (id)colorWithHex:(unsigned int)hex
             alpha:(float)alpha
{
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0
                           green:((float)((hex & 0xFF00) >> 8)) / 255.0
                            blue:((float)(hex & 0xFF)) / 255.0
                           alpha:alpha];
}

/* 创建一个随机UIColor对象 */
+ (UIColor *)randomColor
{
    int r = arc4random() % 255;
    int g = arc4random() % 255;
    int b = arc4random() % 255;
    
    return [UIColor colorWithRed:r/255.0
                           green:g/255.0
                            blue:b/255.0
                           alpha:1.0];
}

/*  从已知UIColor对象和Alpha对象得到一个UIColor对象 */
+ (UIColor *)colorWithColor:(UIColor *)color
                      alpha:(float)alpha
{
    if([color isEqual:[UIColor whiteColor]])
        return [UIColor colorWithWhite:1.000
                                 alpha:alpha];
    if([color isEqual:[UIColor blackColor]])
        return [UIColor colorWithWhite:0.000
                                 alpha:alpha];
    
    // 使用CGColorGetComponents方法，获取'color'关联的颜色组件
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    return [UIColor colorWithRed:components[0]
                           green:components[1]
                            blue:components[2]
                           alpha:alpha];
}

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha
{
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

// UIColor 转UIImage
+ (UIImage*) imageWithColor: (UIColor*) color
{
    CGRect rect=CGRectMake(0,0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


@end
