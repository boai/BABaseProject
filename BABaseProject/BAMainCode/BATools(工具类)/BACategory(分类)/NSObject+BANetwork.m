////
////  NSObject+BANetwork.m
////  BABaseProject
////
////  Created by apple on 16/1/13.
////  Copyright © 2016年 博爱之家. All rights reserved.
////
//
//#import "NSObject+BANetwork.h"
//
//@implementation NSObject (BANetwork)
//
//+ (AFHTTPSessionManager *)sharedAFManager
//{
//    static AFHTTPSessionManager *manager = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        manager = [AFHTTPSessionManager manager];
//        
//        manager.requestSerializer.timeoutInterval = 30;
//        // 设置响应数据的基本了类型
//        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/plain", @"application/javascript", nil];
//
////        [manager.requestSerializer setValue:nil forHTTPHeaderField:nil];
//        
//    });
//    
//    return manager;
//}
//
//
////+(id)GET:(NSString *)URLPath parameters:(NSDictionary *)params completionHandle:(void (^)(id, NSError *))completionHandle
////{
////    return [[self sharedAFManager] GET:URLPath parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
////        
////        completionHandle(responseObject, nil);
////    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
////        
////        completionHandle(nil, error);
////    }];
////}
////
////
////+(id)POST:(NSString *)URLPath parameters:(NSDictionary *)params completionHandle:(void (^)(id, NSError *))completionHandle
////{
////    return [[self sharedAFManager] POST:URLPath parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
////        
////        completionHandle(responseObject, nil);
////    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
////        
////        completionHandle(nil, error);
////    }];
////}
//
//+ (id)BA_GET_Url:(NSString *)url
//      parameters:(NSDictionary *)params
//        response:(BAResponseStyle)style
// requestHeadFile:(NSDictionary *)headFile
//completionHandle:(void (^)(id, NSError *))completionHandle
//{
//    // 1. 根据style类型，去选择返回值的类型
//    switch (style) {
//        case BAResponseStyleJSON:
//            [self sharedAFManager].responseSerializer = [AFJSONResponseSerializer serializer];
//            break;
//        case BAResponseStyleXML:
//            [self sharedAFManager].responseSerializer = [AFXMLParserResponseSerializer serializer];
//            break;
//        case BAResponseStyleData:
//            [self sharedAFManager].responseSerializer = [AFHTTPResponseSerializer serializer];
//            break;
//        default:
//            break;
//    }
//    
//    // 2. 给网络请求加请求头
//    if (headFile) {
//        for (NSString *key in headFile.allKeys) {
//            [[self sharedAFManager].requestSerializer setValue:headFile[key] forHTTPHeaderField:key];
//        }
//    }
//    
//    // 3. UTF8转码
//    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
//    
//    // 4. 发送GET请求
//    return [[self sharedAFManager] GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
//        /****************************************************/
//        // 如果请求成功 , 回调请求到的数据 , 同时 在这里 做本地缓存
//        NSString *path = [NSString stringWithFormat:@"%ld.plist", [url hash]];
//        // 存储的沙盒路径
//        NSString *path_doc = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
//        // 归档
//        [NSKeyedArchiver archiveRootObject:responseObject toFile:[path_doc stringByAppendingPathComponent:path]];
//        
//        completionHandle(responseObject, nil);
//
////        if (success)
////        {
////            success(task, responseObject);
////        }
//
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//        completionHandle(nil, error);
//
//    }];
//    
//}
//
//+ (id)BA_POST_Url:(NSString *)url
//       parameters:(NSDictionary *)params
//         response:(BAResponseStyle)style
//  requestHeadFile:(NSDictionary *)headFile
// completionHandle:(void (^)(id, NSError *))completionHandle
//{
//    // 1. 根据style类型，去选择返回值的类型
//    switch (style) {
//        case BAResponseStyleJSON:
//            [self sharedAFManager].responseSerializer = [AFJSONResponseSerializer serializer];
//            break;
//        case BAResponseStyleXML:
//            [self sharedAFManager].responseSerializer = [AFXMLParserResponseSerializer serializer];
//            break;
//        case BAResponseStyleData:
//            [self sharedAFManager].responseSerializer = [AFHTTPResponseSerializer serializer];
//            break;
//        default:
//            break;
//    }
//    
//    // 2. 给网络请求加请求头
//    if (headFile) {
//        for (NSString *key in headFile.allKeys) {
//            [[self sharedAFManager].requestSerializer setValue:headFile[key] forHTTPHeaderField:key];
//        }
//    }
//    
//    // 3. UTF8转码
//    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
//    
//    // 4. 发送POST请求
//    return [[self sharedAFManager] POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
//        /* ************************************************** */
//        //如果请求成功 , 回调请求到的数据 , 同时 在这里 做本地缓存
//        NSString *path = [NSString stringWithFormat:@"%ld.plist", [url hash]];
//        // 存储的沙盒路径
//        NSString *path_doc = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
//        // 归档
//        [NSKeyedArchiver archiveRootObject:responseObject toFile:[path_doc stringByAppendingPathComponent:path]];
//        
//        completionHandle(responseObject, nil);
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//        /* *************************************************** */
//        // 在这里读取本地缓存
//        NSString *path = [NSString stringWithFormat:@"%ld.plist", [url hash]];
//        NSString *path_doc = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
//        
//        id result = [NSKeyedUnarchiver unarchiveObjectWithFile:[path_doc stringByAppendingPathComponent:path]];
//        
//        if (result) {
//            completionHandle(task, result);
//        } else {
//            completionHandle(nil, error);
//        }
//
//    }];
//}
<<<<<<< HEAD

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
        
        
//        [self writeInfoWithDict:(NSDictionary *)responseObject];
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

