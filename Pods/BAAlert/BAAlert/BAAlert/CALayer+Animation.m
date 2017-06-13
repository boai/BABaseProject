
/*!
 *  @brief      BAAlert
 *
 *  @author     BAHome
 *  @copyright  Copyright © 2016年 BAHome. All rights reserved.
 *  @version    V1.1.0
 */


#import "CALayer+Animation.h"

@implementation CALayer (MyAnimation)
- (void )shakeAnimationWithDuration:(NSTimeInterval )duration
                        shakeRadius:(CGFloat )radius
                             repeat:(NSUInteger )repeat
                    finishAnimation:(void(^)()) finish
{
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animation];
    keyAnimation.duration = duration;
    keyAnimation.keyPath = @"transform.rotation.z";
    keyAnimation.values = @[@((0) / 180.0 * M_PI),@((-radius) / 180.0 * M_PI),@((radius) / 180.0 * M_PI),@((-radius) / 180.0 * M_PI),@((0) / 180.0 * M_PI)];
    keyAnimation.repeatCount = repeat;
    [self addAnimation:keyAnimation forKey:nil];
    if (finish)
    {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * (CGFloat )repeat * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            finish();
        });
    }
}

- (void )pathAnimationWithDuration:(NSTimeInterval )duration
                              path:(CGPathRef )path
                            repeat:(NSUInteger )repeat
                   finishAnimation:(void(^)()) finish
{
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animation];
    keyAnimation.keyPath = @"position";
    keyAnimation.duration = duration;
    keyAnimation.repeatCount = repeat;
    keyAnimation.fillMode = kCAFillModeForwards;
    keyAnimation.path = path;
    [self addAnimation:keyAnimation forKey:nil];
    if (finish)
    {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((duration * (CGFloat )repeat - 0.1) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            finish();
        });
    }
}

- (void )fallAnimationWithDuration:(NSTimeInterval )duration
                   finishAnimation:(void(^)()) finish
{
    CGRect frame = [UIScreen mainScreen].bounds;
    CGPoint center = CGPointMake(CGRectGetWidth(frame)*0.5, (CGRectGetHeight(frame) * 0.5));
    CGPoint point = CGPointMake(CGRectGetWidth(frame)*0.5, -(CGRectGetHeight(self.frame)));
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:point];
    [path addLineToPoint:center];
    
    [self pathAnimationWithDuration:duration path:path.CGPath repeat:1 finishAnimation:^{
        if (finish)
        {
            finish();
        }
    }];
}

- (void )floatAnimationWithDuration:(NSTimeInterval )duration
                    finishAnimation:(void(^)()) finish
{
    CGRect frame = [UIScreen mainScreen].bounds;
    CGPoint center = CGPointMake(CGRectGetWidth(frame)*0.5, (CGRectGetHeight(frame) * 0.5));
    CGPoint point = CGPointMake(CGRectGetWidth(frame)*0.5, -(CGRectGetHeight(self.frame)));
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:center];
    [path addLineToPoint:point];
    
    [self pathAnimationWithDuration:duration path:path.CGPath repeat:1 finishAnimation:^{
        if (finish)
        {
            finish();
        }
    }];
}
@end


@implementation UIView(MyAnimation)


- (void )scaleAnimationShowFinishAnimation:(void(^)()) finish
{
    self.transform = CGAffineTransformMakeScale(0.001f, 0.001f);
    [UIView animateWithDuration:0.35f animations:^{
        self.transform = CGAffineTransformMakeScale(1.18f, 1.18f);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.25f animations:^{
            self.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
        } completion:^(BOOL finished) {
            if (finish) {
                finish();
            }
        }];
    }];
}

- (void )scaleAnimationDismissFinishAnimation:(void(^)()) finish
{
    [UIView animateWithDuration:0.15f animations:^{
        self.transform = CGAffineTransformMakeScale(1.18f, 1.18f);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.25f animations:^{
            self.transform = CGAffineTransformMakeScale(0.0001f, 0.0001f);
        } completion:^(BOOL finished) {
            if (finish) {
                finish();
            }
        }];
    }];
}

@end
