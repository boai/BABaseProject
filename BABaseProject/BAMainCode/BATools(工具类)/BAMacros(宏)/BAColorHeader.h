//
//  BAColorHeader.h
//  demoTest
//
//  Created by 博爱 on 16/5/3.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#ifndef BAColorHeader_h
#define BAColorHeader_h

#pragma mark - ***** 颜色设置
// 颜色
#define BA_COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
// 随机色
#define BARandomColor      [UIColor colorWithRed:arc4random_uniform(256)%255.0 green:arc4random_uniform(256)%255.0 blue:arc4random_uniform(256)%255.0 alpha:1.0]
#define BA_ColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

// navi蓝色
#define BA_NaviBgBlueColor     BA_COLOR(92, 177, 251, 1.0)
#define BA_BGGrayColor        BA_COLOR(239, 239, 239, 1.0)
#define BA_TEXTGrayColor      BA_COLOR(148, 147, 133, 1.0)
#define BA_BLUEColor          BA_COLOR(78, 164, 255, 1.0)
#define BA_BGClearColor       [UIColor colorWithRed:0.1f green:0.1f blue:0.1f alpha:0.7f]
// 白色
#define BA_White_Color      [UIColor whiteColor]
// 红色
#define BA_Red_Color        [UIColor redColor]
// 黄色
#define BA_Yellow_Color     [UIColor yellowColor]
// 绿色
#define BA_Green_Color      [UIColor greenColor]
// 蓝色
#define BA_Blue_Color       [UIColor blueColor]

#endif /* BAColorHeader_h */
