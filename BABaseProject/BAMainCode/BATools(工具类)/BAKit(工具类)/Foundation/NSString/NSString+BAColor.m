//
//  NSString+BAColor.m
//  BAKit
//
//  Created by boai on 2017/6/7.
//  Copyright © 2017年 boai. All rights reserved.
//


#import "NSString+BAColor.h"

@implementation NSString (BAColor)

#pragma mark - 随机颜色（十六进制）
/*!
 *  获取十六进制的随机颜色
 *
 *  @return 十六进制的随机颜色
 */
+ (NSString *)ba_stringRandomColor
{
    NSString *colorString = @"";
    NSArray *colorArray = @[@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9",@"a", @"b", @"c", @"d", @"e", @"f"];
    
    for (NSInteger i= 0; i < 6; i++)
    {
        int r = arc4random()%colorArray.count;
        NSString *string = colorArray[r];
        colorString = [NSString stringWithFormat:@"%@%@", colorString, string];
//        NSLog(@"随机颜色为3：%@", colorString);
    }
//    NSLog(@"随机颜色为：%@", colorString);
    return colorString;
}

@end
