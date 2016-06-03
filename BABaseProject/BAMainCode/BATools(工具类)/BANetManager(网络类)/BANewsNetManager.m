//
//  BANewsNetManager.m
//  BABaseProject
//
//  Created by apple on 16/1/13.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BANewsNetManager.h"
#import "BAURLsPath.h"


#import "BAVideoModel.h"
#import "DemoVC11_model.h"

//static AFHTTPSessionManager *manger = nil;

@implementation BANewsNetManager

/*!
 *  示例1：DemoVC1中的网络获取示例
 *
 *  @param startIndex index
 *
 *  @return DemoVC1中的网络获取示例
 */
+ (id)getVideosWithStartIndex:(NSInteger)startIndex completionHandle:(void (^)(id, NSError *))completionHandle
{
    NSString *path = [NSString stringWithFormat:KVideoPath, startIndex];
    
//    return [self BA_GET_Url:path parameters:nil response:BAResponseStyleJSON requestHeadFile:nil completionHandle:^(id model, NSError *error) {
//        
//        completionHandle([BAVideoModel BAMJParse:model], error);
//    }];
    return [BANetManager ba_requestWithType:BAHttpRequestTypeGet withUrlString:path withParameters:nil withSuccessBlock:^(id response) {
        
        completionHandle([BAVideoModel BAMJParse:response], nil);
        
    } withFailureBlock:^(NSError *error) {
        
        BALog(@"error：%@", error);
        
    } progress:^(int64_t bytesProgress, int64_t totalBytesProgress) {
        
    }];
}

/*!
 *  示例2：DemoVC11中的网络获取示例
 *
 *  @return DemoVC11中的网络获取示例
 */
+ (id)getDemoVC11DataCompletionHandle:(void(^)(id model, NSError *error))completionHandle
{
    return [BANetManager ba_requestWithType:BAHttpRequestTypeGet withUrlString:DemoVC11URLPath withParameters:nil withSuccessBlock:^(id response) {
        
    completionHandle([DemoVC11_model BAMJParse:response], nil);
        
    } withFailureBlock:^(NSError *error) {
        
        BALog(@"error：%@", error);
        
    } progress:^(int64_t bytesProgress, int64_t totalBytesProgress) {
        
    }];
}



@end
