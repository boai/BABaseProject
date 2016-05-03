//
//  Created by iOS_Liu on 16/2/3.
//  Copyright © 2016年 iOS_Liu. All rights reserved.
//
//  作者GitHub主页 https://github.com/SwiftLiu
//  作者邮箱 1062014109@qq.com
//  下载链接 https://github.com/SwiftLiu/LPLevelView.git

#import <UIKit/UIKit.h>

@interface LPLevelView : UIView

///整星图标，半星和空星尺寸以整星为准
@property (strong, nonatomic) UIImage *iconFull;
///半星图标
@property (strong, nonatomic) UIImage *iconHalf;
///空星图标
@property (strong, nonatomic) UIImage *iconEmpty;
///图标颜色，按图标形状蒙版剪切该颜色
@property (strong, nonatomic) UIColor *iconColor;
///图片尺寸，默认为iconFull图标的尺寸，同时自适应self尺寸
@property (assign, nonatomic) CGSize iconSize;

///星级，默认为0
@property (assign, nonatomic) float level;
///星级是否必须为整数，默认为否
@property (assign, nonatomic) BOOL levelInt;
///最大等级，默认为5
@property (assign, nonatomic) int maxLevel;

///是否允许打分，即用户触摸设置星级，默认不允许
@property (assign, nonatomic) BOOL canScore;
///打分是否有动画，默认没有
@property (assign, nonatomic) BOOL animated;
///动画颜色，默认橘色
@property (strong, nonatomic) UIColor *animateColor;
///完成评分后处理
@property (strong, nonatomic) void (^scoreBlock)(float level);

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com