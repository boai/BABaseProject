
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

#import "UILabel+BAKit.h"

@implementation UILabel (BAKit)
/* 初始化UILael */
+ (UILabel *)initWithFrame:(CGRect)frame                // 结构
                      text:(NSString *)text             // 标题
                      font:(FontName)fontName           // 字体
                      size:(CGFloat)size                // 尺寸
                     color:(UIColor *)color             // 颜色
                 alignment:(NSTextAlignment)alignment   // 对齐方式
                     lines:(NSInteger)lines             // 行数
{
    return [UILabel initWithFrame:frame
                             text:text
                             font:fontName
                             size:size
                            color:color
                        alignment:alignment
                            lines:lines
                      shadowColor:[UIColor clearColor]];
}

/* 初始化UILael */
+ (UILabel *)initWithFrame:(CGRect)frame                // 结构
                      text:(NSString *)text             // 标题
                      font:(FontName)fontName           // 字体
                      size:(CGFloat)size                // 尺寸
                     color:(UIColor *)color             // 颜色
                 alignment:(NSTextAlignment)alignment   // 对齐方式
                     lines:(NSInteger)lines             // 行数
               shadowColor:(UIColor *)colorShadow       // 阴影颜色
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    [label setFont:[UIFont fontForFontName:fontName
                                      size:size]];
    [label setText:text];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextColor:color];
    [label setShadowColor:colorShadow];
    [label setTextAlignment:alignment];
    [label setNumberOfLines:lines];
    
    return label;
}

/**
 *  Remove the commment to this lines if you want to use an UILabel to show the progress of an operation in AFNetworking
 */
/*
 - (void)setProgressWithUploadProgressOfOperation:(AFURLConnectionOperation *)operation
 {
 __weak __typeof(self)weakSelf = self;
 void (^original)(NSUInteger bytesWritten, NSInteger totalBytesWritten, NSInteger totalBytesExpectedToWrite) = [operation.uploadProgress copy];
 [operation setUploadProgressBlock:^(NSUInteger bytesWritten, NSInteger totalBytesWritten, NSInteger totalBytesExpectedToWrite) {
 if(original)
 {
 original(bytesWritten, totalBytesWritten, totalBytesExpectedToWrite);
 }
 
 dispatch_async(dispatch_get_main_queue(), ^{
 if(totalBytesExpectedToWrite > 0)
 {
 __strong __typeof(weakSelf)strongSelf = weakSelf;
 [strongSelf setText:[NSString stringWithFormat:@"%i%@", (int)((totalBytesWritten / (totalBytesExpectedToWrite * 1.0f)) * 100), @"%"]];
 }
 });
 }];
 }
 */

@end
