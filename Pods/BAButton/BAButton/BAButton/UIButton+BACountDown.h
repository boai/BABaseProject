//
//  UIButton+BACountDown.h
//  BAButton
//
//  Created by 任子丰 on 16/6/17.
//  Copyright © 2016年 任子丰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (BACountDown)

@property (nonatomic, copy) void(^timeStoppedCallback)();

/**
 设置倒计时的间隔和倒计时文案

 @param duration 倒计时时间
 @param format 可选，传nil默认为 @"%zd秒"
 */
- (void)ba_countDownWithTimeInterval:(NSTimeInterval)duration countDownFormat:(NSString *)format;

/** 
 * invalidate timer
 */
- (void)ba_cancelTimer;

@end
