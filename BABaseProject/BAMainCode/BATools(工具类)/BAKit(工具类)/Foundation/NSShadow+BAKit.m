//
//  NSShadow+BAKit.m
//  test
//
//  Created by boai on 2016/10/12.
//  Copyright © 2016年 博爱. All rights reserved.
//

#import "NSShadow+BAKit.h"

@implementation NSShadow (BAKit)

static NSShadow *_insetControlShadow = nil;

- (NSShadow *)ba_shadowWithColor:(UIColor *)shadowColor
                    shadowOffset:(CGSize)shadowSize
                shadowBlurRadius:(CGFloat)shadowBlurRadius
{
    if (_insetControlShadow == nil)
    {
        _insetControlShadow = [[NSShadow alloc] init];
        _insetControlShadow.shadowColor = shadowColor;
        _insetControlShadow.shadowOffset = shadowSize;
        _insetControlShadow.shadowBlurRadius = shadowBlurRadius;
    }
    return _insetControlShadow;
}

@end
