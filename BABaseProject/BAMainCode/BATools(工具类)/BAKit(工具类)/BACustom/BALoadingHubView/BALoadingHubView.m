//
//  iKYLoadingHubView.m
//  iKYLoadingHub
//
//  Created by 郑钦洪 on 15/10/6.
//  Copyright (c) 2015年 Kingsly. All rights reserved.
//

#import "BALoadingHubView.h"

#define ORIGIN_X    self.frame.origin.x
#define ORIGIN_Y    self.frame.origin.y
#define WIDTH       self.frame.size.width
#define HEIGHT      self.frame.size.height
#define BALL_RADIUS  20

@interface BALoadingHubView ()

/**第1个球 */
@property (nonatomic, strong) UIView *ball_1;
/**第2个球 */
@property (nonatomic, strong) UIView *ball_2;
/**第3个球 */
@property (nonatomic, strong) UIView *ball_3;

/*! 遮罩背景 */
@property (nonatomic, strong) UIVisualEffectView *bgView;

@end

@implementation BALoadingHubView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _bgView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
        _bgView.alpha = 0.9f;
        _bgView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
        _bgView.layer.cornerRadius = BALL_RADIUS / 2;
        _bgView.clipsToBounds = YES;
        [self addSubview:_bgView];
    }
    return self;
}

- (UIColor *)ballColor{
    if (_ballColor) {
        return _ballColor;
    }
    return [UIColor redColor];
}

- (void)showHub{
    CGFloat ballH = HEIGHT / 2 - BALL_RADIUS * 0.5;
    UIView *ball_1 = [[UIView alloc] initWithFrame:CGRectMake(WIDTH/2 - BALL_RADIUS * 1.5, ballH, BALL_RADIUS, BALL_RADIUS)];
    ball_1.layer.cornerRadius = BALL_RADIUS / 2; // 成为圆形
    ball_1.backgroundColor = self.ballColor;
    [self addSubview:ball_1];
    self.ball_1 = ball_1;
    
    UIView *ball_2 = [[UIView alloc] initWithFrame:CGRectMake(WIDTH/2 - BALL_RADIUS * 0.5, ballH, BALL_RADIUS, BALL_RADIUS)];
    ball_2.layer.cornerRadius = BALL_RADIUS / 2; // 成为圆形
    ball_2.backgroundColor = self.ballColor;
    [self addSubview:ball_2];
    self.ball_2 = ball_2;
    
    UIView *ball_3 = [[UIView alloc] initWithFrame:CGRectMake(WIDTH/2 + BALL_RADIUS * 0.5, ballH, BALL_RADIUS, BALL_RADIUS)];
    ball_3.layer.cornerRadius = BALL_RADIUS / 2; // 成为圆形
    ball_3.backgroundColor = self.ballColor;
    [self addSubview:ball_3];
    self.ball_3 = ball_3;

    [self rotationAnimation];
}

