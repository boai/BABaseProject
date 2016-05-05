//
//  NSObject+Network.h
//  BABaseProject
//
//  Created by apple on 16/1/13.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <Foundation/Foundation.h>


#define kCompletionHandle completionHandle:(void(^)(id model, NSError *error))completionHandle;

typedef NS_ENUM(NSUInteger, BAResponseStyle){

    BAResponseStyleJSON,
    BAResponseStyleXML,
    BAResponseStyleData,
};



@interface NSObject (Network)

/*
 
 请求类型:Get Post
 Get: 传递小型数据, 数据
 Post: 传递大型数据, 传zip/图片/音乐...
 具体使用哪个请求: 由服务器人员规定
 
 */

//+ (id)GET:(NSString *)URLPath parameters:(NSDictionary *)params kCompletionHandle;
//
//+ (id)POST:(NSString *)URLPath parameters:(NSDictionary *)params kCompletionHandle;

/*!
 *  请求类型:Get
 *
 *  @param url      请求url
 *  @param params   请求参数
 *  @param style    请求数据样式：JSON、XML、Data
 *  @param headFile 请求头
 *
 *  @return 请求成功后返回请求数据
 */
+ (id)BA_GET_Url:(NSString *)url
      parameters:(NSDictionary *)params
        response:(BAResponseStyle)style
 requestHeadFile:(NSDictionary *)headFile kCompletionHandle;

/*!
 *  请求类型:Post
 *
 *  @param url      请求url
 *  @param params   请求参数
 *  @param style    请求数据样式：JSON、XML、Data
 *  @param headFile 请求头
 *
 *  @return 请求成功后返回请求数据
 */
+ (id)BA_POST_Url:(NSString *)url
       parameters:(NSDictionary *)params
         response:(BAResponseStyle)style
  requestHeadFile:(NSDictionary *)headFile kCompletionHandle;

@end
