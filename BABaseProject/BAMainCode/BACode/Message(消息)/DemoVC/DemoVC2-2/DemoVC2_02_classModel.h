//
//  DemoVC2_02_classModel.h
//  BABaseProject
//
//  Created by 博爱 on 16/7/20.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DemoVC2_02_studentModel.h"

@interface DemoVC2_02_classModel : NSObject

@property (nonatomic, strong) NSString *className;
@property (nonatomic, strong) NSArray <DemoVC2_02_studentModel *>*students;

#pragma mark - 额外的数据
@property (nonatomic) BOOL  expend;


- (void)setValue:(id)value forUndefinedKey:(NSString *)key;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
