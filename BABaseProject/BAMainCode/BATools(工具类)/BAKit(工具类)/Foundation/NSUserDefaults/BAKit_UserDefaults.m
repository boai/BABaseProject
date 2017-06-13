//
//  BAKit_UserDefaults.m
//  BAQMUIDemo
//
//  Created by boai on 2017/5/28.
//  Copyright © 2017年 boaihome. All rights reserved.
//

#import "BAKit_UserDefaults.h"

@implementation BAKit_UserDefaults

#pragma mark - 保存对象

/**
 保存指定对象 id 对象

 @param value value
 @param defaultName defaultName
 */
+ (void)ba_archive_setObject:(nullable id)value forKey:(NSString *)defaultName
{
    // 保存
    [BAKit_NSUserDefaults setObject:value forKey:defaultName];
    // 立即同步
    [BAKit_NSUserDefaults synchronize];
}

/**
 读取指定对象 id 对象

 @param defaultName defaultName
 @return 读取指定的对象
 */
+ (nullable id)ba_archive_getObjectForKey:(NSString *)defaultName
{
    return [BAKit_NSUserDefaults objectForKey:defaultName];
}

/**
 读取指定 NSArray 对象
 
 @param defaultName defaultName
 @return 读取指定的 NSArray 对象
 */
+ (NSArray *)ba_archive_getArrayForKey:(NSString *)defaultName
{
    return [BAKit_NSUserDefaults arrayForKey:defaultName];
}

/**
 读取指定 NSData 对象
 
 @param defaultName defaultName
 @return 读取指定的 NSData 对象
 */
+ (NSArray<NSString *> *)ba_archive_getStringArrayForKey:(NSString *)defaultName
{
    return [BAKit_NSUserDefaults stringArrayForKey:defaultName];
}

/**
 读取指定 NSDictionary 对象
 
 @param defaultName defaultName
 @return 读取指定的 NSDictionary 对象
 */
+ (NSDictionary *)ba_archive_getDictionaryForKey:(NSString *)defaultName
{
    return [BAKit_NSUserDefaults dictionaryForKey:defaultName];
}

/**
 读取指定 NSData 对象
 
 @param defaultName defaultName
 @return 读取指定的 NSData 对象
 */
+ (NSData *)ba_archive_getDatayForKey:(NSString *)defaultName
{
    return [BAKit_NSUserDefaults dataForKey:defaultName];
}

/**
 删除指定对象

 @param defaultName defaultName
 */
+ (void)ba_archive_removeObjectForKey:(NSString *)defaultName
{
    [BAKit_NSUserDefaults removeObjectForKey:defaultName];
}

/**
 保存指定 int 对象
 
 @param value value
 @param defaultName defaultName
 */
+ (void)ba_archive_setInteger:(NSInteger)value forKey:(NSString *)defaultName
{
    // 保存
    [BAKit_NSUserDefaults setInteger:value forKey:defaultName];
    // 立即同步
    [BAKit_NSUserDefaults synchronize];
}

/**
 读取指定 int 对象
 
 @param defaultName defaultName
 @return 读取指定的 int 对象
 */
+ (NSInteger)ba_archive_getIntegerForKey:(NSString *)defaultName
{
    return [BAKit_NSUserDefaults integerForKey:defaultName];
}

/**
 保存指定 float 对象
 
 @param value value
 @param defaultName defaultName
 */
+ (void)ba_archive_setFloat:(CGFloat)value forKey:(NSString *)defaultName
{
    // 保存
    [BAKit_NSUserDefaults setFloat:value forKey:defaultName];
    // 立即同步
    [BAKit_NSUserDefaults synchronize];
}

/**
 读取指定 float 对象
 
 @param defaultName defaultName
 @return 读取指定的 int 对象
 */
+ (CGFloat)ba_archive_getFloatForKey:(NSString *)defaultName
{
    return [BAKit_NSUserDefaults floatForKey:defaultName];
}

/**
 保存指定 BOOL 对象
 
 @param value value
 @param defaultName defaultName
 */
+ (void)ba_archive_setBool:(BOOL)value forKey:(NSString *)defaultName
{
    // 保存
    [BAKit_NSUserDefaults setFloat:value forKey:defaultName];
    // 立即同步
    [BAKit_NSUserDefaults synchronize];
}

/**
 读取指定 BOOL 对象
 
 @param defaultName defaultName
 @return 读取指定的 BOOL 对象
 */
+ (BOOL)ba_archive_getBoolForKey:(NSString *)defaultName
{
    return [BAKit_NSUserDefaults boolForKey:defaultName];
}



#pragma mark - 文件归档
/**
 归档
 
 @param rootObject 需要归档的 rootObject
 @param path path
 @return 是否归档
 */
+ (BOOL)ba_archive_rootObject:(id)rootObject toFile:(NSString *)path
{
    return [NSKeyedArchiver archiveRootObject:rootObject toFile:path];
}

/**
 删档
 
 @param path path
 @return 是否删档
 */
+ (BOOL)ba_archive_removeRootObjectWithFile:(NSString *)path
{
    return [self ba_archive_rootObject:nil toFile:path];
}

/**
 解档

 @param path path
 @return 解档后的数据
 */
+ (nullable id)ba_archive_unarchiveObjectWithFile:(NSString *)path
{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:path];
}

@end
