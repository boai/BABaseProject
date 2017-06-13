//
//  NSString+BAUIButton.m
//  BAKit
//
//  Created by boai on 2017/6/7.
//  Copyright © 2017年 boai. All rights reserved.
//


#import "NSString+BAUIButton.h"

@implementation NSString (BAUIButton)

/**
 给 button 添加下划线
 
 @param button button
 @param range button 的 title 需要加下划线的地方
 @param lineColor 下划线颜色
 */
+ (void)ba_stringToBeUnderlineWithButton:(UIButton *)button
                                   range:(NSRange)range
                               lineColor:(UIColor *)lineColor
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:button.titleLabel.text];
    [str addAttribute:NSUnderlineColorAttributeName value:lineColor range:range];
    [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:range];
    [button setAttributedTitle:str forState:UIControlStateNormal];
}

/**
 给 button 添加下划线
 
 @param button button
 @param range button 的 title 需要加下划线的地方
 @param lineColor 下划线颜色
 @param controlstate UIControlState
 */
+ (void)ba_stringToBeUnderlineWithButton:(UIButton *)button
                                   range:(NSRange)range
                               lineColor:(UIColor *)lineColor
                            controlstate:(UIControlState)controlstate
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:button.titleLabel.text];
    [str addAttribute:NSUnderlineColorAttributeName value:lineColor range:range];
    [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:range];
    [button setAttributedTitle:str forState:controlstate];
}

@end
