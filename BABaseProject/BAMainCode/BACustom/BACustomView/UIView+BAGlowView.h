//
//  UIView+BAGlowView.h
//  BABaseProject
//
//  Created by 博爱 on 16/5/4.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (BAGlowView)

@property (nonatomic, strong) NSNumber *GCDTimerInterval; // 定时器的时间间隔，给float值
@property (nonatomic, strong) NSNumber *glowDuration;     // layer动画的时间长度，给float值
@property (nonatomic, strong) NSNumber *glowLayerOpacity; // 设置glowLayer的动画透明度的程度，给float值，范围在[0,1]

- (void)createGlowLayerWithColor:(UIColor *)color glowRadius:(CGFloat)radius;
- (void)startGlow;
- (void)glowToGlowLayerOnce;
- (void)glowToNormalLayerOnce;

@end
