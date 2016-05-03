//
//  Created by iOS_Liu on 16/2/3.
//  Copyright © 2016年 iOS_Liu. All rights reserved.
//
//  作者GitHub主页 https://github.com/SwiftLiu
//  作者邮箱 1062014109@qq.com
//  下载链接 https://github.com/SwiftLiu/LPLevelView.git

#import "LPLevelView.h"

@interface LPLevelView ()
{
    UILabel *animateLabel;//评分时动画显示分数
}
@end

@implementation LPLevelView

#pragma mark - 重写
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initData];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)awakeFromNib
{
    [self initData];
}

- (void)initData
{
    _maxLevel = 5;
}

- (void)setFrame:(CGRect)frame
{
    CGSize size = self.frame.size;
    [super setFrame:frame];
    if (!CGSizeEqualToSize(size, frame.size)) {
        self.maxLevel = _maxLevel;
        [self setNeedsDisplay];
    }
}

- (void)setBounds:(CGRect)bounds
{
    CGSize size = self.bounds.size;
    [super setBounds:bounds];
    if (!CGSizeEqualToSize(size, bounds.size)) {
        self.maxLevel = _maxLevel;
        [self setNeedsDisplay];
    }
}

- (void)addSubview:(UIView *)view
{
    if (view == animateLabel) {
        [super addSubview:view];
    }
}

#pragma mark - 设置属性值
- (void)setLevel:(float)level
{
    if (_level != level) {
        _level = level;
        //默认图标
        if (!_iconFull) {
            _iconFull = [UIImage imageNamed:@"LPLevelView.bundle/lp_badge_star_full"];
            _iconHalf = [UIImage imageNamed:@"LPLevelView.bundle/lp_badge_star_half"];
            _iconEmpty = [UIImage imageNamed:@"LPLevelView.bundle/lp_badge_star_empty"];
            BALog(@"LPLevelView：找不到属性iconFull对象，将使用默认风格图标！");
        }
        [self setNeedsDisplay];
    }
}

- (void)setMaxLevel:(int)maxLevel
{
    if (maxLevel==0) maxLevel = 5;
    if (_maxLevel != maxLevel) _maxLevel = maxLevel;
}

- (void)setCanScore:(BOOL)canScore
{
    _canScore = canScore;
    self.userInteractionEnabled = canScore;
    self.clipsToBounds = NO;
}


#pragma mark - 绘图
- (void)drawRect:(CGRect)rect
{
    //绘制默认图标
    if (_iconColor) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSaveGState(context);
        CGContextClipToMask(context, rect, [self clipPathImage]);//按蒙版图像路径剪切
        CGContextSetFillColorWithColor(context, _iconColor.CGColor);
        CGContextFillRect(context, rect);
        CGContextRestoreGState(context);
    }
    //绘制自定义图标
    else {
        [self drawIcons];//绘制
    }
}

//绘制蒙版图像，即剪切路径
- (CGImageRef)clipPathImage
{
    //方法①：
    //在内存中创建image绘制画布
    CGFloat scale = [UIScreen mainScreen].scale;//必须设置画布分辨率，否则会模糊
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, scale);
    CGContextRef imageContext = UIGraphicsGetCurrentContext();
    //翻转画布坐标系Y轴再平移坐标系原点到(0,0)位置，此处使用矩阵变换
    CGFloat transY = CGContextGetClipBoundingBox(imageContext).size.height;
    CGContextConcatCTM(imageContext, CGAffineTransformMake(1, 0, 0, -1, 0, transY));
    //绘制
    [self drawIcons];
    //提取UIImage
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //释放该画布
    CGContextRelease(imageContext);
    UIGraphicsEndImageContext();//关闭image绘制
    return image.CGImage;
    
    /*方法②：不是很好的方法，建议不使用
    //创建没有alpha通道的bitmap新画布
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();//灰度色彩空间
    CGBitmapInfo info = (CGBitmapInfo)kCGImageAlphaNone;
    CGContextRef imgContext = CGBitmapContextCreate(NULL, width, height, 8, width, colorSpace, info);
    //翻转画布坐标系Y轴再平移坐标系原点到(0,0)位置，此处使用矩阵变换
    CGFloat transY = CGBitmapContextGetHeight(imgContext);
    CGAffineTransform trans = CGAffineTransformMake(1, 0, 0, -1, 0, transY);
    CGContextConcatCTM(imgContext, trans);
    //绘制
    [self drawIconsInContext:imgContext];
    //提取CGImage
    CGImageRef imageRef = CGBitmapContextCreateImage(imgContext);
    CGContextRelease(imgContext);
    return imageRef;
    */
}

