
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
 * QQ     : 博爱1616【137361770】
 * 微博    : 博爱1616
 * Email  : 137361770@qq.com
 * GitHub : https://github.com/boai
 * 博客园  : http://www.cnblogs.com/boai/
 * 博客    : http://boai.github.io
 
 *********************************************************************************
 
 */

#import "BAScrollBar.h"

@interface BAScrollBar()

/** 1.前面的文本框 */
@property (nonatomic, strong) UILabel *labelFront;
/** 2.后面的文本框 */
@property (nonatomic, strong) UILabel *labelBack;
/** 3.内容的宽度 */
@property (nonatomic, assign) CGFloat widthContent;

@end

@implementation BAScrollBar

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    _font = [UIFont systemFontOfSize:17];
    _colorText = [UIColor whiteColor];
    _start = YES;
    _text = @"";
    self.backgroundColor = [UIColor blackColor];
    self.clipsToBounds = YES;
    [self addSubview:self.labelFront];
    [self addSubview:self.labelBack];
}

- (void)reloadFrame
{
    self.labelFront.text = self.text;
    self.labelBack.text = self.text;
    self.time = self.text.length / 3;
    self.widthContent = [self.labelFront sizeThatFits:CGSizeZero].width;
    self.labelFront.frame = CGRectMake(0, 0, self.widthContent, self.height);
    if (self.widthContent > self.width) {
        self.labelBack.frame = CGRectMake(self.widthContent, 0, self.widthContent, self.height);
    }
}
#pragma mark - ***** delegate 视图委托

#pragma mark - ***** event response 事件相应
- (void)startAnimation
{
    if (self.width > self.widthContent)
    {
        return;
    }
    
    BA_Weak;
    if (self.start)
    {
        [UIView transitionWithView:self
                          duration:self.time
                           options:UIViewAnimationOptionCurveLinear
                        animations:^{
                            weakSelf.labelBack.x -= weakSelf.widthContent;
                            weakSelf.labelFront.x -= weakSelf.widthContent;
                        } completion:^(BOOL finished) {
                            weakSelf.labelBack.x += weakSelf.widthContent;
                            weakSelf.labelFront.x += weakSelf.widthContent;
                            [weakSelf startAnimation];
                        }];
    }
}


#pragma mark - ***** private methods 私有方法

#pragma mark - ***** setter
- (void)setFont:(UIFont *)font
{
    _font = font;
    self.labelBack.font = font;
    self.labelFront.font = font;
}

- (void)setColorText:(UIColor *)colorText
{
    _colorText = colorText;
    self.labelFront.textColor = colorText;
    self.labelBack.textColor = colorText;
}

- (void)setBgColor:(UIColor *)bgColor
{
    _bgColor = bgColor;
    self.backgroundColor = bgColor;
}

- (void)setText:(NSString *)text
{
    _text = text;
    [self reloadFrame];
    [self startAnimation];
}

- (void)setTime:(NSTimeInterval)time
{
    _time = time;
    [self startAnimation];
}

- (void)setStart:(BOOL)start
{
    _start = start;
    [self reloadFrame];
    [self startAnimation];
}

#pragma mark - ***** getter
- (UILabel *)labelFront
{
    if (!_labelFront)
    {
        _labelFront = [[UILabel alloc]init];
        _labelFront.textColor = self.colorText;
        _labelFront.font = self.font;
    }
    return _labelFront;
}

- (UILabel *)labelBack
{
    if (!_labelBack)
    {
        _labelBack = [[UILabel alloc]init];
        _labelBack.textColor = self.colorText;
        _labelBack.font = self.font;
    }
    return _labelBack;
}

@end
