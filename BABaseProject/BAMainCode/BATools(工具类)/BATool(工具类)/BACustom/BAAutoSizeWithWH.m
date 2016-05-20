//
//  BAAutoSizeWithWH.m
//  BABaseProject
//
//  Created by 博爱 on 16/5/6.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BAAutoSizeWithWH.h"

@implementation BAAutoSizeWithWH

/*!
 *  自适应label的高度
 *
 *  @param text  内容
 *  @param font  字体大小
 *  @param width 宽度
 *
 *  @return label的高度
 */
+ (CGSize)BA_AutoSizeOfHeghtWithText:(NSString *)text font:(UIFont *)font width:(CGFloat)width
{
    CGSize size = CGSizeMake(width, MAXFLOAT);
    //    NSDictionary *attributesDic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,nil];
    //    CGRect frame = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributesDic context:nil];
    //
    //
    // iOS7以后使用boundingRectWithSize，之前使用sizeWithFont
    // 多行必需使用NSStringDrawingUsesLineFragmentOrigin，网上有人说不是用NSStringDrawingUsesFontLeading计算结果不对
    NSStringDrawingOptions opts = NSStringDrawingUsesLineFragmentOrigin |
    NSStringDrawingUsesFontLeading;
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineBreakMode:NSLineBreakByCharWrapping];
    
    NSDictionary *attributes = @{ NSFontAttributeName : font, NSParagraphStyleAttributeName : style };
    
    CGRect rect = [text boundingRectWithSize:size
                                     options:opts
                                  attributes:attributes
                                     context:nil];
    return rect.size;
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
+ (CGSize)BA_AutoSizeOfWidthWithText:(NSString *)text font:(UIFont *)font height:(CGFloat)height
{
    CGSize size = CGSizeMake(MAXFLOAT, height);
    //    NSDictionary *attributesDic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,nil];
    //    CGRect frame = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributesDic context:nil];
    
    // iOS7以后使用boundingRectWithSize，之前使用sizeWithFont
    // 多行必需使用NSStringDrawingUsesLineFragmentOrigin，网上有人说不是用NSStringDrawingUsesFontLeading计算结果不对
    NSStringDrawingOptions opts = NSStringDrawingUsesLineFragmentOrigin |
    NSStringDrawingUsesFontLeading;
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineBreakMode:NSLineBreakByCharWrapping];
    
    NSDictionary *attributes = @{ NSFontAttributeName : font, NSParagraphStyleAttributeName : style };
    
    CGRect rect = [text boundingRectWithSize:size
                                     options:opts
                                  attributes:attributes
                                     context:nil];
    return rect.size;
}


@end
