

#import "BAButton.h"

/*! 定义宏：按钮中文本和图片的间隔 */
#define BA_padding        7
#define BA_btnRadio       0.6
/*! 获得按钮的大小 */
#define BA_btnWidth       self.bounds.size.width
#define BA_btnHeight      self.bounds.size.height
/*! 获得按钮中UILabel文本的大小 */
#define BA_labelWidth     self.titleLabel.bounds.size.width
#define BA_labelHeight    self.titleLabel.bounds.size.height
/*! 获得按钮中image图标的大小 */
#define BA_imageWidth     self.imageView.bounds.size.width
#define BA_imageHeight    self.imageView.bounds.size.height

/*! 图标在上，文本在下按钮的图文间隔比例（0-1），默认0.8 */
#define BA_ButtonTopRadio 0.8

/*! 图标在下，文本在上按钮的图文间隔比例（0-1），默认0.5 */
#define BA_ButtonBottomRadio 0.5


@implementation BAButton

- (void)setButtonStatus:(BABAButtonStatus)buttonStatus
{
    _buttonStatus = buttonStatus;
}

#pragma mark - 左对齐
- (void)alignmentLeft
{
    /*! 获得按钮的文本的frame */
    CGRect titleFrame = self.titleLabel.frame;
    /*! 设置按钮的文本的x坐标为0-－－左对齐 */
    titleFrame.origin.x = 0;
    /*! 获得按钮的图片的frame */
    CGRect imageFrame = self.imageView.frame;
    /*! 设置按钮的图片的x坐标紧跟文本的后面 */
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
    
    /*! 重写赋值frame */
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
    /*! 设置文本的坐标 */
    CGFloat labelX = (BA_btnWidth - BA_labelWidth - BA_imageWidth - BA_padding) * 0.5;
    CGFloat labelY = (BA_btnHeight - BA_labelHeight) * 0.5;
    /*! 设置label的frame */
    self.titleLabel.frame = CGRectMake(labelX, labelY, BA_labelWidth, BA_labelHeight);
    
    /*! 设置图片的坐标 */
    CGFloat imageX = CGRectGetMaxX(self.titleLabel.frame) + BA_padding;
    CGFloat imageY = (BA_btnHeight - BA_imageHeight) * 0.5;
    /*! 设置图片的frame */
    self.imageView.frame = CGRectMake(imageX, imageY, BA_imageWidth, BA_imageHeight);
}

#pragma mark - 图标在上，文本在下(居中)
- (void)alignmentTop
{
    CGRect frame = [self getTitleLabelWith];
    
    CGFloat imageX = (BA_btnWidth - BA_imageWidth) * 0.5;
    self.imageView.frame = CGRectMake(imageX, BA_btnHeight * 0.5 - BA_imageHeight * BA_ButtonTopRadio, BA_imageWidth, BA_imageHeight);
    self.titleLabel.frame = CGRectMake((self.center.x - frame.size.width) * 0.5, BA_btnHeight * 0.5 + BA_labelHeight * BA_ButtonTopRadio, BA_btnWidth, BA_labelHeight);
    CGPoint labelCenter = self.titleLabel.center;
    labelCenter.x = self.imageView.center.x;
    self.titleLabel.center = labelCenter;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

#pragma mark - 图标在下，文本在上(居中)
- (void)alignmentBottom
{
    CGRect frame = [self getTitleLabelWith];
    
    CGFloat imageX = (BA_btnWidth - BA_imageWidth) * 0.5;
    self.titleLabel.frame = CGRectMake((self.center.x - frame.size.width) * 0.5, BA_btnHeight * 0.5 - BA_labelHeight * (1 + BA_ButtonBottomRadio), BA_btnWidth, BA_labelHeight);
    self.imageView.frame = CGRectMake(imageX, BA_btnHeight * 0.5, BA_imageWidth, BA_imageHeight);
    CGPoint labelCenter = self.titleLabel.center;
    labelCenter.x = self.imageView.center.x;
    self.titleLabel.center = labelCenter;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)setButtonCornerRadius:(CGFloat)buttonCornerRadius
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = buttonCornerRadius;
}

/*! 布局子控件 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (_buttonStatus == BABAButtonStatusNormal)
    {
    }
    else if (_buttonStatus == BABAButtonStatusLeft)
    {
        [self alignmentLeft];
    }
    else if (_buttonStatus == BABAButtonStatusCenter)
    {
        [self alignmentCenter];
    }
    else if (_buttonStatus == BABAButtonStatusRight)
    {
        [self alignmentRight];
    }
    else if (_buttonStatus == BABAButtonStatusTop)
    {
        [self alignmentTop];
    }
    else if (_buttonStatus == BABAButtonStatusBottom)
    {
        [self alignmentBottom];
    }
}
@end


