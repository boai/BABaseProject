//
//  BAAutoSizeWithWH.h
//  BABaseProject
//
//  Created by 博爱 on 16/5/6.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BAAutoSizeWithWH : NSObject

/*!
 
 在自定义文字高度那
 高度用
 参数一:需要存的文字,
 参数二:字体大小
 参数三:需要的字体宽度
 CGFloat labelHeight = [ZIshiyinggaodu AutoSizeOfHeightWithText:self.cellContent.descriptionF andFont:[UIFont systemFontOfSize:15] andLabelWidth:self.contentView.frame.size.width - 20]; 接收一下
 图片高度
 CGFloat photoHeight = ([参数高 floatValue] /[self.参数款 floatValue]) * (view宽 - 20);
 
 
 lable返回高度:
 文字高度+图片高度+加需要的间距;
 return siteViewHeight + textHeight + (30);
 
 */


/*!
 *  自适应label的高度
 *
 *  @param text  内容
 *  @param font  字体大小
 *  @param width 宽度
 *
 *  @return label的高度
 */
+ (CGSize)BA_AutoSizeOfHeghtWithText:(NSString *)text font:(UIFont *)font width:(CGFloat)width;

/*!
 *  自适应label的宽度
 *
 *  @param text  内容
 *  @param font  字体大小
 *  @param width 高度
 *
 *  @return label的宽度
 */
+ (CGSize)BA_AutoSizeOfWidthWithText:(NSString *)text font:(UIFont *)font height:(CGFloat)height;

@end
