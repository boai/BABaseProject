//
//  NSDateFormatter+BAKit.m
//  BABaseProject
//
//  Created by 博爱 on 16/7/18.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "NSDateFormatter+BAKit.h"

@implementation NSDateFormatter (BAKit)

+ (id)ba_dateFormatter
{
    return [[self alloc] init];
}

+ (id)ba_dateFormatterWithFormat:(NSString *)dateFormat
{
    NSDateFormatter *dateFormatter = [[self alloc] init];
    dateFormatter.dateFormat = dateFormat;
    return dateFormatter;
}

+ (id)ba_defaultDateFormatter
{
    return [self ba_dateFormatterWithFormat:@"yyyy-MM-dd HH:mm:ss"];
}

@end
