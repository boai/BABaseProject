//
//  BAKit_UserDefaults.h
//  BAQMUIDemo
//
//  Created by boai on 2017/5/28.
//  Copyright © 2017年 boaihome. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface BAKit_UserDefaults : NSObject

#pragma mark - 信息存储 类

/**
 保存指定对象 id 对象
 
 @param value value
 @param defaultName defaultName
 */
+ (void)ba_archive_setObject:(nullable id)value forKey:(NSString *)defaultName;

/**
 读取指定对象 id 对象
 
 @param defaultName defaultName
 @return 读取指定的对象
 */
+ (nullable id)ba_archive_getObjectForKey:(NSString *)defaultName;

/**
 读取指定 NSArray 对象
 
 @param defaultName defaultName
 @return 读取指定的 NSArray 对象
 */
+ (NSArray *)ba_archive_getArrayForKey:(NSString *)defaultName;

/**
 读取指定 NSData 对象
 
 @param defaultName defaultName
 @return 读取指定的 NSData 对象
 */
+ (NSArray<NSString *> *)ba_archive_getStringArrayForKey:(NSString *)defaultName;

/**
 读取指定 NSDictionary 对象
 
 @param defaultName defaultName
 @return 读取指定的 NSDictionary 对象
 */
+ (NSDictionary *)ba_archive_getDictionaryForKey:(NSString *)defaultName;

/**
 读取指定 NSData 对象
 
 @param defaultName defaultName
 @return 读取指定的 NSData 对象
 */
+ (NSData *)ba_archive_getDatayForKey:(NSString *)defaultName;

/**
 删除指定对象
 
 @param defaultName defaultName
 */
+ (void)ba_archive_removeObjectForKey:(NSString *)defaultName;

/**
 保存指定 int 对象
 
 @param value value
 @param defaultName defaultName
 */
+ (void)ba_archive_setInteger:(NSInteger)value forKey:(NSString *)defaultName;

/**
 读取指定 int 对象
 
 @param defaultName defaultName
 @return 读取指定的 int 对象
 */
+ (NSInteger)ba_archive_getIntegerForKey:(NSString *)defaultName;

/**
 保存指定 float 对象
 
 @param value value
 @param defaultName defaultName
 */
+ (void)ba_archive_setFloat:(CGFloat)value forKey:(NSString *)defaultName;

/**
 读取指定 float 对象
 
 @param defaultName defaultName
 @return 读取指定的 int 对象
 */
+ (CGFloat)ba_archive_getFloatForKey:(NSString *)defaultName;

/**
 保存指定 BOOL 对象
 
 @param value value
 @param defaultName defaultName
 */
+ (void)ba_archive_setBool:(BOOL)value forKey:(NSString *)defaultName;

/**
 读取指定 BOOL 对象
 
 @param defaultName defaultName
 @return 读取指定的 BOOL 对象
 */
+ (BOOL)ba_archive_getBoolForKey:(NSString *)defaultName;

#pragma mark - 文件归档
/**
 归档
 
 @param rootObject 需要归档的 rootObject
 @param path path
 @return 是否归档
 */
+ (BOOL)ba_archive_rootObject:(id)rootObject toFile:(NSString *)path;

/**
 删档
 
 @param path path
 @return 是否删档
 */
+ (BOOL)ba_archive_removeRootObjectWithFile:(NSString *)path;

/**
 解档
 
 @param path path
 @return 解档后的数据
 */
+ (nullable id)ba_archive_unarchiveObjectWithFile:(NSString *)path;

@end
NS_ASSUME_NONNULL_END
