//
//  NSString+BARegular.m
//  BAKit
//
//  Created by boai on 2017/6/7.
//  Copyright © 2017年 boai. All rights reserved.
//


#import "NSString+BARegular.h"

@implementation NSString (BARegular)

- (NSTextCheckingResult *)ba_regularFirstMacthWithPattern:(NSString *)pattern
{
    //正则表达式的创建很容易失败，注意捕获错误
    NSError *error = nil;
    //根据正则表达式创建实例
    NSRegularExpression *regular = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    if ( error)
    {
        NSLog(@"正则表达式创建失败");
        
        return nil;
    }
    //匹配出结果
    NSTextCheckingResult *result =   [regular firstMatchInString:self options:0 range:NSMakeRange(0, self.length)];
    
    if ( result)
    {
        NSLog(@"匹配");
        return result;
    }else
    {
        NSLog(@"不匹配");
        return nil;
    }
}

- (NSArray <NSTextCheckingResult *> *)ba_regularMachesWithPattern:(NSString *)pattern
{
    NSError *error = nil;
    NSRegularExpression *expression = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    if (error)
    {
        NSLog(@"正则表达式创建失败");
        return nil;
    }
    return [expression matchesInString:self options:0 range:NSMakeRange(0, self.length)];
}

@end
