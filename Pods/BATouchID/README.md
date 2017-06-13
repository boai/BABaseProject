# BATouchID
[![BAHome Team Name](https://img.shields.io/badge/Team-BAHome-brightgreen.svg?style=flat)](https://github.com/BAHome "BAHome Team")
![](https://img.shields.io/badge/platform-iOS-red.svg) ![](https://img.shields.io/badge/language-Objective--C-orange.svg) 
![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 
![](https://img.shields.io/cocoapods/v/BATouchID.svg?style=flat) ![](https://img.shields.io/cocoapods/dt/BATouchID.svg
)  [![](https://img.shields.io/badge/微博-博爱1616-red.svg)](http://weibo.com/538298123)

## 1、功能及简介
* 1、支付宝 指纹登录 touchID 封装 <br>
* 2、可以自定义 描述文字、取消按钮、第二个按钮等、详细的错误状态返回
* 3、demo 中增加了支付宝指纹登录逻辑，详见 demo
* 4、进入后台 10秒 后再次打开APP 会自动判断指纹登录，详见 demo
* 5、本地存储开启指纹登录开关，会自动判断指纹登录，详见 demo
* 6、本地密码登录后自动判断是否支持指纹登录，会自动判断指纹登录，详见 demo
* 7、新增 单独判断是否支持指纹识别的方法 <br>
* 8、demo 新增手势密码设置、验证、修改、重置等方法 <br>
* 9、demo 新增手势密码和指纹识别的逻辑处理，具体使用中可参照demo 中的逻辑处理方式 <br>


## 2、图片示例
![支付宝指纹登录流程图](https://github.com/BAHome/BATouchID/blob/master/Images/支付宝指纹登录流程图.png)

## 3、安装、导入示例和源码地址
* 1、pod 导入【最新版本：version 1.0.1】： <br>
 `pod 'BATouchID'` <br>
如果发现 `pod search BATouchID` 搜索出来的不是最新版本，需要在终端执行 cd 转换文件路径命令退回到 desktop，然后执行 `pod setup` 命令更新本地spec缓存（可能需要几分钟），然后再搜索就可以了。<br>
具体步骤：
  - pod setup : 初始化
  - pod repo update : 更新仓库
  - pod search BATouchID
* 2、文件夹拖入：下载demo，把 BATouchID 文件夹拖入项目即可，<br>
* 3、导入头文件：<br>
`  #import "BATouchID.h" `<br>
* 4、项目源码地址：<br>
 OC 版 ：[https://github.com/BAHome/BATouchID](https://github.com/BAHome/BATouchID)<br>

## 4、BATouchID 的类结构及 demo 示例
![BATouchID](https://github.com/BAHome/BATouchID/blob/master/Images/BATouchID.png)

### BATouchID.h
```
#ifndef BATouchID_h
#define BATouchID_h

#import "UIButton+BAKit.h"

/*!
 *********************************************************************************
 ************************************ 更新说明 ************************************
 *********************************************************************************
 
 欢迎使用 BAHome 系列开源代码 ！
 如有更多需求，请前往：https://github.com/BAHome
 
#ifndef BATouchID_h
#define BATouchID_h

#import "BAKit_TouchID.h"
#import "BAKit_DeviceModel.h"

/*! view 用 BAKit_ShowAlertWithMsg */
#define BAKit_ShowAlertWithMsg(msg) [[[UIAlertView alloc] initWithTitle:@"温馨提示" message:(msg) delegate:nil cancelButtonTitle:@"确 定" otherButtonTitles:nil] show];

/*! VC 用 BAKit_ShowAlertWithMsg */
#define BAKit_ShowAlertWithMsg_ios8(msg) UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:msg preferredStyle:UIAlertControllerStyleAlert];\
UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确 定" style:UIAlertActionStyleDefault handler:nil];\
[alert addAction:sureAction];\
[self presentViewController:alert animated:YES completion:nil];

/*!
 *********************************************************************************
 ************************************ 更新说明 ************************************
 *********************************************************************************
 
 项目源码地址：
 OC 版 ：https://github.com/BAHome/BATouchID
 
 最新更新时间：2017-05-27 【倒叙】 <br>
 最新Version：【Version：1.0.1】 <br>
 更新内容： <br>
 1.0.1.1、新增 单独判断是否支持指纹识别的方法 <br>
 1.0.1.2、demo 新增手势密码设置、验证、修改、重置等方法 <br>
 1.0.1.3、demo 新增手势密码和指纹识别的逻辑处理，具体使用中可参照demo 中的逻辑处理方式 <br>

 最新更新时间：2017-05-24 【倒叙】 <br>
 最新Version：【Version：1.0.0】 <br>
 更新内容： <br>
 1.0.0.1、新增 Touch ID de 详细封装 <br>
 1.0.0.2、可以自定义 描述文字、取消按钮、第二个按钮等、详细的错误状态返回 <br>
 1.0.0.3、demo 中增加了支付宝指纹登录逻辑，详见 demo
 1.0.0.4、新增获取设备详细信息的封装，详见：BAKit_DeviceModel
 
*/

#endif /* BATouchID_h */

```

### BAKit_TouchID.h
```
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
```

### BAKit_DeviceModel.h
```
#import <Foundation/Foundation.h>

@interface BAKit_DeviceModel : NSObject

/*
 获取设备描述
 */
+ (NSString *)ba_deviceGetCurrentDeviceModelDescription;

/*
 由获取到的设备描述，来匹配设备型号
 */
+ (NSString *)ba_deviceGetCurrentDeviceModel;

@end
```
### demo 示例
```
// 示例1：登录验证，是否开启指纹登录
- (void)checkIsSupportTouchID
{
    [BAKit_TouchID ba_touchIDVerifyIsSupportWithBlock:^(BOOL isSupport, LAContext *context, NSInteger policy, NSError *error) {
        if (isSupport)
        {
            id isShow = [kUserDefaults objectForKey:kIsOpenTouchID];
            if ([isShow intValue] == 0)
            {
                [kUserDefaults setObject:[NSNumber numberWithBool:YES] forKey:kIsOpenTouchID];
                [self presentViewController:[BATouchIDLoginVC new] animated:YES completion:nil];
            }
        }
        else
        {
            BAKit_ShowAlertWithMsg_ios8(@"设备不支持 touch ID！");
        }
    }];
}
    
// 示例2：指纹识别
- (void)test
{
    /**
     指纹解锁
     
     @param content  提示文本
     @param cancelButtonTitle  取消按钮显示内容(此参数只有iOS10以上才能生效)，默认（nil）：取消
     @param otherButtonTitle   密码登录按钮显示内容，默认（nil）：输入密码（nil）
     @param enabled    默认：NO，输入密码按钮，使用系统解锁；YES：自己操作点击密码登录
     @param BAKit_TouchIDTypeBlock   返回状态码和错误，可以自行单独处理
     */
    [BAKit_TouchID ba_touchIDWithContent:@"此操作需要认证您的身份" cancelButtonTitle:nil otherButtonTitle:nil enabled:YES BAKit_TouchIDTypeBlock:^(BAKit_TouchIDType touchIDType, NSError *error, NSString *errorMessage) {
        
        if (errorMessage && touchIDType != BAKit_TouchIDTypeTouchIDLockout && touchIDType != BAKit_TouchIDTypeInputPassword)
        {
            NSString *msg = errorMessage;
            BAKit_ShowAlertWithMsg_ios8(msg);
        }
        
        if (touchIDType == BAKit_TouchIDTypeSuccess)
        {
            BAKit_ShowAlertWithMsg(@"指纹验证成功！");
            [self ba_backToPreVC:nil];
        }
        if (touchIDType == BAKit_TouchIDTypeInputPassword)
        {
            NSLog(@"请跳转到自己的密码登录界面，如：手势解锁等！");

            dispatch_async(dispatch_get_main_queue(), ^{
                [self ba_verifyPwd];
            });
        }
    }];
}

其他示例可下载demo查看源码！
```

## 5、更新记录：【倒叙】
 欢迎使用 [【BAHome】](https://github.com/BAHome) 系列开源代码 ！
 如有更多需求，请前往：[【https://github.com/BAHome】](https://github.com/BAHome) 
 
 最新更新时间：2017-05-27 【倒叙】 <br>
 最新Version：【Version：1.0.1】 <br>
 更新内容： <br>
 1.0.1.1、新增 单独判断是否支持指纹识别的方法 <br>
 1.0.1.2、demo 新增手势密码设置、验证、修改、重置等方法 <br>
 1.0.1.3、demo 新增手势密码和指纹识别的逻辑处理，具体使用中可参照demo 中的逻辑处理方式 <br>

 最新更新时间：2017-05-24 【倒叙】 <br>
 最新Version：【Version：1.0.0】 <br>
 更新内容： <br>
 1.0.0.1、新增 Touch ID de 详细封装 <br>
 1.0.0.2、可以自定义 描述文字、取消按钮、第二个按钮等、详细的错误状态返回 <br>
 1.0.0.3、demo 中增加了支付宝指纹登录逻辑，详见 demo
 1.0.0.4、新增获取设备详细信息的封装，详见：BAKit_DeviceModel

## 6、bug 反馈 和 联系方式
> 1、开发中遇到 bug，希望小伙伴儿们能够及时反馈与我们 BAHome 团队，我们必定会认真对待每一个问题！ <br>

> 2、联系方式 <br> 
QQ群：479663605  【注意：此群为 2 元 付费群，介意的小伙伴儿勿扰！】<br> 
博爱QQ：137361770 <br> 
博爱微博：[![](https://img.shields.io/badge/微博-博爱1616-red.svg)](http://weibo.com/538298123) <br> 

## 7、开发环境 和 支持版本
> 开发使用 Xcode Version 8.3.2 (8E2002) ，理论上支持所有 iOS 版本，如有版本适配问题，请及时反馈！多谢合作！

## 8、感谢
> 感谢 BAHome 团队成员倾力合作，后期会推出一系列 常用 UI 控件的封装，大家有需求得也可以在 issue 提出，如果合理，我们会尽快推出新版本！<br>

> BAHome 的发展离不开小伙伴儿的信任与推广，再次感谢各位小伙伴儿的支持！

