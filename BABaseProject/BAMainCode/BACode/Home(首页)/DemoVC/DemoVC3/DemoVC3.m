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

//@property (strong, nonatomic) dispatch_source_t timer2;

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
    
//    if (self.timer2)
//    {
//        dispatch_source_cancel(self.timer2);
//    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.headerLine.hidden  = NO;
    self.headerLine2.hidden = NO;
    self.timeButton2.hidden = NO;
    self.timeButton3.hidden = NO;

    [self test];
}

- (void)test
{
    CGFloat min_x = 20;
    CGFloat min_y = self.timeButton2.bottom + 20;
    CGFloat min_w = CGRectGetWidth(self.view.frame) - min_x * 2;
    //    CGFloat min_w = 200;
    
    CGFloat min_h = 0;
    CGFloat min_space = 5;
    
    for (NSInteger i = 0; i < 8; i ++)
    {
        min_h = 30;
        if (i == 2 || i == 3)
        {
            min_h = 80;
        }
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(min_x, min_y, min_w, min_h);
        button.backgroundColor = BAKit_ColorRandom();
        button.titleLabel.font = [UIFont systemFontOfSize:13];
        [button setImage:[UIImage imageNamed:@"tabbar_mainframeHL"] forState:UIControlStateNormal];
        min_y = CGRectGetMaxY(button.frame) + min_space;
        
        CGFloat padding = 10;
        CGFloat viewCornerRadius = 15;
        BAButtonLayoutType type;
        
        switch (i) {
            case 0:
            {
                [button setTitle:@"默认样式：内容居中-图左文右" forState:UIControlStateNormal];
                type = BAButtonLayoutTypeNormal;
                [button ba_button_setBAViewRectCornerType:BAViewRectCornerTypeBottomLeft viewCornerRadius:viewCornerRadius];
            }
                break;
            case 1:
            {
                [button setTitle:@"内容居中-图右文左" forState:UIControlStateNormal];
                type = BAButtonLayoutTypeCenterImageRight;
                [button ba_button_setBAViewRectCornerType:BAViewRectCornerTypeBottomRight viewCornerRadius:viewCornerRadius];
            }
                break;
            case 2:
            {
                [button setTitle:@"内容居中-图上文下" forState:UIControlStateNormal];
                type = BAButtonLayoutTypeCenterImageTop;
                [button ba_button_setBAViewRectCornerType:BAViewRectCornerTypeTopLeftAndTopRight viewCornerRadius:viewCornerRadius * 2];
            }
                break;
            case 3:
            {
                [button setTitle:@"内容居中-图下文上" forState:UIControlStateNormal];
                type = BAButtonLayoutTypeCenterImageBottom;
                [button ba_button_setBAViewRectCornerType:BAViewRectCornerTypeBottomRightAndTopRightAndTopLeft viewCornerRadius:viewCornerRadius * 2];
            }
                break;
            case 4:
            {
                [button setTitle:@"内容居左-图左文右" forState:UIControlStateNormal];
                type = BAButtonLayoutTypeLeftImageLeft;
                [button ba_button_setBAViewRectCornerType:BAViewRectCornerTypeBottomRight viewCornerRadius:viewCornerRadius];
                button.padding_inset = 20;
            }
                break;
            case 5:
            {
                [button setTitle:@"内容居左-图右文左" forState:UIControlStateNormal];
                type = BAButtonLayoutTypeLeftImageRight;
                [button ba_button_setBAViewRectCornerType:BAViewRectCornerTypeBottomLeftAndTopLeft viewCornerRadius:viewCornerRadius];
            }
                break;
            case 6:
            {
                [button setTitle:@"内容居右-图左文右" forState:UIControlStateNormal];
                type = BAButtonLayoutTypeRightImageLeft;
                [button ba_button_setBAViewRectCornerType:BAViewRectCornerTypeBottomRightAndTopRightAndBottomLeft viewCornerRadius:viewCornerRadius];
            }
                break;
            case 7:
            {
                [button setTitle:@"内容居右-图右文左" forState:UIControlStateNormal];
                type = BAButtonLayoutTypeRightImageRight;
                [button ba_button_setBAViewRectCornerType:BAViewRectCornerTypeAllCorners viewCornerRadius:viewCornerRadius];
            }
                break;
                
            default:
                type = BAButtonLayoutTypeNormal;
                break;
        }
        
        // 注意：文字、字体大小、图片等设置一定要在设置 ba_button_setBAButtonLayoutType 之前设置，要不然计算会以默认字体大小计算，导致位置偏移
        [button ba_button_setBAButtonLayoutType:type padding:padding];
        
        [self.view addSubview:button];
    }
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
        BA_WEAKSELF;
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
        BA_WEAKSELF;
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
        [_timeButton2 addTarget:self action:@selector(handleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_timeButton2 jm_setCornerRadius:5 withBackgroundColor:BA_Orange_Color];
        
        _timeButton2.tag = 100;
        [self.view addSubview:_timeButton2];
    }
    return _timeButton2;
}

