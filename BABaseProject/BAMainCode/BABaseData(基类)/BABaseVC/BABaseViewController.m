//
//  BABaseViewController.m
//  demoTest
//
//  Created by 博爱 on 16/4/9.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BABaseViewController.h"

#import "BANavigationBar.h"
// GIF动画
#import "BAGIFImageView.h"

#import "BASnowView.h"
// 更新 + 变黑
#import "BAUpdatingView.h"
#import "BAFadeBlackView.h"

@interface BABaseViewController ()



// 雪花动画
@property (strong, nonatomic) CADisplayLink    *displayLink;
/*! 自定义naviView */
@property (strong, nonatomic) UIView           *naviView;

@property (strong, nonatomic) BAFadeBlackView  *fadeBlackView;
@property (strong, nonatomic) BAUpdatingView   *upDatingView;


@end

@implementation BABaseViewController



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*! 1、基本设置 */
    [self setupBase];
    
    /*! 2、navi设置 */
//    [self setupBaseNavi];
}

#pragma mark - ***** 基本设置
- (void)setupBase
{
    self.view.backgroundColor = BA_White_Color;

    
}



/*!
 *  设置VC的背景颜色
 *
 *  @param vcBgColor vcBgColor
 */
- (void)setVCBgColor:(UIColor *)vcBgColor
{
    /*! 1、背景颜色 */
    if (vcBgColor)
    {
        self.view.backgroundColor = vcBgColor;
    }
}

#pragma mark - ***** navi设置
//- (void)setupBaseNavi
//{
//    self.extendedLayoutIncludesOpaqueBars = YES;
//    [self BA_setNavbarBackgroundHidden:NO];
//    [self.navigationController setNavigationBarHidden:NO];
//    
//    if ([self respondsToSelector:@selector(set_navBackgroundImage)])
//    {
//        UIImage *naviBgImage = [self set_navBackgroundImage];
//        [self setNavigationBack:naviBgImage];
//    }
//    if ([self respondsToSelector:@selector(set_Title)])
//    {
//        NSMutableAttributedString *titleAttri = [self set_Title];
//        [self set_Title:titleAttri];
//    }
//    if (![self leftButton])
//    {
//        [self configLeftBaritemWithImage];
//    }
//    if (![self leftButton])
//    {
//        [self configRightBaritemWithImage];
//    }
//    
//}
//
//- (void)setNavigationBack:(UIImage*)image
//{
//    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
//    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
//    [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:image ];
//    [self.navigationController.navigationBar setShadowImage:image];
//}
//
///*!
// *  设置vc的title
// *
// *  @param title title
// */
//- (void)set_Title:(NSMutableAttributedString *)title
//{
//    UILabel *titleLabel = [[UILabel alloc] init];
//    titleLabel.frame = CGRectMake(80, 20, BA_SCREEN_WIDTH - 80*2, 44);
////    titleLabel.numberOfLines = 0;//可能出现多行的标题
//    [titleLabel setAttributedText:title];
//    titleLabel.textAlignment = NSTextAlignmentCenter;
//    titleLabel.backgroundColor = BA_Clear_Color;
//    titleLabel.userInteractionEnabled = YES;
//    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(titleClick:)];
//    [titleLabel addGestureRecognizer:tap];
//    self.navigationItem.titleView = titleLabel;
//}
//
//#pragma mark left_button
//- (BOOL)leftButton
//{
//    BOOL isLeft = [self respondsToSelector:@selector(set_leftButton)];
//    if (isLeft)
//    {
//        UIButton *leftbutton = [self set_leftButton];
//        [leftbutton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
//        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:leftbutton];
//        self.navigationItem.leftBarButtonItem = item;
//    }
//    return isLeft;
//}
//
//- (void)configLeftBaritemWithImage
//{
//    if ([self respondsToSelector:@selector(set_leftBarButtonItemWithImage)])
//    {
//        UIImage *image = [self set_leftBarButtonItemWithImage];
//        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self  action:@selector(leftButtonClick:)];
//        self.navigationItem.backBarButtonItem = leftItem;
//    }
//}
//
//#pragma mark rightButton
//- (BOOL)rightButton
//{
//    BOOL isRitht = [self respondsToSelector:@selector(set_rightButton)];
//    if (isRitht)
//    {
//        UIButton *rightButton = [self set_rightButton];
//        [rightButton addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
//        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
//        self.navigationItem.rightBarButtonItem = item;
//    }
//    return isRitht;
//}
//
//- (void)configRightBaritemWithImage
//{
//    if ([self respondsToSelector:@selector(set_rightBarButtonItemWithImage)])
//    {
//        UIImage *image = [self set_rightBarButtonItemWithImage];
//        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonClick:)];
//        self.navigationItem.rightBarButtonItem = rightItem;
//    }
//}
//
//#pragma mark - ***** 按钮点击事件
//#pragma mark
//- (IBAction)titleClick:(UIGestureRecognizer*)Tap
//{
//    UIView *view = Tap.view;
//    if ([self respondsToSelector:@selector(titleButton_Click:)])
//    {
//        [self titleButton_Click:view];
//    }
//}
//
//- (IBAction)leftButtonClick:(UIButton *)sender
//{
//    if ([self respondsToSelector:@selector(leftButton_Click:)])
//    {
//        [self leftButton_Click:sender];
//    }
//}
//
//- (IBAction)rightButtonClick:(UIButton *)sender
//{
//    if ([self respondsToSelector:@selector(rightButton_Click:)])
//    {
//        [self rightButton_Click:sender];
//    }
//}

