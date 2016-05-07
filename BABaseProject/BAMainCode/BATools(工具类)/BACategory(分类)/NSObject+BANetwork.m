//
//  NSObject+BANetwork.m
//  BABaseProject
//
//  Created by apple on 16/1/13.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "NSObject+BANetwork.h"

@implementation NSObject (BANetwork)

+ (AFHTTPSessionManager *)sharedAFManager
{
    static AFHTTPSessionManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
        
        manager.requestSerializer.timeoutInterval = 30;
        // 设置响应数据的基本了类型
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/plain", @"application/javascript", nil];

//        [manager.requestSerializer setValue:nil forHTTPHeaderField:nil];
        
    });
    
    return manager;
}


//+(id)GET:(NSString *)URLPath parameters:(NSDictionary *)params completionHandle:(void (^)(id, NSError *))completionHandle
//{
//    return [[self sharedAFManager] GET:URLPath parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
//        completionHandle(responseObject, nil);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//        completionHandle(nil, error);
//    }];
//}
//
//
//+(id)POST:(NSString *)URLPath parameters:(NSDictionary *)params completionHandle:(void (^)(id, NSError *))completionHandle
//{
//    return [[self sharedAFManager] POST:URLPath parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
//        completionHandle(responseObject, nil);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//        completionHandle(nil, error);
//    }];
//}

+ (id)BA_GET_Url:(NSString *)url
      parameters:(NSDictionary *)params
        response:(BAResponseStyle)style
 requestHeadFile:(NSDictionary *)headFile
completionHandle:(void (^)(id, NSError *))completionHandle
{
    // 1. 根据style类型，去选择返回值的类型
    switch (style) {
        case BAResponseStyleJSON:
            [self sharedAFManager].responseSerializer = [AFJSONResponseSerializer serializer];
            break;
        case BAResponseStyleXML:
            [self sharedAFManager].responseSerializer = [AFXMLParserResponseSerializer serializer];
            break;
        case BAResponseStyleData:
            [self sharedAFManager].responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
        default:
            break;
    }
    
    // 2. 给网络请求加请求头
    if (headFile) {
        for (NSString *key in headFile.allKeys) {
            [[self sharedAFManager].requestSerializer setValue:headFile[key] forHTTPHeaderField:key];
        }
    }
    
    // 3. UTF8转码
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    // 4. 发送GET请求
    return [[self sharedAFManager] GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        /****************************************************/
        // 如果请求成功 , 回调请求到的数据 , 同时 在这里 做本地缓存
        NSString *path = [NSString stringWithFormat:@"%ld.plist", [url hash]];
        // 存储的沙盒路径
        NSString *path_doc = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        // 归档
        [NSKeyedArchiver archiveRootObject:responseObject toFile:[path_doc stringByAppendingPathComponent:path]];
        
        completionHandle(responseObject, nil);

//        if (success)
//        {
//            success(task, responseObject);
//        }

        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        completionHandle(nil, error);

    }];
    
}

+ (id)BA_POST_Url:(NSString *)url
       parameters:(NSDictionary *)params
         response:(BAResponseStyle)style
  requestHeadFile:(NSDictionary *)headFile
 completionHandle:(void (^)(id, NSError *))completionHandle
{
    // 1. 根据style类型，去选择返回值的类型
    switch (style) {
        case BAResponseStyleJSON:
            [self sharedAFManager].responseSerializer = [AFJSONResponseSerializer serializer];
            break;
        case BAResponseStyleXML:
            [self sharedAFManager].responseSerializer = [AFXMLParserResponseSerializer serializer];
            break;
        case BAResponseStyleData:
            [self sharedAFManager].responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
        default:
            break;
    }
    
    // 2. 给网络请求加请求头
    if (headFile) {
        for (NSString *key in headFile.allKeys) {
            [[self sharedAFManager].requestSerializer setValue:headFile[key] forHTTPHeaderField:key];
        }
    }
    
    // 3. UTF8转码
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    // 4. 发送POST请求
    return [[self sharedAFManager] POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        /* ************************************************** */
        //如果请求成功 , 回调请求到的数据 , 同时 在这里 做本地缓存
        NSString *path = [NSString stringWithFormat:@"%ld.plist", [url hash]];
        // 存储的沙盒路径
        NSString *path_doc = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        // 归档
        [NSKeyedArchiver archiveRootObject:responseObject toFile:[path_doc stringByAppendingPathComponent:path]];
        
        completionHandle(responseObject, nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        /* *************************************************** */
        // 在这里读取本地缓存
        NSString *path = [NSString stringWithFormat:@"%ld.plist", [url hash]];
        NSString *path_doc = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        
        id result = [NSKeyedUnarchiver unarchiveObjectWithFile:[path_doc stringByAppendingPathComponent:path]];
        
        if (result) {
            completionHandle(task, result);
        } else {
            completionHandle(nil, error);
        }

    }];
}

@end
