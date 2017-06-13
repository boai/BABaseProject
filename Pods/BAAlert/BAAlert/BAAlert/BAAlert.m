
/*!
 *  @brief      BAAlert
 *
 *  @author     BAHome
 *  @copyright  Copyright © 2016年 BAHome. All rights reserved.
 *  @version    V1.1.0
 */


#import "BAAlert.h"
#import <Accelerate/Accelerate.h>
#import <float.h>
//#import "UIView+BAAnimation.h"
#import "CALayer+Animation.h"
#import "BAAlert_OC.h"

@interface UIImage (BAAlertImageEffects)

- (UIImage*)BAAlert_ApplyLightEffect;

- (UIImage*)BAAlert_ApplyExtraLightEffect;

- (UIImage*)BAAlert_ApplyDarkEffect;

- (UIImage*)BAAlert_ApplyTintEffectWithColor:(UIColor*)tintColor;

- (UIImage*)BAAlert_ApplyBlurWithRadius:(CGFloat)blurRadius
                              tintColor:(UIColor*)tintColor
                  saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                              maskImage:(UIImage*)maskImage;
@end

@implementation UIImage (BAAlertImageEffects)

- (UIImage *)BAAlert_ApplyLightEffect
{
    UIColor *tintColor = [UIColor colorWithWhite:0.3 alpha:0.4];
    return [self BAAlert_ApplyBlurWithRadius:1.3 tintColor:tintColor saturationDeltaFactor:1.8 maskImage:nil];
}

- (UIImage *)BAAlert_ApplyExtraLightEffect
{
    UIColor *tintColor = [UIColor colorWithWhite:0.97 alpha:0.82];
    return [self BAAlert_ApplyBlurWithRadius:2 tintColor:tintColor saturationDeltaFactor:1.8 maskImage:nil];
}

- (UIImage *)BAAlert_ApplyDarkEffect
{
    UIColor *tintColor = [UIColor colorWithWhite:0.11 alpha:0.73];
    return [self BAAlert_ApplyBlurWithRadius:20 tintColor:tintColor saturationDeltaFactor:1.8 maskImage:nil];
}

- (UIImage *)BAAlert_ApplyTintEffectWithColor:(UIColor *)tintColor
{
    const CGFloat EffectColorAlpha = 0.45;
    UIColor *effectColor = tintColor;
    size_t componentCount = CGColorGetNumberOfComponents(tintColor.CGColor);
    if (componentCount == 2) {
        CGFloat b;
        if ([tintColor getWhite:&b alpha:NULL]) {
            effectColor = [UIColor colorWithWhite:b alpha:EffectColorAlpha];
        }
    }
    else {
        CGFloat r, g, b;
        if ([tintColor getRed:&r green:&g blue:&b alpha:NULL]) {
            effectColor = [UIColor colorWithRed:r green:g blue:b alpha:EffectColorAlpha];
        }
    }
    return [self BAAlert_ApplyBlurWithRadius:10 tintColor:effectColor saturationDeltaFactor:-1.0 maskImage:nil];
}

