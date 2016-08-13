
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
 * QQ     : 可以添加SDAutoLayout群 497140713 在这里找到我(博爱1616【137361770】)
 * 微博    : 博爱1616
 * Email  : 137361770@qq.com
 * GitHub : https://github.com/boai
 * 博客园  : http://www.cnblogs.com/boai/
 * 博客    : http://boai.github.io
 
 *********************************************************************************
 
 */


#import "BACustomAlertView.h"

#define SCREENWIDTH     [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT    [UIScreen mainScreen].bounds.size.height
#define kBAAlertWidth   SCREENWIDTH - 50
#define BAWeak          __weak __typeof(self) weakSelf = self
/*! RGB色值 */
#define BA_COLOR(R, G, B, A)      [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

@interface BACustomAlertView ()

@property (nonatomic,strong) UIView    *subView;
@property (nonatomic, strong) UITapGestureRecognizer *dismissTap;

@property (copy, nonatomic, readonly  ) NSString  *title;
@property (copy, nonatomic, readonly  ) NSString  *message;
@property (copy, nonatomic, readonly  ) NSArray   *buttonTitles;

@end

@implementation BACustomAlertView

- (instancetype)initWithCustomViewiew:(UIView *)customView
{
    if (self = [self initWithFrame:CGRectZero])
    {
        self.subView = customView;
        [self setupUI];
    }
    return self;
}

- (instancetype)showTitle:(NSString *)title message:(NSString *)message buttonTitles:(NSArray *)buttonTitles
{
    if (self == [self initWithFrame:CGRectZero])
    {
        _title = [title copy];
        _message = [message copy];
        _buttonTitles = [NSArray arrayWithArray:buttonTitles];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:CGRectMake(0, 0, kBAAlertWidth, 0)])
    {
//        [self setupUI];
    }
    return self;
}

#pragma mark - ***** 加载自定义View
- (void)setupUI
{
    self.frame = [UIScreen mainScreen].bounds;
    self.backgroundColor = [UIColor colorWithRed:0.1f green:0.1f blue:0.1f alpha:0.3f];

    self.subView.layer.shadowColor = [UIColor colorWithWhite:0 alpha:0.5].CGColor;
    self.subView.layer.shadowOffset = CGSizeZero;
    self.subView.layer.shadowOpacity = 1;
    self.subView.layer.shadowRadius = 10.0f;
    self.subView.layer.borderWidth = 0.5f;
    self.subView.layer.borderColor = BA_COLOR(110, 115, 120, 1).CGColor;
    
    /*! 添加手势 */
    [self addGestureRecognizer:self.dismissTap];
    
    [self addSubview:self.subView];
}

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
    _bgColor = bgColor;
    self.backgroundColor = bgColor;
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
                                         weakSelf.subView.center = window.center;
                                     } completion:nil];
                });
            }
            
        } completion:^(BOOL finished) {
            NSLog(@"显示完毕！");
        }];
    }
    else
    {
        self.subView.center = window.center;
    }
}

#pragma mark - **** 视图消失方法
- (void)ba_dismissAlertView
{
    BAWeak;
    [UIView animateWithDuration:0 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        weakSelf.subView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [weakSelf removeFromSuperview];
    }];
}

@end
