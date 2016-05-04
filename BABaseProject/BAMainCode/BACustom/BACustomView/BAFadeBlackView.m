//
//  BAFadeBlackView.m
//  BABaseProject
//
//  Created by 博爱 on 16/5/4.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BAFadeBlackView.h"

@implementation BAFadeBlackView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:CGRectMake(0, 0, BA_SCREEN_WIDTH, BA_SCREEN_HEIGHT)])
    {
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0.0f;
    }
    return self;
}

/*! 显示褪色背景 */
- (void)showFadeBlackView:(BOOL)isShow
{
//    if (!isShow) isShow = YES;
    if (isShow)
    {
        [UIView animateWithDuration:1.0f animations:^{
            self.alpha = 0.75f;
        }];
    }
    else
    {
        [UIView animateWithDuration:0.75f animations:^{
            self.alpha = 0.0f;
        }];
    }
}

@end