- (UIImage *)BAAlert_ApplyBlurWithRadius:(CGFloat)blurRadius
                               tintColor:(UIColor *)tintColor
                   saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                               maskImage:(UIImage *)maskImage
{
    // Check pre-conditions.
    if (self.size.width < 1 || self.size.height < 1)
    {
        NSLog (@"*** error: invalid size: (%.2f x %.2f). Both dimensions must be >= 1: %@", self.size.width, self.size.height, self);
        return nil;
    }
    if (!self.CGImage)
    {
        NSLog (@"*** error: image must be backed by a CGImage: %@", self);
        return nil;
    }
    if (maskImage && !maskImage.CGImage)
    {
        NSLog (@"*** error: maskImage must be backed by a CGImage: %@", maskImage);
        return nil;
    }
    
    CGRect imageRect = { CGPointZero, self.size };
    UIImage *effectImage = self;
    
    BOOL hasBlur = blurRadius > __FLT_EPSILON__;
    BOOL hasSaturationChange = fabs(saturationDeltaFactor - 1.) > __FLT_EPSILON__;
    if (hasBlur || hasSaturationChange) {
        UIGraphicsBeginImageContextWithOptions(self.size, NO, [[UIScreen mainScreen] scale]);
        CGContextRef effectInContext = UIGraphicsGetCurrentContext();
        CGContextScaleCTM(effectInContext, 1.0, -1.0);
        CGContextTranslateCTM(effectInContext, 0, -self.size.height);
        CGContextDrawImage(effectInContext, imageRect, self.CGImage);
        
        vImage_Buffer effectInBuffer;
        effectInBuffer.data     = CGBitmapContextGetData(effectInContext);
        effectInBuffer.width    = CGBitmapContextGetWidth(effectInContext);
        effectInBuffer.height   = CGBitmapContextGetHeight(effectInContext);
        effectInBuffer.rowBytes = CGBitmapContextGetBytesPerRow(effectInContext);
        
        UIGraphicsBeginImageContextWithOptions(self.size, NO, [[UIScreen mainScreen] scale]);
        CGContextRef effectOutContext = UIGraphicsGetCurrentContext();
        vImage_Buffer effectOutBuffer;
        effectOutBuffer.data     = CGBitmapContextGetData(effectOutContext);
        effectOutBuffer.width    = CGBitmapContextGetWidth(effectOutContext);
        effectOutBuffer.height   = CGBitmapContextGetHeight(effectOutContext);
        effectOutBuffer.rowBytes = CGBitmapContextGetBytesPerRow(effectOutContext);
        
        if (hasBlur) {
            // A description of how to compute the box kernel width from the Gaussian
            // radius (aka standard deviation) appears in the SVG spec:
            // http://www.w3.org/TR/SVG/filters.html#feGaussianBlurElement
            //
            // For larger values of 's' (s >= 2.0), an approximation can be used: Three
            // successive box-blurs build a piece-wise quadratic convolution kernel, which
            // approximates the Gaussian kernel to within roughly 3%.
            //
            // let d = floor(s * 3*sqrt(2*pi)/4 + 0.5)
            //
            // ... if d is odd, use three box-blurs of size 'd', centered on the output pixel.
            //
            CGFloat inputRadius = blurRadius * [[UIScreen mainScreen] scale];
            NSUInteger radius = floor(inputRadius * 3. * sqrt(2 * M_PI) / 4 + 0.5);
            if (radius % 2 != 1) {
                radius += 1; // force radius to be odd so that the three box-blur methodology works.
            }
            vImageBoxConvolve_ARGB8888(&effectInBuffer, &effectOutBuffer, NULL, 0, 0, (int)radius, (int)radius, 0, kvImageEdgeExtend);
            vImageBoxConvolve_ARGB8888(&effectOutBuffer, &effectInBuffer, NULL, 0, 0, (int)radius, (int)radius, 0, kvImageEdgeExtend);
            vImageBoxConvolve_ARGB8888(&effectInBuffer, &effectOutBuffer, NULL, 0, 0, (int)radius, (int)radius, 0, kvImageEdgeExtend);
        }
        BOOL effectImageBuffersAreSwapped = NO;
        if (hasSaturationChange) {
            CGFloat s = saturationDeltaFactor;
            CGFloat floatingPointSaturationMatrix[] = {
                0.0722 + 0.9278 * s,  0.0722 - 0.0722 * s,  0.0722 - 0.0722 * s,  0,
                0.7152 - 0.7152 * s,  0.7152 + 0.2848 * s,  0.7152 - 0.7152 * s,  0,
                0.2126 - 0.2126 * s,  0.2126 - 0.2126 * s,  0.2126 + 0.7873 * s,  0,
                0,                    0,                    0,  1,
            };
            const int32_t divisor = 256;
            NSUInteger matrixSize = sizeof(floatingPointSaturationMatrix)/sizeof(floatingPointSaturationMatrix[0]);
            int16_t saturationMatrix[matrixSize];
            for (NSUInteger i = 0; i < matrixSize; ++i) {
                saturationMatrix[i] = (int16_t)roundf(floatingPointSaturationMatrix[i] * divisor);
            }
            if (hasBlur) {
                vImageMatrixMultiply_ARGB8888(&effectOutBuffer, &effectInBuffer, saturationMatrix, divisor, NULL, NULL, kvImageNoFlags);
                effectImageBuffersAreSwapped = YES;
            }
            else {
                vImageMatrixMultiply_ARGB8888(&effectInBuffer, &effectOutBuffer, saturationMatrix, divisor, NULL, NULL, kvImageNoFlags);
            }
        }
        if (!effectImageBuffersAreSwapped)
            effectImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        if (effectImageBuffersAreSwapped)
            effectImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    // 开启上下文 用于输出图像
    UIGraphicsBeginImageContextWithOptions(self.size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef outputContext = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(outputContext, 1.0, -1.0);
    CGContextTranslateCTM(outputContext, 0, -self.size.height);
    
    // 开始画底图
    CGContextDrawImage(outputContext, imageRect, self.CGImage);
    
    // 开始画模糊效果
    if (hasBlur) {
        CGContextSaveGState(outputContext);
        if (maskImage) {
            CGContextClipToMask(outputContext, imageRect, maskImage.CGImage);
        }
        CGContextDrawImage(outputContext, imageRect, effectImage.CGImage);
        CGContextRestoreGState(outputContext);
    }
    
    // 添加颜色渲染
    if (tintColor) {
        CGContextSaveGState(outputContext);
        CGContextSetFillColorWithColor(outputContext, tintColor.CGColor);
        CGContextFillRect(outputContext, imageRect);
        CGContextRestoreGState(outputContext);
    }
    
    // 输出成品,并关闭上下文
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return outputImage;
}

@end


#define BAKit_BaseScreenWidth   320.0f
#define BAKit_BaseScreenHeight  568.0f


/*! 屏幕适配（5S标准屏幕：320 * 568） */
// iPhone 7 屏幕：375 * 667
//376/320 =
//667/568 =
#define BAKit_ScaleXAndWidth    SCREENWIDTH/BAKit_BaseScreenWidth
#define BAKit_ScaleYAndHeight   SCREENHEIGHT/BAKit_BaseScreenHeight

#define kBAAlert_Padding           10
#define kBAAlert_Radius            10
#define kBAAlert_ButtonHeight      40

#pragma mark - 根据文字内容、宽度和字体返回 size
CG_INLINE CGSize
ba_LabelSizeWithTextAndWidthAndFont(NSString *text, CGFloat width, UIFont *font){
    CGSize size = CGSizeMake(width, MAXFLOAT);
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineBreakMode:NSLineBreakByWordWrapping];
    
    CGRect frame = [text boundingRectWithSize:size
                                      options:
                    NSStringDrawingTruncatesLastVisibleLine |
                    NSStringDrawingUsesLineFragmentOrigin |
                    NSStringDrawingUsesFontLeading
                                   attributes:@{NSFontAttributeName : font, NSParagraphStyleAttributeName : style} context:nil];
    CGRect newFrame = CGRectMake(frame.origin.x, frame.origin.y, width, frame.size.height);
    return newFrame.size;
}

typedef NS_ENUM(NSUInteger, BAAlertType) {
    BAAlertTypeNormal = 0,
    BAAlertTypeCustom
};

@interface BAAlert ()
{
    CGFloat  _scroll_bottom;
    CGFloat  _button_totalHeight;
    CGFloat  _maxContent_Width;
    CGFloat  _maxContent_Height;

}
/*! 自定义 View */
@property (nonatomic, strong) UIView                  *customView;


@property (nonatomic, strong) NSString                *title;
@property (nonatomic, strong) NSString                *message;
@property (nonatomic, strong) UIImage                 *image;
@property (nonatomic, strong) NSArray                 *buttonTitleArray;
@property (nonatomic, strong) NSArray                 *buttonTitleColorArray;
@property (nonatomic, strong) NSMutableArray          *buttonArray;
@property (nonatomic, strong) NSMutableArray          *lineArray;


@property (nonatomic, strong) UIImageView             *containerView;
@property (nonatomic, strong) UIScrollView            *scrollView;
@property (nonatomic, strong) UILabel                 *titleLabel;
@property (nonatomic, strong) UIImageView             *imageView;
@property (nonatomic, strong) UILabel                 *messageLabel;

@property (nonatomic, assign) BAAlertType alertType;
@property (nonatomic, strong) UIWindow *alertWindow;

@property (nonatomic, assign) CGFloat view_width;
@property (nonatomic, assign) CGFloat view_height;

@property (nonatomic, assign) CGRect customView_frame;
@property (nonatomic, strong) UIImageView *blurImageView;

@property (nonatomic, assign) BAAlertBlurEffectStyle current_blurEffectStyle;
@property (nonatomic, copy) BAAlert_ButtonActionBlock actionBlock;
@property(nonatomic, assign) BOOL isAnimating;

@end

@implementation BAAlert

#pragma mark - 快速创建方法
+ (void)ba_alertShowCustomView:(UIView *)customView
                 configuration:(BAAlert_ConfigBlock) configuration
{
    BAAlert *tempView = [[BAAlert alloc] initWithCustomView:customView];
    if (configuration)
    {
        configuration(tempView);
    }
    [tempView ba_alertShow];
}

/*!
 *  创建一个类似于系统的alert
 *
 *  @param title         标题：可空
 *  @param message       消息内容：可空
 *  @param image         图片：可空
 *  @param buttonTitleArray  按钮标题：不可空
 *  @param buttonTitleColorArray  按钮标题颜色：可空，默认蓝色
 *  @param configuration 属性配置：如 bgColor、buttonTitleColor、isTouchEdgeHide...
 *  @param actionBlock        按钮的点击事件处理
 */
+ (void)ba_alertShowWithTitle:(NSString *)title
                      message:(NSString *)message
                        image:(UIImage *)image
             buttonTitleArray:(NSArray <NSString *>*)buttonTitleArray
        buttonTitleColorArray:(NSArray <UIColor *>*)buttonTitleColorArray
                configuration:(BAAlert_ConfigBlock)configuration
                  actionBlock:(BAAlert_ButtonActionBlock)actionBlock
{
    BAAlert *tempView = [[BAAlert alloc] ba_showTitle:title
                                          message:message
                                            image:image
                                     buttonTitles:buttonTitleArray
                                buttonTitlesColor:buttonTitleColorArray];
    if (configuration)
    {
        configuration(tempView);
    }
    tempView.actionBlock = actionBlock;
    [tempView ba_alertShow];
}

#pragma mark - ***** 初始化自定义View
- (instancetype)initWithCustomView:(UIView *)customView
{
    if (self = [super initWithFrame:CGRectZero])
    {
        self.customView = customView;
        self.alertType = BAAlertTypeCustom;
        self.customView_frame = customView.frame;
        
        [self addSubview:customView];
        [self bringSubviewToFront:customView];
        [self setupCommonUI];
    }
    return self;
}

#pragma mark - ***** 创建一个类似系统的警告框
- (instancetype)ba_showTitle:(NSString *)title
                     message:(NSString *)message
                       image:(UIImage *)image
                buttonTitles:(NSArray *)buttonTitles
           buttonTitlesColor:(NSArray <UIColor *>*)buttonTitlesColor
{
    if (self == [super initWithFrame:CGRectZero])
    {
        _title             = [title copy];
        _image             = image;
        _message           = [message copy];
        _buttonTitleArray      = [NSArray arrayWithArray:buttonTitles];
        _buttonTitleColorArray = [NSArray arrayWithArray:buttonTitlesColor];
        self.alertType = BAAlertTypeNormal;
        
        [self setupCommonUI];
    }
    return self;
}

- (void)setupCommonUI
{
    self.bgColor = BAAlert_Color_Translucent;
    self.blurImageView.hidden = NO;
    
    if (self.alertType == BAAlertTypeCustom)
    {
        [self interfaceOrientation:UIInterfaceOrientationPortrait];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleKeyboardShowAction:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleKeyboardHiddenAction:) name:UIKeyboardWillHideNotification object:nil];
    }

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleDeviceOrientationRotateAction:) name:UIDeviceOrientationDidChangeNotification object:nil];
}

