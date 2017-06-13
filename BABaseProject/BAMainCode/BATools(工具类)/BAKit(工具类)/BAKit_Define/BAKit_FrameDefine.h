//
//  BAKit_FrameDefine.h
//  BAQMUIDemo
//
//  Created by 博爱 on 2017/2/9.
//  Copyright © 2017年 boaihome. All rights reserved.
//

#ifndef BAKit_FrameDefine_h
#define BAKit_FrameDefine_h

#pragma mark - Margin
#define BAKit_Margin_1       BAKit_Flat(1)
#define BAKit_Margin_2       BAKit_Flat(2)
#define BAKit_Margin_5       BAKit_Flat(5)
#define BAKit_Margin_10      BAKit_Flat(10)
#define BAKit_Margin_15      BAKit_Flat(15)
#define BAKit_Margin_20      BAKit_Flat(20)
#define BAKit_Margin_25      BAKit_Flat(25)
#define BAKit_Margin_30      BAKit_Flat(30)
#define BAKit_Margin_35      BAKit_Flat(35)
#define BAKit_Margin_40      BAKit_Flat(40)
#define BAKit_Margin_44      BAKit_Flat(44)
#define BAKit_Margin_50      BAKit_Flat(50)
#define BAKit_Margin_100     BAKit_Flat(100)
#define BAKit_Margin_150     BAKit_Flat(150)

#define BAKit_Margin_Content_width (SCREEN_WIDTH - BAKit_Margin_10 * 2)
#define BAKit_Margin_EmotionViewHeight BAKit_Flat(232)


#define BAKit_Margin_UserImage_Size BAKit_Margin_40


#define BAKit_Margin_GridCell_w_h_4  (BAKit_SCREEN_WIDTH - (3 * BAKit_Margin_1))/4
#define BAKit_Margin_GridCell_w_h_2  (BAKit_SCREEN_WIDTH - BAKit_Margin_1)/2

#define BAKit_Rect_FullScreenView  CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)


/*!
 *  获取屏幕宽度和高度
 */
#define BAKit_SCREEN_WIDTH ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)

#define BAKit_SCREEN_HEIGHT ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)

#define BAKit_ScreenScale ([[UIScreen mainScreen] scale])




#pragma mark - 根据文字内容和大小返回 size
CG_INLINE CGSize
BAKit_LabelSizeWithTextAndFont(NSString *text, UIFont *font){
    CGSize size = [text sizeWithAttributes:@{NSFontAttributeName:font}];
    CGSize newSize = CGSizeMake(size.width, size.height);
    return newSize;
}

#pragma mark - 根据文字内容、宽度和字体返回 size
CG_INLINE CGSize
BAKit_LabelSizeWithTextAndWidthAndFont(NSString *text, CGFloat width, UIFont *font){
    CGSize size = CGSizeMake(width, MAXFLOAT);
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineBreakMode:NSLineBreakByWordWrapping];
    
//    if (![text isKindOfClass:[NSString class]] || ![text isKindOfClass:[NSAttributedString class]])
//    {
//        NSLog(@"text 错误，此功能仅限 NSString / NSAttributedString 类型！");
//        return CGSizeZero;
//    }
    CGRect frame = [text boundingRectWithSize:size
                                      options:
                    NSStringDrawingTruncatesLastVisibleLine |
                    NSStringDrawingUsesLineFragmentOrigin |
                    NSStringDrawingUsesFontLeading
                                   attributes:@{NSFontAttributeName : font, NSParagraphStyleAttributeName : style} context:nil];
    CGRect newFrame = CGRectMake(frame.origin.x, frame.origin.y, width, frame.size.height);
    return newFrame.size;
}

CG_INLINE CGSize
BAKit_LabelSizeWithMutableAttributedStringAndWidthAndFont(NSMutableAttributedString *text, CGFloat width, UIFont *font){
    CGSize size = CGSizeMake(width, MAXFLOAT);
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineBreakMode:NSLineBreakByWordWrapping];
    
    //    if (![text isKindOfClass:[NSString class]] || ![text isKindOfClass:[NSAttributedString class]])
    //    {
    //        NSLog(@"text 错误，此功能仅限 NSString / NSAttributedString 类型！");
    //        return CGSizeZero;
    //    }
    CGRect frame = [[text copy] boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine |
                    NSStringDrawingUsesLineFragmentOrigin |
                    NSStringDrawingUsesFontLeading context:nil];
    CGRect newFrame = CGRectMake(frame.origin.x, frame.origin.y, width, frame.size.height);
    return newFrame.size;
}

