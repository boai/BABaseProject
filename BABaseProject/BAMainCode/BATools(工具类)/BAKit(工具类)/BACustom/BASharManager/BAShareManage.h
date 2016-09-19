//
//  ShareManage.h
//  yrapp
//
//  Created by 博爱 on 16/2/3.
//  Copyright © 2016年 有人科技. All rights reserved.
//  友盟分享工具类

#import <Foundation/Foundation.h>
#import <MessageUI/MessageUI.h>

#define BASHAREMANAGER [BAShareManage shareManage]

@protocol BAShareManageDelegate <NSObject>

/*! 返回用户信息 */
- (void)getUserData:(NSDictionary *)backUserData;

@end

@interface BAShareManage : NSObject <MFMessageComposeViewControllerDelegate>

/** 登录后返回的数据 **/
@property (nonatomic, weak) id<BAShareManageDelegate> delegate;

/*!
 *  友盟分享工具类封装
 *
 *  @return 返回：友盟分享工具类封装的实例
 */
+ (BAShareManage *)shareManage;

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
- (void)BA_QQLogin:(UIViewController *)viewController;

/*！友盟 Qzone 登录 */
- (void)BA_QzoneLogin:(UIViewController *)viewController;

/*！友盟 新浪微博登录 */
- (void)BA_SinaLogin:(UIViewController *)viewController;
/*！删除新浪微博登陆授权调用下面的方法 */
- (void)deleteSinaLogin;

/*！友盟 微信 登录 */
- (void)BA_WechatSessionLogin:(UIViewController *)viewController;

/*!
 *  友盟登录列表
 *
 *  @param viewController viewController
 */
- (void)BA_UMLoginListWithViewControll:(UIViewController *)viewController;

@end