#pragma mark - 系统默认 alert
#pragma mark 初始化按钮
- (void)loadButtons
{
    if (!_buttonTitleArray || _buttonTitleArray.count == 0)
    {
        return;
    }
    if (!_buttonTitleColorArray || _buttonTitleColorArray.count == 0 || _buttonTitleColorArray.count < _buttonTitleArray.count)
    {
        NSMutableArray *mutArr = [NSMutableArray array];
        for (NSInteger i = 0; i < _buttonTitleArray.count; i ++)
        {
            [mutArr addObject:[UIColor blueColor]];
        }
        _buttonTitleColorArray = [mutArr mutableCopy];
    }
    
    CGFloat buttonHeight = kBAAlert_ButtonHeight;
    CGFloat buttonWidth  = CGRectGetWidth(self.containerView.frame);
    CGFloat top          = CGRectGetHeight(_containerView.frame) - _button_totalHeight;
    [self addLine:CGRectMake(0, top - 0.5, buttonWidth, 0.5) toView:_containerView];
    
    if (_buttonTitleColorArray.count)
    {
        if (1 == _buttonTitleArray.count)
        {
            [self addButton:CGRectMake(0, top, buttonWidth, buttonHeight) title:_buttonTitleArray[0] tag:(0)  titleColor:_buttonTitleColorArray[0]];
        }
        else if (2 == _buttonTitleArray.count)
        {
            for (NSInteger i = 0; i < _buttonTitleArray.count; i ++)
            {
                CGRect button_frame = CGRectMake(buttonWidth/2 * i, top, buttonWidth/2, buttonHeight);
            
                [self addButton:button_frame title:_buttonTitleArray[i] tag:i titleColor:_buttonTitleColorArray[i]];
            }
            
            [self addLine:CGRectMake(buttonWidth/2-.5, top, 0.5, buttonHeight) toView:_containerView];
        }
        else
        {
            for (NSInteger i=0; i<_buttonTitleArray.count; i++)
            {
                [self addButton:CGRectMake(0, top, buttonWidth, buttonHeight) title:_buttonTitleArray[i] tag:i titleColor:_buttonTitleColorArray[i]];
                top += buttonHeight;
                if (_buttonTitleArray.count-1!=i)
                {
                    [self addLine:CGRectMake(0, top, buttonWidth, 0.5) toView:_containerView];
                }
            }
            [_lineArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                [_containerView bringSubviewToFront:obj];
            }];
        }
    }
}

