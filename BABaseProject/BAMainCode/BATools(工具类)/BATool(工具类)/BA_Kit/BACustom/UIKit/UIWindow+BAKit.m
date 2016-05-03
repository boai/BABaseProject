
/*!
 *  @header BAKit
 *          demoTest
 *
 *  @brief  BAKit
 *
 *  @author 博爱
 *  @copyright    Copyright © 2016年 博爱. All rights reserved.
 *  @version    V1.0
 */

/*!
 *
 *          ┌─┐       ┌─┐
 *       ┌──┘ ┴───────┘ ┴──┐
 *       │                 │
 *       │       ───       │
 *       │  ─┬┘       └┬─  │
 *       │                 │
 *       │       ─┴─       │
 *       │                 │
 *       └───┐         ┌───┘
 *           │         │
 *           │         │
 *           │         │
 *           │         └──────────────┐
 *           │                        │
 *           │                        ├─┐
 *           │                        ┌─┘
 *           │                        │
 *           └─┐  ┐  ┌───────┬──┐  ┌──┘
 *             │ ─┤ ─┤       │ ─┤ ─┤
 *             └──┴──┘       └──┴──┘
 *                 神兽保佑
 *                 代码无BUG!
 */

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
 *********************************************************************************
 
 */

#import "UIWindow+BAKit.h"
#import "UIDevice+BAKit.h"

@implementation UIWindow (BAKit)

/* 采取截屏 */
- (UIImage *)takeScreenshot
{
    // 源代码地址 (Under MIT License): https://github.com/shinydevelopment/SDScreenshotCapture/blob/master/SDScreenshotCapture/SDScreenshotCapture.m#L35
    // 判断系统版本号
    BOOL ignoreOrientation = SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0");
    // 获取状态栏方向
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    
    /* 获取屏幕尺寸 */
    CGSize imageSize = CGSizeZero;
    if (UIInterfaceOrientationIsPortrait(orientation) || ignoreOrientation)
        imageSize = [UIScreen mainScreen].bounds.size;
    else
        imageSize = CGSizeMake([UIScreen mainScreen].bounds.size.height,
                               [UIScreen mainScreen].bounds.size.width);
    
    // 开启UIImage上下文
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    // 获取当前上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 保存上下文状态
    CGContextSaveGState(context);
    // 设置平移坐标
    CGContextTranslateCTM(context, self.center.x, self.center.y);
    // 设置连接平移坐标
    CGContextConcatCTM(context, self.transform);
    // 设置平移坐标
    CGContextTranslateCTM(context,
                          -self.bounds.size.width * self.layer.anchorPoint.x,
                          -self.bounds.size.height * self.layer.anchorPoint.y);
    
    // 正确的屏幕方向
    if(!ignoreOrientation)
    {
        if(orientation == UIInterfaceOrientationLandscapeLeft)
        {
            // 设置旋转坐标
            CGContextRotateCTM(context, (CGFloat)M_PI_2);
            // 设置平移坐标
            CGContextTranslateCTM(context, 0, -imageSize.width);
        }
        else if(orientation == UIInterfaceOrientationLandscapeRight)
        {
            // 设置旋转坐标
            CGContextRotateCTM(context, (CGFloat)-M_PI_2);
            // 设置平移坐标
            CGContextTranslateCTM(context, -imageSize.height, 0);
        }
        else if(orientation == UIInterfaceOrientationPortraitUpsideDown)
        {
            // 设置旋转坐标
            CGContextRotateCTM(context, (CGFloat)M_PI);
            // 设置平移坐标
            CGContextTranslateCTM(context, -imageSize.width, -imageSize.height);
        }
    }
    
    if([self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)])
        // 获取快照到当前上下文中
        [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:NO];
    else
        // 渲染上下文
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    // 恢复当前图形状态
    CGContextRestoreGState(context);
    // 获取当前图像上下文
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭UIImage上下文
    UIGraphicsEndImageContext();
    
    return image;
}

@end
