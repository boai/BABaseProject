//
//  NSFileManager+BAKit.m
//  BAKit
//
//  Created by boai on 2017/6/7.
//  Copyright © 2017年 boai. All rights reserved.
//

#import "NSFileManager+BAKit.h"
#include <sys/param.h>
#include <sys/mount.h>
#include <sys/stat.h>
#include <dirent.h>

@implementation NSFileManager (BAKit)

/**
 计算路径下的文件内存大小

 @param filepath 文件路径
 @return 文件内存大小
 */
+ (int64_t)ba_fileManagerGetSizeWithFilePath:(NSString *)filepath
{
//    NSFileManager *fmgr = [NSFileManager defaultManager];
//    // CHECK FILE EXIST
//    BOOL isFolder = NO;
//    if ([fmgr fileExistsAtPath:filepath isDirectory:&isFolder])
//    {
//        float filesize = 0;
//        if (isFolder)
//        {
//            // FOLDER
//            NSArray *files = [fmgr subpathsAtPath:filepath];
//            for (NSString *filename in files)
//            {
//                filesize += [NSFileManager ba_fileManagerGetSizeWithFilePath:filename];
//            }
//        }
//        else
//        {
//            // FILE
//            filesize = [fmgr attributesOfItemAtPath:filepath error:NULL].fileSize / 1024.0f / 1024.0f;
//        }
//        return filesize;
//    }
//    return 0;
    return [self folderSizeAtPath:[filepath cStringUsingEncoding:NSUTF8StringEncoding] maxTime:nil];
}

// 完全使用unix c 函数 性能最好
// 实测  1000个文件速度 0.005896
+ (int64_t)folderSizeAtPath:(const char *)folderPath maxTime:(NSNumber *)maxTime
{
    CFAbsoluteTime startTime =CFAbsoluteTimeGetCurrent();
    
    int64_t folderSize = 0;
    DIR* dir = opendir(folderPath);
    
    
    if (dir == NULL) return 0;
    struct dirent* child;
    while ((child = readdir(dir))!=NULL) {
        if (child->d_type == DT_DIR && (
                                        (child->d_name[0] == '.' && child->d_name[1] == 0) || // 忽略目录 .
                                        (child->d_name[0] == '.' && child->d_name[1] == '.' && child->d_name[2] == 0) // 忽略目录 ..
                                        )) continue;
        
        int64_t folderPathLength = strlen(folderPath);
        
        // 子文件的路径地址
        char childPath[1024];
        stpcpy(childPath, folderPath);
        
        if (folderPath[folderPathLength-1] != '/') {
            childPath[folderPathLength] = '/';
            folderPathLength++;
        }
        
        stpcpy(childPath+folderPathLength, child->d_name);
        childPath[folderPathLength + child->d_namlen] = 0;
        
        if (child->d_type == DT_DIR) { // directory
            // 递归调用子目录
            folderSize += [[self class] folderSizeAtPath:childPath maxTime:maxTime];
            
            // 把目录本身所占的空间也加上
            struct stat st;
            if(lstat(childPath, &st) == 0) folderSize += st.st_size;
        }else if (child->d_type == DT_REG || child->d_type == DT_LNK) { // file or link
            //特殊处理几个月前的内容
            if (maxTime) {
                BOOL shouldCountSize = YES;
                char *p = child->d_name;
                NSString *fileName = [NSString stringWithCString:p encoding:NSUTF8StringEncoding];
                NSComparisonResult result = [fileName compare:[maxTime stringValue]];
                if (result == NSOrderedDescending)//小于三个月不统计
                {
                    shouldCountSize = NO;
                }
                
                if (!shouldCountSize) {
                    continue;
                }
            }
            
            struct stat st;
            if(lstat(childPath, &st) == 0) folderSize += st.st_size;
        }
    }
    CFAbsoluteTime endTime = CFAbsoluteTimeGetCurrent();
    NSLog(@"ttttttttttt:%s,%f,%lld",__func__,endTime-startTime,folderSize);
    return folderSize;
}

@end
