//
//  NSObject+BAMJParse.m
//  BABaseProject
//
//  Created by apple on 16/1/14.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "NSObject+BAMJParse.h"

@implementation NSObject (BAMJParse)

/** MJExtension是从属性名 -> key */
/*
 如果 key 就是 desc, 那么下方代码自动切换为description则出错
 */

/*
+ (NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName
{
    if ([propertyName isEqualToString:@"ID"])
    {
        propertyName = @"id";
    }
    if ([propertyName isEqualToString:@"desc"])
    {
        propertyName = @"description";
    }
    // ...
    return propertyName;
}
*/
 
+ (id)BAMJParse:(id)responseObj
{
    if ([responseObj isKindOfClass:[NSArray class]])
    {
        return [self mj_objectArrayWithKeyValuesArray:responseObj];
    }
    if ([responseObj isKindOfClass:[NSDictionary class]])
    {
        return [self mj_objectWithKeyValues:responseObj];
    }
    
    return responseObj;
}




@end
