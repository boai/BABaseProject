//
//  DemoVC2_01_Model.h
//  BABaseProject
//
//  Created by 博爱 on 16/6/28.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DemoVC2_01_Model : NSObject

@property (nonatomic, strong  ) NSString  *contentString;

@property (nonatomic, readonly) CGFloat    expendStringHeight;
@property (nonatomic, readonly) CGFloat    normalStringHeight;

/*!
 *  返回展开的高度
 *
 *  @param attribute 字体样式
 *  @param width     宽度
 */
- (void)calculateTheExpendStringHeightWithStringAttribute:(NSDictionary <NSString *, id> *)attribute fixedWidth:(CGFloat)width;

/*!
 *  返回正常的高度
 *
 *  @param attribute 字体样式
 *  @param width     宽度
 */
- (void)calculateTheNormalStringHeightWithStringAttribute:(NSDictionary <NSString *, id> *)attribute fixedWidth:(CGFloat)width;


@end
