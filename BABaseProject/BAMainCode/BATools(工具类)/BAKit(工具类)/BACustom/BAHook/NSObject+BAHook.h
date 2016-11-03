//
//  NSObject+BAHook.h
//  testDemo
//
//  Created by 博爱 on 2016/11/2.
//  Copyright © 2016年 DS-Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (BAHook)

/*!
 *  替换两个方法
 *
 *  @param originalSelector 原始方法
 *  @param swizzledSelector 替换的方法
 */
+ (void)ba_swizzlingOriginalSelector:(SEL)originalSelector
                    swizzledSelector:(SEL)swizzledSelector;

@end
