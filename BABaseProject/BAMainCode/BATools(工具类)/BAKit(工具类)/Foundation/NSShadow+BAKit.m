//
//  NSShadow+BAKit.m
//  test
//
//  Created by boai on 2016/10/12.
//  Copyright © 2016年 博爱. All rights reserved.
//

#import "NSShadow+BAKit.h"

@implementation NSShadow (BAKit)

- (void)ba_shadowWithColor:(UIColor *)shadowColor
              shadowOffset:(CGSize)shadowSize
          shadowBlurRadius:(CGFloat)shadowBlurRadius
{
    self.shadowColor = shadowColor;
    self.shadowOffset = shadowSize;
    self.shadowBlurRadius = shadowBlurRadius;
}

@end
