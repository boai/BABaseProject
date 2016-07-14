//
//  BAClearCacheManager.m
//  BABaseProject
//
//  Created by 博爱 on 16/7/14.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BAClearCacheManager.h"

@implementation BAClearCacheManager

+ (instancetype)ba_sharedCache
{
    static BAClearCacheManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[BAClearCacheManager alloc] init];
    });
    
    return manager;
}

#pragma mark - 计算单个文件大小
- (CGFloat)ba_fileSizeAtPath:(NSString *)path
{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if([fileManager fileExistsAtPath:path])
    {
        long long size=[fileManager attributesOfItemAtPath:path error:nil].fileSize;
        return size/1024.0/1024.0;
    }
    return 0;
}

- (CGFloat)ba_loadCacheSize
{
    self.cacheSize = 0;
    NSString *cachPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachPath];
    for (NSString *f in files)
    {
        NSString *path = [cachPath stringByAppendingPathComponent:f];
        self.cacheSize += [self ba_fileSizeAtPath:path];
    }
    BALog(@"cacheSize == %f",self.cacheSize);
    
    return self.cacheSize;
    
}

#pragma mark - 计算目录大小
- (CGFloat)ba_folderSizeAtPath:(NSString *)path
{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    float folderSize;
    if ([fileManager fileExistsAtPath:path])
    {
        NSArray *childerFiles=[fileManager subpathsAtPath:path];
        for (NSString *fileName in childerFiles)
        {
            NSString *absolutePath=[path stringByAppendingPathComponent:fileName];
            folderSize += [self ba_fileSizeAtPath:absolutePath];
        }
        //SDWebImage框架自身计算缓存的实现
        //        folderSize+=[[SDImageCache sharedImageCache] getSize]/1024.0/1024.0;
        BALog(@"d = %f",folderSize);
        return folderSize;
    }
    return 0;
}

//第一种：
//-(void)clearCache:(NSString *)path{
//    NSFileManager *fileManager=[NSFileManager defaultManager];
//    if ([fileManager fileExistsAtPath:path]) {
//        NSArray *childerFiles=[fileManager subpathsAtPath:path];
//        for (NSString *fileName in childerFiles) {
//            //如有需要，加入条件，过滤掉不想删除的文件
//            NSString *absolutePath=[path stringByAppendingPathComponent:fileName];
//            [fileManager removeItemAtPath:absolutePath error:nil];
//        }
//    }
//    [[SDImageCache sharedImageCache] cleanDisk];
//}


#pragma mark - 清除缓存
//第二种：
- (void)ba_myClearCacheAction{
    dispatch_async(
                   dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
                   , ^{
                       NSString *cachPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
                       BALog(@"cachPath===%@",cachPath);
                       NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachPath];
                       BALog(@"files :%lu",(unsigned long)[files count]);
                       BALog(@"file === %@",files);
                       for (NSString *p in files)
                       {
                           NSError *error;
                           NSString *path = [cachPath stringByAppendingPathComponent:p];
                           if ([[NSFileManager defaultManager] fileExistsAtPath:path])
                           {
                               [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
                           }
                       }
                       [self performSelectorOnMainThread:@selector(ba_clearCacheSuccess) withObject:nil waitUntilDone:YES];});
}

- (void)ba_clearCacheSuccess
{
    BALog(@"清理成功");
}


@end
