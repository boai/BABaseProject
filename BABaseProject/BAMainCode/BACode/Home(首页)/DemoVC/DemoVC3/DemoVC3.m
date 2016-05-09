//
//  DemoVC3.m
//  BABaseProject
//
//  Created by 博爱 on 16/5/6.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC3.h"

@interface DemoVC3 ()
{
    NSInteger _time;
}
@property (nonatomic, strong) UIButton  *timeButton;
@property (nonatomic, strong) NSTimer   *timer;
@property (nonatomic, strong) UIButton  *timeButton2;

@end

@implementation DemoVC3

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.timeButton.hidden = NO;
    self.timeButton2.hidden = NO;

}

#pragma mark - ***** 第一种倒计时button
- (UIButton *)timeButton
{
    if (!_timeButton)
    {
        _time = 29;
        self.timeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.timeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
        self.timeButton.titleLabel.font = BA_FontSize(15);
        [self.timeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.timeButton addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.timeButton jm_setCornerRadius:5 withBackgroundColor:BA_Orange_Color];
        
        [self refreshButtonWidth];
        [self.view addSubview:self.timeButton];
    }
    return _timeButton;
}

- (void)refreshButtonWidth
{
    CGFloat width = 0;
    if (self.timeButton.enabled)
    {
        width = 100;
    }
    else
    {
        width = 120;
    }
    self.timeButton.center = CGPointMake(self.view.centerX, 100);
    self.timeButton.bounds = CGRectMake(0, 0, width, 40);
    
    // 每次刷新，保证区域正确
    [self.timeButton setBackgroundImage:[UIImage imageWithColor:[UIColor orangeColor] size:self.timeButton.frame.size] forState:UIControlStateNormal];
    [self.timeButton setBackgroundImage:[UIImage imageWithColor:[UIColor lightGrayColor] size:self.timeButton.frame.size] forState:UIControlStateDisabled];
}

- (IBAction)btnAction:(UIButton *)sender
{
    sender.enabled = NO;
    [self refreshButtonWidth];
    [sender setTitle:[NSString stringWithFormat:@"获取验证码(%zi)", _time] forState:UIControlStateNormal];
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(timeDown) userInfo:nil repeats:YES];
}

- (void)timeDown
{
    _time --;
    if (_time == 0)
    {
        [self.timeButton setTitle:@"重新获取" forState:UIControlStateNormal];
        self.timeButton.enabled = YES;
        [self refreshButtonWidth];
        [_timer invalidate];
        _timer = nil;
        _time = 29 ;
        return;
    }
    [self.timeButton setTitle:[NSString stringWithFormat:@"获取验证码(%zi)", _time] forState:UIControlStateNormal];
}

#pragma mark - ***** 第二种倒计时button【推荐使用】
- (UIButton *)timeButton2
{
    if (!_timeButton2)
    {
        _time = 19;
        _timeButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
        _timeButton2.frame = CGRectMake(_timeButton.x, _timeButton.bottom + 10, 120, _timeButton.height);
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
    
    // 倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer2 = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer2,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0);
    
    // 每秒执行
    dispatch_source_set_event_handler(_timer2, ^{
        
        if(timeout <= 0)
        {
            // 倒计时结束，关闭
            dispatch_source_cancel(_timer2); dispatch_async(dispatch_get_main_queue(), ^{
                
                // 设置界面的按钮显示 根据自己需求设置
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
                
                // 设置界面的按钮显示 根据自己需求设置
                // NSLog(@"____%@",strTime);
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

@end