#pragma mark 添加按钮方法
- (void)addButton:(CGRect)frame
            title:(NSString *)title
              tag:(NSInteger)tag
       titleColor:(UIColor *)titleColor
{
    UIButton *button       = [[UIButton alloc] initWithFrame:frame];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    button.tag             = tag;
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    
    if (self.bgImageName)
    {
        [button setBackgroundImage:[self imageWithColor:[UIColor clearColor]] forState:UIControlStateNormal];
    }
    else
    {
        [button setBackgroundImage:[self imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    }
    [button setBackgroundImage:[self imageWithColor:BAAlert_Color_RGBA(135, 140, 145, 0.45)] forState:UIControlStateHighlighted];

    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.containerView addSubview:button];
    [self.buttonArray addObject:button];
}

#pragma mark 添加底部横线方法
- (void)addLine:(CGRect)frame toView:(UIView *)view
{
    UIView *line = [[UIView alloc] initWithFrame:frame];
    line.backgroundColor = BAAlert_Color_RGBA(160, 170, 160, 0.5);
    [view addSubview:line];
    [_lineArray addObject:line];
}

#pragma mark 按钮事件
- (void)buttonClicked:(UIButton *)button
{
    [self endEditing:YES];
    
    if (self.actionBlock)
    {
        self.actionBlock(button.tag);
    }
}

#pragma mark 纯颜色转图片
- (UIImage *)imageWithColor:(UIColor *)color
{
    UIImage *image = [self imageWithColor:color andSize:CGSizeMake(1.0f, 1.0f)];
    return image;
}

- (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize )size
{
    CGRect rect          = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
    UIImage *image       = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark - 通知处理
- (void)handleDeviceOrientationRotateAction:(NSNotification *)notification
{
    [self ba_layoutSubViews];
}

- (void)handleKeyboardShowAction:(NSNotification *)notification
{
    NSDictionary *infoDic = notification.userInfo;
    CGFloat duration  = [infoDic[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    CGRect keyBoardRect  = [infoDic[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    CGRect viewFrame = self.customView.frame;
    CGFloat height_different = CGRectGetMaxY(viewFrame) - keyBoardRect.origin.y;
    
    if (height_different > 0)
    {
        viewFrame.origin.y -= height_different;
        viewFrame.origin.y -= 10;
        BAKit_WeakSelf
        [UIView animateWithDuration:duration animations:^{
            BAKit_StrongSelf
            self.customView.frame = viewFrame;
        }];
    }
}

- (void)handleKeyboardHiddenAction:(NSNotification *)notification
{
    NSDictionary *info = [notification userInfo];
    double duration = [info[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    BAKit_WeakSelf
    [UIView animateWithDuration:duration animations:^{
        BAKit_StrongSelf
        self.customView.frame = self.customView_frame;
    }];
}

#pragma mark - custom method

/*!
 *  视图显示
 */
- (void)ba_alertShow
{
    [self.alertWindow addSubview:self];
    [self.alertWindow bringSubviewToFront:self];
    
    [self ba_layoutSubViews];

    /*! 设置默认样式为： */
    if (self.isShowAnimate && !self.animatingStyle)
    {
        _animatingStyle = BAAlertAnimatingStyleScale;
    }
    /*! 如果没有开启动画，就直接默认第一个动画样式 */
    else if (!self.isShowAnimate && self.animatingStyle)
    {
        self.showAnimate = YES;
    }
    else
    {
        if (!self.animatingStyle)
        {
            NSLog(@"您没有开启动画，也没有设置动画样式，默认为没有动画！");
        }
    }
    
    if (self.isShowAnimate)
    {
        [self showAnimationWithView:(self.alertType == BAAlertTypeNormal) ? self.containerView:self.customView];
    }
}

/*!
 *  视图消失
 */
- (void)ba_alertHidden
{
    if (self.isShowAnimate)
    {
        [self dismissAnimationView:(self.alertType == BAAlertTypeNormal) ? self.containerView:self.customView];
    }
    else
    {
        [self ba_removeSelf];
    }
}

- (void)ba_resetButtons
{
    if (self.buttonArray.count > 0)
    {
        [self.buttonArray makeObjectsPerformSelector:@selector(removeFromSuperview)];
        
        [self.buttonArray removeAllObjects];
    }
    if (self.lineArray.count > 0)
    {
        [self.lineArray makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [self.lineArray removeAllObjects];
    }
}

#pragma mark - 进场动画
- (void )showAnimationWithView:(UIView *)animationView
{
    self.isAnimating = YES;
    BAKit_WeakSelf
    if (self.animatingStyle == BAAlertAnimatingStyleScale)
    {
        [animationView scaleAnimationShowFinishAnimation:^{
            BAKit_StrongSelf
            self.isAnimating = NO;
        }];
    }
    else if (self.animatingStyle == BAAlertAnimatingStyleShake)
    {
        [animationView.layer shakeAnimationWithDuration:1.0 shakeRadius:16.0 repeat:1 finishAnimation:^{
            BAKit_StrongSelf
            self.isAnimating = NO;
        }];
    }
    else if (self.animatingStyle == BAAlertAnimatingStyleFall)
    {
        [animationView.layer fallAnimationWithDuration:0.35 finishAnimation:^{
            BAKit_StrongSelf
            self.isAnimating = NO;
        }];
    }
}

#pragma mark - 出场动画
- (void )dismissAnimationView:(UIView *)animationView
{
    self.isAnimating = YES;
    BAKit_WeakSelf
    if (self.animatingStyle == BAAlertAnimatingStyleScale)
    {
        [animationView scaleAnimationDismissFinishAnimation:^{
            BAKit_StrongSelf
            self.isAnimating = NO;
            [self ba_removeSelf];
        }];
    }
    else if (self.animatingStyle == BAAlertAnimatingStyleShake)
    {
        [animationView.layer floatAnimationWithDuration:0.35f finishAnimation:^{
            BAKit_StrongSelf
            self.isAnimating = NO;
            [self ba_removeSelf];
        }];
    }
    else if (self.animatingStyle == BAAlertAnimatingStyleFall)
    {
        [animationView.layer floatAnimationWithDuration:0.35f finishAnimation:^{
            BAKit_StrongSelf
            self.isAnimating = NO;
            [self ba_removeSelf];
        }];
    }
}

#pragma mark - 清除所有视图
- (void)ba_removeSelf
{
    //    NSLog(@"【 %@ 】已经释放！",[self class]);
    if (_titleLabel)
    {
        [_titleLabel removeFromSuperview];
        _titleLabel = nil;
    }
    if (_imageView)
    {
        [_imageView removeFromSuperview];
        _imageView = nil;
    }
    if (_messageLabel)
    {
        [_messageLabel removeFromSuperview];
        _messageLabel = nil;
    }
    
    [self ba_resetButtons];
    
    if (_customView)
    {
        [_customView removeFromSuperview];
        _customView = nil;
    }
    if (_containerView)
    {
        [_containerView removeFromSuperview];
        _containerView = nil;
    }
    if (_blurImageView)
    {
        [_blurImageView removeFromSuperview];
        _blurImageView = nil;
    }
    if (_scrollView)
    {
        [_scrollView removeFromSuperview];
        _scrollView = nil;
    }
    _alertWindow = nil;
    [self removeFromSuperview];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)dealloc
{
    [self ba_removeSelf];
}

- (void)interfaceOrientation:(UIInterfaceOrientation)orientation
{
    // arc下
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)])
    {
        SEL selector             = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        int val                  = orientation;
        // 从2开始是因为0 1 两个参数已经被selector和target占用
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"触摸了边缘隐藏View！");
    UITouch *touch = [touches anyObject];
    UIView *view = [touch view];
    
    if (self.isAnimating)
    {
        NSLog(@"请在动画结束时点击！");
        return;
    }
    if (!self.isTouchEdgeHide)
    {
        NSLog(@"触摸了View边缘，但您未开启触摸边缘隐藏方法，请设置 isTouchEdgeHide 属性为 YES 后再使用！");
    }
    
    if ([view isKindOfClass:[self class]])
    {
        [self ba_alertHidden];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];

}

- (void)ba_layoutSubViews
{
    self.frame = self.window.bounds;
    self.alertWindow.frame = self.window.bounds;
    
    if (self.blurEffectStyle)
    {
        self.blurImageView.image = nil;
        self.blurImageView.frame = [UIScreen mainScreen].bounds;
        self.current_blurEffectStyle = self.blurEffectStyle;
    }

    self.view_width = [UIScreen mainScreen].bounds.size.width;
    self.view_height = [UIScreen mainScreen].bounds.size.height;
    
    if (self.alertType == BAAlertTypeNormal)
    {
        [self layoutNormalAlert];
    }
    else if (self.alertType == BAAlertTypeCustom)
    {
        NSLog(@"【 BAAlert 】注意：【自定义 alert 只适用于竖屏状态！】");
        self.customView.frame = self.customView_frame;
    }
}

- (void)layoutNormalAlert
{
    [self ba_resetButtons];
    CGFloat min_x = 0;
    CGFloat min_y = 0;
    CGFloat min_w = 0;
    CGFloat min_h = 0;
    _scroll_bottom = 0;
    
    _maxContent_Width = self.view_width - 50 * BAKit_ScaleXAndWidth * 2;
    _maxContent_Height = self.view_height - 20 * BAKit_ScaleYAndHeight * 2;
    _button_totalHeight = kBAAlert_ButtonHeight*((_buttonTitleArray.count>2||_buttonTitleArray.count==0)?_buttonTitleArray.count:1);

    // 标题
    min_x = kBAAlert_Padding;
    min_y = 0;
    CGSize titleLabel_size = ba_LabelSizeWithTextAndWidthAndFont(self.titleLabel.text, _maxContent_Width - kBAAlert_Padding * 2, self.titleLabel.font);
    min_w = titleLabel_size.width;
    min_h = titleLabel_size.height;
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.frame = CGRectMake(min_x, min_y, min_w, min_h);
    
    min_y = CGRectGetMaxY(self.titleLabel.frame) + kBAAlert_Padding;
    min_h = 0.5f;
    [self addLine:CGRectMake(min_x, min_y, min_w, min_h) toView:self.scrollView];
    
    // 图片
    min_y = CGRectGetMaxY(self.titleLabel.frame) + kBAAlert_Padding * 2;
    CGSize imageView_size = self.image.size;
    if (imageView_size.width > _maxContent_Width)
    {
        imageView_size = CGSizeMake(_maxContent_Width, imageView_size.height / imageView_size.width * _maxContent_Width);
    }
    min_w = imageView_size.width - kBAAlert_Padding * 2;
    min_h = imageView_size.height;
    
    self.imageView.frame = CGRectMake(min_x, min_y, min_w, min_h);

    // message
    if (min_h <= 0)
    {
        min_y = CGRectGetMaxY(self.titleLabel.frame) + kBAAlert_Padding * 2;
    }
    else
    {
        min_y = CGRectGetMaxY(self.imageView.frame) + kBAAlert_Padding;
    }
    CGSize messageLabel_size = ba_LabelSizeWithTextAndWidthAndFont(self.messageLabel.text, _maxContent_Width - kBAAlert_Padding * 2, self.messageLabel.font);
    min_w = messageLabel_size.width;
    min_h = messageLabel_size.height;
    self.messageLabel.frame = CGRectMake(min_x, min_y, min_w, min_h);
    _scroll_bottom = CGRectGetMaxY(self.messageLabel.frame) + kBAAlert_Padding;

    min_x = 0;
    min_y = 0;
    min_w = _maxContent_Width;
    min_h = MIN(MAX(_scroll_bottom + 2 * kBAAlert_Padding + _button_totalHeight, 3 * kBAAlert_Padding), _maxContent_Height);
    
    self.containerView.frame = CGRectMake(min_x, min_y, min_w, min_h);
    self.containerView.center = self.center;
    
    min_y = kBAAlert_Padding;
    min_h = MIN(_scroll_bottom, CGRectGetHeight(self.containerView.frame) - 2 * kBAAlert_Padding - _button_totalHeight);
    self.scrollView.frame = CGRectMake(min_x, min_y, min_w, min_h);
    self.scrollView.contentSize = CGSizeMake(_maxContent_Width, _scroll_bottom);
    
    [self loadButtons];
}

#pragma mark - setter / getter
- (NSMutableArray *)buttonArray
{
    if (!_buttonArray)
    {
        _buttonArray = @[].mutableCopy;
    }
    return _buttonArray;
}

- (NSMutableArray *)lineArray
{
    if (!_lineArray)
    {
        _lineArray = @[].mutableCopy;
    }
    return _lineArray;
}

- (UIImageView *)containerView
{
    if (!_containerView)
    {
        _containerView                            = [UIImageView new];
        self.containerView.userInteractionEnabled = YES;
        self.containerView.layer.masksToBounds    = YES;
        self.containerView.layer.cornerRadius     = kBAAlert_Radius;
        self.containerView.backgroundColor        = [UIColor whiteColor];
        
        [self addSubview:self.containerView];
    }
    return _containerView;
}

- (UIScrollView *)scrollView
{
    if (!_scrollView)
    {
        _scrollView = [[UIScrollView alloc] init];
        self.scrollView.backgroundColor = [UIColor whiteColor];
        self.scrollView.scrollEnabled = YES;
        [self.containerView addSubview:self.scrollView];
    }
    return _scrollView;
}

- (UIWindow *)alertWindow
{
    if (!_alertWindow)
    {
        _alertWindow = [UIApplication sharedApplication].keyWindow;
        
        if (self.alertWindow.windowLevel != UIWindowLevelNormal)
        {
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"windowLevel == %ld AND hidden == 0 " , UIWindowLevelNormal];
            self.alertWindow = [[UIApplication sharedApplication].windows filteredArrayUsingPredicate:predicate].firstObject;
        }
        self.alertWindow.backgroundColor = BAAlert_Color_Translucent;
    }
    return _alertWindow;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel               = [UILabel new];
        _titleLabel.textColor     = [UIColor blackColor];
        _titleLabel.font          = [UIFont fontWithName:@"FontNameAmericanTypewriterBold" size:20];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 0;
        _titleLabel.text = self.title;
        
        [self.scrollView addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UIImageView *)imageView
{
    if (!_imageView)
    {
        _imageView = [UIImageView new];
        self.imageView.image = self.image;

        [self.scrollView addSubview:self.imageView];
    }
    return _imageView;
}

- (UILabel *)messageLabel
{
    if (!_messageLabel)
    {
        _messageLabel                   = [UILabel new];
        self.messageLabel.textColor     = [UIColor blackColor];
        self.messageLabel.font          = [UIFont systemFontOfSize:14];
        self.messageLabel.textAlignment = NSTextAlignmentCenter;
        self.messageLabel.numberOfLines = 0;
        self.messageLabel.backgroundColor = [UIColor clearColor];
        self.messageLabel.text          = self.message;
        [self.scrollView addSubview:self.messageLabel];
    }
    return _messageLabel;
}

- (UIImageView *)blurImageView
{
    if ( !_blurImageView )
    {
        _blurImageView = [[UIImageView alloc] init];
        _blurImageView.contentMode = UIViewContentModeScaleAspectFit;
        _blurImageView.clipsToBounds = true;
        _blurImageView.backgroundColor = [UIColor clearColor];
        
        [self.alertWindow addSubview:_blurImageView];
        //[self sendSubviewToBack:_blurImageView];
    }
    return _blurImageView;
}

- (void)setAlertType:(BAAlertType)alertType
{
    _alertType = alertType;
}

- (void)setBgColor:(UIColor *)bgColor
{
    _bgColor = bgColor;
    self.backgroundColor = bgColor;
}

- (void)setIsTouchEdgeHide:(BOOL)isTouchEdgeHide
{
    _isTouchEdgeHide = isTouchEdgeHide;
}

- (void)setShowAnimate:(BOOL)showAnimate
{
    _showAnimate = showAnimate;
}

- (void)setAnimatingStyle:(BAAlertAnimatingStyle)animatingStyle
{
    _animatingStyle = animatingStyle;
}

- (void)setIsAnimating:(BOOL)isAnimating
{
    _isAnimating = isAnimating;
}

- (void)setBgImageName:(NSString *)bgImageName
{
    _bgImageName                   = bgImageName;
    
    _containerView.backgroundColor = [UIColor clearColor];
    _scrollView.backgroundColor    = [UIColor clearColor];
    _containerView.image           = [UIImage imageNamed:bgImageName];
    _containerView.contentMode     = UIViewContentModeScaleAspectFill;
}

- (void)setCurrent_blurEffectStyle:(BAAlertBlurEffectStyle)current_blurEffectStyle
{
    _current_blurEffectStyle = current_blurEffectStyle;
    
    self.blurImageView.image = nil;
    
    self.blurImageView.image = [self getCurrentWindowImage];
    
    if (self.blurEffectStyle == BAAlertBlurEffectStyleLight)
    {
        self.blurImageView.image = [self.blurImageView.image BAAlert_ApplyLightEffect];
    }
    else if (self.blurEffectStyle == BAAlertBlurEffectStyleExtraLight)
    {
        self.blurImageView.image = [self.blurImageView.image BAAlert_ApplyExtraLightEffect];
    }
    else if (self.blurEffectStyle == BAAlertBlurEffectStyleDark)
    {
        self.blurImageView.image = [self.blurImageView.image BAAlert_ApplyDarkEffect];
    }
    //    [self imageOutPut:^(UIImage *image) {
    //        self.blurImageView.image = image;
    //    }];
}

- (UIImage *)getCurrentWindowImage
{
    UIGraphicsBeginImageContext(self.alertWindow.rootViewController.view.bounds.size);
    
    [self.alertWindow.rootViewController.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

/*! 待优化 */
- (void )imageOutPut:(void(^)(UIImage *image)) outPutImage
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        /*! CIImage，不能用UIImage的CIImage属性 */
        CIImage *ciImage         = [[CIImage alloc] initWithImage:[UIImage imageNamed:@"123.png"]];
        //        UIImage *tempImage = [self imageWithColor:[UIColor grayColor] andSize:[UIScreen mainScreen].bounds.size];
        //        CIImage *ciImage         = [[CIImage alloc] initWithImage:tempImage];
        
        // CIFilter(滤镜的名字)
        CIFilter *blurFilter     = [CIFilter filterWithName:@"CIGaussianBlur"];
        //    CIColor *color = [CIColor colorWithRed:1.0 green:0 blue:0];
        // 将图片放到滤镜中
        //    [blurFilter setValue:color forKey:kCIInputColorKey];
        [blurFilter setValue:ciImage forKey:kCIInputImageKey];
        
        // inputRadius参数: 模糊的程度 默认为10, 范围为0-100, 接收的参数为NSNumber类型
        
        // 设置模糊的程度
        [blurFilter setValue:@(10) forKey:kCIInputRadiusKey];
        //        [blurFilter setValue:@(10) forKey:kCIInputSharpnessKey];
        
        // 将处理好的图片导出
        CIImage *outImage        = [blurFilter valueForKey:kCIOutputImageKey];
        
        //理论上这些东西需要放到子线程去渲染，待优化
        // CIContext 上下文(参数nil，默认为CPU渲染, 如果想用GPU渲染来提高效率的话,则需要传参数)
        CIContext *context       = [CIContext contextWithOptions:@{kCIContextUseSoftwareRenderer:@(YES)}];
        
        // 将处理好的图片创建出来
        CGImageRef outputCGImage = [context createCGImage:outImage fromRect:[UIScreen mainScreen].bounds];
        
        UIImage *blurImage       = [UIImage imageWithCGImage:outputCGImage];
        
        // 释放CGImageRef
        CGImageRelease(outputCGImage);
        
        if (outPutImage) {
            dispatch_async(dispatch_get_main_queue(), ^{
                outPutImage(blurImage);
            });
        }
    });
}

@end
