//
//  NSObject+BAMJParse.h
//  BABaseProject
//
//  Created by apple on 16/1/14.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@interface NSObject (BAMJParse)

/*
 MJExtension 解析数组和字典需要使用不同的方法.
 我们自己合并,用代码判断
 */

+ (id)BAMJParse:(id)responseObj;


@end
