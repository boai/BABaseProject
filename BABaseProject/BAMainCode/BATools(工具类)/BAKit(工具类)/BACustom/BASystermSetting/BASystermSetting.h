
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

/*!
 Version：【Version：2.0】
 最新更新时间：2016-11-17
 */
#import <Foundation/Foundation.h>

@interface BASystermSetting : NSObject

/*!
 *  创建单例 ba_systermSettingManage
 *
 *  @return ba_systermSettingManage
 */
+ (BASystermSetting *)ba_systermSettingManage;

#pragma mark - ***** app跳转到系统的各种基本设置选项
/*!
 *  跳转系统通知
 */
- (void)ba_gotoSystermSettings;

/*!
 *  跳到WIFI界面
 */
- (void)ba_gotoSystermWIFISettings;

/*!
 *  跳到About关于本机界面
 */
- (void)ba_gotoSystermAboutSettings;

/*!
 *  跳到Accessibility辅助功能界面
 */
- (void)ba_gotoSystermAccessibilitySettings;

/*!
 *  跳到AirplaneModeOn飞行模式界面
 */
- (void)ba_gotoSystermAirplaneModeOnSettings;

/*!
 *  跳到Auto-Lock自动锁屏时间界面
 */
- (void)ba_gotoSystermAutoLockSettings;

/*!
 *  跳到Brightness自动锁定界面
 */
- (void)ba_gotoSystermBrightnessSettings;

/*!
 *  跳到MICROPHONE麦克风界面
 */
- (void)ba_gotoSystermMICROPHONESettings;

/*!
 *  跳到CONTACTS通讯录界面
 */
- (void)ba_gotoSystermCONTACTSSettings;

/*!
 *  跳到Bluetooth蓝牙界面
 */
- (void)ba_gotoSystermBluetoothSettings;

/*!
 *  跳到DATE_AND_TIME日期和时间界面
 */
- (void)ba_gotoSystermDATE_AND_TIMESettings;

/*!
 *  跳到FaceTime界面
 */
- (void)ba_gotoSystermFaceTimeSettings;

/*!
 *  跳到General界面
 */
- (void)ba_gotoSystermGeneralSettings;

/*!
 *  跳到Keyboard界面
 */
- (void)ba_gotoSystermKeyboardSettings;

/*!
 *  跳到iCloud界面
 */
- (void)ba_gotoSystermiCloudSettings;

/*!
 *  跳转Safari浏览器
 *
 *  @param url 需要用Safari打开的url
 */
- (void)ba_gotoSafariBrowserWithURL:(NSString *)url;


@end
