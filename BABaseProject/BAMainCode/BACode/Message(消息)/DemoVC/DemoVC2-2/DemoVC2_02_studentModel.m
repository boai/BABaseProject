//
//  DemoVC2_02_studentModel.m
//  BABaseProject
//
//  Created by 博爱 on 16/7/20.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC2_02_studentModel.h"

@implementation DemoVC2_02_studentModel


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([value isKindOfClass:[NSNull class]]) return;
    [super setValue:value forKey:key];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    if ([dictionary isKindOfClass:[NSDictionary class]])
    {
        if (self = [super init])
        {
            [self setValuesForKeysWithDictionary:dictionary];
        }
        return self;
    }
    else return nil;
}

@end
