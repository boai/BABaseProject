//
//  CALayer+BAMaskLayer.m
//  BABaseProject
//
//  Created by 博爱 on 16/5/4.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "CALayer+BAMaskLayer.h"

@implementation CALayer (BAMaskLayer)

+ (CALayer *)createMaskLayerWithSize:(CGSize)size maskPNGImage:(UIImage *)image
{
    CALayer *layer = [CALayer layer];
    // 重置锚点
    layer.anchorPoint = CGPointMake(0, 0);
    // 设置尺寸
    layer.bounds = CGRectMake(0, 0, size.width, size.height);
    if (image)
    {
        layer.contents = (__bridge id)(image.CGImage);
    }
    return layer;
}

@end
