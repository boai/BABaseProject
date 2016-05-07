
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

#ifndef BAFrameHeader_h
#define BAFrameHeader_h

#pragma mark - ***** frame设置
/*! 当前设备的屏幕宽度 */
#define BA_SCREEN_WIDTH    [[UIScreen mainScreen] bounds].size.width

/*! 当前设备的屏幕高度 */
#define BA_SCREEN_HEIGHT   [[UIScreen mainScreen] bounds].size.height

/*! 黄金比例的宽 */
#define BA_WIDTH_0_618 WIDTH * 0.618

/*! Status bar height. */
#define  BA_StatusBarHeight      20.f

/*! Navigation bar height. */
#define  BA_NavigationBarHeight  44.f

/*! Tabbar height. */
#define  BA_getTabbarHeight         49.f

/*! Status bar & navigation bar height. */
#define  BA_StatusBarAndNavigationBarHeight   (20.f + 44.f)

/*! iPhone4 or iPhone4s */
#define  BA_iPhone4_4s     (Width == 320.f && Height == 480.f)

/*! iPhone5 or iPhone5s */
#define  BA_iPhone5_5s     (Width == 320.f && Height == 568.f)

/*! iPhone6 or iPhone6s */
#define  BA_iPhone6_6s     (Width == 375.f && Height == 667.f)

/*! iPhone6Plus or iPhone6sPlus */
#define  BA_iPhone6_6sPlus (Width == 414.f && Height == 736.f)

/*! cell的间距：10 */
#define BAStatusCellMargin 10



#endif /* BAFrameHeader_h */
