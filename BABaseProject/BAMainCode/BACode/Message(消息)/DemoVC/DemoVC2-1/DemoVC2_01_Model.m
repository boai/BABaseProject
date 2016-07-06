//
//  DemoVC2_01_Model.m
//  BABaseProject
//
//  Created by 博爱 on 16/6/28.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC2_01_Model.h"

@interface DemoVC2_01_Model ()

@property (nonatomic) CGFloat   expendStringHeight;
@property (nonatomic) CGFloat   normalStringHeight;

@end

@implementation DemoVC2_01_Model

/*!
 *  返回展开的高度
 *
 *  @param attribute 字体样式
 *  @param width     宽度
 */
- (void)calculateTheExpendStringHeightWithStringAttribute:(NSDictionary <NSString *, id> *)attribute fixedWidth:(CGFloat)width
{
    self.expendStringHeight = 10 + [self.contentString ba_heightWithStringAttribute:attribute fixedWidth:width] + 10;
}

/*!
 *  返回正常的高度
 *
 *  @param attribute 字体样式
 *  @param width     宽度
 */
- (void)calculateTheNormalStringHeightWithStringAttribute:(NSDictionary <NSString *, id> *)attribute fixedWidth:(CGFloat)width
{
    CGFloat oneLineHeight = [NSString ba_oneLineOfTextHeightWithStringAttribute:attribute];
    CGFloat textHeight = [self.contentString ba_heightWithStringAttribute:attribute fixedWidth:width];
    
    CGFloat normalTextHeight = textHeight >= 3 * oneLineHeight ? 3 * oneLineHeight : textHeight;
    self.normalStringHeight = 10 + normalTextHeight + 10;
}


@end
