
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

#import <UIKit/UIKit.h>

//#pragma mark - ***** 设置navi



@interface BABaseViewController : UIViewController


@property (nonatomic, strong) UIColor *vcBgColor;

#pragma mark - ***** 显示自定义加载框

/*!
 *  显示雪花加载框
 *
 *  @param isShow yes:显示，no:隐藏
 */
- (void)isShowSnowLoadingView:(BOOL)isShow;


#pragma mark - ***** 网络类型判断
/*!
 *  网络判断
 *
 *  @param viewController viewController
 */
- (void)ba_networkChangeWith:(UIViewController *)viewController;

/*!
 *  使用4G网络时的方法调用此方法
 */
- (void)ba_netUse4Gnet;

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




#pragma mark - ***** VC的基本设置
/*!
 *  设置VC的背景颜色
 *
 *  @param vcBgColor vcBgColor
 */
//- (void)setVCBgColor:(UIColor *)vcBgColor;

/*!
 *  创建UI
 */
- (void)ba_setupUI;

#pragma mark - ***** VC的navi设置
/*!
 *  设置navi
 */
- (void)ba_setupNavi;
/*!
 *  是否隐藏naviBar
 *
 *  @param hidden YES：隐藏，NO：显示
 */
- (void)ba_setNavbarBackgroundHidden:(BOOL)hidden;



#pragma mark 随机颜色
- (UIColor *)ba_randomColor;

#pragma mark - ***** VC的其他设置

#pragma mark - ***** 各种动画开关
/*!
 *  开启樱花动画（CAEmitterLayer动画）
 */
- (void)ba_starYingHuaCoreAnimation;

/*!
 *  开启雪花动画（CADisplayLink动画）
 */
- (void)ba_starXueHuaCoreAnimation;

/*!
 *  暂停雪花动画
 */
- (void)ba_stopXueHuaCoreAnimation;

/*!
 *  开启烟花动画（CAEmitterLayer动画）
 */
- (void)ba_starYanHuaCoreAnimation;

/*!
 *  gif动画
 *
 *  @param gifImageName gifImageName
 *  @param imgFrame     imgFrame
 */
- (void)ba_useGIFImageViewWithGifImageName:(NSString *)gifImageName frame:(CGRect)imgFrame;


@end
