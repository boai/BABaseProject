//
//  DemoVC6.m
//  BABaseProject
//
//  Created by 博爱 on 16/5/14.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC6.h"
#import "BALocalNotification.h"

@interface DemoVC6 ()

@end

@implementation DemoVC6

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"本地通知";
    
    [self setupUI];
    
    // 1463215800
}

- (void)setupUI
{
    UIButton *notBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    notBtn.frame = CGRectMake(20, 200, 320-40, 40);
    [notBtn setBackgroundColor:[UIColor greenColor]];
    [notBtn setTitle:@"不服，来点我呀！" forState:UIControlStateNormal];
    notBtn.layer.masksToBounds = YES;
    notBtn.layer.cornerRadius = 5.0;
    [notBtn addTarget:self action:@selector(notBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:notBtn];
}

- (void)notBtnClick:(UIButton *)sender
{
    // 此处使用两个时间戳的差来计算，10秒后开启通知
    NSInteger time = [[NSString BA_time_getTimeStamp] integerValue] + 10 - [[NSString BA_time_getTimeStamp] integerValue];
    
//    NSDate *fireDate = [NSDate ba_NSDateTransformWithNSDateTimeSp:@"1464586860"];
    NSLog(@"***** 通知时间：%ld", (long)time);
    [BALocalNotification registerLocalNotification:time];
    
    /*! 记得要看 #import "AppDelegate+BACategory.h" 里面的回调哦！ #pragma mark - ***** 本地通知回调 */
}

- (void)reloadNotiView
{
    BALog(@"本地通知已跳转到本页面！");
}


@end
