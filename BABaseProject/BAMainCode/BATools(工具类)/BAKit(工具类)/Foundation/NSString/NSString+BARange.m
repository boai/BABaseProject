//
//  NSString+BARange.m
//  BAKit
//
//  Created by boai on 2017/6/7.
//  Copyright © 2017年 boai. All rights reserved.
//


#import "NSString+BARange.h"

@implementation NSString (BARange)

/**
  * 在接收器的给定范围内查找并返回给定字符串的范围
  *
  * @param searchString searchString。
  * @param options 指定搜索选项的掩码。 可以通过将它们与C位OR运算符组合来指定以下选项：NSCaseInsensitiveSearch，NSLiteralSearch，NSBackwardsSearch，NSAnchoredSearch。 有关这些选项的详细信息，请参阅“String Programming Guide”
  * @param serachRange serachRange
  *
  * @return 范围
  */
- (NSArray <NSValue *> *)ba_rangesOfString:(NSString *)searchString
                                   options:(NSStringCompareOptions)options
                               serachRange:(NSRange)serachRange
{
    if (serachRange.location == NSNotFound)
    {
        serachRange = NSMakeRange(0, self.length);
    }
    NSMutableArray *array = [NSMutableArray array];
    [self ba_rangeOfString:searchString range:serachRange array:array options:options];
    
    return array;
}

- (void)ba_rangeOfString:(NSString *)searchString
                   range:(NSRange)searchRange
                   array:(NSMutableArray *)array
                 options:(NSStringCompareOptions)mask
{
    
    NSRange range = [self rangeOfString:searchString options:mask range:searchRange];
    
    if (range.location != NSNotFound)
    {
        
        [array addObject:[NSValue valueWithRange:range]];
        [self ba_rangeOfString:searchString
                         range:NSMakeRange(range.location + range.length, self.length - (range.location + range.length))
                         array:array
                       options:mask];
    }
}

@end