//- (void)uploadFileWithfileList:(NSMutableArray *)params//存放上传文件的数组
//                        Option:(NSDictionary *)optiondic//请求参数
//                           Url:(NSString *)requestURL//上传网络地址
//                       Success:(void(^)(id responseObject))successBlock
//                       Failure:(void(^)(NSError *error))failBlock
//                      progress:(void (^)(float progress))progress{
//    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
//    //设置返回的数据解析格式
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
//    AFHTTPRequestOperation *operation = [manager POST:requestURL parameters:optiondic constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//        //下方举了一个极端例子：当数组里存放了不同类型的文件如何上传
//        for (int i = 0; i<params.count; i++) {
//            if ([params[i] isKindOfClass:[UIImage class]]) {
//                
//                UIImage *image = [params[i] imageCompressForWidth:params[i] targetWidth:375];
//                NSData *imageData =UIImagePNGRepresentation(image);
//                [formData appendPartWithFileData:imageData name:@"file_content" fileName:[NSString stringWithFormat:@"anyImage_%d.png",i] mimeType:@"image/png"];
//            }else if ([params[i] isKindOfClass:[NSString class]]) {
//                NSURL *url = [NSURL fileURLWithPath:params[i]];
//                NSData *data = [NSData dataWithContentsOfURL:url];
//                [formData appendPartWithFileData:data name:@"file_content" fileName:@"11.aac" mimeType:@"audio/x-mei-aac"];
//                
//            }else if ([params[i] isKindOfClass:[NSURL class]]) {
//                NSData *data = [NSData dataWithContentsOfURL:params[i]];
//                [formData appendPartWithFileData:data name:@"file_content" fileName:@"11.aac" mimeType:@"audio/x-mei-aac"];
//            }
//            
//        }
//    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        successBlock(responseObject);
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        failBlock(error);
//    }];
//    //获得上传进度
//    [operation setUploadProgressBlock:^(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite) {
//        NSLog(@"百分比:%f",totalBytesWritten*1.0/totalBytesExpectedToWrite);
//        progress(totalBytesWritten*1.0/totalBytesExpectedToWrite);
//        
//        
//    }];
//}

+ (void)writeInfoWithDict:(NSDictionary *)dict
{
    NSMutableString *strM = [NSMutableString string];
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        //  NSLog(@"%@,%@",key,[obj class]);
        
        NSString *className = NSStringFromClass([obj class]) ;
        
        if ([className isEqualToString:@"__NSCFString"] | [className isEqualToString:@"__NSCFConstantString"] | [className isEqualToString:@"NSTaggedPointerString"]) {
            [strM appendFormat:@"@property (nonatomic, copy) NSString *%@;\\\\n",key];
        }else if ([className isEqualToString:@"__NSCFArray"] |
                  [className isEqualToString:@"__NSArray0"] |
                  [className isEqualToString:@"__NSArrayI"]){
            [strM appendFormat:@"@property (nonatomic, strong) NSArray *%@;\\\\n",key];
        }else if ([className isEqualToString:@"__NSCFDictionary"]){
            [strM appendFormat:@"@property (nonatomic, strong) NSDictionary *%@;\\\\n",key];
        }else if ([className isEqualToString:@"__NSCFNumber"]){
            [strM appendFormat:@"@property (nonatomic, copy) NSNumber *%@;\\\\n",key];
        }else if ([className isEqualToString:@"__NSCFBoolean"]){
            [strM appendFormat:@"@property (nonatomic, assign) BOOL  %@;\\\\n",key];
        }else if ([className isEqualToString:@"NSDecimalNumber"]){
            [strM appendFormat:@"@property (nonatomic, copy) NSString *%@;\\\\n",[NSString stringWithFormat:@"%@",key]];
        }
        else if ([className isEqualToString:@"NSNull"]){
            [strM appendFormat:@"@property (nonatomic, copy) NSString *%@;\\\\n",[NSString stringWithFormat:@"%@",key]];
        }else if ([className isEqualToString:@"__NSArrayM"]){
            [strM appendFormat:@"@property (nonatomic, strong) NSMutableArray *%@;\\\\n",[NSString stringWithFormat:@"%@",key]];
        }
        
    }];
    BALog(@"\\\\n\\\\n%@\\\\n",strM);
}

@end
=======
//
//@end
>>>>>>> origin/master
