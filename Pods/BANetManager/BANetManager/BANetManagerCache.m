//
//  BANetManagerCache.m
//  BANetManagerDemo
//
//  Created by boai on 2017/5/2.
//  Copyright © 2017年 博爱之家. All rights reserved.
//

#import "BANetManagerCache.h"
#import "YYCache.h"

static NSString * const kBANetManagerCache = @"BANetManagerCache";
static  YYCache *_dataCache;

@implementation BANetManagerCache

+ (void)initialize
{
    _dataCache = [YYCache cacheWithName:kBANetManagerCache];
}

/**
 异步缓存网络数据,根据请求的 url 与 parameters

 @param httpData 服务器返回的数据
 @param urlString 请求的 URL 地址
 @param parameters 请求的参数
 */
+ (void)ba_setHttpCache:(id)httpData
              urlString:(NSString *)urlString
             parameters:(NSDictionary *)parameters
{
    NSString *cacheKey = [self ba_cacheWithUrlString:urlString parameters:parameters];
    [_dataCache setObject:httpData forKey:cacheKey];
}

/**
 根据请求的 URL 与 parameters 异步取出缓存数据

 @param urlString 请求的URL
 @param parameters 请求的参数
 @return 缓存的服务器数据
 */
+ (id)ba_httpCacheWithUrlString:(NSString *)urlString
                     parameters:(NSDictionary *)parameters
{
    NSString *cacheKey = [self ba_cacheWithUrlString:urlString parameters:parameters];
    return [_dataCache objectForKey:cacheKey];
}

/**
 根据请求的 URL 与 parameters 异步取出缓存数据

 @param urlString 请求的URL
 @param parameters 请求的参数
 @param block 异步回调缓存的数据
 */
+ (void)ba_httpCacheWithUrlString:(NSString *)urlString
                       parameters:(NSDictionary *)parameters block:(void(^)(id <NSCoding> responseObject))block
{
    NSString *cacheKey = [self ba_cacheWithUrlString:urlString parameters:parameters];
    [_dataCache objectForKey:cacheKey withBlock:^(NSString * _Nonnull key, id<NSCoding>  _Nonnull object) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            block(object);
        });
    }];
    
}

+ (NSString *)ba_cacheWithUrlString:(NSString *)urlString
                         parameters:(NSDictionary *)parameters
{
    if (!parameters)
    {
        return urlString;
    }
    NSData *cacheData = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:nil];
    NSString *cacheString = [[NSString alloc] initWithData:cacheData encoding:NSUTF8StringEncoding];
    
    NSString *cacheKey = [NSString stringWithFormat:@"%@%@", urlString, cacheString];
    return cacheKey;
}

/**
   返回此缓存中对象的总大小（以M为单位）。
   此方法可能阻止调用线程，直到文件读取完成。

 @return 总对象的大小（以M为单位）。
 */
+ (CGFloat)ba_getAllHttpCacheSize
{
    return [_dataCache.diskCache totalCost]/1024.0/1024.0;
}

/**
   清空缓存。
   此方法可能会阻止调用线程，直到文件删除完成。
 */
+ (void)ba_clearAllHttpCache
{
    [_dataCache.diskCache removeAllObjects];
}

@end