#pragma mark - ***** 显示自定义加载框

/*!
 *  显示雪花加载框
 *
 *  @param isShow yes:显示，no:隐藏
 */
- (void)isShowSnowLoadingView:(BOOL)isShow
{
    // 变黑
    self.fadeBlackView = [[BAFadeBlackView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.fadeBlackView];
    
    // loading
    self.upDatingView        = [[BAUpdatingView alloc] initWithFrame:CGRectZero];
    self.upDatingView.center = self.view.center;
    [self.view addSubview:self.upDatingView];
    
    if (isShow)
    {
        // 显示出等待页面
        [self.fadeBlackView showFadeBlackView:YES];
        [self.upDatingView show];
    }
    else
    {
        [self.fadeBlackView showFadeBlackView:NO];
        [self.upDatingView hide];
    }
}

#pragma mark - ***** 网络类型判断
/*!
 *  网络判断
 *
 *  @param viewController viewController
 */
- (void)networkChangeWith:(UIViewController *)viewController
{
    // 1.获得网络监控的管理者
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    // 2.设置网络状态改变后的处理
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        // 当网络状态改变了, 就会调用这个block
        switch (status) {
                
            case AFNetworkReachabilityStatusUnknown: // 未知网络
            {
                BALog(@"当前网络未知！");
                [self BA_showAlert:@"当前网络未知！"];
                break;
            }
            case AFNetworkReachabilityStatusNotReachable: // 没有网络(断网)
            {
                BALog(@"当前无网络！");
                [self BAAlertWithTitle:@"温馨提示：" message:@"亲！当前无网络！去设置网络" andOthers:@[@"取消", @"确认"] animated:YES action:^(NSInteger index) {
                    
                    if (index == 0)
                    {
                    }
                    if (index == 1)
                    {
                        [self goNetNotUse];
                    }
                }];
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWWAN: // 手机自带网络
            {
                [self BAAlertWithTitle:@"温馨提示：" message:@"亲！正在使用手机3G/4G网络" andOthers:@[@"取消", @"确认"] animated:YES action:^(NSInteger index) {
                    
                    if (index == 0)
                    {
                    }
                    if (index == 1)
                    {
                    }
                }];
                
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWiFi: // WIFI
            {
                BALog(@"当前是WiFi环境！");
                [self BA_showAlert:@"当前是WiFi环境！"];
                break;
            }
        }
    }];
    
    // 3.开始监控
    [manager startMonitoring];

}

#pragma mark 网络不可用点击UI的回调
- (void)goNetNotUse
{
    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if ([[UIApplication sharedApplication] canOpenURL:url])
    {
        [[UIApplication sharedApplication] openURL:url];
    }
}




#pragma mark - ***** 其他设置
/*!
 *  是否隐藏naviBar
 *
 *  @param hidden YES：隐藏，NO：显示
 */
- (void)BA_setNavbarBackgroundHidden:(BOOL)hidden
{
    BANavigationBar *navBar =(BANavigationBar *)self.navigationController.navigationBar;
    if (hidden) {
        [navBar BA_hiddenNaviBar];
    }else{
        [navBar BA_showNaviBar];
    }
}

/*!
 *  开启樱花动画
 */
- (void)BA_starYingHuaCoreAnimation
{
    // =================== 樱花飘落 ====================
    CAEmitterLayer * snowEmitterLayer = [CAEmitterLayer layer];
    snowEmitterLayer.emitterPosition = CGPointMake(100, -30);
    snowEmitterLayer.emitterSize = CGSizeMake(self.view.bounds.size.width * 2, 0);
    snowEmitterLayer.emitterMode = kCAEmitterLayerOutline;
    snowEmitterLayer.emitterShape = kCAEmitterLayerLine;
    //    snowEmitterLayer.renderMode = kCAEmitterLayerAdditive;
    
    CAEmitterCell * snowCell = [CAEmitterCell emitterCell];
    
    snowCell.contents = (__bridge id)[UIImage imageNamed:@"樱花瓣2.jpg"].CGImage;

    // 花瓣缩放比例
    snowCell.scale = 0.02;
    snowCell.scaleRange = 0.5;
    
    // 每秒产生的花瓣数量
    snowCell.birthRate = 10;
    snowCell.lifetime = 80;
    
    // 每秒花瓣变透明的速度
    snowCell.alphaSpeed = -0.01;
    
    // 秒速“五”厘米～～
    snowCell.velocity = 40;
    snowCell.velocityRange = 60;
    
    // 花瓣掉落的角度范围
    snowCell.emissionRange = M_PI;
    
    // 花瓣旋转的速度
    snowCell.spin = M_PI_4;
    
    // 每个cell的颜色
    //    snowCell.color = [[UIColor redColor] CGColor];
    
    // 阴影的 不透明 度
    snowEmitterLayer.shadowOpacity = 1;
    // 阴影化开的程度（就像墨水滴在宣纸上化开那样）
    snowEmitterLayer.shadowRadius = 8;
    // 阴影的偏移量
    snowEmitterLayer.shadowOffset = CGSizeMake(3, 3);
    // 阴影的颜色
    snowEmitterLayer.shadowColor = [[UIColor whiteColor] CGColor];
    
    snowEmitterLayer.emitterCells = [NSArray arrayWithObject:snowCell];
    [self.view.layer addSublayer:snowEmitterLayer];
}

/*!
 *  开启雪花动画
 */
- (void)BA_starXueHuaCoreAnimation
{
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
//    imageView.image = [UIImage imageNamed:@"snowbg.jpg"];
//    imageView.contentMode = UIViewContentModeScaleAspectFill;
//    [self.view addSubview:imageView];
    
    //方法每秒钟调用60次
    /*
     CADisplayLink用来重绘，绘图
     NSTimer用于计时，重复调用
     */
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(handleAction:)];
    self.displayLink.frameInterval = 5;
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)handleAction:(CADisplayLink *)displayLink
{
    UIImage *image = [UIImage imageNamed:@"雪花"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    CGFloat scale = arc4random_uniform(60) / 100.0;
    imageView.transform = CGAffineTransformMakeScale(scale, scale);
    CGSize winSize = self.view.bounds.size;
    CGFloat x = arc4random_uniform(winSize.width);
    CGFloat y = - imageView.frame.size.height;
    imageView.center = CGPointMake(x, y);
    
    [self.view addSubview:imageView];
    [UIView animateWithDuration:arc4random_uniform(15) animations:^{
        CGFloat toX = arc4random_uniform(winSize.width);
        CGFloat toY = imageView.frame.size.height * 0.5 + winSize.height;
        
        imageView.center = CGPointMake(toX, toY);
        imageView.transform = CGAffineTransformRotate(imageView.transform, arc4random_uniform(M_PI * 4));
        
        imageView.alpha = 0.5;
    } completion:^(BOOL finished) {
        [imageView removeFromSuperview];
    }];
    
    //    BALog(@"%ld",self.displayLink.frameInterval);
    //    BALog(@"%lf",self.displayLink.duration);
    //
}

/*!
 *  暂停雪花动画
 */
- (void)BA_stopXueHuaCoreAnimation
{
    [self.displayLink invalidate];
    self.displayLink = nil;
}

/*!
 *  开启烟花动画（CAEmitterLayer动画）
 */
- (void)BA_starYanHuaCoreAnimation
{
    CAEmitterLayer *snowEmitter = [CAEmitterLayer layer];
    snowEmitter.emitterPosition = CGPointMake(self.view.bounds.size.width / 2.0, -30);
    snowEmitter.emitterSize		= CGSizeMake(self.view.bounds.size.width * 2.0, 0.0);;
    
    // Spawn points for the flakes are within on the outline of the line
    snowEmitter.emitterMode		= kCAEmitterLayerOutline;
    snowEmitter.emitterShape	= kCAEmitterLayerLine;
    
    // Configure the snowflake emitter cell
    CAEmitterCell *snowflake = [CAEmitterCell emitterCell];
    
    //    随机颗粒的大小
    snowflake.scale = 0.2;
    snowflake.scaleRange = 0.5;
    
    //    缩放比列速度
    //        snowflake.scaleSpeed = 0.1;
    
    //    粒子参数的速度乘数因子；
    snowflake.birthRate		= 20.0;
    
    //生命周期
    snowflake.lifetime		= 60.0;
    
    //    粒子速度
    snowflake.velocity		= 20;				// falling down slowly
    snowflake.velocityRange = 10;
    //    粒子y方向的加速度分量
    snowflake.yAcceleration = 2;
    
    //    周围发射角度
    snowflake.emissionRange = 0.5 * M_PI;		// some variation in angle
    //    自动旋转
    snowflake.spinRange		= 0.25 * M_PI;		// slow spin
    
    snowflake.contents		= (id) [[UIImage imageNamed:@"fire"] CGImage];
    snowflake.color			= [[UIColor colorWithRed:0.600 green:0.658 blue:0.743 alpha:1.000] CGColor];
    
    // Make the flakes seem inset in the background
    snowEmitter.shadowOpacity = 1.0;
    snowEmitter.shadowRadius  = 0.0;
    snowEmitter.shadowOffset  = CGSizeMake(0.0, 1.0);
    snowEmitter.shadowColor   = [[UIColor whiteColor] CGColor];
    
    // Add everything to our backing layer below the UIContol defined in the storyboard
    snowEmitter.emitterCells = [NSArray arrayWithObject:snowflake];
    [self.view.layer addSublayer:snowEmitter];
    
    //    [self.view.layer insertSublayer:snowEmitter atIndex:0];
    //// 雪花／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／
    //// 雪花／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／／
    // Cells spawn in the bottom, moving up
    CAEmitterLayer *fireworksEmitter = [CAEmitterLayer layer];
    CGRect viewBounds = self.view.layer.bounds;
    fireworksEmitter.emitterPosition = CGPointMake(viewBounds.size.width/2.0, viewBounds.size.height);
    fireworksEmitter.emitterSize	= CGSizeMake(viewBounds.size.width/2.0, 0.0);
    fireworksEmitter.emitterMode	= kCAEmitterLayerOutline;
    fireworksEmitter.emitterShape	= kCAEmitterLayerLine;
    fireworksEmitter.renderMode		= kCAEmitterLayerAdditive;
    fireworksEmitter.seed = (arc4random()%100)+1;
    
    // Create the rocket
    CAEmitterCell* rocket = [CAEmitterCell emitterCell];
    
    rocket.birthRate		= 5.0;
    rocket.emissionRange	= 0.25 * M_PI;  // some variation in angle
    rocket.velocity			= 380;
    rocket.velocityRange	= 380;
    rocket.yAcceleration	= 75;
    rocket.lifetime			= 1.02;	// we cannot set the birthrate < 1.0 for the burst
    
    rocket.contents			= (id) [[UIImage imageNamed:@"ball"] CGImage];
    rocket.scale			= 0.2;
    //    rocket.color			= [[UIColor colorWithRed:1 green:0 blue:0 alpha:1] CGColor];
    rocket.greenRange		= 1.0;		// different colors
    rocket.redRange			= 1.0;
    rocket.blueRange		= 1.0;
    
    rocket.spinRange		= M_PI;		// slow spin
    
    
    
    // the burst object cannot be seen, but will spawn the sparks
    // we change the color here, since the sparks inherit its value
    CAEmitterCell* burst = [CAEmitterCell emitterCell];
    
    burst.birthRate			= 1.0;		// at the end of travel
    burst.velocity			= 0;
    burst.scale				= 2.5;
    burst.redSpeed			=-1.5;		// shifting
    burst.blueSpeed			=+1.5;		// shifting
    burst.greenSpeed		=+1.0;		// shifting
    burst.lifetime			= 0.35;
    
    // and finally, the sparks
    CAEmitterCell* spark = [CAEmitterCell emitterCell];
    
    spark.birthRate			= 400;
    spark.velocity			= 125;
    spark.emissionRange		= 2* M_PI;	// 360 deg
    spark.yAcceleration		= 75;		// gravity
    spark.lifetime			= 3;
    
    spark.contents			= (id) [[UIImage imageNamed:@"fire"] CGImage];
    spark.scale		        =0.5;
    spark.scaleSpeed		=-0.2;
    spark.greenSpeed		=-0.1;
    spark.redSpeed			= 0.4;
    spark.blueSpeed			=-0.1;
    spark.alphaSpeed		=-0.5;
    spark.spin				= 2* M_PI;
    spark.spinRange			= 2* M_PI;
    
    // putting it together
    fireworksEmitter.emitterCells	= [NSArray arrayWithObject:rocket];
    rocket.emitterCells				= [NSArray arrayWithObject:burst];
    burst.emitterCells				= [NSArray arrayWithObject:spark];
    [self.view.layer addSublayer:fireworksEmitter];
}

/*!
 *  gif动画
 *
 *  @param gifImageName gifImageName
 *  @param imgFrame     imgFrame
 */
- (void)BA_useGIFImageViewWithGifImageName:(NSString *)gifImageName frame:(CGRect)imgFrame
{
    BAGIFImageView *GIFimgView = [BAGIFImageView new];
    GIFimgView.frame = imgFrame;
    [self.view addSubview:GIFimgView];
    // gifImageName = @"xia.gif";
    GIFimgView.gifPath = [[NSBundle mainBundle] pathForResource:gifImageName ofType:nil];
    [GIFimgView startGIF];
}

@end
