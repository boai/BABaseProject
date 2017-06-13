//
//  NSFileManager+BAKit.h
//  BAKit
//
//  Created by boai on 2017/6/7.
//  Copyright © 2017年 boai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (BAKit)

/**
 计算路径下的文件内存大小，完全使用 unix c 函数 性能最好
 
 @param filepath 文件路径
 @return 文件内存大小
 */
+ (int64_t)ba_fileManagerGetSizeWithFilePath:(NSString *)filepath;

@end
