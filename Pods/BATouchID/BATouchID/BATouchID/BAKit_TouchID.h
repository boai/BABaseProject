//
//  BAKit_TouchID.h
//  BAKit_TouchID
//
//  Created by boai on 2017/5/22.
//  Copyright © 2017年 boaihome.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <LocalAuthentication/LocalAuthentication.h>


// 操作系统版本号
#define IOS_VERSION ([[[UIDevice currentDevice] systemVersion] floatValue])

/**
 *  TouchID 状态
 */
typedef NS_ENUM(NSUInteger, BAKit_TouchIDType){
    
    /**
     *  当前设备不支持TouchID
     */
    BAKit_TouchIDTypeNotSupport = 0,
    /**
     *  TouchID 验证成功
     */
    BAKit_TouchIDTypeSuccess,
    /**
     *  TouchID 验证失败
     */
    BAKit_TouchIDTypeFail,
    /**
     *  TouchID 被用户手动取消
     */
    BAKit_TouchIDTypeUserCancel,
    /**
     *  用户不使用TouchID,选择手动输入密码
     */
    BAKit_TouchIDTypeInputPassword,
    /**
     *  TouchID 被系统取消 (如遇到来电,锁屏,按了Home键等)
     */
    BAKit_TouchIDTypeSystemCancel,
    /**
     *  TouchID 无法启动,因为用户没有设置密码
     */
    BAKit_TouchIDTypePasswordNotSet,
    /**
     *  TouchID 无法启动,因为用户没有设置TouchID
     */
    BAKit_TouchIDTypeTouchIDNotSet,
    /**
     *  TouchID 无效
     */
    BAKit_TouchIDTypeTouchIDNotAvailable,
    /**
     *  TouchID 被锁定(连续多次验证TouchID失败,系统需要用户手动输入密码)
     */
    BAKit_TouchIDTypeTouchIDLockout,
    /**
     *  当前软件被挂起并取消了授权 (如App进入了后台等)
     */
    BAKit_TouchIDTypeAppCancel,
    /**
     *  当前软件被挂起并取消了授权 (LAContext对象无效)
     */
    BAKit_TouchIDTypeInvalidContext,
    /**
     *  系统版本不支持TouchID (必须高于iOS 8.0才能使用)
     */
    BAKit_TouchIDTypeVersionNotSupport
};

/**
 指纹解锁 回调

 @param touchIDType 返回的类型，BAKit_TouchIDType
 @param error error
 @param errorMessage errorMessage
 */
typedef void (^BAKit_TouchID_Block)(BAKit_TouchIDType touchIDType, NSError *error, NSString *errorMessage);

/**
 判断是否支持指纹解锁 回调

 @param isSupport 是否支持
 @param context context
 @param policy policy
 @param error error
 */
typedef void (^BAKit_TouchIDVerifyIsSupport_Block)(BOOL isSupport, LAContext *context, NSInteger policy, NSError *error);

@interface BAKit_TouchID : NSObject

/**
 指纹解锁
 
 @param content  提示文本
 @param cancelButtonTitle  取消按钮显示内容(此参数只有iOS10以上才能生效)，默认（nil）：取消
 @param otherButtonTitle   密码登录按钮显示内容，默认（nil）：输入密码（nil）
 @param enabled    默认：NO，输入密码按钮，使用系统解锁；YES：自己操作点击密码登录
 @param BAKit_TouchIDTypeBlock   返回状态码和错误，可以自行单独处理
 */
+ (void)ba_touchIDWithContent:(NSString *)content
            cancelButtonTitle:(NSString *)cancelButtonTitle
             otherButtonTitle:(NSString *)otherButtonTitle
                      enabled:(BOOL)enabled
       BAKit_TouchIDTypeBlock:(BAKit_TouchID_Block)BAKit_TouchIDTypeBlock;

/**
 判断是否支持指纹解锁

 @param block block
 */
+ (void)ba_touchIDVerifyIsSupportWithBlock:(BAKit_TouchIDVerifyIsSupport_Block)block;

@end
