//
//  BAKit_TouchID.m
//  BAKit_TouchID
//
//  Created by boai on 2017/5/22.
//  Copyright © 2017年 boaihome.com. All rights reserved.
//

#import "BAKit_TouchID.h"
#import "BAKit_DeviceModel.h"

@implementation BAKit_TouchID

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
       BAKit_TouchIDTypeBlock:(BAKit_TouchID_Block)BAKit_TouchIDTypeBlock
{
    [BAKit_TouchID ba_touchIDVerifyIsSupportWithBlock:^(BOOL isSupport, LAContext *context, NSInteger policy, NSError *error) {
        
        context.localizedFallbackTitle = otherButtonTitle;
        NSInteger policy2;
        if (enabled)
        {
            policy2 = LAPolicyDeviceOwnerAuthenticationWithBiometrics;
        }
        else
        {
            policy2 = LAPolicyDeviceOwnerAuthentication;
        }
        
        if (isSupport)
        {
            // 支持指纹验证
            [context evaluatePolicy:policy2 localizedReason:content reply:^(BOOL success, NSError * _Nullable error) {
                if (success)
                {
                    dispatch_sync(dispatch_get_main_queue(), ^{
                        BAKit_TouchIDTypeBlock(BAKit_TouchIDTypeSuccess, error, nil);
                    });
                    
                    return ;
                }
                else if (error)
                {
                    NSString *msg = @"";
                    switch (error.code) {
                        case LAErrorAuthenticationFailed:
                        {
                            msg = @"TouchID 验证失败";
                            BAKit_TouchIDTypeBlock(BAKit_TouchIDTypeFail, error, msg);
                        }
                            break;
                        case LAErrorUserCancel:
                        {
                            msg = @"TouchID 被用户手动取消";
                            BAKit_TouchIDTypeBlock(BAKit_TouchIDTypeUserCancel, error, msg);
                        }
                            break;
                        case LAErrorUserFallback:
                        {
                            msg = @"用户不使用TouchID,选择手动输入密码";
                            BAKit_TouchIDTypeBlock(BAKit_TouchIDTypeInputPassword, error, msg);
                        }
                            break;
                        case LAErrorSystemCancel:
                        {
                            msg = @"TouchID 被系统取消 (如遇到来电,锁屏,按了Home键等)";
                            BAKit_TouchIDTypeBlock(BAKit_TouchIDTypeSystemCancel, error, msg);
                        }
                            break;
                        case LAErrorPasscodeNotSet:
                        {
                            msg = @"TouchID 无法启动,因为用户没有设置密码";
                            BAKit_TouchIDTypeBlock(BAKit_TouchIDTypePasswordNotSet, error, msg);
                        }
                            break;
                        case LAErrorTouchIDNotEnrolled:
                        {
                            msg = @"TouchID 无法启动,因为用户没有设置 TouchID";
                            BAKit_TouchIDTypeBlock(BAKit_TouchIDTypeTouchIDNotSet, error, msg);
                        }
                            break;
                        case LAErrorTouchIDNotAvailable:
                        {
                            msg = @"TouchID 无效";
                            BAKit_TouchIDTypeBlock(BAKit_TouchIDTypeTouchIDNotAvailable, error, msg);
                        }
                            break;
                            
                        if (IOS_VERSION >= 9.0)
                        {
                        case LAErrorTouchIDLockout:
                            {
                                msg = @"TouchID 被锁定(连续多次验证 TouchID 失败,系统需要用户手动输入密码)";
                                BAKit_TouchIDTypeBlock(BAKit_TouchIDTypeTouchIDLockout, error, msg);
                                if (enabled)
                                {
                                    [context evaluatePolicy:policy localizedReason:content reply:^(BOOL success, NSError * _Nullable error) {}];
                                }
                            }
                            break;
                        case LAErrorAppCancel:
                            {
                                msg = @"当前软件被挂起并取消了授权 (如App进入了后台等)";
                                BAKit_TouchIDTypeBlock(BAKit_TouchIDTypeAppCancel, error, msg);
                                if (enabled)
                                {
                                    [context evaluatePolicy:policy localizedReason:content reply:^(BOOL success, NSError * _Nullable error) {}];
                                }
                            }
                            break;
                        case LAErrorInvalidContext:
                            {
                                msg = @"当前软件被挂起并取消了授权 (LAContext对象无效)";
                                BAKit_TouchIDTypeBlock(BAKit_TouchIDTypeInvalidContext, error, msg);
                                if (enabled)
                                {
                                    [context evaluatePolicy:policy localizedReason:content reply:^(BOOL success, NSError * _Nullable error) {}];
                                }
                            }
                            break;
                        }
                            
                        default:
                        {
                            msg = @"TouchID 验证失败";
                            if (enabled)
                            {
                                [context evaluatePolicy:policy localizedReason:content reply:^(BOOL success, NSError * _Nullable error) {}];
                            }
                        }
                            break;
                    }
                    NSLog(@"%@", msg);
                }
            }];
        }
        else
        {
            NSString *msg = @"";
            msg = [NSString stringWithFormat:@"此设备不支持Touch ID\n设备操作系统:%@\n设备系统版本号:%@\n设备型号:%@", [[UIDevice currentDevice] systemVersion], [[UIDevice currentDevice] systemName], [BAKit_DeviceModel ba_deviceGetCurrentDeviceModel]];
            
            BAKit_TouchIDTypeBlock(BAKit_TouchIDTypeNotSupport, nil, msg);
        }
    }];
}

/**
 判断是否支持指纹解锁
 
 @param block block
 */
+ (void)ba_touchIDVerifyIsSupportWithBlock:(BAKit_TouchIDVerifyIsSupport_Block)block
{
    LAContext *context = [LAContext new];
    context.maxBiometryFailures = @(3);  // 接收的最大的错误次数
    
    NSInteger policy;
    if (IOS_VERSION < 9.0 && IOS_VERSION >= 8.0)
    {
        policy = LAPolicyDeviceOwnerAuthenticationWithBiometrics;
    }
    else
    {
        policy = LAPolicyDeviceOwnerAuthentication;
    }
    
    // 错误对象
    NSError *error = nil;
    
    // 首先使用 canEvaluatePolicy 判断设备支持状态
    BOOL isSupport = [context canEvaluatePolicy:policy error:&error];
    block(isSupport, context, policy, error);
}

@end
