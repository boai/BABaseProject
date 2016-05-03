//
//  NSObject+Network.m
//  BABaseProject
//
//  Created by apple on 16/1/13.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "NSObject+Network.h"

@implementation NSObject (Network)

+ (AFHTTPSessionManager *)sharedAFManager
{
    static AFHTTPSessionManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
        
        manager.requestSerializer.timeoutInterval = 30;
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript", @"text/plain", nil];

//        [manager.requestSerializer setValue:nil forHTTPHeaderField:nil];
        
    });
    
    return manager;
}


+(id)GET:(NSString *)URLPath parameters:(NSDictionary *)params completionHandle:(void (^)(id, NSError *))completionHandle
{
    return [[self sharedAFManager] GET:URLPath parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        completionHandle(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        completionHandle(nil, error);
    }];
}


+(id)POST:(NSString *)URLPath parameters:(NSDictionary *)params completionHandle:(void (^)(id, NSError *))completionHandle
{
    return [[self sharedAFManager] POST:URLPath parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        completionHandle(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        completionHandle(nil, error);
    }];
}

@end
