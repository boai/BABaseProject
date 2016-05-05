//
//  BANewsNetManager.m
//  BABaseProject
//
//  Created by apple on 16/1/13.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BANewsNetManager.h"
#import "BAURLsPath.h"

//static AFHTTPSessionManager *manger = nil;

@implementation BANewsNetManager


//+ (id)getVideosWithStartIndex:(NSInteger)startIndex completionHandle:(void (^)(id, NSError *))completionHandle
//{
//    NSString *path = [NSString stringWithFormat:KVideoPath, startIndex];
//    
//    return [self GET:path parameters:nil completionHandle:^(id model, NSError *error) {
//
//        /** MJExtension 解析方法, 数组和字典是不同的 */
//        // 如果model是个字典类型
//        // 在最新版本中,下方方法名称变动mj_objectWithKeyValues
////        BAVideoModel *mo = [BAVideoModel mj_objectWithKeyValues:model];
//        // 假设 返回值 是数组类型
//        
////         mo = [BAVideoModel mj_objectArrayWithKeyValuesArray:model];
////        completionHandle(mo, error);
//        
//        completionHandle([BAVideoModel BAMJParse:model], error);
//    }];
//}

+ (id)getVideosWithStartIndex:(NSInteger)startIndex completionHandle:(void (^)(id, NSError *))completionHandle
{
    NSString *path = [NSString stringWithFormat:KVideoPath, startIndex];
    
    return [self BA_GET_Url:path parameters:nil response:BAResponseStyleJSON requestHeadFile:nil completionHandle:^(id model, NSError *error) {
        
        completionHandle([BAVideoModel BAMJParse:model], error);
    }];
}


//// 单例写法
//+ (AFHTTPSessionManager *)sharedAFManager
//{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        manger = [AFHTTPSessionManager manager];
//        
//        // 设置AF对哪些数据类型进行解析
//        manger.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript", @"text/plain", nil];
//        
//        // 定义请求超时时间长度
//        manger.requestSerializer.timeoutInterval = 30;
//        
//        // 还可以设置请求的 头部 httpHeaderField
//        // 可以设置value为nil, 来删除某个key
//        
//    });
//    return manger;
//}

//+ (id)getNewsListWithStartIndex:(NSInteger)index completionHandle:(void (^)(id, NSError *))completionHandle
//{
//    NSString *path = [NSString stringWithFormat:KVideoPath, index];
//    return [self GET:path parameters:nil completionHandle:^(id responseObject, NSError *error) {
//        completionHandle(responseObject, error);
//    }];
//    
////    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
////    NSString *path = [NSString stringWithFormat:KNewsPath, index];
////    return [[self sharedAFManager] GET:path parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
////        
////        completionHandle(responseObject, nil);
////        
////    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
////        
////        completionHandle(nil, error);
////    }];
//    
//}


@end
