//
//  ShareManage.h
//  yrapp
//
//  Created by 博爱 on 16/2/3.
//  Copyright © 2016年 有人科技. All rights reserved.
//  友盟分享工具类

#import <Foundation/Foundation.h>
#import <MessageUI/MessageUI.h>


@protocol BAShareManageDelegate <NSObject>

/*! 返回用户信息 */
- (void)getUserData:(NSDictionary *)backUserData;

@end

@interface BAShareManage : NSObject <MFMessageComposeViewControllerDelegate>

/** 登录后返回的数据 **/
@property (nonatomic, weak) id<BAShareManageDelegate> delegate;
/*! 图片数组 */
@property (nonatomic, strong) NSArray *shareImageArray;
/*! 分享的名字数组（要和图片名字一一对应哦！） */
@property (nonatomic, strong) NSArray *shareNameArray;

//// 友盟分享SDK的各种key设置【pod下来后只需调用下即可】
//@property (nonatomic, strong) NSString *BAShareUmengAppkey;
//@property (nonatomic, strong) NSString *BAShareSinaAppKey;
//@property (nonatomic, strong) NSString *BAShareWX_APP_KEY;
//@property (nonatomic, strong) NSString *BAShareWX_APP_SECRET;
//@property (nonatomic, strong) NSString *BASharekQQKey;
//@property (nonatomic, strong) NSString *BASharekQQAppID;



+ (BAShareManage *)shareManage;

- (void)shareConfig;

#pragma mark - ***** 友盟分享
/**微信分享**/
- (void)BA_wxShareWithViewControll:(UIViewController *)viewC withShareText:(NSString *)shareText image:(UIImage *)shareImage url:(NSString *)shareURLString;

/**新浪微博分享**/
- (void)BA_wbShareWithViewControll:(UIViewController *)viewC withShareText:(NSString *)shareText image:(UIImage *)shareImage;

/**微信朋友圈分享**/
- (void)BA_wxpyqShareWithViewControll:(UIViewController *)viewC withShareText:(NSString *)shareText image:(UIImage *)shareImage url:shareURLString;

/**短信分享**/
- (void)BA_smsShareWithViewControll:(UIViewController *)viewC withShareText:(NSString *)shareText image:(UIImage *)shareImage;

/**分享列表**/
- (void)BA_UMshareListWithViewControll:(UIViewController *)viewC withShareText:(NSString *)shareText image:(UIImage *)shareImage url:(NSString *)shareURLString;

#pragma mark - ***** 友盟登录
/**友盟 QQ 登录**/
- (void)BA_QQLogin:(UIViewController *)viewController;

/**友盟 Qzone 登录**/
- (void)BA_QzoneLogin:(UIViewController *)viewController;

/**友盟 新浪微博登录**/
- (void)BA_SinaLogin:(UIViewController *)viewController;
/**删除新浪微博登陆授权调用下面的方法**/
- (void)deleteSinaLogin;

/**友盟 微信 登录**/
- (void)BA_WechatSessionLogin:(UIViewController *)viewController;

/**友盟登录列表**/
- (void)BA_UMLoginListWithViewControll:(UIViewController *)viewController;

@end
