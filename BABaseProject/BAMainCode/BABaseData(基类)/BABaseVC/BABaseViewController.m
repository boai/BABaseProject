
/*!
 *  @header BAKit.h
 *          BABaseProject
 *
 *  @brief  BAKit
 *
 *  @author 博爱
 *  @copyright    Copyright © 2016年 博爱. All rights reserved.
 *  @version    V1.0
 */

//                            _ooOoo_
//                           o8888888o
//                           88" . "88
//                           (| -_- |)
//                            O\ = /O
//                        ____/`---'\____
//                      .   ' \\| |// `.
//                       / \\||| : |||// \
//                     / _||||| -:- |||||- \
//                       | | \\\ - /// | |
//                     | \_| ''\---/'' | |
//                      \ .-\__ `-` ___/-. /
//                   ___`. .' /--.--\ `. . __
//                ."" '< `.___\_<|>_/___.' >'"".
//               | | : `- \`.;`\ _ /`;.`/ - ` : | |
//                 \ \ `-. \_ __\ /__ _/ .-` / /
//         ======`-.____`-.___\_____/___.-`____.-'======
//                            `=---='
//
//         .............................................
//                  佛祖镇楼                  BUG辟易
//          佛曰:
//                  写字楼里写字间，写字间里程序员；
//                  程序人员写程序，又拿程序换酒钱。
//                  酒醒只在网上坐，酒醉还来网下眠；
//                  酒醉酒醒日复日，网上网下年复年。
//                  但愿老死电脑间，不愿鞠躬老板前；
//                  奔驰宝马贵者趣，公交自行程序员。
//                  别人笑我忒疯癫，我笑自己命太贱；
//                  不见满街漂亮妹，哪个归得程序员？

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
 * 博客    : http://boai.github.io
 
 *********************************************************************************
 
 */

#import "BABaseViewController.h"

#import "BANavigationBar.h"

#import "BASnowView.h"
// 更新 + 变黑
#import "BAUpdatingView.h"
#import "BAFadeBlackView.h"

#import "RDVTabBarController.h"


@interface BABaseViewController ()



/*! 雪花动画 */
@property (strong, nonatomic) CADisplayLink    *displayLink;
/*! love动画 */
@property (nonatomic, strong) CAReplicatorLayer *loveLayer;

/*! 自定义naviView */
@property (strong, nonatomic) UIView           *naviView;

@property (strong, nonatomic) BAFadeBlackView  *fadeBlackView;
@property (strong, nonatomic) BAUpdatingView   *upDatingView;

@property (nonatomic, strong) BALoadingHubView *loadingHubView;

@end

@implementation BABaseViewController



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
    
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*! 1、基本设置 */
    [self setupBase];
    
    /*! 2、navi设置 */
    [self ba_setupNavi];
    
    /*! 3、创建UI */
    [self ba_setupUI];
}

#pragma mark - ***** 基本设置
#pragma mark 创建UI
- (void)ba_setupUI
{
    
}

- (void)setupBase
{
    self.view.backgroundColor = BA_White_Color;
    
    
}



/*!
 *  设置VC的背景颜色
 *
 *  @param vcBgColor vcBgColor
 */
- (void)setVcBgColor:(UIColor *)vcBgColor
{
    _vcBgColor = vcBgColor;
    self.view.backgroundColor = vcBgColor;
}

#pragma mark - ***** navi设置
- (void)ba_setupNavi
{

}


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
        [self.upDatingView removeFromSuperview];
        [self.fadeBlackView removeFromSuperview];
    }
}

#pragma mark - ***** color
#pragma mark 随机颜色
- (UIColor *)ba_randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 ); //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

#pragma mark - ***** 网络类型判断
/*!
 *  网络判断
 *
 *  @param viewController viewController
 */
- (void)ba_networkChangeWith:(UIViewController *)viewController
{
    // 1.获得网络监控的管理者
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    // 2.设置网络状态改变后的处理
    BA_WEAKSELF;
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        // 当网络状态改变了, 就会调用这个block
        switch (status) {
                
            case AFNetworkReachabilityStatusUnknown: // 未知网络
            {
                BALog(@"当前网络未知！");
                [weakSelf BA_showAlertWithTitle:@"当前网络未知！"];
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
                        [[BASystermSetting ba_systermSettingManage] ba_gotoSystermSettings];
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
                        [weakSelf ba_netUse4Gnet];
                    }
                }];
                
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWiFi: // WIFI
            {
                BALog(@"当前是WiFi环境！");
                [weakSelf BA_showAlertWithTitle:@"当前是WiFi环境！"];
                break;
            }
        }
    }];
    
    // 3.开始监控
    [manager startMonitoring];
}

