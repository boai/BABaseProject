//
//  DemoVC3.m
//  BABaseProject
//
//  Created by 博爱 on 16/5/6.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC3.h"
#import "BAScrollBar.h"

@interface DemoVC3 ()
{
    NSInteger   _time;
    BAModal    *_modal1;
    
    UILabel    *_label1;
}
@property (nonatomic, strong) UIButton     *timeButton;
@property (nonatomic, strong) NSTimer      *timer;
@property (nonatomic, strong) UIButton     *timeButton2;
@property (nonatomic, strong) UIButton     *timeButton3;

@property (nonatomic, strong) BAScrollBar  *scrollBar;

@end

@implementation DemoVC3

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.timeButton.hidden = NO;
    self.timeButton2.hidden = NO;
    self.timeButton3.hidden = NO;
    self.scrollBar.hidden = NO;
}

#pragma mark - ***** 第一种倒计时button【不推荐，推荐第二种，此方法有内存泄露】
//- (UIButton *)timeButton
//{
//    if (!_timeButton)
//    {
//        _time = 29;
//        self.timeButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        [self.timeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
//        self.timeButton.titleLabel.font = BA_FontSize(15);
//        [self.timeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [self.timeButton addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
//        [self.timeButton jm_setCornerRadius:5 withBackgroundColor:BA_Orange_Color];
//
//        [self refreshButtonWidth];
//        [self.view addSubview:self.timeButton];
//    }
//    return _timeButton;
//}
//
//- (void)refreshButtonWidth
//{
//    CGFloat width = 0;
//    if (self.timeButton.enabled)
//    {
//        width = 100;
//    }
//    else
//    {
//        width = 120;
//    }
//    self.timeButton.center = CGPointMake(self.view.centerX, 100);
//    self.timeButton.bounds = CGRectMake(0, 100, width, 40);
//    
//    /*! 每次刷新，保证区域正确 */
//    [self.timeButton setBackgroundImage:[UIImage imageWithColor:[UIColor orangeColor] size:self.timeButton.frame.size] forState:UIControlStateNormal];
//    [self.timeButton setBackgroundImage:[UIImage imageWithColor:[UIColor lightGrayColor] size:self.timeButton.frame.size] forState:UIControlStateDisabled];
//    [self.timeButton jm_setCornerRadius:5 withBackgroundColor:BA_Orange_Color];
//}
//
//- (IBAction)btnAction:(UIButton *)sender
//{
//    sender.enabled = NO;
//    [self refreshButtonWidth];
//    [sender setTitle:[NSString stringWithFormat:@"获取验证码(%zi)", _time] forState:UIControlStateNormal];
//    _timer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(timeDown) userInfo:nil repeats:YES];
//}
//
//- (void)timeDown
//{
//    _time --;
//    if (_time == 0)
//    {
//        [self.timeButton setTitle:@"重新获取" forState:UIControlStateNormal];
//        self.timeButton.enabled = YES;
//        [self refreshButtonWidth];
//        [_timer invalidate];
//        _timer = nil;
//        _time = 29 ;
//        return;
//    }
//    [self.timeButton setTitle:[NSString stringWithFormat:@"获取验证码(%zi)", _time] forState:UIControlStateNormal];
//}

#pragma mark - ***** 第二种倒计时button【推荐使用】
- (UIButton *)timeButton2
{
    if (!_timeButton2)
    {
        _time = 19;
        _timeButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
        _timeButton2.frame = CGRectMake(self.view.centerX, 120, 120, 40);
        [_timeButton2 setTitle:@"获取验证码" forState:UIControlStateNormal];
        _timeButton2.titleLabel.font = BA_FontSize(15);
        [_timeButton2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_timeButton2 addTarget:self action:@selector(btnAction2:) forControlEvents:UIControlEventTouchUpInside];
        [_timeButton2 jm_setCornerRadius:5 withBackgroundColor:BA_Orange_Color];
        
        [self.view addSubview:_timeButton2];
    }
    return _timeButton2;
}

