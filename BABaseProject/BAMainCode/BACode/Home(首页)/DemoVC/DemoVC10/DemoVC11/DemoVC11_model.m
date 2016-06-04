//
//  DemoVC11_model.m
//  BABaseProject
//
//  Created by 博爱 on 16/6/1.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC11_model.h"

@implementation DemoVC11_model

/** 通过下方方法更换某些属性对应的key */
//propertyName :属性名
//返回 属性名 所对应的 key

+ (NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName
{
    if ([propertyName isEqualToString:@"desc"])
    {
        propertyName = @"description";
    }
    return propertyName;
}

@end
