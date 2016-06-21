
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
#import "NSNumber+BAKit.h"

@implementation NSNumber (BAKit)
#if __cplusplus
extern "C" {
#endif
    /* 角度转成弧度 */
    CGFloat DegreesToRadians(CGFloat degrees) {return degrees * M_PI / 180;};
    /* 弧度转成角度 */
    CGFloat RadiansToDegrees(CGFloat radians) {return radians * 180 / M_PI;};
#if _cplusplus
}
#endif

/* 创建在给定范围之间的随机整数 */
+ (NSInteger)randomIntBetweenMin:(NSInteger)minValue
                          andMax:(NSInteger)maxValue
{
    return (NSInteger)(minValue + [self randomFloat] * (maxValue - minValue));
}

/* 创建一个随机浮点值 */
+ (CGFloat)randomFloat
{
    return (float) arc4random() / UINT_MAX;
}

/* 创建在给定范围之间的随机浮点数 */
+ (CGFloat)randomFloatBetweenMin:(CGFloat)minValue
                          andMax:(CGFloat)maxValue
{
    return (((float) (arc4random() % ((unsigned)RAND_MAX + 1)) / RAND_MAX) * (maxValue - minValue)) + minValue;
}

+ (NSNumber *)numberWithString:(NSString *)string {
    NSString *str = [[string stringByTrim] lowercaseString];
    if (!str || !str.length) {
        return nil;
    }
    
    static NSDictionary *dic;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dic = @{@"true" :   @(YES),
                @"yes" :    @(YES),
                @"false" :  @(NO),
                @"no" :     @(NO),
                @"nil" :    [NSNull null],
                @"null" :   [NSNull null],
                @"<null>" : [NSNull null]};
    });
    id num = dic[str];
    if (num) {
        if (num == [NSNull null]) return nil;
        return num;
    }
    
    // hex number
    int sign = 0;
    if ([str hasPrefix:@"0x"]) sign = 1;
    else if ([str hasPrefix:@"-0x"]) sign = -1;
    if (sign != 0) {
        NSScanner *scan = [NSScanner scannerWithString:str];
        unsigned num = -1;
        BOOL suc = [scan scanHexInt:&num];
        if (suc)
            return [NSNumber numberWithLong:((long)num * sign)];
        else
            return nil;
    }
    // normal number
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    return [formatter numberFromString:string];
}


@end