#pragma mark - 根据文字内容、高度和字体返回 宽度
CG_INLINE CGFloat
BAKit_LabelWidthWithTextAndFont(NSString *text, CGFloat height, UIFont *font){
    CGSize size = CGSizeMake(MAXFLOAT, height);
    NSDictionary *attributesDic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,nil];
    CGRect frame = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributesDic context:nil];
    
    return frame.size.width;
}

#pragma mark - UITableView
#pragma mark UITableView 分割线设置
CG_INLINE void
BAKit_UITableViewSetSeparatorInset(id tableView, UIColor *color, UIEdgeInsets separatorInset)
{
    BOOL isTabelViewClass = [tableView isKindOfClass:[UITableView class]];
    if (!isTabelViewClass)
    {
        NSLog(@"分割线设置错误，此功能仅限 UITableView 类型！");
        return ;
    }

    [tableView setSeparatorColor:color];
    [tableView setSeparatorInset:separatorInset];
}


#pragma mark - 方法-C对象、结构操作

/**
 *  基于指定的倍数，对传进来的 floatValue 进行像素取整。若指定倍数为0，则表示以当前设备的屏幕倍数为准。
 *
 *  例如传进来 “2.1”，在 2x 倍数下会返回 2.5（0.5pt 对应 1px），在 3x 倍数下会返回 2.333（0.333pt 对应 1px）。
 */
CG_INLINE CGFloat
BAKit_FlatSpecificScale(CGFloat floatValue, CGFloat scale) {
    scale = scale == 0 ? BAKit_ScreenScale : scale;
    CGFloat flattedValue = ceil(floatValue * scale) / scale;
    return flattedValue;
}

/**
 *  基于当前设备的屏幕倍数，对传进来的 floatValue 进行像素取整。
 *
 *  注意如果在 Core Graphic 绘图里使用时，要注意当前画布的倍数是否和设备屏幕倍数一致，若不一致，不可使用 flat() 函数，而应该用 flatSpecificScale
 */
CG_INLINE CGFloat
BAKit_Flat(CGFloat floatValue) {
    return BAKit_FlatSpecificScale(floatValue, 0);
}

/**
 *  类似flat()，只不过 flat 是向上取整，而 floorInPixel 是向下取整
 */
CG_INLINE CGFloat
BAKit_FloorInPixel(CGFloat floatValue) {
    CGFloat resultValue = floor(floatValue * BAKit_ScreenScale) / BAKit_ScreenScale;
    return resultValue;
}

CG_INLINE BOOL
BAKit_Between(CGFloat minimumValue, CGFloat value, CGFloat maximumValue) {
    return minimumValue < value && value < maximumValue;
}

CG_INLINE BOOL
BAKit_BetweenOrEqual(CGFloat minimumValue, CGFloat value, CGFloat maximumValue) {
    return minimumValue <= value && value <= maximumValue;
}

