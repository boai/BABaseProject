//
//  UIButton+BACountDown.m
//  BAButton
//
//  Created by 任子丰 on 16/6/17.
//  Copyright © 2016年 任子丰. All rights reserved.
//

#import "UIButton+BACountDown.h"
#import "BAButton.h"
#import <objc/runtime.h>

@interface UIButton ()

@property (nonatomic, assign) NSTimeInterval leaveTime;
@property (nonatomic, copy) NSString *normalTitle;
@property (nonatomic, copy) NSString *countDownFormat;
@property (nonatomic, strong) dispatch_source_t timer;

@end

@implementation UIButton (BACountDown)

- (void)setTimer:(dispatch_source_t)timer {
    BAKit_Objc_setObj(@selector(timer), timer);
}

- (dispatch_source_t)timer {
    return BAKit_Objc_getObj;
}

- (void)setLeaveTime:(NSTimeInterval)leaveTime {
    BAKit_Objc_setObj(@selector(leaveTime), @(leaveTime));
}

- (NSTimeInterval)leaveTime {
     return  [BAKit_Objc_getObj doubleValue];
}

- (void)setCountDownFormat:(NSString *)countDownFormat {
    BAKit_Objc_setObjCOPY(@selector(countDownFormat), countDownFormat);
}

- (NSString *)countDownFormat {
    return BAKit_Objc_getObj;
}

- (void)setTimeStoppedCallback:(void (^)())timeStoppedCallback {
    BAKit_Objc_setObjCOPY(@selector(timeStoppedCallback), timeStoppedCallback);
}

- (void (^)())timeStoppedCallback {
    return BAKit_Objc_getObj;
}

- (void)setNormalTitle:(NSString *)normalTitle {
    BAKit_Objc_setObjCOPY(@selector(normalTitle), normalTitle);
}

- (NSString *)normalTitle {
    return BAKit_Objc_getObj;
}

#pragma mark - public

- (void)ba_countDownWithTimeInterval:(NSTimeInterval)duration countDownFormat:(NSString *)format{
    if (!format){
        self.countDownFormat = @"%zd秒";
    } else {
        self.countDownFormat = format;
    }
    self.normalTitle = self.titleLabel.text;
    __block NSInteger timeOut = duration; //倒计时时间
    __weak typeof(self) weakSelf = self;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(self.timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(self.timer, ^{
        if (timeOut <= 0) { // 倒计时结束，关闭
            [weakSelf ba_cancelTimer];
        } else {
            NSString *title = [NSString stringWithFormat:weakSelf.countDownFormat,timeOut];
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf setTitle:title forState:UIControlStateNormal];
            });
            timeOut--;
        }
    });
    dispatch_resume(self.timer);
}

- (void)ba_cancelTimer {
    dispatch_source_cancel(self.timer);
    self.timer = nil;
    dispatch_async(dispatch_get_main_queue(), ^{
        // 设置界面的按钮显示 根据自己需求设置
        [self setTitle:self.normalTitle forState:UIControlStateNormal];
        self.userInteractionEnabled = YES;
        if (self.timeStoppedCallback) { self.timeStoppedCallback(); }
    });
}

@end
