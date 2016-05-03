
/*!
 *  @header BAKit
 *          demoTest
 *
 *  @brief  BAKit
 *
 *  @author 博爱
 *  @copyright    Copyright © 2016年 博爱. All rights reserved.
 *  @version    V1.0
 */

/*!
 *
 *          ┌─┐       ┌─┐
 *       ┌──┘ ┴───────┘ ┴──┐
 *       │                 │
 *       │       ───       │
 *       │  ─┬┘       └┬─  │
 *       │                 │
 *       │       ─┴─       │
 *       │                 │
 *       └───┐         ┌───┘
 *           │         │
 *           │         │
 *           │         │
 *           │         └──────────────┐
 *           │                        │
 *           │                        ├─┐
 *           │                        ┌─┘
 *           │                        │
 *           └─┐  ┐  ┌───────┬──┐  ┌──┘
 *             │ ─┤ ─┤       │ ─┤ ─┤
 *             └──┴──┘       └──┴──┘
 *                 神兽保佑
 *                 代码无BUG!
 */

/*
 
 *********************************************************************************
 *
 * 在使用BAKit的过程中如果出现bug请及时以以下任意一种方式联系我，我会及时修复bug
 *
 * QQ     : 可以添加SDAutoLayout群 497140713 在这里找到我(博爱1616【137361770】)
 * 微博    : 博爱1616
 * Email  : 137361770@qq.com
 * GitHub : https://github.com/boai
 * 博客园  : http://www.cnblogs.com/boai/
 *********************************************************************************
 
 */

#import <Foundation/Foundation.h>
/**
 *  目录类型枚举
 */
typedef NS_ENUM(NSInteger, DirectoryType)
{
    DirectoryTypeMainBundle = 0,    // 主要资源目录
    DirectoryTypeLibrary,           // 库目录
    DirectoryTypeDocuments,         // 文件目录
    DirectoryTypeCache              // 缓存目录
};

/**
 *  给NSFileManager类添加许多有用的方法
 */
@interface NSFileManager (BAKit)

/**
 *  从文件中读取信息
 */
+ (NSString *)readTextFile:(NSString *)file
                    ofType:(NSString *)type;

/**
 *  保存给定的数组到plist文件
 */
+ (BOOL)saveArrayToPath:(DirectoryType)path
           withFilename:(NSString *)fileName
                  array:(NSArray *)array;

/**
 *  从给定的文件载入plist集合中
 */
+ (NSArray *)loadArrayFromPath:(DirectoryType)path
                  withFilename:(NSString *)fileName;

/**
 *  获取资源包路径下的文件
 */
+ (NSString *)getBundlePathForFile:(NSString *)fileName;

/**
 *  获取文档目录下的文件
 */
+ (NSString *)getDocumentsDirectoryForFile:(NSString *)fileName;

/**
 *  获取库目录下的文件
 */
+ (NSString *)getLibraryDirectoryForFile:(NSString *)fileName;

/**
 *  获取缓存目录下的文件
 */
+ (NSString *)getCacheDirectoryForFile:(NSString *)fileName;

/**
 *  删除目录下的文件
 */
+ (BOOL)deleteFile:(NSString *)fileName fromDirectory:(DirectoryType)directory;

/**
 * 移动区域文件从一个目录到另一个目录
 */
+ (BOOL)moveLocalFile:(NSString *)fileName
        fromDirectory:(DirectoryType)origin
          toDirectory:(DirectoryType)destination;

/**
 *  移动区域文件从一个目录到另一个目录下的文件夹
 */
+ (BOOL)moveLocalFile:(NSString *)fileName
        fromDirectory:(DirectoryType)origin
          toDirectory:(DirectoryType)destination
       withFolderName:(NSString *)folderName;

/**
 *  复制文件从一个路径到另一个路径
 */
+ (BOOL)duplicateFileAtPath:(NSString *)origin
                  toNewPath:(NSString *)destination;

/**
 *  重命名文件
 */
+ (BOOL)renameFileFromDirectory:(DirectoryType)origin
                         atPath:(NSString *)path
                    withOldName:(NSString *)oldName
                     andNewName:(NSString *)newName;

/**
 *  获取应用程序设置
 */
+ (id)getAppSettingsForObjectWithKey:(NSString *)objKey;

/**
 *  设置应用程序设置
 */
+ (BOOL)setAppSettingsForObject:(id)value
                         forKey:(NSString *)objKey;

/**
 *  获取应用程序设置
 */
+ (id)getSettings:(NSString *)settings
     objectForKey:(NSString *)objKey;

/**
 *  设置应用程序设置
 */
+ (BOOL)setSettings:(NSString *)settings
             object:(id)value
             forKey:(NSString *)objKey;
@end
