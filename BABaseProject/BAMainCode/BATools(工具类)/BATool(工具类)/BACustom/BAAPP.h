
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
 * QQ     : 可以添加SDAutoLayout群 497140713 在这里找到我(博爱1616【137361770】)
 * 微博    : 博爱1616
 * Email  : 137361770@qq.com
 * GitHub : https://github.com/boai
 * 博客园  : http://www.cnblogs.com/boai/
 * 博客    : http://boai.github.io
 
 *********************************************************************************
 
 */

#import <Foundation/Foundation.h>


/*! 1、获取APP的名字 */
#define BA_APP_Name [[[NSBundle mainBundle] infoDictionary] objectForKey:BABundleName]

/*! 2、获取APP的版本号 */
#define BA_APP_Version [[[NSBundle mainBundle] infoDictionary] objectForKey:BABundleVersion]

/*! 3、获取App短式版本号 */
#define BA_APP_VersionShort [[[NSBundle mainBundle] infoDictionary] objectForKey:BABundleShortVersionString]

/*! 4、使用BALocalizedString检索本地化字符串 */
//#define BALocalizedString(key, comment) \
//[[NSBundle mainBundle] localizedStringForKey:(key) value:@"" table:@"BAKit"]

#define BALocalizedString(key, comment) NSLocalizedString(key, comment)


/*! 5、获取AppDelegate */
#define APPDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])

/*! 6、获取sharedApplication */
#define BASharedApplication [UIApplication sharedApplication]

FOUNDATION_EXPORT NSString * _Nonnull const BABundleName;
FOUNDATION_EXPORT NSString * _Nonnull const BABundleVersion;
FOUNDATION_EXPORT NSString * _Nonnull const BABundleShortVersionString;

@interface BAAPP : NSObject

// TODO:下面的方法还没有验证

/**
 *  Executes a block on first start of the App for current version.
 *  Remember to execute UI instuctions on main thread
 *
 *  @param block The block to execute, returns isFirstStartForCurrentVersion
 */
+ (void)onFirstStart:(void (^ _Nullable)(BOOL isFirstStart))block;

/**
 *  Executes a block on first start of the App.
 *  Remember to execute UI instuctions on main thread
 *
 *  @param block The block to execute, returns isFirstStart
 */
+ (void)onFirstStartForCurrentVersion:(void (^ _Nullable)(BOOL isFirstStartForCurrentVersion))block;

/**
 *  Executes a block on first start of the App for current given version.
 *  Remember to execute UI instuctions on main thread
 *
 *  @param version Version to be checked
 *  @param block   The block to execute, returns isFirstStartForVersion
 */
+ (void)onFirstStartForVersion:(NSString * _Nonnull)version
                         block:(void (^ _Nullable)(BOOL isFirstStartForCurrentVersion))block;

/**
 *  Returns if is the first start of the App
 *
 *  @return Returns if is the first start of the App
 */
+ (BOOL)isFirstStart;

/**
 *  Returns if is the first start of the App for current version
 *
 *  @return Returns if is the first start of the App for current version
 */
+ (BOOL)isFirstStartForCurrentVersion;

/**
 *  Returns if is the first start of the App for the given version
 *
 *  @param version Version to be checked
 *
 *  @return Returns if is the first start of the App for the given version
 */
+ (BOOL)isFirstStartForVersion:(NSString * _Nonnull)version;


@end
