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
        completionHandle(nil, error);

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
        
        /*! 
         获取的字典示例：
         
         {
         description = "Hi\Uff0c\U6d17\U526a\U5439";
         height = 1600;
         id = 13328041;
         "photo_url" = "http://p.chanyouji.cn/333978/1451945850044p1a879bbtem71udn1ujh1aaa1h9958.jpg";
         "trip_id" = 333978;
         width = 1068;
         },
         {
         description = "";
         height = 1600;
         id = 14015158;
         "photo_url" = "http://p.chanyouji.cn/1456589788/B078C994-6D71-4811-80BE-653D01C3A2A1.jpg";
         "trip_id" = 361477;
         width = 1600;
         }
         
         */
        
    completionHandle([DemoVC11_model BAMJParse:response], nil);
        
    } withFailureBlock:^(NSError *error) {
        
        BALog(@"error：%@", error);
        completionHandle(nil, error);
        
    } progress:^(int64_t bytesProgress, int64_t totalBytesProgress) {
        
    }];
}



@end
