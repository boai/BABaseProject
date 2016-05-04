//
//  CALayer+BAMaskLayer.h
//  BABaseProject
//
//  Created by 博爱 on 16/5/4.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (BAMaskLayer)

/**
 *  根据PNG图片创建出用于mask的layer
 *
 *  @param size  mask的尺寸
 *  @param image 用于mask的图片
 *
 *  @return 创建好的mask的layer
 */
+ (CALayer *)createMaskLayerWithSize:(CGSize)size maskPNGImage:(UIImage *)image;

@end
