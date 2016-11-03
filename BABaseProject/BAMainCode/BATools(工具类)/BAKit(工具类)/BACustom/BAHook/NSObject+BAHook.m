//
//  NSObject+BAHook.m
//  testDemo
//
//  Created by 博爱 on 2016/11/2.
//  Copyright © 2016年 DS-Team. All rights reserved.
//

#import "NSObject+BAHook.h"
#import <objc/runtime.h>

@implementation NSObject (BAHook)

/*!
 *  替换两个方法
 *
 *  @param originalSelector 原始方法
 *  @param swizzledSelector 替换的方法
 */
+ (void)ba_swizzlingOriginalSelector:(SEL)originalSelector
                    swizzledSelector:(SEL)swizzledSelector
{
    Class class = [self class];
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod =
    class_addMethod(class,
                    originalSelector,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod)
    {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    }
    else
    {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end
