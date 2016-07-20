//
//  DemoVC2_02_classModel.m
//  BABaseProject
//
//  Created by 博爱 on 16/7/20.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC2_02_classModel.h"

@implementation DemoVC2_02_classModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{

}

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([value isKindOfClass:[NSNull class]]) return;
    if ([key isEqualToString:@"students"] && [value isKindOfClass:[NSArray class]])
    {
        NSArray *tmp = value;
        NSMutableArray *dataArray = @[].mutableCopy;
        
        [tmp enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            DemoVC2_02_studentModel *model = [[DemoVC2_02_studentModel alloc] initWithDictionary:obj];
            [dataArray addObject:model];
        }];
        value = dataArray;
    }
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
