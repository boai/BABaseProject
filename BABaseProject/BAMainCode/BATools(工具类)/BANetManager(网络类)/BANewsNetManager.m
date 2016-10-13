
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
 * QQ     : 博爱1616【137361770】
 * 微博    : 博爱1616
 * Email  : 137361770@qq.com
 * GitHub : https://github.com/boai
 * 博客园  : http://www.cnblogs.com/boai/
 * 博客    : http://boai.github.io
 
 *********************************************************************************
 
 */

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
    return [BANetManager ba_requestWithType:BAHttpRequestTypeGet UrlString:path Parameters:nil SuccessBlock:^(id response) {
        
        completionHandle([BAVideoModel BAMJParse:response], nil);
        
    } FailureBlock:^(NSError *error) {
        
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
    return [BANetManager ba_requestWithType:BAHttpRequestTypeGet UrlString:DemoVC11URLPath Parameters:nil SuccessBlock:^(id response) {
        
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
        
    } FailureBlock:^(NSError *error) {
        
        BALog(@"error：%@", error);
        completionHandle(nil, error);
        
    } progress:^(int64_t bytesProgress, int64_t totalBytesProgress) {
        
    }];
}

/*!
 *  示例3：DemoVC11中的网络获取示例 post
 *
 *  @return DemoVC11中的网络获取示例
 */
+ (id)postDemoVC11DataWithParameters:parameters completionHandle:(void(^)(id model, NSError *error))completionHandle
{
//    NSString *url = [NSString stringWithFormat:@"%@%@", DemoVC11URLPath2, parameters[@"page"]];
    return [BANetManager ba_requestWithType:BAHttpRequestTypePost UrlString:DemoVC11URLPath2 Parameters:parameters SuccessBlock:^(id response) {
        completionHandle([DemoVC11_model BAMJParse:response], nil);
    } FailureBlock:^(NSError *error) {
        BALog(@"error：%@", error);
        completionHandle(nil, error);
    } progress:^(int64_t bytesProgress, int64_t totalBytesProgress) {
        
    }];
}

@end