/*!
 *  使用4G网络时的方法回调
 */
- (void)ba_netUse4Gnet
{
    BALog(@"使用3G/4G网络情况处理方法调用！");
}


#pragma mark - ***** 其他设置
/*!
 *  是否隐藏naviBar
 *
 *  @param hidden YES：隐藏，NO：显示
 */
- (void)ba_setNavbarBackgroundHidden:(BOOL)hidden
{
    BANavigationBar *navBar =(BANavigationBar *)self.navigationController.navigationBar;
    if (hidden) {
        [navBar BA_hiddenNaviBar];
    }else{
        [navBar BA_showNaviBar];
    }
}

#pragma mark - ***** 各种动画开关

/*! 三个球 自定义加载动画 */
- (void)ba_showBallLoadingView:(BOOL)isShow
{
    if (isShow)
    {
        _loadingHubView = [[BALoadingHubView alloc] initWithFrame:CGRectMake(85, 80, 150, 150)];
        _loadingHubView.center = self.view.center;
//        _loadingHubView = [[BALoadingHubView alloc] initWithFrame:CGRectMake(85, 80, 150, 150)];
        [self.view addSubview:_loadingHubView];
        [_loadingHubView showHub];
    }
    else
    {
        [_loadingHubView dismissHub];
    }
}

/*!
 *  开启樱花动画
 */
- (void)ba_starYingHuaCoreAnimation
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
- (void)ba_starXueHuaCoreAnimation
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
- (void)ba_stopXueHuaCoreAnimation
{
    [self.displayLink invalidate];
    self.displayLink = nil;
}

/*!
 *  开启烟花动画（CAEmitterLayer动画）
 */
- (void)ba_starYanHuaCoreAnimation
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

/*! love动画 */
- (void)ba_isShowLoveReplicatorLayer:(BOOL)show
{
    /*! love路径：送给丹丹 */
    UIBezierPath *tPath = [UIBezierPath bezierPath];
    [tPath moveToPoint:CGPointMake(BA_SCREEN_WIDTH/2.0, 200)];
    [tPath addQuadCurveToPoint:CGPointMake(BA_SCREEN_WIDTH/2.0, 400) controlPoint:CGPointMake(BA_SCREEN_WIDTH/2.0 + 250, 40)];
    [tPath addQuadCurveToPoint:CGPointMake(BA_SCREEN_WIDTH/2.0, 200) controlPoint:CGPointMake(BA_SCREEN_WIDTH/2.0 - 250, 40)];
//    tPath.lineCapStyle = kCGLineCapRound;//线条拐角
//    
//    tPath.lineJoinStyle = kCGLineCapRound;//终点处理
    [tPath closePath];
    
    /*! 具体的layer */
    UIView *tView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    tView.center = CGPointMake(BA_SCREEN_WIDTH/2.0, 200);
    tView.layer.cornerRadius = 5;
    tView.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    
    /*! 动作效果 */
    CAKeyframeAnimation *loveAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    loveAnimation.path = tPath.CGPath;
    loveAnimation.duration = 8;
    loveAnimation.repeatCount = MAXFLOAT;
    [tView.layer addAnimation:loveAnimation forKey:@"loveAnimation"];
    
    _loveLayer = [CAReplicatorLayer layer];
    _loveLayer.instanceCount = 40;                // 40个layer
    _loveLayer.instanceDelay = 0.2;               // 每隔0.2出现一个layer
    _loveLayer.instanceColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0].CGColor;
    _loveLayer.instanceGreenOffset = -0.03;       // 颜色值递减。
    _loveLayer.instanceRedOffset = -0.02;         // 颜色值递减。
    _loveLayer.instanceBlueOffset = -0.01;        // 颜色值递减。
    [_loveLayer addSublayer:tView.layer];
    
    [self.view.layer addSublayer:_loveLayer];

    if (show == NO)
    {
        [_loveLayer removeFromSuperlayer];
    }
}



@end
