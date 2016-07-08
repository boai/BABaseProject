//
//  UIView+BARotateAnimationProtocol.h
//  BABaseProject
//
//  Created by 博爱 on 16/7/7.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UIView (BARotateAnimationProtocol)

/*!
 *  在初始化的时候保存transform的值
 */
@property (nonatomic) CGAffineTransform defaulfTransform;

/*!
 *  旋转的动画时间
 */
@property (nonatomic) CGFloat rotateDuration;

@end
