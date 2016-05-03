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
// 当前设备的屏幕宽度
#define BA_SCREEN_WIDTH    [[UIScreen mainScreen] bounds].size.width
// 当前设备的屏幕高度
#define BA_SCREEN_HEIGHT   [[UIScreen mainScreen] bounds].size.height
// 导航栏高，前提控制器带导航栏
#define BA_NAV_HEIGHT CGRectGetHeight(self.navigationController.navigationBar.frame)
// 状态栏高度
#define BA_STATUSBAR_HEIGHT CGRectGetHeight([UIApplication sharedApplication].statusBarFrame)
// Tabbar 的高度
#define BA_getTabbarHeight 49
// 黄金比例的宽
#define BA_WIDTH_0_618 WIDTH * 0.618

// BABannerView.h 广告frame
#define YRBannerHeight 100
// 直播、点播页面 头高
#define YRLiveHeadViewHeight 250

#endif /* BAFrameHeader_h */
