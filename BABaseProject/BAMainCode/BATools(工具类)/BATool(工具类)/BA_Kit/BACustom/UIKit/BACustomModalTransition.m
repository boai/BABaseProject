
/*!
 *  @header BAKit
 *          demoTest
 *
 *  @brief  BAKit
 *
 *  @author 博爱
 *  @copyright    Copyright © 2016年 博爱. All rights reserved.
 *  @version    V1.0
 */

/*!
 *
 *          ┌─┐       ┌─┐
 *       ┌──┘ ┴───────┘ ┴──┐
 *       │                 │
 *       │       ───       │
 *       │  ─┬┘       └┬─  │
 *       │                 │
 *       │       ─┴─       │
 *       │                 │
 *       └───┐         ┌───┘
 *           │         │
 *           │         │
 *           │         │
 *           │         └──────────────┐
 *           │                        │
 *           │                        ├─┐
 *           │                        ┌─┘
 *           │                        │
 *           └─┐  ┐  ┌───────┬──┐  ┌──┘
 *             │ ─┤ ─┤       │ ─┤ ─┤
 *             └──┴──┘       └──┴──┘
 *                 神兽保佑
 *                 代码无BUG!
 */

/*
 
 *********************************************************************************
 *
 * 在使用BAKit的过程中如果出现bug请及时以以下任意一种方式联系我，我会及时修复bug
 *
 * QQ     : 可以添加SDAutoLayout群 497140713 在这里找到我(博爱1616【137361770】)
 * 微博    : 博爱1616
 * Email  : 137361770@qq.com
 * GitHub : https://github.com/boai
 * 博客园  : http://www.cnblogs.com/boai/
 *********************************************************************************
 
 */

#import "BACustomModalTransition.h"

#define ScreenHeight [[UIScreen mainScreen]bounds].size.height

@interface BACustomModalTransition()

//---保存入口传入的 试图控制器，用于操作
@property (nonatomic, strong) UIViewController *modalVC;
//---保存时弹出还是收起的状态
@property (nonatomic, assign) BOOL isDismiss;
//---拖动手势
@property (nonatomic, strong) UIPanGestureRecognizer *dragGesture;

//---保存frame
@property (nonatomic, assign) CATransform3D tempTransform;
//---保存当前动画的上下文
@property (nonatomic, strong) id<UIViewControllerContextTransitioning> transitionContext;

//---保存是否可手势驱动
@property BOOL isInteractive;
//---保存是否完成
@property BOOL isDragEnough;
@end

@implementation BACustomModalTransition

- (instancetype)initWithModalViewController:(UIViewController *)modalViewController
{
    self = [super init];
    if (self) {
        _modalVC = modalViewController;
        _dragable = NO;
    }
    return self;
}

- (void)setDragable:(BOOL)dragable
{
    _dragable = dragable;
    if (self.isDragable)
    {
        self.dragGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePanGesture:)];
        self.dragGesture.delegate = self;
        [self.modalVC.view addGestureRecognizer:self.dragGesture];
    }
}

#pragma mark -处理手势驱动
- (void)handlePanGesture:(UIPanGestureRecognizer *)gesture
{
    CGPoint translation = [gesture translationInView:self.modalVC.view];
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:{
            self.isInteractive =  YES;
            [self.modalVC dismissViewControllerAnimated:YES completion:nil];
            break;
        }
        case UIGestureRecognizerStateChanged:{
            //---滑动距离/屏幕高度 = 进度
            CGFloat percent = (translation.y/ScreenHeight) <= 1 ? (translation.y/ScreenHeight):1;
            self.isDragEnough = (percent > 0.2);
            [self updateInteractiveTransition:percent];
            
            break;
        }
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded:{
            //---拖动结束，判断是执行还是取消
            self.isInteractive = NO;
            if (gesture.state == UIGestureRecognizerStateCancelled || !self.isDragEnough) {
                [self cancelInteractiveTransition];
            }else{
                [self finishInteractiveTransition];
            }
            break;
        }
            
        default:
            break;
    }
}

