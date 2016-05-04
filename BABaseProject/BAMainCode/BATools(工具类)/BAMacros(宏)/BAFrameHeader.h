//
//  BAFrameHeader.h
//  demoTest
//
//  Created by 博爱 on 16/5/3.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

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
