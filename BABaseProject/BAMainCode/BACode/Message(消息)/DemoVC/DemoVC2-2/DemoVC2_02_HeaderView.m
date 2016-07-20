//
//  DemoVC2_02_HeaderView.m
//  BABaseProject
//
//  Created by 博爱 on 16/7/7.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC2_02_HeaderView.h"
#import "DemoVC2_02_classModel.h"

@interface DemoVC2_02_HeaderView ()

@property (nonatomic, strong) UIButton      *button;
@property (nonatomic, strong) BARotateView  *rotateView;

@property (nonatomic, strong) UILabel       *normalClassNameLabel;
@property (nonatomic, strong) UILabel       *highClassNameLabel;

@end

@implementation DemoVC2_02_HeaderView

- (void)ba_buildSubview
{
    // 白色背景
    UIView *backgroundView         = [[UIView alloc] initWithFrame:CGRectMake(0, 0, BA_SCREEN_WIDTH, 30)];
    backgroundView.backgroundColor = BA_White_Color;
    
    // 灰色背景
    UIView *contentView         = [[UIView alloc] initWithFrame:CGRectMake(0, 2, BA_SCREEN_WIDTH, 26)];
    contentView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.05f];

    UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, BA_SCREEN_WIDTH, 0.5)];
    line1.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.25f];
    
    UIView *line2         = [[UIView alloc] initWithFrame:CGRectMake(0, 25.5f, BA_SCREEN_WIDTH, 0.5)];
    line2.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.25f];
    
    /*! 按钮 */
    _button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, BA_SCREEN_WIDTH, 30)];
    [_button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    /*! 旋转的view */
    _rotateView = [[BARotateView alloc] initWithFrame:CGRectMake(BA_SCREEN_WIDTH - 25, 5, 20, 20)];
    _rotateView.rotateDuration = 0.25f;
    
    /*! 箭头图片 */
    UIImageView *arrowImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20/3.f, 36/3.f)];
    arrowImageView.image = [UIImage imageNamed:@"messageVC.bundle/Arrow_right"];
    arrowImageView.center = _rotateView.center;
    
    _normalClassNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 100, 26)];
    _normalClassNameLabel.font = [UIFont fontWithName:@"AppleSDGothicNeo-Medium" size:12.f];
    
    _highClassNameLabel = [[UILabel alloc] initWithFrame:_normalClassNameLabel.frame];
    _highClassNameLabel.font = _normalClassNameLabel.font;
    _highClassNameLabel.textColor = BA_Red_Color;
    
    
    [self addSubview:backgroundView];
    [self addSubview:contentView];
    [contentView addSubview:line1];
    [contentView addSubview:line2];
    [self addSubview:_button];
    [self addSubview:_rotateView];
    [_rotateView addSubview:arrowImageView];
    [contentView addSubview:_normalClassNameLabel];
    [contentView addSubview:_highClassNameLabel];
}

- (void)buttonAction:(UIButton *)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ba_customHeaderFooterView:action:)])
    {
        [self.delegate ba_customHeaderFooterView:self action:nil];
    }
}

- (void)ba_loadContent
{
    DemoVC2_02_classModel *model = self.data;
    
    _normalClassNameLabel.text = model.className;
    _highClassNameLabel.text   = model.className;
}

/*!
 *  Change to normal state.
 *
 *  @param animated Animated or not.
 */
- (void)ba_normalStateAnimated:(BOOL)animated
{
    [self.rotateView ba_changeToUpAnimated:animated];
    
    if (animated == YES)
    {
        [UIView animateWithDuration:0.5f delay:0 usingSpringWithDamping:1.f initialSpringVelocity:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
            
            _normalClassNameLabel.alpha = 1.f;
            _normalClassNameLabel.frame = CGRectMake(10, 0, 100, 26);
            _highClassNameLabel.alpha   = 0.f;
            _highClassNameLabel.frame   = CGRectMake(10, 0, 100, 26);

        } completion:^(BOOL finished) {
            
        }];
    }
    else
    {
        _normalClassNameLabel.alpha = 1.f;
        _normalClassNameLabel.frame = CGRectMake(10, 0, 100, 26);
        _highClassNameLabel.alpha   = 0.f;
        _highClassNameLabel.frame   = CGRectMake(10, 0, 100, 26);
    }
    
}

/*!
 *  Change to extended state.
 *
 *  @param animated Animated or not.
 */
- (void)ba_extendStateAnimated:(BOOL)animated
{
    [self.rotateView ba_changeToUpAnimated:animated];
    
    if (animated == YES)
    {
        [UIView animateWithDuration:0.5f delay:0 usingSpringWithDamping:1.f initialSpringVelocity:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
            
            _normalClassNameLabel.alpha = 0.f;
            _normalClassNameLabel.frame = CGRectMake(10 + 10, 0, 100, 26);
            _highClassNameLabel.alpha   = 1.f;
            _highClassNameLabel.frame   = CGRectMake(10 + 10, 0, 100, 26);
            
        } completion:^(BOOL finished) {
            
        }];
    }
    else
    {
        
        _normalClassNameLabel.alpha = 0.f;
        _normalClassNameLabel.frame = CGRectMake(10 + 10, 0, 100, 26);
        _highClassNameLabel.alpha   = 1.f;
        _highClassNameLabel.frame   = CGRectMake(10 + 10, 0, 100, 26);
    }

    
}

@end
