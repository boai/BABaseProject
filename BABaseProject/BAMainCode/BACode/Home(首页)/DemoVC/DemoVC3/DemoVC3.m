//
//  DemoVC3.m
//  BABaseProject
//
//  Created by 博爱 on 16/5/6.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC3.h"
#import "SXHeadLine.h"
#import "SXMarquee.h"
#import "UIColor+Wonderful.h"

@interface DemoVC3 ()
{
    NSInteger   _time;
    BAModal    *_modal1;
    UILabel    *_label1;
}
@property (nonatomic, strong) UIButton    *timeButton2;
@property (nonatomic, strong) UIButton    *timeButton3;

@property (nonatomic, strong) SXHeadLine  *headerLine;
@property (nonatomic, strong) SXMarquee   *headerLine2;

@property (strong, nonatomic) dispatch_source_t timer2;

@end

@implementation DemoVC3

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [_headerLine stop];    
    
    dispatch_source_cancel(self.timer2);
    
//    _timeButton2 = nil;
//    _timeButton3 = nil;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.headerLine.hidden  = NO;
    self.headerLine2.hidden = NO;
    self.timeButton2.hidden = NO;
    self.timeButton3.hidden = NO;

}

#pragma mark - ***** 一个滚动的广告条：跑马灯label
- (SXHeadLine *)headerLine
{
    if (!_headerLine)
    {
        /*! 本demo已经优化源码，增加点击事件处理，可以随意滚动了！博爱还是够贴心吧！ */
        NSArray *array = @[@"1、库里43分，勇士吊打骑士",@"2、伦纳德死亡缠绕詹姆斯，马刺大胜骑士",@"3、乐福致命失误，骑士惨遭5连败",@"4、五小阵容发威，雄鹿吊打骑士", @"5、天猫的双十一，然而并没卵用"];
        _headerLine = [[SXHeadLine alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 40)];
        _headerLine.messageArray = array;
        [_headerLine setBgColor:[UIColor whiteColor] textColor:[UIColor orangeColor] textFont:BA_FontSize(14)];
        [_headerLine setScrollDuration:0.5 stayDuration:2];
        _headerLine.hasGradient = YES;
        [_headerLine start];
        BA_Weak;
        /*! 此处已做奇偶数的点击事件处理，请大家放心使用！ */
        [_headerLine changeTapMarqueeAction:^(NSInteger index) {
            
            NSString *msg = [NSString stringWithFormat:@"你点击了第 %ld 个广告！内容：%@", index, weakSelf.headerLine.messageArray[index]];
            [weakSelf.view ba_showAlertView:@"博爱温馨提示：" message:msg];
            
        }];
        
        _headerLine.bgColor = BA_Green_Color;
        
        [self.view addSubview:_headerLine];
    }
    return _headerLine;
}

- (SXMarquee *)headerLine2
{
    if (!_headerLine2)
    {
        BA_Weak;
        _headerLine2 = [[SXMarquee alloc]initWithFrame:CGRectMake(0, _headerLine.bottom + 20, BA_SCREEN_WIDTH, 40) speed:4 Msg:@"重大活动，天猫的双十一，然而并没卵用" bgColor:[UIColor salmonColor] txtColor:[UIColor whiteColor]];
        [_headerLine2 changeMarqueeLabelFont:[UIFont systemFontOfSize:26]];
        [_headerLine2 changeTapMarqueeAction:^{
            
            [weakSelf.view ba_showAlertView:@"博爱温馨提示：" message:@"可以设置弹窗，当然也能设置别的"];
            
        }];
        [_headerLine2 start];
        [self.view addSubview:_headerLine2];
    }
    return _headerLine2;
}

#pragma mark - ***** 倒计时button【推荐使用】
- (UIButton *)timeButton2
{
    if (!_timeButton2)
    {
        _time = 19;
        _timeButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
        _timeButton2.frame = CGRectMake(50, _headerLine2.bottom + 20, 120, 40);
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
    self.timer2 = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(self.timer2,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0);
    
    /*! 每秒执行 */
    dispatch_source_set_event_handler(self.timer2, ^{
        
        if(timeout <= 0)
        {
            /*! 倒计时结束，关闭 */
            dispatch_source_cancel(self.timer2); dispatch_async(dispatch_get_main_queue(), ^{
                
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
    dispatch_resume(self.timer2);
}

#pragma mark - ***** 第3种button
- (UIButton *)timeButton3
{
    if (!_timeButton3)
    {
        _timeButton3 = [UIButton buttonWithType:UIButtonTypeCustom];
        _timeButton3.frame = CGRectMake(_timeButton2.x, _timeButton2.bottom + 10, 120, 40);
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


@end
