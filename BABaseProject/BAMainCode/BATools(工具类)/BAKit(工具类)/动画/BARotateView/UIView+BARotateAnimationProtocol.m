//
//  UIView+BARotateAnimationProtocol.m
//  BABaseProject
//
//  Created by 博爱 on 16/7/7.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "UIView+BARotateAnimationProtocol.h"
#import <objc/runtime.h>

static NSString * const _recognizerRotateDuation = @"_recognizerRotateDuation";
static NSString * const _recognizerDefaultTransform = @"_recognizerDefaultTransform";

@implementation UIView (BARotateAnimationProtocol)

- (void)setRotateDuration:(CGFloat)rotateDuration
{
    NSNumber *value = @(rotateDuration);
    objc_setAssociatedObject(self, (__bridge const void *)(_recognizerRotateDuation), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)rotateDuration
{
    NSNumber *value = objc_getAssociatedObject(self, (__bridge const void *)(_recognizerRotateDuation));
    return [value floatValue];
}

- (void)setDefaulfTransform:(CGAffineTransform)defaulfTransform
{
    NSValue *value = [NSValue valueWithCGAffineTransform:defaulfTransform];
    objc_setAssociatedObject(self, (__bridge const void *)(_recognizerDefaultTransform), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGAffineTransform)defaulfTransform
{
    NSValue *value = objc_getAssociatedObject(self, (__bridge const void *)(_recognizerDefaultTransform));
    return [value CGAffineTransformValue];
}

@end
