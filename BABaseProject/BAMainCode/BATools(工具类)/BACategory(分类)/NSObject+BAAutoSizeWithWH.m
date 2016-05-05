//
//  NSObject+BAAutoSizeWithWH.m
//  BABaseProject
//
//  Created by 博爱 on 16/5/5.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "NSObject+BAAutoSizeWithWH.h"

@implementation NSObject (BAAutoSizeWithWH)

/*!
 *  自适应label的高度
 *
 *  @param text  内容
 *  @param font  字体大小
 *  @param width 宽度
 *
 *  @return label的高度
 */
+ (CGFloat)BA_AutoSizeOfHeghtWithText:(NSString *)text font:(UIFont *)font width:(CGFloat)width
{
    CGSize size = CGSizeMake(width, MAXFLOAT);
    NSDictionary *attributesDic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,nil];
    CGRect frame = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributesDic context:nil];
    
    return frame.size.height;
}

/*!
 *  自适应label的宽度
 *
 *  @param text  内容
 *  @param font  字体大小
 *  @param width 高度
 *
 *  @return label的宽度
 */
+ (CGFloat)BA_AutoSizeOfWidthWithText:(NSString *)text font:(UIFont *)font height:(CGFloat)height
{
    CGSize size = CGSizeMake(MAXFLOAT, height);
    NSDictionary *attributesDic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,nil];
    CGRect frame = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributesDic context:nil];
    
    return frame.size.width;
}

@end
