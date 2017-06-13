//
//  BAKit_ClearCacheManager.h
//  BABaseProject
//
//  Created by 博爱 on 16/7/14.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <Foundation/Foundation.h>


#define  BAKit_ClearCacheManagerShared [BAKit_ClearCacheManager ba_sharedCache]
@interface BAKit_ClearCacheManager : NSObject

@property (nonatomic, assign) CGFloat cacheSize;

+ (instancetype)ba_sharedCache;

/*!
 *  计算单个文件大小
 *
 *  @param path path路径
 *
 *  @return 计算单个文件大小
 */
- (CGFloat)ba_fileManagerGetSizeWithFilePath:(NSString *)path;

/*!
 *  计算目录大小
 *
 *  @param path path路径
 *
 *  @return 计算目录大小
 */
- (CGFloat)ba_folderSizeAtPath:(NSString *)path;

/*!
 *  缓存大小
 *
 *  @return 缓存大小
 */
- (CGFloat)ba_loadCacheSize;

/*!
 *  清除缓存
 */
- (void)ba_myClearCacheAction;

/*!
 *  清除缓存成功回调
 */
- (void)ba_clearCacheSuccess;

@end
