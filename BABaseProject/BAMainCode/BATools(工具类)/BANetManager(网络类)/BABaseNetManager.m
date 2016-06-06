//
//  BABaseNetManager.m
//  BABaseProject
//
//  Created by apple on 16/1/12.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BABaseNetManager.h"
//#import <AFNetworking.h>
//#import <AFHTTPRequestOperationManager.h>

@implementation BABaseNetManager

/**
 * get 请求
 */

//+ (void)GET:(NSString *)URLString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure
//{
//    // 创建请求管理者
//    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
//    
//    [mgr GET:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        // AFN请求成功时候调用block
//        // 先把请求成功要做的事情，保存到这个代码块
//        if (success) {
//            success(responseObject);
//        }
//        
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        if (failure) {
//            failure(error);
//        }
//    }];
//}

/**
 * post 请求
 */

//+ (void)Post:(NSString *)URLString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure
//{
//    // 创建请求管理者
//    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
//    
//    [mgr POST:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        // AFN请求成功时候调用block
//        // 先把请求成功要做的事情，保存到这个代码块
//        if (success) {
//            success(responseObject);
//        }
//        
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        if (failure) {
//            failure(error);
//        }
//    }];
//}


@end