- (IBAction)handleButtonAction:(UIButton *)sender
{
    sender.userInteractionEnabled = NO;
    __block UIButton *btn = sender;
    
    if (sender.tag == 100)
    {
        [sender ba_countDownWithTimeInterval:60 countDownFormat:@"剩余 %zd s"];
        [sender setTimeStoppedCallback:^{
            [btn setTitle:@"获取验证码" forState:UIControlStateNormal];
        }];
    }
    if (sender.tag == 101)
    {
        [sender ba_countDownWithTimeInterval:5 countDownFormat:@"跳过 %zd s"];
        [sender setTimeStoppedCallback:^{
            [btn setTitle:@"跳过" forState:UIControlStateNormal];
        }];
    }
}

//- (void)btnAction2:(UIButton *)btn
//{
//    __block int timeout = 29;
//    
//    /*! 倒计时时间 */
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    self.timer2 = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
//    dispatch_source_set_timer(self.timer2,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0);
//    
//    /*! 每秒执行 */
//    dispatch_source_set_event_handler(self.timer2, ^{
//        
//        if(timeout <= 0)
//        {
//            /*! 倒计时结束，关闭 */
//            dispatch_source_cancel(self.timer2); dispatch_async(dispatch_get_main_queue(), ^{
//                
//                /*! 设置界面的按钮显示 根据自己需求设置 */
//                [btn setTitle:@"发送验证码" forState:UIControlStateNormal];
//                btn.userInteractionEnabled = YES;
//                
//            });
//        }
//        else
//        {
//            int seconds = timeout % 60;
//            NSString *strTime = [NSString stringWithFormat:@"%d", seconds];
//            if ([strTime isEqualToString:@"0"])
//            {
//                strTime = [NSString stringWithFormat:@"%d", 60];
//            }
//            dispatch_async(dispatch_get_main_queue(), ^{
//                
//                /*! 设置界面的按钮显示 根据自己需求设置 */
//                // BALog(@"____%@",strTime);
//                [UIView beginAnimations:nil context:nil];
//                [UIView setAnimationDuration:1];
//                [btn setTitle:[NSString stringWithFormat:@"%@秒后重新发送",strTime] forState:UIControlStateNormal];
//                [UIView commitAnimations];
//                btn.userInteractionEnabled = NO;
//                
//            });
//            timeout--;
//        }
//    });
//    dispatch_resume(self.timer2);
//}
//
#pragma mark - ***** 第3种 倒计时
- (UIButton *)timeButton3
{
    if (!_timeButton3)
    {
        _timeButton3 = [UIButton buttonWithType:UIButtonTypeCustom];
        _timeButton3.frame = CGRectMake(_timeButton2.right + 20, _timeButton2.y, _timeButton2.width, _timeButton2.height);
        [_timeButton3 setTitle:@"跳过" forState:UIControlStateNormal];
        _timeButton3.titleLabel.font = BA_FontSize(15);
        [_timeButton3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_timeButton3 addTarget:self action:@selector(handleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_timeButton3 jm_setCornerRadius:5 withBackgroundColor:BA_Orange_Color];
        _timeButton3.tag = 101;
        
        [self.view addSubview:_timeButton3];
    }
    return _timeButton3;
}




@end
