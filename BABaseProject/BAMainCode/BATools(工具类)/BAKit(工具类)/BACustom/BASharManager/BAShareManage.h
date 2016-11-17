
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


/*!
 最新更新时间：2016-11-17 【倒叙】
 最新Version：【Version：2.0】
 更新内容：
     2.0.1、优化方法名命名规范
     2.0.2、新增 分享类型选择，可以单独选择分享类型
     2.0.3、新增 软件安装判断，如果没有安装就不显示
     2.0.4、新增 友盟登录封装，返回用户信息代理更详细
 */
#import <Foundation/Foundation.h>
#import <MessageUI/MessageUI.h>

#define BASHAREMANAGER [BAShareManage ba_shareManage]


typedef NS_ENUM(NSUInteger, BAShareManageType) {
    /*! 默认类型 */
    BAShareManageTypeNone,
    /*! 纯图片类型分享 */
    BAShareManageTypeImage,
    /*! 截图类型分享 */
    BAShareManageTypeScreenShots
};
@protocol BAShareManageDelegate <NSObject>

/*! 返回用户信息 */
- (void)getUserData:(NSDictionary *)backUserData;

@end

@interface BAShareManage : NSObject <MFMessageComposeViewControllerDelegate>

/** 登录后返回的数据 **/
@property (nonatomic, weak) id<BAShareManageDelegate> delegate;

/*! 博爱分享：纯图片，默认为 NO */
@property (nonatomic, assign) BAShareManageType shareManageType;

/*!
 *  友盟分享工具类封装
 *
 *  @return 返回：友盟分享工具类封装的实例
 */
+ (BAShareManage *)ba_shareManage;

/*!
 *  友盟分享设置
 */
- (void)ba_setupShareConfig;

#pragma mark - ***** 友盟分享
/*! 微信分享 */
- (void)ba_wxShareWithViewControll:(UIViewController *)viewC
                             title:(NSString *)shareTitle
                      shareContent:(NSString *)shareContent
                             image:(UIImage *)shareImage
                               url:(NSString *)shareURLString;

/*! 微信朋友圈分享 */
- (void)ba_wxpyqShareWithViewControll:(UIViewController *)viewC
                                title:(NSString *)shareTitle
                         shareContent:(NSString *)shareContent
                                image:(UIImage *)shareImage
                                  url:(NSString *)shareURLString;

/*! 新浪微博分享 */
- (void)ba_wbShareWithViewControll:(UIViewController *)viewC
                             title:(NSString *)shareTitle
                      shareContent:(NSString *)shareContent
                             image:(UIImage *)shareImage
                               url:(NSString *)shareURLString;

/*! qq分享 */
- (void)ba_qqShareWithViewControll:(UIViewController *)viewC
                             title:(NSString *)shareTitle
                      shareContent:(NSString *)shareContent
                             image:(UIImage *)shareImage
                               url:(NSString *)shareURLString;

/*! qqzone分享 */
- (void)ba_qqzoneShareWithViewControll:(UIViewController *)viewC
                                 title:(NSString *)shareTitle
                          shareContent:(NSString *)shareContent
                                 image:(UIImage *)shareImage
                                   url:(NSString *)shareURLString;

/*! 短信分享 */
- (void)ba_smsShareWithViewControll:(UIViewController *)viewC
                              title:(NSString *)shareTitle
                       shareContent:(NSString *)shareContent
                              image:(UIImage *)shareImage
                                url:(NSString *)shareURLString;

/*!
 *  友盟分享列表
 *
 *  @param viewC          viewC
 *  @param title          sharetitle
 *  @param shareContent   shareContent
 *  @param shareImage     shareImage
 *  @param shareURLString shareURLString
 */
- (void)ba_UMshareListWithViewControll:(UIViewController *)viewC
                                 title:(NSString *)shareTitle
                          shareContent:(NSString *)shareContent
                                 image:(UIImage *)shareImage
                                   url:(NSString *)shareURLString;


#pragma mark - ***** 友盟登录
/*！友盟 QQ 登录 */
- (void)ba_QQLogin:(UIViewController *)viewController;

/*！友盟 Qzone 登录 */
- (void)ba_QzoneLogin:(UIViewController *)viewController;

/*！友盟 新浪微博登录 */
- (void)ba_SinaLogin:(UIViewController *)viewController;
/*！删除新浪微博登陆授权调用下面的方法 */
- (void)deleteSinaLogin;

/*！友盟 微信 登录 */
- (void)ba_WechatSessionLogin:(UIViewController *)viewController;

/*!
 *  友盟登录列表
 *
 *  @param viewController viewController
 */
- (void)ba_UMLoginListWithViewControll:(UIViewController *)viewController;

@end