CG_INLINE void
BAKit_ReplaceMethod(Class _class, SEL _originSelector, SEL _newSelector) {
    Method oriMethod = class_getInstanceMethod(_class, _originSelector);
    Method newMethod = class_getInstanceMethod(_class, _newSelector);
    BOOL isAddedMethod = class_addMethod(_class, _originSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
    if (isAddedMethod) {
        class_replaceMethod(_class, _newSelector, method_getImplementation(oriMethod), method_getTypeEncoding(oriMethod));
    } else {
        method_exchangeImplementations(oriMethod, newMethod);
    }
}

#pragma mark - CGFloat

/// 用于居中运算
CG_INLINE CGFloat
BAKit_CGFloatGetCenter(CGFloat parent, CGFloat child) {
    return BAKit_Flat((parent - child) / 2.0);
}

#pragma mark - CGPoint

/// 两个point相加
CG_INLINE CGPoint
BAKit_CGPointUnion(CGPoint point1, CGPoint point2) {
    return CGPointMake(BAKit_Flat(point1.x + point2.x), BAKit_Flat(point1.y + point2.y));
}

/// 获取rect的center，包括rect本身的x/y偏移
CG_INLINE CGPoint
BAKit_CGPointGetCenterWithRect(CGRect rect) {
    return CGPointMake(BAKit_Flat(CGRectGetMidX(rect)), BAKit_Flat(CGRectGetMidY(rect)));
}

CG_INLINE CGPoint
BAKit_CGPointGetCenterWithSize(CGSize size) {
    return CGPointMake(BAKit_Flat(size.width / 2.0), BAKit_Flat(size.height / 2.0));
}

#pragma mark - UIEdgeInsets

/// 获取UIEdgeInsets在水平方向上的值
CG_INLINE CGFloat
BAKit_UIEdgeInsetsGetHorizontalValue(UIEdgeInsets insets) {
    return insets.left + insets.right;
}

/// 获取UIEdgeInsets在垂直方向上的值
CG_INLINE CGFloat
BAKit_UIEdgeInsetsGetVerticalValue(UIEdgeInsets insets) {
    return insets.top + insets.bottom;
}

/// 将两个UIEdgeInsets合并为一个
CG_INLINE UIEdgeInsets
BAKit_UIEdgeInsetsConcat(UIEdgeInsets insets1, UIEdgeInsets insets2) {
    insets1.top += insets2.top;
    insets1.left += insets2.left;
    insets1.bottom += insets2.bottom;
    insets1.right += insets2.right;
    return insets1;
}

CG_INLINE UIEdgeInsets
BAKit_UIEdgeInsetsSetTop(UIEdgeInsets insets, CGFloat top) {
    insets.top = BAKit_Flat(top);
    return insets;
}

CG_INLINE UIEdgeInsets
BAKit_UIEdgeInsetsSetLeft(UIEdgeInsets insets, CGFloat left) {
    insets.left = BAKit_Flat(left);
    return insets;
}
CG_INLINE UIEdgeInsets
BAKit_UIEdgeInsetsSetBottom(UIEdgeInsets insets, CGFloat bottom) {
    insets.bottom = BAKit_Flat(bottom);
    return insets;
}

CG_INLINE UIEdgeInsets
BAKit_UIEdgeInsetsSetRight(UIEdgeInsets insets, CGFloat right) {
    insets.right = BAKit_Flat(right);
    return insets;
}

#pragma mark - CGSize

/// 判断一个size是否为空（宽或高为0）
CG_INLINE BOOL
BAKit_CGSizeIsEmpty(CGSize size) {
    return size.width <= 0 || size.height <= 0;
}

/// 将一个CGSize像素对齐
CG_INLINE CGSize
BAKit_CGSizeFlatted(CGSize size) {
    return CGSizeMake(BAKit_Flat(size.width), BAKit_Flat(size.height));
}

/// 将一个 CGSize 以 pt 为单位向上取整
CG_INLINE CGSize
BAKit_CGSizeCeil(CGSize size) {
    return CGSizeMake(ceil(size.width), ceil(size.height));
}

/// 将一个 CGSize 以 pt 为单位向下取整
CG_INLINE CGSize
BAKit_CGSizeFloor(CGSize size) {
    return CGSizeMake(floor(size.width), floor(size.height));
}

#pragma mark - CGRect

/// 判断一个CGRect是否存在NaN
CG_INLINE BOOL
BAKit_CGRectIsNaN(CGRect rect) {
    return isnan(rect.origin.x) || isnan(rect.origin.y) || isnan(rect.size.width) || isnan(rect.size.height);
}

/// 创建一个像素对齐的CGRect
CG_INLINE CGRect
BAKit_CGRectFlatMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height) {
    return CGRectMake(BAKit_Flat(x), BAKit_Flat(y), BAKit_Flat(width), BAKit_Flat(height));
}

/// 对CGRect的x/y、width/height都调用一次flat，以保证像素对齐
CG_INLINE CGRect
BAKit_CGRectFlatted(CGRect rect) {
    return CGRectMake(BAKit_Flat(rect.origin.x), BAKit_Flat(rect.origin.y), BAKit_Flat(rect.size.width), BAKit_Flat(rect.size.height));
}

/// 为一个CGRect叠加scale计算
CG_INLINE CGRect
BAKit_CGRectApplyScale(CGRect rect, CGFloat scale) {
    return BAKit_CGRectFlatted(CGRectMake(CGRectGetMinX(rect) * scale, CGRectGetMinY(rect) * scale, CGRectGetWidth(rect) * scale, CGRectGetHeight(rect) * scale));
}

/// 计算view的水平居中，传入父view和子view的frame，返回子view在水平居中时的x值
CG_INLINE CGFloat
BAKit_CGRectGetMinXHorizontallyCenterInParentRect(CGRect parentRect, CGRect childRect) {
    return BAKit_Flat((CGRectGetWidth(parentRect) - CGRectGetWidth(childRect)) / 2.0);
}

/// 计算view的垂直居中，传入父view和子view的frame，返回子view在垂直居中时的y值
CG_INLINE CGFloat
BAKit_CGRectGetMinYVerticallyCenterInParentRect(CGRect parentRect, CGRect childRect) {
    return BAKit_Flat((CGRectGetHeight(parentRect) - CGRectGetHeight(childRect)) / 2.0);
}

