
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


#import "BASystermSetting.h"

@implementation BASystermSetting

/*! 
 注意：
 iOS 10 系统下需要请求相关权限，iOS 10 干掉了所有系统设置的 URL Scheme，这意味着你再也不可能直接跳转到系统设置页面（比如 WiFi、蜂窝数据、定位等）。

 ios 10 系统，其他权限具体设置如下：
 
 麦克风权限：Privacy - Microphone Usage Description 是否允许此App使用你的麦克风？
 
 相机权限： Privacy - Camera Usage Description 是否允许此App使用你的相机？
 
 相册权限： Privacy - Photo Library Usage Description 是否允许此App访问你的媒体资料库？
 
 通讯录权限： Privacy - Contacts Usage Description 是否允许此App访问你的通讯录？
 
 蓝牙权限：Privacy - Bluetooth Peripheral Usage Description 是否许允此App使用蓝牙？
 
 语音转文字权限：Privacy - Speech Recognition Usage Description 是否允许此App使用语音识别？
 
 日历权限：Privacy - Calendars Usage Description 是否允许此App使用日历？
 
 定位权限：Privacy - Location When In Use Usage Description 我们需要通过您的地理位置信息获取您周边的相关数据
 
 定位权限: Privacy - Location Always Usage Description 我们需要通过您的地理位置信息获取您周边的相关数据
 */

+ (BASystermSetting *)ba_systermSettingManage
{
    static BASystermSetting *ba_systermSettingManage;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ba_systermSettingManage = [[BASystermSetting alloc] init];
    });
    return ba_systermSettingManage;
}

#pragma mark - ***** app跳转到系统的各种基本设置选项
/*!
 *  跳转系统通知
 */
- (void)ba_gotoSystermSettings
{
    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if ([[UIApplication sharedApplication] canOpenURL:url])
    {
        [[UIApplication sharedApplication] openURL:url];
        BA_OpenUrl(UIApplicationOpenSettingsURLString);
    }
}

/*!
 *  跳到WIFI界面
 */
- (void)ba_gotoSystermWIFISettings
{
    /*!
     (1.)需要先配置plist文件:在URL types--URL Schemes中添加 prefs的字符串.因为苹果在iOS5.0后把系统自带的URL Schemes删除了
     */
    NSURL *url = [NSURL URLWithString:@"prefs:root=WIFI"];
    if ([[UIApplication sharedApplication] canOpenURL:url])
    {
        BA_OpenUrl(@"prefs:root=WIFI");
    }
}

/*!
 *  跳到About关于本机界面
 */
- (void)ba_gotoSystermAboutSettings
{
    /*!
     (1.)需要先配置plist文件:在URL types--URL Schemes中添加 prefs的字符串.因为苹果在iOS5.0后把系统自带的URL Schemes删除了
     */
    NSURL *url = [NSURL URLWithString:@"prefs:root=General&path=About"];
    if ([[UIApplication sharedApplication] canOpenURL:url])
    {
        BA_OpenUrl(@"prefs:root=General&path=About");
    }
}

/*!
 *  跳到Accessibility辅助功能界面
 */
- (void)ba_gotoSystermAccessibilitySettings
{
    /*!
     (1.)需要先配置plist文件:在URL types--URL Schemes中添加 prefs的字符串.因为苹果在iOS5.0后把系统自带的URL Schemes删除了
     */
    NSURL *url = [NSURL URLWithString:@"prefs:root=General&path=ACCESSIBILITY"];
    if ([[UIApplication sharedApplication] canOpenURL:url])
    {
        BA_OpenUrl(@"prefs:root=General&path=ACCESSIBILITY");
    }
}

/*!
 *  跳到AirplaneModeOn飞行模式界面
 */
- (void)ba_gotoSystermAirplaneModeOnSettings
{
    /*!
     (1.)需要先配置plist文件:在URL types--URL Schemes中添加 prefs的字符串.因为苹果在iOS5.0后把系统自带的URL Schemes删除了
     */
    NSURL *url = [NSURL URLWithString:@"prefs:root=AIRPLANE_MODE"];
    if ([[UIApplication sharedApplication] canOpenURL:url])
    {
        BA_OpenUrl(@"prefs:root=AIRPLANE_MODE");
    }
}

/*!
 *  跳到Auto-Lock自动锁屏时间界面
 */