- (void)btnAction2:(UIButton *)btn
{
    __block int timeout = 29;
    
    /*! 倒计时时间 */
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer2 = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer2,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0);
    
    /*! 每秒执行 */
    dispatch_source_set_event_handler(_timer2, ^{
        
        if(timeout <= 0)
        {
            /*! 倒计时结束，关闭 */
            dispatch_source_cancel(_timer2); dispatch_async(dispatch_get_main_queue(), ^{
                
                /*! 设置界面的按钮显示 根据自己需求设置 */
                [btn setTitle:@"发送验证码" forState:UIControlStateNormal];
                btn.userInteractionEnabled = YES;
                
            });
        }
        else
        {
            int seconds = timeout % 60;
            NSString *strTime = [NSString stringWithFormat:@"%d", seconds];
            if ([strTime isEqualToString:@"0"])
            {
                strTime = [NSString stringWithFormat:@"%d", 60];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                
                /*! 设置界面的按钮显示 根据自己需求设置 */
                // BALog(@"____%@",strTime);
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1];
                [btn setTitle:[NSString stringWithFormat:@"%@秒后重新发送",strTime] forState:UIControlStateNormal];
                [UIView commitAnimations];
                btn.userInteractionEnabled = NO;
                
            });
            timeout--;
        }
    });
    dispatch_resume(_timer2);
}

#pragma mark - ***** 第3种button
- (UIButton *)timeButton3
{
    if (!_timeButton3)
    {
        _timeButton3 = [UIButton buttonWithType:UIButtonTypeCustom];
        _timeButton3.frame = CGRectMake(self.view.centerX, _timeButton2.bottom + 10, 120, 40);
        [_timeButton3 setTitle:@"点击有惊喜！" forState:UIControlStateNormal];
        _timeButton3.titleLabel.font = BA_FontSize(15);
        [_timeButton3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_timeButton3 addTarget:self action:@selector(btnAction3:) forControlEvents:UIControlEventTouchUpInside];
        [_timeButton3 jm_setCornerRadius:5 withBackgroundColor:BA_Orange_Color];
        
        [self.view addSubview:_timeButton3];
    }
    return _timeButton3;
}

- (IBAction)btnAction3:(UIButton *)sender
{
    if (!_modal1)
    {
        _modal1 = [self creatModal:nil];
    }
    
    if (!_label1)
    {
        _label1 = [self creatLabel];
        _label1.userInteractionEnabled = YES;
        _label1.text = @"欢迎使用 iPhone SE，迄今最高性能的 4 英寸 iPhone。在打造这款手机时，我们在深得人心的 4 英寸设计基础上，从里到外重新构想。它所采用的 A9 芯片，正是在 iPhone 6s 上使用的先进芯片。1200 万像素的摄像头能拍出令人叹为观止的精彩照片和 4K 视频，而 Live Photos 则会让你的照片栩栩如生。这一切，成就了一款外形小巧却异常强大的 iPhone。";
        
        _label1.font = [UIFont systemFontOfSize:16];
        
        CGSize size2 = [BAAutoSizeWithWH BA_AutoSizeOfHeghtWithText:_label1.text font:_label1.font width:BA_SCREEN_WIDTH - 60];
        _label1.frame = CGRectMake(10, CGRectGetMidX(self.view.frame), size2.width, size2.height);
        _label1.backgroundColor = BA_Green_Color;
        [_label1 jm_setCornerRadius:10 withBorderColor:BA_Red_Color borderWidth:2];
    }
    [_modal1 showContentView:_label1 animated:YES];
}

- (BAModal *)creatModal:(UIView *)contentView
{
    BAModal *modal = [BAModal ba_modalWithContentView:contentView];
    modal.hideWhenTouchOutside = YES;
    return modal;
}

- (UILabel *)creatLabel
{
    UILabel *label = [UILabel new];
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = [UIColor colorWithWhite:1 alpha:0.85];
    return label;
}

#pragma mark - ***** 一个滚动的广告条：跑马灯label
- (BAScrollBar *)scrollBar
{
    if (!_scrollBar)
    {
        _scrollBar = [[BAScrollBar alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 40)];
        _scrollBar.text = @"对于 MacBook，我们给自己设定了一个几乎不可能实现的目标：在有史以来最为轻盈纤薄的 Mac 笔记本电脑上，打造全尺寸的使用体验。这就要求每个元素都必须重新构想，不仅令其更为纤薄轻巧，还要更加出色。最终我们带来的，不仅是一部新款的笔记本电脑，更是一种对笔记本电脑的前瞻性思考。现在，有了第六代 Intel 处理器、提升的图形处理性能、高速闪存和最长可达 10 小时的电池使用时间*，MacBook 的强大更进一步。";
        _scrollBar.bgColor = BA_Green_Color;
        
        [self.view addSubview:_scrollBar];
    }
    return _scrollBar;
}

@end
