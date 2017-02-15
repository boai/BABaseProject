//
//  DemoVC2_09.m
//  BABaseProject
//
//  Created by 博爱 on 2016/12/16.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC2_09.h"

@interface DemoVC2_09 ()

@property (nonatomic, strong) UIView *demoView;
@property (nonatomic, strong) UIButton *shareLabelButton;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

- (IBAction)supportButtonAction:(UIButton *)sender;

@end

@implementation DemoVC2_09

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.demoView.hidden         = NO;
    self.shareLabelButton.hidden = NO;
    
}

- (void)basicAnimation1
{
    /*! 使用CABasicAnimation创建基础动画 */
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, BA_SCREEN_WIDTH/2 - 75)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(BA_SCREEN_WIDTH, BA_SCREEN_HEIGHT/2-75)];
    animation.duration = 2.0f;
    /*!
     如果 fillMode = kCAFillModeForwards 和 removedOnComletion = NO，那么在动画执行完毕后，图层会保持显示动画执行后的状态。但在实质上，图层的属性值还是动画执行前的初始值，并没有真正被改变。
     */
    
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [_demoView.layer addAnimation:animation forKey:@"positionAnimation"];
    
    
}

- (IBAction)supportButtonAction:(UIButton *)sender
{
    UIButton *button = (UIButton *)[self.view viewWithTag:sender.tag];
    button.selected = !button.selected;
    
    BAWeak;
    if (sender.tag == 1)
    {
        /*! 1、基础的缩放动画【仿qq空间的点赞】 */
        [UIView animateWithDuration:0.5f animations:^{
            /*! 1.5和0，67，两个的缩放的积等于1才能回归原大小 */
            button.transform = CGAffineTransformScale(button.transform, 2, 2);
            weakSelf.contentLabel.transform = CGAffineTransformScale(weakSelf.contentLabel.transform, 1.6, 1.6);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.5f animations:^{
                button.transform = CGAffineTransformScale(button.transform, 0.5, 0.5);
                weakSelf.contentLabel.transform = CGAffineTransformScale(weakSelf.contentLabel.transform, 0.625, 0.625);
            }];
        }];
    }
    else if (sender.tag == 2)
    {
        
        [self showNewStatusCount:5];
//        if (button.selected)
//        {
        
        /*! 2、基础的移动动画【仿微博上下拉新数据条数】 */
        [UIView animateWithDuration:1.8f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            /*! 负数为向左向上 */
            weakSelf.shareLabelButton.transform = CGAffineTransformMakeTranslation(0, -30);
        } completion:^(BOOL finished) {
            /*! 2、基础的移动动画【仿微博上下拉新数据条数】 */
            [UIView animateWithDuration:1.8f delay:1.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
                /*! 正数为向右向下 */
                weakSelf.shareLabelButton.transform = CGAffineTransformIdentity;
//                weakSelf.shareLabelButton.transform = CGAffineTransformMakeTranslation(0, 30);
            } completion:^(BOOL finished) {
            }];
        }];
    }
    else if (sender.tag == 3)
    {
        [UIView animateWithDuration:1.0f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            weakSelf.contentLabel.transform = CGAffineTransformRotate(_contentLabel.transform, M_PI_2);
            weakSelf.contentLabel.transform = CGAffineTransformScale(weakSelf.contentLabel.transform, 1.6, 1.6);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:1.0f delay:0.f options:UIViewAnimationOptionCurveEaseOut animations:^{
                weakSelf.contentLabel.transform = CGAffineTransformScale(weakSelf.contentLabel.transform, 0.625, 0.625);
            } completion:^(BOOL finished) {
                
            }];
        }];
    }
    else
    {
        
    }
}

- (void)showNewStatusCount:(int)count
{
    if (count == 0) return;
    /*! 展示最新的微博数 */
    
    CGFloat h = 35;
    CGFloat x = 0;
    CGFloat y = CGRectGetMaxY(self.navigationController.navigationBar.frame) - h;
    CGFloat w = self.view.width;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
    label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"timeline_new_status_background"]];
    label.text = [NSString stringWithFormat:@"最新的微博数：%d", count];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    //    [self.view addSubview:label];
    
    /*! 插入到导航控制器下面 */
    [self.navigationController.view insertSubview:label belowSubview:self.navigationController.navigationBar];
    
    /*! 动画平移 */
    [UIView animateWithDuration:1.25 animations:^{
        label.transform = CGAffineTransformMakeTranslation(0, h);
        
    } completion:^(BOOL finished) {
        /*! 往上平移 */
        [UIView animateKeyframesWithDuration:1.25 delay:2 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
            
            /*! 还原 */
            label.transform = CGAffineTransformIdentity;
            
        } completion:^(BOOL finished) {
            [label removeFromSuperview];
        }];
    }];
}

- (UIView *)demoView
{
    if (!_demoView)
    {
        _demoView = [UIView new];
        _demoView.frame = CGRectMake(BA_SCREEN_WIDTH/2-50, BA_SCREEN_HEIGHT/2-100,100 ,100);
        _demoView.backgroundColor = [UIColor greenColor];
        [self.view addSubview:_demoView];
    }
    return _demoView;
}

- (UIButton *)shareLabelButton
{
    if (!_shareLabelButton)
    {
        _shareLabelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _shareLabelButton.frame = CGRectMake(0, BA_SCREEN_HEIGHT, BA_SCREEN_WIDTH, 30);
        [_shareLabelButton setTitle:@"快点使用博爱的分享吧！【上拉新数据20条！】" forState:UIControlStateNormal];
        [_shareLabelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _shareLabelButton.backgroundColor = [UIColor redColor];
        
        //        [_shareLabelButton addTarget:self action:@selector(onShareBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:_shareLabelButton];
    }
    return _shareLabelButton;
}

@end