- (void)ba_gotoSystermAutoLockSettings
{
    /*!
     (1.)需要先配置plist文件:在URL types--URL Schemes中添加 prefs的字符串.因为苹果在iOS5.0后把系统自带的URL Schemes删除了
     */
    NSURL *url = [NSURL URLWithString:@"prefs:root=General&path=AUTOLOCK"];
    if ([[UIApplication sharedApplication] canOpenURL:url])
    {
        BA_OpenUrl(@"prefs:root=General&path=AUTOLOCK");
    }
}

/*!
 *  跳到Brightness自动锁定界面
 */
- (void)ba_gotoSystermBrightnessSettings
{
    NSURL *url = [NSURL URLWithString:@"prefs:root=Brightness"];
    if ([[UIApplication sharedApplication] canOpenURL:url])
    {
        BA_OpenUrl(@"prefs:root=Brightness");
    }
}

/*!
 *  跳到MICROPHONE麦克风界面
 */
- (void)ba_gotoSystermMICROPHONESettings
{
    NSURL *url = [NSURL URLWithString:@"prefs:root=Privacy&path=MICROPHONE"];
    if ([[UIApplication sharedApplication] canOpenURL:url])
    {
        BA_OpenUrl(@"prefs:root=Privacy&path=MICROPHONE");
    }
}

/*!
 *  跳到CONTACTS通讯录界面
 */
- (void)ba_gotoSystermCONTACTSSettings
{
    NSURL *url = [NSURL URLWithString:@"prefs:root=Privacy&path=CONTACTS"];
    if ([[UIApplication sharedApplication] canOpenURL:url])
    {
        BA_OpenUrl(@"prefs:root=Privacy&path=CONTACTS");
    }
}

/*!
 *  跳到Bluetooth蓝牙界面
 */
- (void)ba_gotoSystermBluetoothSettings
{
    NSURL *url = [NSURL URLWithString:@"prefs:root=Bluetooth"];
    if ([[UIApplication sharedApplication] canOpenURL:url])
    {
        BA_OpenUrl(@"prefs:root=Bluetooth");
    }
}

/*!
 *  跳到DATE_AND_TIME日期和时间界面
 */
- (void)ba_gotoSystermDATE_AND_TIMESettings
{
    NSURL *url = [NSURL URLWithString:@"prefs:root=General&path=DATE_AND_TIME"];
    if ([[UIApplication sharedApplication] canOpenURL:url])
    {
        BA_OpenUrl(@"prefs:root=General&path=DATE_AND_TIME");
    }
}

/*!
 *  跳到FaceTime界面
 */
- (void)ba_gotoSystermFaceTimeSettings
{
    NSURL *url = [NSURL URLWithString:@"prefs:root=FACETIME"];
    if ([[UIApplication sharedApplication] canOpenURL:url])
    {
        BA_OpenUrl(@"prefs:root=FACETIME");
    }
}

/*!
 *  跳到General界面
 */
- (void)ba_gotoSystermGeneralSettings
{
    NSURL *url = [NSURL URLWithString:@"prefs:root=General"];
    if ([[UIApplication sharedApplication] canOpenURL:url])
    {
        BA_OpenUrl(@"prefs:root=General");
    }
}

/*!
 *  跳到Keyboard界面
 */
- (void)ba_gotoSystermKeyboardSettings
{
    NSURL *url = [NSURL URLWithString:@"prefs:root=General&path=Keyboard"];
    if ([[UIApplication sharedApplication] canOpenURL:url])
    {
        BA_OpenUrl(@"prefs:root=General&path=Keyboard");
    }
}

/*!
 *  跳到iCloud界面
 */
- (void)ba_gotoSystermiCloudSettings
{
    NSURL *url = [NSURL URLWithString:@"prefs:root=CASTLE"];
    if ([[UIApplication sharedApplication] canOpenURL:url])
    {
        BA_OpenUrl(@"prefs:root=CASTLE");
    }
}


/*!
 *  跳转Safari浏览器
 */
- (void)ba_gotoSafariBrowserWithURL:(NSString *)url
{
    if ([BARegularExpression ba_isUrl:url])
    {
        /*! 跳转系统通知 */
        BA_OpenUrl(url);
    }
    else
    {
        BALog(@"url错误，请重新输入！");
    }
    
}



@end
