
/*!
 *  @header BAKit.h
 *          BABaseProject
 *
 *  @brief  BAKit
 *
 *  @author 博爱
 *  @copyright    Copyright © 2016年 博爱. All rights reserved.
 *  @version    V1.0
 */

//                            _ooOoo_
//                           o8888888o
//                           88" . "88
//                           (| -_- |)
//                            O\ = /O
//                        ____/`---'\____
//                      .   ' \\| |// `.
//                       / \\||| : |||// \
//                     / _||||| -:- |||||- \
//                       | | \\\ - /// | |
//                     | \_| ''\---/'' | |
//                      \ .-\__ `-` ___/-. /
//                   ___`. .' /--.--\ `. . __
//                ."" '< `.___\_<|>_/___.' >'"".
//               | | : `- \`.;`\ _ /`;.`/ - ` : | |
//                 \ \ `-. \_ __\ /__ _/ .-` / /
//         ======`-.____`-.___\_____/___.-`____.-'======
//                            `=---='
//
//         .............................................
//                  佛祖镇楼                  BUG辟易
//          佛曰:
//                  写字楼里写字间，写字间里程序员；
//                  程序人员写程序，又拿程序换酒钱。
//                  酒醒只在网上坐，酒醉还来网下眠；
//                  酒醉酒醒日复日，网上网下年复年。
//                  但愿老死电脑间，不愿鞠躬老板前；
//                  奔驰宝马贵者趣，公交自行程序员。
//                  别人笑我忒疯癫，我笑自己命太贱；
//                  不见满街漂亮妹，哪个归得程序员？

/*
 
 *********************************************************************************
 *
 * 在使用BAKit的过程中如果出现bug请及时以以下任意一种方式联系我，我会及时修复bug
 *
 * QQ     : 可以添加ios开发技术群 479663605 在这里找到我(博爱1616【137361770】)
 * 微博    : 博爱1616
 * Email  : 137361770@qq.com
 * GitHub : https://github.com/boai
 * 博客园  : http://www.cnblogs.com/boai/
 * 博客    : http://boai.github.io
 * 简书    : http://www.jianshu.com/users/95c9800fdf47/latest_articles
 * 简书专题 : http://www.jianshu.com/collection/072d578bf782
 
 *********************************************************************************
 
 */

/*!
 *********************************************************************************
 ************************************ 更新说明 ************************************
 *********************************************************************************

 最新更新时间：2017-05-03 【倒叙】
 最新Version：【Version：2.2.2】
 更新内容：
 2.2.1、优化方法名命名规范
 2.2.2、优化网络状态实时监测 block 回调，去除多余设置，需要网络判断，直接调用block回调即可
 2.2.3、新增 YYCache 缓存处理
 2.2.4、新增自定义：超时设置
 2.2.5、新增自定义：requestSerializer设置
 2.2.6、新增自定义：responseSerializer设置
 2.2.7、新增自定义：请求头设置
 2.2.8、新增自定义 CA 证书 和 HTTPS 请求配置，只需把证书导入项目目录即可，无需设置
 2.2.9、新增史上最全的 AFN 请求 NSLog 打印，详见 demo 控制台打印结果
 2.2.10、新增 DEBUG 模式下的 NSLog 判断，release 下不会打印，请放心使用
 2.2.11、如果打印数据不完整，是因为 Xcode 8 版本问题，请下断点打印数据
 2.2.12、由于新版本改动较大，原有方法命名可能有所改动，希望老用户见谅！
 2.2.13、目前版本较稳定，稍后奉上 pod 版本！请大家耐心等待

 
 最新更新时间：2016-11-24 【倒叙】
 最新Version：【Version：2.1】
 更新内容：
 2.1.1、优化方法名命名规范
 2.1.2、新增网络状态实时监测 block 回调，新增单独网络监测 bool 返回，详见 demo
 2.1.3、新增旧方法更新提示
 2.1.4、优化各种注释
 
 最新更新时间：2016-11-17
 最新Version：【Version：2.0】
 更新内容：
    2.0.1、优化方法名命名规范
    2.0.2、新增部分注释
    2.0.3、视频上传方法对接，目前有很多项目对接成功
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#define BANetManagerShare [BANetManager sharedBANetManager]

#define BAWeak  __weak __typeof(self) weakSelf = self

/*! 过期属性或方法名提醒 */
#define BANetManagerDeprecated(instead) __deprecated_msg(instead)


