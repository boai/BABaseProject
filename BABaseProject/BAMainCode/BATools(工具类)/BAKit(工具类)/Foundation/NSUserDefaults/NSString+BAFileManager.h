//
//  NSString+BAFileManager.h
//  BAQMUIDemo
//
//  Created by boai on 2017/5/28.
//  Copyright © 2017年 boaihome. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BAFileManager)

#pragma mark - 获取软件沙盒路径 类

/*! 获取软件沙盒路径 */
+ (nullable NSString *)ba_path_getApplicationSupportPath;

/*! 获取软件沙盒Documents路径 */
+ (nullable NSString *)ba_path_getDocumentsPath;

/*! 获取软件沙盒cache路径 */
+ (nullable NSString *)ba_path_getCachePath;

/*! 获取软件沙盒cachesDic路径 */
+ (nullable NSString *)ba_path_getTemPath;

/*! 在软件沙盒指定的路径创建一个目录 */
+ (BOOL)ba_path_createDirectory:(nullable NSString *)newDirectory;

/*! 在软件沙盒指定的路径删除一个目录 */
+ (BOOL)ba_path_deleteFilesysItem:(nullable NSString*)strItem;

/*! 在软件沙盒路径移动一个目录到另一个目录中 */
+ (BOOL)ba_path_moveFilesysItem:(nullable NSString *)srcPath toPath:(nullable NSString *)dstPath;

/*! 在软件沙盒路径中查看有没有这个路径 */
+ (BOOL)ba_path_fileExist:(nullable NSString*)strPath;

/*! 在软件沙盒路径中获取指定userPath路径 */
- (nullable NSString *)ba_path_getUserInfoStorePath:(nullable NSString *)userPath;

@end