#pragma mark -设置是否手势驱动转场动画
- (id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator
{
    return nil;
}

- (id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator
{
    if (self.isInteractive && self.dragable) {
        self.isDismiss = YES;
        return self;
    }
    return nil;
}

#pragma mark -覆写手势驱动过程
//---开始
- (void)startInteractiveTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //---保存当前缩小的状态
    self.tempTransform = toVC.view.layer.transform;
    //---保存transitionContext，下面使用
    self.transitionContext = transitionContext;
}

//---更新
- (void)updateInteractiveTransition:(CGFloat)percentComplete
{
    id<UIViewControllerContextTransitioning> transitionContext = self.transitionContext;
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //---计算放大倍数，然后进行缩放
    CGFloat scale = 1 + ((1/0.8*0.95) - 1)*percentComplete;
    toVC.view.layer.transform = CATransform3DScale(self.tempTransform, scale, scale, 1);
    
    //---下拉的长度
    CGRect nowFrame = CGRectMake(0,
                                 (CGRectGetHeight(fromVC.view.bounds) * percentComplete),
                                 CGRectGetWidth(fromVC.view.frame),
                                 CGRectGetHeight(fromVC.view.frame));
    fromVC.view.frame = nowFrame;
}

//---完成
- (void)finishInteractiveTransition
{
    id<UIViewControllerContextTransitioning> transitionContext = self.transitionContext;
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //---收起弹出的试图控制器
    CGRect finalRect = CGRectMake(0,
                                  CGRectGetHeight(fromVC.view.bounds) ,
                                  CGRectGetWidth(fromVC.view.frame),
                                  CGRectGetHeight(fromVC.view.frame));
    
    //---动画
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0
         usingSpringWithDamping:5
          initialSpringVelocity:5
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         
                         //---放大到原始大小
                         CATransform3D transition = CATransform3DIdentity;
                         toVC.view.layer.transform = transition;
                         //---向下移动隐藏
                         fromVC.view.frame = finalRect;

    } completion:^(BOOL finished) {
       //---标记结束
        [transitionContext completeTransition:YES];
        self.modalVC = nil;
    }];
}

//---取消
- (void)cancelInteractiveTransition
{
    id<UIViewControllerContextTransitioning> transitionContext = self.transitionContext;
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    [UIView animateWithDuration:0.4
                          delay:0
         usingSpringWithDamping:5
          initialSpringVelocity:5
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         //---缩小到大小
                         toVC.view.layer.transform = self.tempTransform;
                         //---向上移动，恢复到弹出的状态
                         fromVC.view.frame = CGRectMake(0,0,
                                                        CGRectGetWidth(fromVC.view.frame),
                                                        CGRectGetHeight(fromVC.view.frame));
                         
     } completion:^(BOOL finished) {
         //---标记未结束
         [transitionContext completeTransition:NO];
     }];
}

#pragma mark -转场委托实现
//---转场动画时间
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.8;
}

//---转场动画具体实现
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //---获取转场的两个视图控制器
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //---获取产生转场的容器view
    UIView *containerView = [transitionContext containerView];

    if (!self.isDismiss)//---弹出
    {
        //---解决角度变换时，fromVC有一半会出现在 toVC上的bug
        fromVC.view.layer.zPosition = -400;
        toVC.view.layer.zPosition = 400;
        
        //---初始化弹出视图在底部
        CGRect finalRect = [transitionContext finalFrameForViewController:toVC];
        toVC.view.frame = CGRectOffset(finalRect, 0, ScreenHeight);
        [containerView addSubview:toVC.view];
        
        //---弹出动画
        [UIView animateWithDuration:[self transitionDuration:transitionContext]/2.0 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            //---第一步形变：绕X轴旋转并缩小
            [fromVC.view.layer setTransform:[self firstTransform]];

        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:[self transitionDuration:transitionContext]/2.0 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{

                //---第二步形变：向上移动，并缩小
                [fromVC.view.layer setTransform:[self secondTransform]];
                
            } completion:^(BOOL finished) {
            }];
            
        }];
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            //---弹出视图控制器
            toVC.view.frame = finalRect;
            
        } completion:^(BOOL finished) {
            //---标记结束
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
        
    }
    else //---收起
    {
        
        //---获得当前frame
        CGRect initRect = [transitionContext initialFrameForViewController:fromVC];
        CGRect finalRect = CGRectOffset(initRect, 0, ScreenHeight);
        
        //---收起动画
        [UIView animateWithDuration:[self transitionDuration:transitionContext]/2.0 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            //---第一步形变：绕X轴旋转并缩小
            [toVC.view.layer setTransform:[self firstTransform]];
          
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:[self transitionDuration:transitionContext]/2.0 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                //---第二步形变：回到初始位置
                [toVC.view.layer setTransform:CATransform3DIdentity];
   
            } completion:^(BOOL finished) {
            }];
            
        }];
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            //---收起视图控制器
            fromVC.view.frame = finalRect;
            
        } completion:^(BOOL finished) {
            //---标记结束
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
        
    }
}

//---弹出动画所使用协议
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    self.isDismiss = NO;
    return self;
}

//---收起动画所用协议
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    self.isDismiss = YES;
    return self;
}

#pragma mark - 变换操作
//---第一步变换
- (CATransform3D )firstTransform
{
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = 1.0/ -900;
    //---宽高缩小0.9
    transform = CATransform3DScale(transform, 0.95, 0.95, 1);
    //---绕X轴旋转15度
    transform = CATransform3DRotate(transform, 15.0 * M_PI / 180.0 , 1, 0, 0);
    
    return transform;
}

//---第二步变换
- (CATransform3D )secondTransform
{
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = [self firstTransform].m34;
    //---向上移动的高度
    transform = CATransform3DTranslate(transform, 0, -20 , 0);
    //---宽高缩小0.8
    transform = CATransform3DScale(transform, 0.8, 0.8, 1);
    
    return transform;
}

@end