/*! 使用枚举NS_ENUM:区别可判断编译器是否支持新式枚举,支持就使用新的,否则使用旧的 */
typedef NS_ENUM(NSUInteger, BANetworkStatus)
{
    /*! 未知网络 */
    BANetworkStatusUnknown           = 0,
    /*! 没有网络 */
    BANetworkStatusNotReachable,
    /*! 手机 3G/4G 网络 */
    BANetworkStatusReachableViaWWAN,
    /*! wifi 网络 */
    BANetworkStatusReachableViaWiFi
};

/*！定义请求类型的枚举 */
typedef NS_ENUM(NSUInteger, BAHttpRequestType)
{
    /*! get请求 */
    BAHttpRequestTypeGet = 0,
    /*! post请求 */
    BAHttpRequestTypePost,
    /*! put请求 */
    BAHttpRequestTypePut,
    /*! delete请求 */
    BAHttpRequestTypeDelete
};

typedef NS_ENUM(NSUInteger, BAHttpRequestSerializer) {
    /** 设置请求数据为JSON格式*/
    BAHttpRequestSerializerJSON,
    /** 设置请求数据为HTTP格式*/
    BAHttpRequestSerializerHTTP,
};

typedef NS_ENUM(NSUInteger, BAHttpResponseSerializer) {
    /** 设置响应数据为JSON格式*/
    BAHttpResponseSerializerJSON,
    /** 设置响应数据为HTTP格式*/
    BAHttpResponseSerializerHTTP,
};

/*! 实时监测网络状态的 block */
typedef void(^BANetworkStatusBlock)(BANetworkStatus status);

/*! 定义请求成功的 block */
typedef void( ^ BAResponseSuccess)(id response);
/*! 定义请求失败的 block */
typedef void( ^ BAResponseFail)(NSError *error);

/*! 定义上传进度 block */
typedef void( ^ BAUploadProgress)(int64_t bytesProgress,
                                  int64_t totalBytesProgress);
/*! 定义下载进度 block */
typedef void( ^ BADownloadProgress)(int64_t bytesProgress,
                                    int64_t totalBytesProgress);

/*!
 *  方便管理请求任务。执行取消，暂停，继续等任务.
 *  - (void)cancel，取消任务
 *  - (void)suspend，暂停任务
 *  - (void)resume，继续任务
 */
typedef NSURLSessionTask BAURLSessionTask;


@interface BANetManager : NSObject

/**
 创建的请求的超时间隔（以秒为单位），此设置为全局统一设置一次即可，默认超时时间间隔为30秒。
 */
@property (nonatomic, assign) NSTimeInterval timeoutInterval;

/**
 设置网络请求参数的格式，此设置为全局统一设置一次即可，默认：BAHttpRequestSerializerJSON
 */
@property (nonatomic, assign) BAHttpRequestSerializer requestSerializer;

/**
 设置服务器响应数据格式，此设置为全局统一设置一次即可，默认：BAHttpResponseSerializerJSON
 */
@property (nonatomic, assign) BAHttpResponseSerializer responseSerializer;

/**
 自定义请求头：httpHeaderField
 */
@property(nonatomic, strong) NSDictionary *httpHeaderFieldDictionary;

/*!
 *  获得全局唯一的网络请求实例单例方法
 *
 *  @return 网络请求类BANetManager单例
 */
+ (instancetype)sharedBANetManager;


#pragma mark - 网络请求的类方法 --- get / post / put / delete
/**
 网络请求的实例方法 get

 @param urlString 请求的地址
 @param isNeedCache 是否需要缓存，只有 get / post 请求有缓存配置
 @param parameters 请求的参数
 @param successBlock 请求成功的回调
 @param failureBlock 请求失败的回调
 @param progress 进度
 @return BAURLSessionTask
 */
