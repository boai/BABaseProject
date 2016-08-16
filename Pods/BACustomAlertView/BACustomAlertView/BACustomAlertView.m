
/*!
 *  @header BAKit.h
 *          BABaseProject
 *
 *  @brief  BAKit
 *
 *  @author 博爱
 *  @copyright    Copyright © 2016年 博爱. All rights reserved.
 *  @version    V1.0
 */

//                            _ooOoo_
//                           o8888888o
//                           88" . "88
//                           (| -_- |)
//                            O\ = /O
//                        ____/`---'\____
//                      .   ' \\| |// `.
//                       / \\||| : |||// \
//                     / _||||| -:- |||||- \
//                       | | \\\ - /// | |
//                     | \_| ''\---/'' | |
//                      \ .-\__ `-` ___/-. /
//                   ___`. .' /--.--\ `. . __
//                ."" '< `.___\_<|>_/___.' >'"".
//               | | : `- \`.;`\ _ /`;.`/ - ` : | |
//                 \ \ `-. \_ __\ /__ _/ .-` / /
//         ======`-.____`-.___\_____/___.-`____.-'======
//                            `=---='
//
//         .............................................
//                  佛祖镇楼                  BUG辟易
//          佛曰:
//                  写字楼里写字间，写字间里程序员；
//                  程序人员写程序，又拿程序换酒钱。
//                  酒醒只在网上坐，酒醉还来网下眠；
//                  酒醉酒醒日复日，网上网下年复年。
//                  但愿老死电脑间，不愿鞠躬老板前；
//                  奔驰宝马贵者趣，公交自行程序员。
//                  别人笑我忒疯癫，我笑自己命太贱；
//                  不见满街漂亮妹，哪个归得程序员？

/*
 
 *********************************************************************************
 *
 * 在使用BAKit的过程中如果出现bug请及时以以下任意一种方式联系我，我会及时修复bug
 *
 * QQ     : 可以添加ios开发技术群 479663605 在这里找到我(博爱1616【137361770】)
 * 微博    : 博爱1616
 * Email  : 137361770@qq.com
 * GitHub : https://github.com/boai
 * 博客园  : http://www.cnblogs.com/boai/
 * 博客    : http://boai.github.io
 * 简书    : http://www.jianshu.com/users/95c9800fdf47/latest_articles
 * 简书专题 : http://www.jianshu.com/collection/072d578bf782
 
 *********************************************************************************
 
 */


#import "BACustomAlertView.h"

#define kBAAlertWidth              self.viewWidth - 50
#define kBAAlertPaddingV           11
#define kBAAlertPaddingH           18
#define kBAAlertRadius             13
#define kBAAlertButtonHeight       40

/*! RGB色值 */
#define BA_COLOR(R, G, B, A)       [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

@interface BACustomAlertView ()

@property (nonatomic,strong         ) UIView                  *subView;
@property (nonatomic, strong        ) UITapGestureRecognizer  *dismissTap;

@property (copy, nonatomic, readonly) NSString                *title;
@property (copy, nonatomic, readonly) NSString                *message;
@property (copy, nonatomic, readonly) UIImage                 *image;
@property (copy, nonatomic, readonly) NSArray                 *buttonTitles;

@property (strong, nonatomic        ) UIImageView             *containerView;
@property (strong, nonatomic        ) UIScrollView            *scrollView;
@property (strong, nonatomic        ) UILabel                 *titleLabel;
@property (strong, nonatomic        ) UIImageView             *imageView;
@property (strong, nonatomic        ) UILabel                 *messageLabel;
@property (strong, nonatomic        ) NSMutableArray          *buttons;
@property (strong, nonatomic        ) NSMutableArray          *lines;

@property (assign, nonatomic        ) CGFloat                  viewWidth;
@property (assign, nonatomic        ) CGFloat                  viewHeight;

@end

@implementation BACustomAlertView
{
    CGFloat   _scrollBottom;
    CGFloat   _buttonsHeight;
    CGFloat   _maxContentWidth;
    CGFloat   _maxAlertViewHeight;
}

#pragma mark - ***** 初始化自定义View
- (instancetype)initWithCustomViewiew:(UIView *)customView
{
    if (self = [super initWithFrame:CGRectZero])
    {
        self.subView = customView;
        [self setupUI];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(changeFrames:)
                                                     name:UIDeviceOrientationDidChangeNotification
                                                   object:nil];
    }
    return self;
}

