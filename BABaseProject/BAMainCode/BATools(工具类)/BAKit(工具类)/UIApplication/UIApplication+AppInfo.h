
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
 
 *********************************************************************************
 
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "AddressBook/ABAddressBook.h"
#import "EventKit/EventKit.h"
#import "AVFoundation/AVFoundation.h"
#import "AssetsLibrary/AssetsLibrary.h"

typedef void(^grantBlock)(BOOL granted);

@interface UIApplication (AppInfo)


@property (strong, nonatomic) UIWindow *window;


///-------------------------------------
/// @name  app基本信息
///-------------------------------------

/**
 当前app名称
 */
- (NSString *)appName;

/*
 当前app版本号
 */
- (NSString *)appVersion;

/**
 build 版本号
 */
- (NSString *)appBuild;

/**
  apps 证书编号 (例如MacKun.az.com)
 */
- (NSString *)appBundleID;

///--------------------------------------------------------------
/// @name  沙盒缓存大小
///--------------------------------------------------------------

/**
 *  沙盒的路径
 */
- (NSString *)documentsDirectoryPath;
/**
  沙盒的内容大小 (例如5 MB)
 */
- (NSString *)documentsFolderSizeAsString;

/**
  沙盒内的字节大小
 */
- (int)documentsFolderSizeInBytes;
/**
 *  程序的大小 包括文件 缓冲 以及 下载
 *
 *  @return  所有文件大小
 */
- (NSString *)applicationSize;


/////---------------------------------------------------------------
///// @name  app 隐私权限
/////---------------------------------------------------------------

/**
  定位权限是否开启
 */
- (BOOL)applicationHasAccessToLocationData;

/**
  通讯录访问权限是否开启
 */
- (BOOL)applicationhasAccessToAddressBook;

/**
  相机权限是否开启
 */
- (BOOL)applicationHasAccessToCalendar;

/**
  推送功能是否开启
 */
- (BOOL)applicationHasAccessToReminders;

/**
 相册权限是否开启
 */
- (BOOL)applicationHasAccessToPhotosLibrary;

/**
 *  麦克风开启
 *
 *  @warning
 */
- (void)applicationHasAccessToMicrophone:(grantBlock)flag;

///-------------------------------------
/// @name  app 相关事件
///-------------------------------------

/**
 *  注册推送(兼容iOS8)
 */
- (void)registerNotifications;
///**
// *  获取当前视图
// *
// */
- (UIViewController*)getCurrentViewConttoller;


@end
