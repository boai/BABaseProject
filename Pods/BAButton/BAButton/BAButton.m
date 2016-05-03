//
//  BAButton.m
//  demoTest
//
//  Created by 博爱 on 16/3/31.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BAButton.h"

@implementation BAButton
{
    UIImageView *_overlayImgView;
    CGFloat _fadeDuration;
}

- (instancetype _Nonnull)initWithFrame:(CGRect)frame
                                 image:(UIImage * _Nonnull)image
                      highlightedImage:(UIImage * _Nonnull)highlightedImage
                          fadeDuration:(CGFloat)fadeDuration {
    if ((self = [BAButton buttonWithType:UIButtonTypeCustom])) {
        self.frame = frame;
        
        _fadeDuration = fadeDuration;
        
        [self setImage:image forState:UIControlStateNormal];
        self.overlayImgView = [[UIImageView alloc] initWithImage:highlightedImage];
        _overlayImgView.frame = self.imageView.frame;
        _overlayImgView.bounds = self.imageView.bounds;
        
        self.adjustsImageWhenHighlighted = NO;
    }
    
    return self;
}

- (void)setHighlighted:(BOOL)highlighted {
    if (![self isHighlighted] && highlighted) {
        [self addSubview:_overlayImgView];
        
        [UIView animateWithDuration:_fadeDuration animations:^{
            _overlayImgView.alpha = 1;
        } completion:NULL];
    } else if ([self isHighlighted] && !highlighted) {
        [UIView animateWithDuration:_fadeDuration animations:^{
            _overlayImgView.alpha = 0;
        } completion:^(BOOL finished) {
            [_overlayImgView removeFromSuperview];
        }];
    }
    
    [super setHighlighted:highlighted];
}

- (void)setOverlayImgView:(UIImageView *)overlayImgView {
    if (overlayImgView != _overlayImgView) {
        _overlayImgView = overlayImgView;
    }
    
    _overlayImgView.alpha = 0;
}


@end

/*! 定义宏：按钮中文本和图片的间隔 */
#define BA_padding 7
#define BA_btnRadio 0.6
/*! 获得按钮的大小 */
#define BA_btnWidth       self.bounds.size.width
#define BA_btnHeight      self.bounds.size.height
/*! 获得按钮中UILabel文本的大小 */
#define BA_labelWidth     self.titleLabel.bounds.size.width
#define BA_labelHeight    self.titleLabel.bounds.size.height
/*! 获得按钮中image图标的大小 */
#define BA_imageWidth     self.imageView.bounds.size.width
#define BA_imageHeight    self.imageView.bounds.size.height


@implementation BACustomButton

+ (instancetype)BA_ShareButton
{
    return [[self alloc] init];
}

- (instancetype)initWitAligenmentStatus:(BAAligenmentStatus)status
{
    BACustomButton *button = [[BACustomButton alloc] init];
    button.buttonStatus = status;
    return button;
}

- (void)setButtonStatus:(BAAligenmentStatus)buttonStatus
{
    _buttonStatus = buttonStatus;
}

#pragma mark - 左对齐
- (void)alignmentLeft
{
    //    获得按钮的文本的frame
    CGRect titleFrame = self.titleLabel.frame;
    //    设置按钮的文本的x坐标为0-－－左对齐
    titleFrame.origin.x = 0;
    //    获得按钮的图片的frame
    CGRect imageFrame = self.imageView.frame;
    //    设置按钮的图片的x坐标紧跟文本的后面
    imageFrame.origin.x = CGRectGetWidth(titleFrame);
    
    self.titleLabel.frame = titleFrame;
    self.imageView.frame = imageFrame;
}

#pragma mark - 右对齐【文字在左，图片在右】
- (void)alignmentRight
{
    CGRect frame = [self getTitleLabelWith];
    CGRect imageFrame = self.imageView.frame;
    imageFrame.origin.x = BA_btnWidth - BA_imageWidth;
    CGRect titleFrame = self.titleLabel.frame;
    titleFrame.origin.x = imageFrame.origin.x - frame.size.width;
    
    //    重写赋值frame
    self.titleLabel.frame = titleFrame;
    self.imageView.frame = imageFrame;
}

#pragma mark - 计算文本的的宽度
- (CGRect)getTitleLabelWith
{
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[NSFontAttributeName] = self.titleLabel.font;
    CGRect frame = [self.titleLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dictM context:nil];
    
    return frame;
}

#pragma mark - 居中对齐
- (void)alignmentCenter
{
    //    设置文本的坐标
    CGFloat labelX = (BA_btnWidth - BA_labelWidth - BA_imageWidth - BA_padding) * 0.5;
    CGFloat labelY = (BA_btnHeight - BA_labelHeight) * 0.5;
    //    设置label的frame
    self.titleLabel.frame = CGRectMake(labelX, labelY, BA_labelWidth, BA_labelHeight);
    
    //    设置图片的坐标
    CGFloat imageX = CGRectGetMaxX(self.titleLabel.frame) + BA_padding;
    CGFloat imageY = (BA_btnHeight - BA_imageHeight) * 0.5;
    //    设置图片的frame
    self.imageView.frame = CGRectMake(imageX, imageY, BA_imageWidth, BA_imageHeight);
}

#pragma mark - 图标在上，文本在下(居中)
- (void)alignmentTop
{
    CGRect frame = [self getTitleLabelWith];
    
    CGFloat imageX = (BA_btnWidth - BA_imageWidth) * 0.5;
    self.imageView.frame = CGRectMake(imageX, BA_btnHeight * 0.5 - BA_imageHeight * BA_ButtonTopRadio, BA_imageWidth, BA_imageHeight);
    self.titleLabel.frame = CGRectMake((self.center.x - frame.size.width) * 0.5, BA_btnHeight * 0.5 + BA_labelHeight * BA_ButtonTopRadio, BA_labelWidth, BA_labelHeight);
    CGPoint labelCenter = self.titleLabel.center;
    labelCenter.x = self.imageView.center.x;
    self.titleLabel.center = labelCenter;
}

#pragma mark - 图标在下，文本在上(居中)
- (void)alignmentBottom
{
    CGRect frame = [self getTitleLabelWith];
    
    CGFloat imageX = (BA_btnWidth - BA_imageWidth) * 0.5;
    self.titleLabel.frame = CGRectMake((self.center.x - frame.size.width) * 0.5, BA_btnHeight * 0.5 - BA_labelHeight * (1 + BA_ButtonBottomRadio), BA_labelWidth, BA_labelHeight);
    self.imageView.frame = CGRectMake(imageX, BA_btnHeight * 0.5, BA_imageWidth, BA_imageHeight);
    CGPoint labelCenter = self.titleLabel.center;
    labelCenter.x = self.imageView.center.x;
    self.titleLabel.center = labelCenter;
}

- (void)setButtonCornerRadius:(CGFloat)buttonCornerRadius
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = buttonCornerRadius;
}

/** 布局子控件 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (_buttonStatus == BAAligenmentStatusNormal)
    {
    }
    else if (_buttonStatus == BAAligenmentStatusLeft)
    {
        [self alignmentLeft];
    }
    else if (_buttonStatus == BAAligenmentStatusCenter)
    {
        [self alignmentCenter];
    }
    else if (_buttonStatus == BAAligenmentStatusRight)
    {
        [self alignmentRight];
    }
    else if (_buttonStatus == BAAligenmentStatusTop)
    {
        [self alignmentTop];
    }
    else if (_buttonStatus == BAAligenmentStatusBottom)
    {
        [self alignmentBottom];
    }
}
@end


