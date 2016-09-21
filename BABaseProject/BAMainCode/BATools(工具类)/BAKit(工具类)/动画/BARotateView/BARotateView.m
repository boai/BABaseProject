//
//  BARotateView.m
//  BABaseProject
//
//  Created by 博爱 on 16/7/7.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BARotateView.h"

@implementation BARotateView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.defaulfTransform = self.transform;
    }
    return self;
}

#pragma mark - ***** 动画的执行
/*!
 *  Rotate to up (default).
 *
 *  @param animated Animated or not.
 */
- (void)ba_changeToUpAnimated:(BOOL)animated
{
    BA_WEAKSELF;
    if (animated)
    {
        [UIView animateWithDuration:(self.rotateDuration > 0 ? self.rotateDuration : 0.5f) animations:^{
            weakSelf.transform = weakSelf.defaulfTransform;
        }];
    }
    else
    {
        self.transform = self.defaulfTransform;
    }
}

/*!
 *  Rotate to left.
 *
 *  @param animated Animated or not.
 */
- (void)ba_changeToLeftAnimated:(BOOL)animated
{
    BA_WEAKSELF;
    if (animated)
    {
        [UIView animateWithDuration:(self.rotateDuration > 0 ? self.rotateDuration : 0.5f) animations:^{
            weakSelf.transform = CGAffineTransformRotate(weakSelf.defaulfTransform, -M_PI_2);
        }];
    }
    else
    {
        self.transform = CGAffineTransformRotate(self.defaulfTransform, -M_PI_2);
    }
}

/*!
 *  Rotate to right.
 *
 *  @param animated Animated or not.
 */
- (void)ba_changeToRightAnimated:(BOOL)animated
{
    BA_WEAKSELF;
    if (animated)
    {
        [UIView animateWithDuration:(self.rotateDuration > 0 ? self.rotateDuration : 0.5f) animations:^{
            weakSelf.transform = CGAffineTransformRotate(weakSelf.defaulfTransform, M_PI_2);
        }];
    }
    else
    {
        self.transform = CGAffineTransformRotate(self.defaulfTransform, M_PI_2);
    }
}

/*!
 *  Rotate to down.
 *
 *  @param animated Animated or not.
 */
- (void)ba_changeToDownAnimated:(BOOL)animated
{
    BA_WEAKSELF;
    if (animated)
    {
        [UIView animateWithDuration:(self.rotateDuration > 0 ? self.rotateDuration : 0.5f) animations:^{
            weakSelf.transform = CGAffineTransformRotate(weakSelf.defaulfTransform, M_PI);
        }];
    }
    else
    {
        self.transform = CGAffineTransformRotate(self.defaulfTransform, M_PI);
    }
}



@end