- (void)rotationAnimation{
    // 1.1 取得围绕中心轴的点
    CGPoint centerPoint = CGPointMake(WIDTH / 2 , HEIGHT / 2);
    // 1.2 获得第一个圆的中点
    CGPoint centerBall_1 = CGPointMake(WIDTH/2-BALL_RADIUS, HEIGHT/2);
    // 1.3 获得第三个圆的中点
    CGPoint centerBall_2 = CGPointMake(WIDTH / 2 + BALL_RADIUS, HEIGHT / 2);
    
    // 2.1 第一个圆的曲线
    UIBezierPath *path_ball_1 = [UIBezierPath bezierPath];
    [path_ball_1 moveToPoint:centerBall_1];
    
    [path_ball_1 addArcWithCenter:centerPoint radius:BALL_RADIUS startAngle:M_PI endAngle:2*M_PI clockwise:NO];
    UIBezierPath *path_ball_1_1 = [UIBezierPath bezierPath];
    [path_ball_1_1 addArcWithCenter:centerPoint radius:BALL_RADIUS startAngle:0 endAngle:M_PI clockwise:NO];
    [path_ball_1 appendPath:path_ball_1_1];
    
    // 2.2 第一个圆的动画
    CAKeyframeAnimation *animation_ball_1=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation_ball_1.path = path_ball_1.CGPath;
    animation_ball_1.removedOnCompletion = NO;
    animation_ball_1.fillMode = kCAFillModeForwards;
    animation_ball_1.calculationMode = kCAAnimationCubic;
    animation_ball_1.repeatCount = 1;
    animation_ball_1.duration = 1.4;
    animation_ball_1.delegate = self;
    animation_ball_1.autoreverses = NO;
    animation_ball_1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [self.ball_1.layer addAnimation:animation_ball_1 forKey:@"animation"];
    
    // 2.1 第一个圆的曲线
    UIBezierPath *path_ball_3 = [UIBezierPath bezierPath];
    [path_ball_3 moveToPoint:centerBall_2];
    
    [path_ball_3 addArcWithCenter:centerPoint radius:BALL_RADIUS startAngle:0 endAngle:M_PI clockwise:NO];
    UIBezierPath *path_ball_3_1 = [UIBezierPath bezierPath];
    [path_ball_3_1 addArcWithCenter:centerPoint radius:BALL_RADIUS startAngle:M_PI endAngle:M_PI*2 clockwise:NO];
    [path_ball_3 appendPath:path_ball_3_1];
    
    // 2.2 第2个圆的动画
    CAKeyframeAnimation *animation_ball_3 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation_ball_3.path = path_ball_3.CGPath;
    animation_ball_3.removedOnCompletion = NO;
    animation_ball_3.fillMode = kCAFillModeForwards;
    animation_ball_3.calculationMode = kCAAnimationCubic;
    animation_ball_3.repeatCount = 1;
    animation_ball_3.duration = 1.4;
//    animation_ball_3.delegate = self;
    animation_ball_3.autoreverses = NO;
    animation_ball_3.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [self.ball_3.layer addAnimation:animation_ball_3 forKey:@"rotation"];
    
}


- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [self rotationAnimation];
}

- (void)animationDidStart:(CAAnimation *)anim{
    [UIView animateWithDuration:0.3 delay:0.1 options:UIViewAnimationOptionCurveEaseOut|UIViewAnimationOptionBeginFromCurrentState animations:^{
       
        self.ball_1.transform = CGAffineTransformMakeTranslation(-BALL_RADIUS, 0);
        self.ball_1.transform = CGAffineTransformScale(self.ball_1.transform, 0.7, 0.7);
        
        self.ball_3.transform = CGAffineTransformMakeTranslation(BALL_RADIUS, 0);
        self.ball_3.transform = CGAffineTransformScale(self.ball_3.transform, 0.7, 0.7);

        
        self.ball_2.transform = CGAffineTransformScale(self.ball_2.transform, 0.7, 0.7);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 delay:0.1 options:UIViewAnimationOptionCurveEaseIn  | UIViewAnimationOptionBeginFromCurrentState animations:^{
            self.ball_1.transform = CGAffineTransformIdentity;
            self.ball_3.transform = CGAffineTransformIdentity;
            self.ball_2.transform = CGAffineTransformIdentity;
        } completion:NULL];

    }];
}

- (void)dismissHub
{
    if (_ball_1)
    {
        [_ball_1 removeFromSuperview];
        _ball_1 = nil;
    }
    if (_ball_2)
    {
        [_ball_2 removeFromSuperview];
        _ball_2 = nil;
    }
    if (_ball_3)
    {
        [_ball_3 removeFromSuperview];
        _ball_3 = nil;
    }
    if (_bgView)
    {
        [_bgView removeFromSuperview];
        _bgView = nil;
    }
    NSLog(@"动画执行完毕！");
}
@end