+ (BAURLSessionTask *)ba_request_GETWithUrlString:(NSString *)urlString
                                      isNeedCache:(BOOL)isNeedCache
                                       parameters:(NSDictionary *)parameters
                                     successBlock:(BAResponseSuccess)successBlock
                                     failureBlock:(BAResponseFail)failureBlock
                                         progress:(BADownloadProgress)progress;

/**
 网络请求的实例方法 post

 @param urlString 请求的地址
 @param isNeedCache 是否需要缓存，只有 get / post 请求有缓存配置
 @param parameters 请求的参数
 @param successBlock 请求成功的回调
 @param failureBlock 请求失败的回调
 @param progress 进度
 @return BAURLSessionTask
 */
+ (BAURLSessionTask *)ba_request_POSTWithUrlString:(NSString *)urlString
                                       isNeedCache:(BOOL)isNeedCache
                                        parameters:(NSDictionary *)parameters
                                      successBlock:(BAResponseSuccess)successBlock
                                      failureBlock:(BAResponseFail)failureBlock
                                          progress:(BADownloadProgress)progress;

/**
 网络请求的实例方法 put

 @param urlString 请求的地址
 @param parameters 请求的参数
 @param successBlock 请求成功的回调
 @param failureBlock 请求失败的回调
 @param progress 进度
 @return BAURLSessionTask
 */
+ (BAURLSessionTask *)ba_request_PUTWithUrlString:(NSString *)urlString
                                       parameters:(NSDictionary *)parameters
                                     successBlock:(BAResponseSuccess)successBlock
                                     failureBlock:(BAResponseFail)failureBlock
                                         progress:(BADownloadProgress)progress;

/**
 网络请求的实例方法 delete

 @param urlString 请求的地址
 @param parameters 请求的参数
 @param successBlock 请求成功的回调
 @param failureBlock 请求失败的回调
 @param progress 进度
 @return BAURLSessionTask
 */
+ (BAURLSessionTask *)ba_request_DELETEWithUrlString:(NSString *)urlString
                                          parameters:(NSDictionary *)parameters
                                        successBlock:(BAResponseSuccess)successBlock
                                        failureBlock:(BAResponseFail)failureBlock
                                            progress:(BADownloadProgress)progress;

/**
 上传图片(多图)

 @param urlString 上传的url
 @param parameters 上传图片预留参数---视具体情况而定 可移除
 @param imageArray 上传的图片数组
 @param fileName 上传的图片数组fileName
 @param successBlock 上传成功的回调
 @param failureBlock 上传失败的回调
 @param progress 上传进度
 @return BAURLSessionTask
 */
+ (BAURLSessionTask *)ba_uploadImageWithUrlString:(NSString *)urlString
                                       parameters:(NSDictionary *)parameters
                                       imageArray:(NSArray *)imageArray
                                         fileName:(NSString *)fileName
                                     successBlock:(BAResponseSuccess)successBlock
                                      failurBlock:(BAResponseFail)failureBlock
                                   upLoadProgress:(BAUploadProgress)progress;

/**
 视频上传

 @param urlString 上传的url
 @param parameters 上传视频预留参数---视具体情况而定 可移除
 @param videoPath 上传视频的本地沙河路径
 @param successBlock 成功的回调
 @param failureBlock 失败的回调
 @param progress 上传的进度
 */
+ (void)ba_uploadVideoWithUrlString:(NSString *)urlString
                         parameters:(NSDictionary *)parameters
                          videoPath:(NSString *)videoPath
                       successBlock:(BAResponseSuccess)successBlock
                       failureBlock:(BAResponseFail)failureBlock
                     uploadProgress:(BAUploadProgress)progress;

/**
 文件下载

 @param urlString 请求的url
 @param parameters 文件下载预留参数---视具体情况而定 可移除
 @param savePath 下载文件保存路径
 @param successBlock 下载文件成功的回调
 @param failureBlock 下载文件失败的回调
 @param progress 下载文件的进度显示
 @return BAURLSessionTask
 */
+ (BAURLSessionTask *)ba_downLoadFileWithUrlString:(NSString *)urlString
                                        parameters:(NSDictionary *)parameters
                                          savaPath:(NSString *)savePath
                                      successBlock:(BAResponseSuccess)successBlock
                                      failureBlock:(BAResponseFail)failureBlock
                                  downLoadProgress:(BADownloadProgress)progress;