#pragma mark - ***** 创建一个类似系统的警告框
- (instancetype)ba_showTitle:(NSString *)title
                     message:(NSString *)message
                       image:(UIImage *)image
                buttonTitles:(NSArray *)buttonTitles
{
    self.viewWidth    = SCREENWIDTH;
    self.viewHeight   = SCREENHEIGHT;
    
    if (self == [super initWithFrame:CGRectMake(0, 0, kBAAlertWidth, 0)])
    {
        _title        = [title copy];
        _image        = image;
        _message      = [message copy];
        _buttonTitles = [NSArray arrayWithArray:buttonTitles];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(changeFrames:)
                                                     name:UIDeviceOrientationDidChangeNotification
                                                   object:nil];
        
        [self loadUI];
        
    }
    return self;
}

- (void)loadUI
{
    _buttons                                      = [NSMutableArray new];
    _lines                                        = [NSMutableArray new];

    _containerView                                = [UIImageView new];
    _containerView.        userInteractionEnabled = YES;
    _containerView.layer.  cornerRadius           = kBAAlertRadius;
    _containerView.layer.  masksToBounds          = YES;
    _containerView.        backgroundColor        = [UIColor whiteColor];

    _scrollView                                   = [[UIScrollView alloc] initWithFrame:self.bounds];
    _scrollView.           backgroundColor        = [UIColor whiteColor];
    [_containerView addSubview:_scrollView];
    
    /*! 添加手势 */
    [self addGestureRecognizer:self.dismissTap];
    [self addSubview:_containerView];

}

#pragma mark - ***** 加载自定义View
- (void)setupUI
{
    self.viewWidth                   = SCREENWIDTH;
    self.viewHeight                  = SCREENHEIGHT;
    
    self.frame                       = [UIScreen mainScreen].bounds;
    self.backgroundColor             = [UIColor colorWithRed:0.1f green:0.1f blue:0.1f alpha:0.3f];

    self.subView.layer.shadowColor   = [UIColor colorWithWhite:0 alpha:0.5].CGColor;
    self.subView.layer.shadowOffset  = CGSizeZero;
    self.subView.layer.shadowOpacity = 1;
    self.subView.layer.shadowRadius  = 10.0f;
    self.subView.layer.borderWidth   = 0.5f;
    self.subView.layer.borderColor   = BA_COLOR(110, 115, 120, 1).CGColor;
    
    /*! 添加手势 */
    [self addGestureRecognizer:self.dismissTap];
    
    [self addSubview:self.subView];
}

#pragma mark - ***** setter / getter
- (UITapGestureRecognizer *)dismissTap
{
    if (!_dismissTap)
    {
        _dismissTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissTapAction:)];
    }
    return _dismissTap;
}

- (void)setBgColor:(UIColor *)bgColor
{
    _bgColor             = bgColor;
    self.backgroundColor = bgColor;
}

- (void)setButtonTitleColor:(UIColor *)buttonTitleColor
{
    _buttonTitleColor = buttonTitleColor;
}

- (void)setBgImageName:(NSString *)bgImageName
{
    _bgImageName                   = bgImageName;
    
    _containerView.backgroundColor = [UIColor clearColor];
    _scrollView.backgroundColor    = [UIColor clearColor];
    _containerView.image           = [UIImage imageNamed:bgImageName];
    _containerView.contentMode     = UIViewContentModeScaleAspectFill;
}

#pragma mark - **** 手势消失方法
- (void)dismissTapAction:(UITapGestureRecognizer *)tapG
{
    NSLog(@"触摸了边缘隐藏View！");
    [self ba_dismissAlertView];
}

#pragma mark - **** 视图显示方法
- (void)ba_showAlertView
{
    UIWindow *window = [[UIApplication sharedApplication].windows firstObject];
    [window addSubview:self];

    BAWeak;
    if (self.isShowAnimate)
    {
        [UIView animateWithDuration:0.f animations:^{
            [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
            
            for (int i = 0; i < 7; i ++)
            {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(i*0.03f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [UIView animateWithDuration:1.0f
                                          delay:0.f
                         usingSpringWithDamping:0.5f
                          initialSpringVelocity:0.8
                                        options:UIViewAnimationOptionCurveEaseOut
                                     animations:^{
                                         if (weakSelf.subView)
                                         {
                                             weakSelf.subView.center = window.center;
                                         }
                                         else if (weakSelf.containerView)
                                         {
                                             [weakSelf prepareForShow];
                                             weakSelf.containerView.center = window.center;
                                         }
                                     } completion:nil];
                });
            }
            
        } completion:^(BOOL finished) {
            NSLog(@"BACustomAlertView动画执行完毕！");
        }];
    }
    else
    {
        if (self.subView)
        {
            self.subView.center = window.center;
        }
        else if (self.containerView)
        {
            [self prepareForShow];
            self.containerView.center = window.center;
        }
    }
}

