
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

@import UIKit;

@interface UIColor (BAKit)

/*!
 *  返回一个RGBA格式的UIColor对象
 */
#define KRGBA(r, g, b, a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

/*!
 *  返回一个RGB格式的UIColor对象
 */
#define KRGB(r, g, b) RGBA(r, g, b, 1.0f)

/*!
 *  从HEX字符串得到一个UIColor对象
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

/*!
 *  获取字符，转换数据类型，改变部分字体颜色
 *
 *  @param string string
 *  @param start  开始位置
 *  @param length 截取长度
 *
 *  @return float
 */
+ (CGFloat)colorComponentFrom:(NSString *)string
                        start:(NSUInteger)start
                       length:(NSUInteger)length;

/*!
 *  从HEX数值得到一个UIColor对象
 */
+ (UIColor *)colorWithHex:(unsigned int)hex;

/*!
 *  从HEX数值和Alpha数值得到一个UIColor对象
 */
+ (UIColor *)colorWithHex:(unsigned int)hex
                    alpha:(float)alpha;

/*!
 *  创建一个随机UIColor对象
 */
+ (UIColor *)randomColor;

/*!
 *  从已知UIColor对象和Alpha对象得到一个UIColor对象
 */
+ (UIColor *)colorWithColor:(UIColor *)color
                      alpha:(float)alpha;

/*!
 *  UIColor 转UIImage
 *
 *  @param color color
 *
 *  @return UIColor 转UIImage
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

@end
