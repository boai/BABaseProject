//
//  NSObject+Network.h
//  BABaseProject
//
//  Created by apple on 16/1/13.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <Foundation/Foundation.h>


#define kCompletionHandle  completionHandle:(void(^)(id model, NSError *error))completionHandle;

@interface NSObject (Network)

/*
 
 请求类型:Get Post
 Get: 传递小型数据, 数据
 Post: 传递大型数据, 传zip/图片/音乐...
 具体使用哪个请求: 由服务器人员规定
 
 */

+ (id)GET:(NSString *)URLPath parameters:(NSDictionary *)params kCompletionHandle;

+ (id)POST:(NSString *)URLPath parameters:(NSDictionary *)params kCompletionHandle;

@end