#pragma mark - **** 视图消失方法
- (void)ba_dismissAlertView
{
    BAWeak;
    [UIView animateWithDuration:0 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        if (weakSelf.subView)
        {
            weakSelf.subView.transform = CGAffineTransformIdentity;
        }
        else if (weakSelf.containerView)
        {
            weakSelf.containerView.transform = CGAffineTransformIdentity;
        }
    } completion:^(BOOL finished) {
        NSLog(@"BACustomAlertView已经释放！");
        [weakSelf removeSelf];
    }];
}

#pragma mark - ***** 设置UI
- (void)prepareForShow
{
    [self resetViews];
    _scrollBottom           = 0;
    CGFloat insetY          = kBAAlertPaddingV;
    _maxContentWidth        = kBAAlertWidth-2*kBAAlertPaddingH;
    _maxAlertViewHeight     = self.viewHeight - 50;
    [self loadTitle];
    [self loadImage];
    [self loadMessage];
    _buttonsHeight          = kBAAlertButtonHeight*((_buttonTitles.count>2||_buttonTitles.count==0)?_buttonTitles.count:1);
    
    self.frame              = self.window.bounds;
    self.backgroundColor    = [UIColor colorWithRed:0.1f green:0.1f blue:0.1f alpha:0.3f];
    _containerView.frame    = CGRectMake(0, 0, kBAAlertWidth, MIN(MAX(_scrollBottom+2*insetY+_buttonsHeight, 2*kBAAlertRadius+kBAAlertPaddingV), _maxAlertViewHeight));
    _scrollView.frame       = CGRectMake(0, insetY, CGRectGetWidth(_containerView.frame),MIN(_scrollBottom, CGRectGetHeight(_containerView.frame)-2*insetY-_buttonsHeight));
    _scrollView.contentSize = CGSizeMake(_maxContentWidth, _scrollBottom);
    
    [self loadButtons];
}

