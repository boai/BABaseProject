//
//  BAVideoModel.m
//  BABaseProject
//
//  Created by apple on 16/1/13.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BAVideoModel.h"

@implementation BAVideoModel

+ (NSDictionary *)objectClassInArray{
    return @{@"videoSidList" : [Videosidlist class], @"videoList" : [Videolist class]};
}

@end

@implementation Videosidlist

@end


@implementation Videolist

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
