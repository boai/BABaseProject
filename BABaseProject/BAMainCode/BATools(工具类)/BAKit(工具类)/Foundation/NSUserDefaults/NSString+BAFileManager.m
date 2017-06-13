//
//  NSString+BAFileManager.m
//  BAQMUIDemo
//
//  Created by boai on 2017/5/28.
//  Copyright © 2017年 boaihome. All rights reserved.
//

#import "NSString+BAFileManager.h"

@implementation NSString (BAFileManager)

/*! 获取软件沙盒路径 */
+ (NSString *)ba_path_getApplicationSupportPath
{
    //such as:../Applications/9A425424-645E-4337-8730-8A080DF086F4/Library/Application Support
    
    NSArray* libraryPaths = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSAllDomainsMask, YES);
    
    NSString *path = nil;
    if ([libraryPaths count] > 0) {
        path = [libraryPaths objectAtIndex:0];
    }
    
    if (![self ba_path_fileExist:path]) {
        [self ba_path_createDirectory:path];
    }
    
    return path;
}

/*! 获取软件沙盒 Documents 路径 */
+ (NSString *)ba_path_getDocumentsPath
{
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) objectAtIndex:0];
    
    // such as:../Applications/9A425424-645E-4337-8730-8A080DF086F4/Documents
    return documentPath;
}

/*! 获取软件沙盒 cache 路径 */
+ (NSString *)ba_path_getCachePath
{
    // such as : ../Applications/9A425424-645E-4337-8730-8A080DF086F4/Library/Caches
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES) objectAtIndex:0];
    return cachePath;
}

/*! 获取软件沙盒 cachesDic 路径 */
+ (NSString *)ba_path_getTemPath
{
    NSString *cachesDic = NSTemporaryDirectory();
    return cachesDic;
}

/*! 在软件沙盒指定的路径创建一个目录 */
+ (BOOL)ba_path_createDirectory:(NSString *)newDirectory
{
    if([self ba_path_fileExist:newDirectory]) return YES;
    
    NSError *error = nil;
    BOOL finished = [[NSFileManager defaultManager] createDirectoryAtPath:newDirectory
                                              withIntermediateDirectories:YES
                                                               attributes:nil
                                                                    error:&error];
    return finished;
}

/*! 在软件沙盒指定的路径删除一个目录 */
+ (BOOL)ba_path_deleteFilesysItem:(NSString*)strItem
{
    if ([strItem length] == 0) {
        return YES;
    }
    
    NSError * error = nil;
    
    BOOL finished = [[NSFileManager defaultManager] removeItemAtPath:strItem error:&error];
    return finished;
}

/*! 在软件沙盒路径移动一个目录到另一个目录中 */
+ (BOOL)ba_path_moveFilesysItem:(NSString *)srcPath toPath:(NSString *)dstPath
{
    if (![self ba_path_fileExist:srcPath]) return NO;
    
    NSError * error = nil;
    return [[NSFileManager defaultManager] moveItemAtPath:srcPath
                                                   toPath:dstPath
                                                    error:&error];
}

/*! 在软件沙盒路径中查看有没有这个路径 */
+ (BOOL)ba_path_fileExist:(NSString*)strPath
{
    NSFileManager *file_manager = [NSFileManager defaultManager];
    BOOL finded = [file_manager fileExistsAtPath:strPath];
    return finded;
}

/*! 在软件沙盒路径中获取指定userPath路径 */
- (NSString *)ba_path_getUserInfoStorePath:(NSString *)userPath
{
    NSString *destPath = [NSString ba_path_getDocumentsPath];
    NSString *userInfoPath = [destPath stringByAppendingString:[NSString stringWithFormat:@"/%@", userPath]];
    return userInfoPath;
}

@end
