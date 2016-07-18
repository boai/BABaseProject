//
//  NSDateFormatter+BAKit.h
//  BABaseProject
//
//  Created by 博爱 on 16/7/18.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (BAKit)

+ (id)ba_dateFormatter;

+ (id)ba_dateFormatterWithFormat:(NSString *)dateFormat;

+ (id)ba_defaultDateFormatter;/*yyyy-MM-dd HH:mm:ss*/


@end
