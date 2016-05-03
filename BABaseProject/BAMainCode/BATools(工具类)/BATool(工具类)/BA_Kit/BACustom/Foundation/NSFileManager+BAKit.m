
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

#import "NSFileManager+BAKit.h"

@implementation NSFileManager (BAKit)

/* 从文件中读取信息 */
+ (NSString *)readTextFile:(NSString *)file
                    ofType:(NSString *)type
{
    // 获取资源路径
    NSString *temp = [[NSBundle mainBundle] pathForResource:file
                                                     ofType:type];
    // 获取文件内容
    file = [NSString stringWithContentsOfFile:temp
                                     encoding:NSStringEncodingConversionAllowLossy
                                        error:nil];
    return file;
}

/* 保存给定的数组到PLIST文件 */
+ (BOOL)saveArrayToPath:(DirectoryType)path
           withFilename:(NSString *)fileName
                  array:(NSArray *)array
{
    NSString *_path;
    
    switch(path)
    {
        case DirectoryTypeMainBundle:
            _path = [self getBundlePathForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeLibrary:
            _path = [self getLibraryDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeDocuments:
            _path = [self getDocumentsDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeCache:
            _path = [self getCacheDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        default:
            break;
    }
    
    //BFLog(@"savedArrayToFile : %@",path);
    return [NSKeyedArchiver archiveRootObject:array toFile:_path];
}

/* 从给定的文件载入plist集合中 */
+ (NSArray *)loadArrayFromPath:(DirectoryType)path withFilename:(NSString *)fileName
{
    NSString *_path;
    
    switch(path)
    {
        case DirectoryTypeMainBundle:
            _path = [self getBundlePathForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeLibrary:
            _path = [self getLibraryDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeDocuments:
            _path = [self getDocumentsDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeCache:
            _path = [self getCacheDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        default:
            break;
    }
    
    //BFLog(@"loadedArrayFromFile : %@",_path);
    return [NSKeyedUnarchiver unarchiveObjectWithFile:_path];
}

/* 获取资源包路径下的文件 */
+ (NSString *)getBundlePathForFile:(NSString *)fileName
{
    NSString *fileExtension = [fileName pathExtension];
    return [[NSBundle mainBundle] pathForResource:[fileName stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@".%@", fileExtension] withString:@""] ofType:fileExtension];
}

/* 获取文档目录下的文件 */
+ (NSString *)getDocumentsDirectoryForFile:(NSString *)fileName
{
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/", fileName]];
}

/* 获取库目录下的文件 */
+ (NSString *)getLibraryDirectoryForFile:(NSString *)fileName
{
    NSString *libraryDirectory = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return [libraryDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/", fileName]];
}

/* 获取缓存目录下的文件 */
+ (NSString *)getCacheDirectoryForFile:(NSString *)fileName
{
    NSString *cacheDirectory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return [cacheDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/", fileName]];
}

/* 删除目录下的文件 */
+ (BOOL)deleteFile:(NSString *)fileName
     fromDirectory:(DirectoryType)directory
{
    if(fileName.length > 0)
    {
        NSString *path;
        
        switch(directory)
        {
            case DirectoryTypeMainBundle:
                path = [self getBundlePathForFile:fileName];
                break;
            case DirectoryTypeLibrary:
                path = [self getLibraryDirectoryForFile:fileName];
                break;
            case DirectoryTypeDocuments:
                path = [self getDocumentsDirectoryForFile:fileName];
                break;
            case DirectoryTypeCache:
                path = [self getCacheDirectoryForFile:fileName];
                break;
            default:
                break;
        }
        // 判断文件是否存在path路径
        if([[NSFileManager defaultManager] fileExistsAtPath:path])
        {
            // 删除path路径下的项目
            return [[NSFileManager defaultManager] removeItemAtPath:path
                                                              error:nil];
        }
        else
        {
            return NO;
        }
    }
    
    return NO;
}

/* 移动区域文件从一个目录到另一个目录 */
+ (BOOL)moveLocalFile:(NSString *)fileName
        fromDirectory:(DirectoryType)origin
          toDirectory:(DirectoryType)destination
{
    return [self moveLocalFile:fileName
                 fromDirectory:origin
                   toDirectory:destination
                withFolderName:nil];
}

/* 移动区域文件从一个目录到另一个目录下的文件夹 */
+ (BOOL)moveLocalFile:(NSString *)fileName
        fromDirectory:(DirectoryType)origin
          toDirectory:(DirectoryType)destination
       withFolderName:(NSString *)folderName
{
    NSString *originPath;
    
    switch(origin)
    {
        case DirectoryTypeMainBundle:
            originPath = [[NSBundle mainBundle] pathForResource:fileName
                                                         ofType:nil];
            break;
        case DirectoryTypeLibrary:
            originPath = [self getDocumentsDirectoryForFile:fileName];
            break;
        case DirectoryTypeDocuments:
            originPath = [self getLibraryDirectoryForFile:fileName];
            break;
        case DirectoryTypeCache:
            originPath = [self getCacheDirectoryForFile:fileName];
            break;
        default:
            break;
    }
    
    NSString *destinationPath;
    
    switch(destination)
    {
        case DirectoryTypeMainBundle:
            if(folderName)
                destinationPath = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@/%@", folderName, fileName] ofType:nil];
            else
                destinationPath = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
            break;
        case DirectoryTypeLibrary:
            if(folderName)
                destinationPath = [self getLibraryDirectoryForFile:[NSString stringWithFormat:@"%@/%@", folderName, fileName]];
            else
                destinationPath = [self getLibraryDirectoryForFile:fileName];
            break;
        case DirectoryTypeDocuments:
            if(folderName)
                destinationPath = [self getDocumentsDirectoryForFile:[NSString stringWithFormat:@"%@/%@", folderName, fileName]];
            else
                destinationPath = [self getDocumentsDirectoryForFile:fileName];
            break;
        case DirectoryTypeCache:
            if(folderName)
                destinationPath = [self getCacheDirectoryForFile:[NSString stringWithFormat:@"%@/%@", folderName, fileName]];
            else
                destinationPath = [self getCacheDirectoryForFile:fileName];
            break;
        default:
            break;
    }
    
    // 检查是否存在文件夹，如果没有，自动创建
    if(folderName)
    {
        NSString *folderPath = [NSString stringWithFormat:@"%@/%@", destinationPath, folderName];
        if(![[NSFileManager defaultManager] fileExistsAtPath:folderPath])
        {
            [[NSFileManager defaultManager] createDirectoryAtPath:folderPath
                                      withIntermediateDirectories:NO
                                                       attributes:nil
                                                            error:nil];
        }
    }
    
    BOOL copied = NO, deleted = NO;
    
    if([[NSFileManager defaultManager] fileExistsAtPath:originPath])
    {
        // 复制在path路径下的项目
        if([[NSFileManager defaultManager] copyItemAtPath:originPath
                                                   toPath:destinationPath
                                                    error:nil])
            copied = YES;
    }
    
    if(destination != DirectoryTypeMainBundle)
    {
        if([[NSFileManager defaultManager] fileExistsAtPath:originPath])
            // 移除在path路径下的项目
            if([[NSFileManager defaultManager] removeItemAtPath:originPath
                                                          error:nil])
                deleted = YES;
    }
    
    if(copied && deleted)
        return YES;
    else
        return NO;
}

/* 复制文件从一个路径到另一个路径 */
+ (BOOL)duplicateFileAtPath:(NSString *)origin
                  toNewPath:(NSString *)destination
{
    if([[NSFileManager defaultManager] fileExistsAtPath:origin])
        // 复制在path路径下的项目
        return [[NSFileManager defaultManager] copyItemAtPath:origin
                                                       toPath:destination
                                                        error:nil];
    else
        return NO;
}

/* 重命名文件 */
+ (BOOL)renameFileFromDirectory:(DirectoryType)origin
                         atPath:(NSString *)path
                    withOldName:(NSString *)oldName
                     andNewName:(NSString *)newName
{
    NSString *originPath;
    
    switch(origin)
    {
        case DirectoryTypeMainBundle:
            originPath = [[NSBundle mainBundle] pathForResource:path
                                                         ofType:nil];
            break;
        case DirectoryTypeLibrary:
            originPath = [self getDocumentsDirectoryForFile:path];
            break;
        case DirectoryTypeDocuments:
            originPath = [self getLibraryDirectoryForFile:path];
            break;
        case DirectoryTypeCache:
            originPath = [self getCacheDirectoryForFile:path];
            break;
        default:
            break;
    }
    
    if([[NSFileManager defaultManager] fileExistsAtPath:originPath])
    {
        // 将目标字符串进行替换
        NSString *newNamePath = [originPath stringByReplacingOccurrencesOfString:oldName
                                                                      withString:newName];
        // 复制在path路径下的项目
        if([[NSFileManager defaultManager] copyItemAtPath:originPath
                                                   toPath:newNamePath
                                                    error:nil])
        {
            // 移除在path路径下的项目
            if([[NSFileManager defaultManager] removeItemAtPath:originPath
                                                          error:nil])
                return YES;
            else
                return NO;
        }
        else
            return NO;
    }
    else
        return NO;
}

/* 获取应用程序设置 */
//+ (id)getAppSettingsForObjectWithKey:(NSString *)objKey
//{
//    return [self getSettings:APP_NAME
//                objectForKey:objKey];
//}
//
///* 设置应用程序设置 */
//+ (BOOL)setAppSettingsForObject:(id)value
//                         forKey:(NSString *)objKey
//{
//    return [self setSettings:APP_NAME
//                      object:value
//                      forKey:objKey];
//}

/* 获取应用程序设置 */
+ (id)getSettings:(NSString *)settings
     objectForKey:(NSString *)objKey
{
    NSString *path = [self getLibraryDirectoryForFile:[NSString stringWithFormat:@"%@-Settings.plist", settings]];
    NSDictionary *loadedPlist = [NSDictionary dictionaryWithContentsOfFile:path];
    if(![[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@-Settings", settings]
                                               ofType:@"plist"];
        [self moveLocalFile:[NSString stringWithFormat:@"%@-Settings.plist", settings]
              fromDirectory:DirectoryTypeMainBundle
                toDirectory:DirectoryTypeLibrary
             withFolderName:@""];
        loadedPlist = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    }
    
    return [loadedPlist objectForKey:objKey];
}

/* 设置应用程序设置 */
+ (BOOL)setSettings:(NSString *)settings
             object:(id)value
             forKey:(NSString *)objKey
{
    NSString *path = [self getLibraryDirectoryForFile:[NSString stringWithFormat:@"%@-Settings.plist", settings]];
    // 获取目录文件字典
    NSMutableDictionary *loadedPlist = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    
    if(![[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        // 在path路径下的资源
        path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@-Settings", settings]
                                               ofType:@"plist"];
        [self moveLocalFile:[NSString stringWithFormat:@"%@-Settings.plist", settings]
              fromDirectory:DirectoryTypeMainBundle
                toDirectory:DirectoryTypeLibrary
             withFolderName:@""];
        loadedPlist = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    }
    
    [loadedPlist setObject:value
                    forKey:objKey];
    return [loadedPlist writeToFile:path
                         atomically:YES];
}

@end