- (void)resetViews
{
    if (_titleLabel)
    {
        [_titleLabel removeFromSuperview];
        _titleLabel.text = @"";
    }
    if (_imageView)
    {
        [_imageView removeFromSuperview];
        _imageView.image = nil;
    }
    if (_messageLabel)
    {
        [_messageLabel removeFromSuperview];
        _messageLabel.text = @"";
    }
    if (_buttons.count > 0)
    {
        [_buttons makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [_buttons removeAllObjects];
    }
    if (_lines.count > 0)
    {
        [_lines makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [_lines removeAllObjects];
    }
}

- (void)addLabel:(UILabel *)label maxHeight:(CGFloat)maxHeight
{
    CGSize size   = [label sizeThatFits:CGSizeMake(_maxContentWidth, maxHeight)];
    label.frame   = CGRectMake(kBAAlertPaddingH, _scrollBottom, _maxContentWidth, size.height);
    [_scrollView addSubview:label];
    
    _scrollBottom = CGRectGetMaxY(label.frame)+kBAAlertPaddingV;
}

- (void)addLine:(CGRect)frame toView:(UIView *)view
{
    UIView *line         = [[UIView alloc] initWithFrame:frame];
    line.backgroundColor = BA_COLOR(160, 170, 160, 0.5);
    [view addSubview:line];
    [_lines addObject:line];
}

- (void)loadTitle
{
    if (!_title)
    {
        return;
    }
    if (!_titleLabel)
    {
        _titleLabel               = [UILabel new];
        _titleLabel.textColor     = [UIColor blackColor];
        _titleLabel.font          = [UIFont fontWithName:@"FontNameAmericanTypewriterBold" size:20];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 0;
    }
    _titleLabel.text              = _title;
    [self addLabel:_titleLabel maxHeight:100];
    [self addLine:CGRectMake(kBAAlertPaddingH, _scrollBottom, _maxContentWidth, 0.5) toView:_scrollView];
    _scrollBottom += kBAAlertPaddingV;
}

- (void)loadImage
{
    if (!_image)
    {
        return;
    }
    if (!_imageView)
    {
        _imageView   = [UIImageView new];
    }
    _imageView.image = _image;
    CGSize size      = _image.size;
    if (size.width > _maxContentWidth)
    {
        size         = CGSizeMake(_maxContentWidth, size.height/size.width*_maxContentWidth);
    }
    _imageView.frame = CGRectMake(kBAAlertPaddingH+_maxContentWidth/2-size.width/2, _scrollBottom, size.width, size.height);
    [_scrollView addSubview:_imageView];
    
    _scrollBottom    = CGRectGetMaxY(_imageView.frame)+kBAAlertPaddingV;
}

- (void)loadMessage
{
    if (!_message)
    {
        return;
    }
    if (!_messageLabel)
    {
        _messageLabel               = [UILabel new];
        _messageLabel.textColor     = [UIColor blackColor];
        _messageLabel.font          = [UIFont systemFontOfSize:14];
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.numberOfLines = 0;
    }
    _messageLabel.text              = _message;
    [self addLabel:_messageLabel maxHeight:100000];
}

- (void)loadButtons
{
    if (!_buttonTitles || _buttonTitles.count == 0)
    {
        return;
    }
    CGFloat buttonHeight = kBAAlertButtonHeight;
    CGFloat buttonWidth  = kBAAlertWidth;
    CGFloat top          = CGRectGetHeight(_containerView.frame)-_buttonsHeight;
    [self addLine:CGRectMake(0, top-0.5, buttonWidth, 0.5) toView:_containerView];
    if (1 == _buttonTitles.count)
    {
        [self addButton:CGRectMake(0, top, buttonWidth, buttonHeight) title:[_buttonTitles firstObject] tag:0];
    }
    else if (2 == _buttonTitles.count)
    {
        [self addButton:CGRectMake(0, top, buttonWidth/2, buttonHeight) title:[_buttonTitles firstObject] tag:0];
        [self addButton:CGRectMake(0+buttonWidth/2, top, buttonWidth/2, buttonHeight) title:[_buttonTitles lastObject] tag:1];
        [self addLine:CGRectMake(0+buttonWidth/2-.5, top, 0.5, buttonHeight) toView:_containerView];
    }
    else
    {
        for (NSInteger i=0; i<_buttonTitles.count; i++)
        {
            [self addButton:CGRectMake(0, top, buttonWidth, buttonHeight) title:_buttonTitles[i] tag:i];
            top += buttonHeight;
            if (_buttonTitles.count-1!=i)
            {
                [self addLine:CGRectMake(0, top, buttonWidth, 0.5) toView:_containerView];
            }
        }
        [_lines enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [_containerView bringSubviewToFront:obj];
        }];
    }
}

- (UIButton *)addButton:(CGRect)frame title:(NSString *)title tag:(NSInteger)tag
{
    UIButton *button       = [[UIButton alloc] initWithFrame:frame];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    button.tag             = tag;
    
    if (_buttonTitleColor)
    {
        [button setTitleColor:_buttonTitleColor forState:UIControlStateNormal];
    }
    else
    {
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    
    if (self.bgImageName)
    {
        [button setBackgroundImage:[self imageWithColor:[UIColor clearColor]] forState:UIControlStateNormal];
        [button setBackgroundImage:[self imageWithColor:BA_COLOR(135, 140, 145, 0.45)] forState:UIControlStateHighlighted];
    }
    else
    {
        [button setBackgroundImage:[self imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
        [button setBackgroundImage:[self imageWithColor:BA_COLOR(135, 140, 145, 0.45)] forState:UIControlStateHighlighted];
    }
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_containerView addSubview:button];
    [_buttons addObject:button];
    return button;
    button = nil;
}



#pragma mark - 按钮事件
- (void)buttonClicked:(UIButton *)button
{
    [self ba_dismissAlertView];
    if (self.buttonActionBlock)
    {
        self.buttonActionBlock(button.tag);
    }
}

- (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect          = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
    UIImage *image       = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark - 清楚所有视图
- (void)removeSelf
{
    [self resetViews];
    [self.buttons removeAllObjects];
    [self.lines removeAllObjects];
    [self.containerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self removeFromSuperview];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - 转屏通知处理
-(void)changeFrames:(NSNotification *)notification
{
    UIDeviceOrientation orientation = [UIDevice currentDevice].orientation;
    
    switch (orientation) {
        case UIDeviceOrientationPortrait:
            NSLog(@"UIDeviceOrientationPortrait");
            break;
        case UIDeviceOrientationLandscapeLeft:
            NSLog(@"UIDeviceOrientationLandscapeLeft");
            break;
        case UIDeviceOrientationLandscapeRight:
            NSLog(@"UIDeviceOrientationLandscapeRight");
            break;
        default:
            break;
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    self.viewWidth                = [UIScreen mainScreen].bounds.size.width;
    self.viewHeight               = [UIScreen mainScreen].bounds.size.height;
    
    if (self.subView)
    {
        self.frame                = CGRectMake(0.f, 0.f, self.viewWidth, self.viewHeight);
        self.subView.frame        = CGRectMake(50.f, 0.f, self.viewWidth - 100.f, CGRectGetHeight(self.subView.frame));
        self.subView.center       = CGPointMake(self.viewWidth/2.f, self.viewHeight/2.f);
    }
    else
    {
        [self prepareForShow];
        self.containerView.center = CGPointMake(self.viewWidth/2.f, self.viewHeight/2.f);
    }
}
@end
