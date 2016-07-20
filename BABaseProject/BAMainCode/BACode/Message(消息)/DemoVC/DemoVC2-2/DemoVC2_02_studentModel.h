//
//  DemoVC2_02_studentModel.h
//  BABaseProject
//
//  Created by 博爱 on 16/7/20.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DemoVC2_02_studentModel : NSObject

@property (nonatomic, strong) NSString  *name;
@property (nonatomic, strong) NSNumber  *age;

- (void)setValue:(id)value forUndefinedKey:(NSString *)key;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;


@end