//绘制图标到画布
- (void)drawIcons
{
    //计算绘制的图标尺寸
    CGSize size = [self sizeOfIcon];
    //纵坐标
    CGFloat y = (self.bounds.size.height - size.height) / 2.l;
    //图标间距
    CGFloat spacing = (self.bounds.size.width - size.width*_maxLevel)/(CGFloat)_maxLevel;
    //横坐标
    CGFloat x = spacing/2.l;
    
    for (int i=1; i<=_maxLevel; i++) {
        //①获取图标
        UIImage *iconImg;
        if (i <= _level) {//整星
            iconImg = _iconFull;
        }else if (i-_level < 1 && !_levelInt) {//半星
            if (_iconHalf) iconImg = _iconHalf;
            else return;
        }else if (_iconHalf) {//空星
            iconImg = _iconEmpty;
        }
        
        //③绘制
        [iconImg drawInRect:CGRectMake(x, y, size.width, size.height)];
        
        //④横坐标右移，以便绘制下一个图标
        x += size.width + spacing;
    }
}

//计算绘制的图标尺寸
- (CGSize)sizeOfIcon
{
    //最大宽度
    CGFloat width = self.bounds.size.width/(CGFloat)_maxLevel;
    width = MIN(width, _iconFull.size.width);
    if (_iconSize.width != 0) width = MIN(width, _iconSize.width);
    //宽度伸缩比
    CGFloat wScale = width / _iconFull.size.width;
    //最大高度
    CGFloat height = self.bounds.size.height;
    height = MIN(height, _iconFull.size.height);
    if (_iconSize.height != 0) height = MIN(height, _iconSize.height);
    //高度伸缩比
    CGFloat hScale = height / _iconFull.size.height;
    
    //实际伸缩比
    CGFloat scale = MIN(wScale, hScale);
    //实际尺寸
    CGSize size = CGSizeMake(_iconFull.size.width * scale, _iconFull.size.height * scale);
    return size;
}


#pragma mark - 评分
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (_canScore) {
        UITouch *touch = [touches anyObject];
        CGFloat touchX = [touch locationInView:self].x;
        CGFloat wide = self.bounds.size.width / (CGFloat)_maxLevel;
        if (touchX > wide * _maxLevel) return;
        
        if (_levelInt) {
            self.level = (int)(touchX/wide) + 1;
        }else{
            self.level = ((int)(2 * touchX/wide) + 1) / 2.l;
        }
        
        if (_animated) [self scoreAnimation];
        if (_scoreBlock) _scoreBlock(_level);
    }
}
//评分动画
- (void)scoreAnimation
{
    //初始化
    if (!animateLabel) {
        animateLabel = [UILabel new];
        animateLabel.bounds = CGRectMake(0, 0, 50, 20);
        animateLabel.textColor = _animateColor?:_iconColor;
        animateLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:animateLabel];
    }
    //数值
    if (_level == (int)_level) {
        animateLabel.text = [NSString stringWithFormat:@"%.0f", _level];
    }else{
        animateLabel.text = [NSString stringWithFormat:@"%.1f", _level];
    }
    //动画
    CGFloat wide = self.bounds.size.width / (CGFloat)_maxLevel;
    CGFloat x = (ceilf(_level) - .5) * wide;
    animateLabel.center = CGPointMake(x, -10);
    animateLabel.alpha = 1;
    [UIView animateWithDuration:0.7 animations:^{
        animateLabel.center = CGPointMake(x, -40);
        animateLabel.alpha = 0;
    }];
}



@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com