#pragma mark - 网络状态监测
/*!
 *  开启实时网络状态监测，通过Block回调实时获取(此方法可多次调用)
 */
+ (void)ba_startNetWorkMonitoringWithBlock:(BANetworkStatusBlock)networkStatus;

#pragma mark - 自定义请求头
/**
 *  自定义请求头
 */
+ (void)ba_setValue:(NSString *)value forHTTPHeaderKey:(NSString *)HTTPHeaderKey;

#pragma mark - 取消 Http 请求
/*!
 *  取消所有 Http 请求
 */
+ (void)ba_cancelAllRequest;

/*!
 *  取消指定 URL 的 Http 请求
 */
+ (void)ba_cancelRequestWithURL:(NSString *)URL;


#pragma mark - 各版本过期方法名
#pragma mark version 2.0 过期方法名
//+ (BAURLSessionTask *)ba_requestWithType:(BAHttpRequestType)type
//                               UrlString:(NSString *)urlString
//                              Parameters:(NSDictionary *)parameters
//                            SuccessBlock:(BAResponseSuccess)successBlock
//                            FailureBlock:(BAResponseFail)failureBlock
//                                progress:(BADownloadProgress)progress BANetManagerDeprecated("该方法已过期,请使用最新方法：+ (BAURLSessionTask *)ba_requestWithType:(BAHttpRequestType)type urlString:(NSString *)urlString parameters:(NSDictionary *)parameters successBlock:(BAResponseSuccess)successBlock failureBlock:(BAResponseFail)failureBlock progress:(BADownloadProgress)progress");

//+ (BAURLSessionTask *)ba_uploadImageWithUrlString:(NSString *)urlString
//                                       parameters:(NSDictionary *)parameters
//                                       ImageArray:(NSArray *)imageArray
//                                         FileName:(NSString *)fileName
//                                     SuccessBlock:(BAResponseSuccess)successBlock
//                                      FailurBlock:(BAResponseFail)failureBlock
//                                   UpLoadProgress:(BAUploadProgress)progress BANetManagerDeprecated("该方法已过期,请使用最新方法：+ (BAURLSessionTask *)ba_uploadImageWithUrlString:(NSString *)urlString parameters:(NSDictionary *)parameters imageArray:(NSArray *)imageArray fileName:(NSString *)fileName successBlock:(BAResponseSuccess)successBlock failurBlock:(BAResponseFail)failureBlock upLoadProgress:(BAUploadProgress)progress");
//
//+ (void)ba_uploadVideoWithUrlString:(NSString *)urlString
//                         parameters:(NSDictionary *)parameters
//                          VideoPath:(NSString *)videoPath
//                       SuccessBlock:(BAResponseSuccess)successBlock
//                       FailureBlock:(BAResponseFail)failureBlock
//                     UploadProgress:(BAUploadProgress)progress BANetManagerDeprecated("该方法已过期,请使用最新方法：+ (void)ba_uploadVideoWithUrlString:(NSString *)urlString parameters:(NSDictionary *)parameters videoPath:(NSString *)videoPath successBlock:(BAResponseSuccess)successBlock failureBlock:(BAResponseFail)failureBlock uploadProgress:(BAUploadProgress)progress");
//
//+ (BAURLSessionTask *)ba_downLoadFileWithUrlString:(NSString *)urlString
//                                        parameters:(NSDictionary *)parameters
//                                          SavaPath:(NSString *)savePath
//                                      SuccessBlock:(BAResponseSuccess)successBlock
//                                      FailureBlock:(BAResponseFail)failureBlock
//                                  DownLoadProgress:(BADownloadProgress)progress BANetManagerDeprecated("该方法已过期,请使用最新方法：+ (BAURLSessionTask *)ba_downLoadFileWithUrlString:(NSString *)urlString parameters:(NSDictionary *)parameters savaPath:(NSString *)savePath successBlock:(BAResponseSuccess)successBlock failureBlock:(BAResponseFail)failureBlock downLoadProgress:(BADownloadProgress)progress");

@end