/// 返回值：同一个坐标系内，想要layoutingRect和已布局完成的referenceRect保持垂直居中时，layoutingRect的originY
CG_INLINE CGFloat
BAKit_CGRectGetMinYVerticallyCenter(CGRect referenceRect, CGRect layoutingRect) {
    return CGRectGetMinY(referenceRect) + BAKit_CGRectGetMinYVerticallyCenterInParentRect(referenceRect, layoutingRect);
}

/// 返回值：同一个坐标系内，想要layoutingRect和已布局完成的referenceRect保持水平居中时，layoutingRect的originX
CG_INLINE CGFloat
BAKit_CGRectGetMinXHorizontallyCenter(CGRect referenceRect, CGRect layoutingRect) {
    return CGRectGetMinX(referenceRect) + BAKit_CGRectGetMinXHorizontallyCenterInParentRect(referenceRect, layoutingRect);
}

/// 为给定的rect往内部缩小insets的大小
CG_INLINE CGRect
BAKit_CGRectInsetEdges(CGRect rect, UIEdgeInsets insets) {
    rect.origin.x += insets.left;
    rect.origin.y += insets.top;
    rect.size.width -= BAKit_UIEdgeInsetsGetHorizontalValue(insets);
    rect.size.height -= BAKit_UIEdgeInsetsGetVerticalValue(insets);
    return rect;
}

/// 传入size，返回一个x/y为0的CGRect
CG_INLINE CGRect
BAKit_CGRectMakeWithSize(CGSize size) {
    return CGRectMake(0, 0, size.width, size.height);
}

CG_INLINE CGRect
BAKit_CGRectFloatTop(CGRect rect, CGFloat top) {
    rect.origin.y = top;
    return rect;
}

CG_INLINE CGRect
BAKit_CGRectFloatBottom(CGRect rect, CGFloat bottom) {
    rect.origin.y = bottom - CGRectGetHeight(rect);
    return rect;
}

CG_INLINE CGRect
BAKit_CGRectFloatRight(CGRect rect, CGFloat right) {
    rect.origin.x = right - CGRectGetWidth(rect);
    return rect;
}

CG_INLINE CGRect
BAKit_CGRectFloatLeft(CGRect rect, CGFloat left) {
    rect.origin.x = left;
    return rect;
}

/// 保持rect的左边缘不变，改变其宽度，使右边缘靠在right上
CG_INLINE CGRect
BAKit_CGRectLimitRight(CGRect rect, CGFloat rightLimit) {
    rect.size.width = rightLimit - rect.origin.x;
    return rect;
}

/// 保持rect右边缘不变，改变其宽度和origin.x，使其左边缘靠在left上。只适合那种右边缘不动的view
/// 先改变origin.x，让其靠在offset上
/// 再改变size.width，减少同样的宽度，以抵消改变origin.x带来的view移动，从而保证view的右边缘是不动的
CG_INLINE CGRect
BAKit_CGRectLimitLeft(CGRect rect, CGFloat leftLimit) {
    CGFloat subOffset = leftLimit - rect.origin.x;
    rect.origin.x = leftLimit;
    rect.size.width = rect.size.width - subOffset;
    return rect;
}

/// 限制rect的宽度，超过最大宽度则截断，否则保持rect的宽度不变
CG_INLINE CGRect
BAKit_CGRectLimitMaxWidth(CGRect rect, CGFloat maxWidth) {
    CGFloat width = CGRectGetWidth(rect);
    rect.size.width = width > maxWidth ? maxWidth : width;
    return rect;
}

CG_INLINE CGRect
BAKit_CGRectSetX(CGRect rect, CGFloat x) {
    rect.origin.x = BAKit_Flat(x);
    return rect;
}

CG_INLINE CGRect
BAKit_CGRectSetY(CGRect rect, CGFloat y) {
    rect.origin.y = BAKit_Flat(y);
    return rect;
}

CG_INLINE CGRect
BAKit_CGRectSetXY(CGRect rect, CGFloat x, CGFloat y) {
    rect.origin.x = BAKit_Flat(x);
    rect.origin.y = BAKit_Flat(y);
    return rect;
}

CG_INLINE CGRect
BAKit_CGRectSetWidth(CGRect rect, CGFloat width) {
    rect.size.width = BAKit_Flat(width);
    return rect;
}

CG_INLINE CGRect
BAKit_CGRectSetHeight(CGRect rect, CGFloat height) {
    rect.size.height = BAKit_Flat(height);
    return rect;
}

CG_INLINE CGRect
BAKit_CGRectSetSize(CGRect rect, CGSize size) {
    rect.size = BAKit_CGSizeFlatted(size);
    return rect;
}


#endif /* BAKit_FrameDefine_h */
