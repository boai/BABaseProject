
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

#import "BAHomeViewController.h"
#import "BASegmentControl.h"
#import "BAHomeSegmentControlVC.h"

@interface BAHomeViewController ()<BASegmentControlDelegate>

@property (nonatomic, strong) BASegmentControl *slideSwitchView;
@property (nonatomic,strong ) NSArray          *itemArray;

@end

@implementation BAHomeViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [[UINavigationBar appearance] setBarTintColor:BA_White_Color];

//    [self isShowSnowLoadingView:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];

//    [self isShowSnowLoadingView:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setVCBgColor:BA_White_Color];
    
//    [self setupNavi];
    // 判断网络
    [self networkChangeWith:self];
    
    [BAFPSLabel showInWindow:[UIApplication sharedApplication].keyWindow];
    
    [self buildSegment];

}

- (void)setupNavi
{
    //    UIImage *image = [UIImage imageNamed:@"14"];
    //    [self set_leftBarButtonItemWithImage] = image;
    //    self.set_leftBarButtonItemWithImage = [UIImage imageNamed:@"14"];
    
}

#pragma mark - 配置segment
- (void)buildSegment
{
    self.itemArray = @[@"最新",@"排行榜",@"手机",@"新闻",@"游戏",@"数码",@"段子",@"科技"];

    self.slideSwitchView = [[BASegmentControl alloc] ba_initWithFrame:CGRectMake(0 , BA_StatusBarHeight, BA_SCREEN_WIDTH, BA_SCREEN_HEIGHT - BA_StatusBarHeight) channelName:self.itemArray source:self];
    [self.slideSwitchView setUserInteractionEnabled:YES];
    
    // BASegmentControl代理
    self.slideSwitchView.segmentControlDelegate = self;
    
    //注意：设置字体大小，颜色，的背景，并且tabSelectionIndicatorLocation设置成HMSegmentedControlSelectionIndicatorLocationNone 实现木有被选中效果
    
    // 设置tab 颜色(可选)
    self.slideSwitchView.tabItemNormalColor = [UIColor lightGrayColor];
    
    // 设置tab 被选中的颜色(可选)
    self.slideSwitchView.tabItemSelectedColor = BA_White_Color;
    
    //设置tab 背景颜色(可选)
    self.slideSwitchView.tabItemNormalBackgroundColor = BA_Red_Color;
    //    //设置tab 被选中的标识的颜色(可选)
//    self.slideSwitchView.tabItemSelectionIndicatorColor = BA_White_Color;
    
    // 设置tab字体大小(可选)
    self.slideSwitchView.tabItemNormalFont = 15;
    
    // 被选中字体大小 (可选)
    self.slideSwitchView.tabItemSelectedFont = 20;
    
    // 设置tab 被选中标识的位置
    //    self.slideSwitchView.tabSelectionIndicatorLocation = HMSegmentedControlSelectionStyleFullWidthStripe;
    // 设置tab 被选中标识的位置 实现木有被选中效果
    self.slideSwitchView.tabSelectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    
    //    self.slideSwitchView.segmentWidthStyle = HMSegmentedControlSegmentWidthStyleFixed;
    
    //设置分界线样式
    //    self.slideSwitchView.verticalDividerEnabled = YES;
    //    self.slideSwitchView.verticalDividerColor = [UIColor brownColor];
    //    self.slideSwitchView.verticalDividerWidth = 1.0f;
    
    [self.view addSubview:self.slideSwitchView];
}

- (NSUInteger)ba_numberOfTitle:(BASegmentControl *)view
{
    return self.itemArray.count;
}

// 待加载的控制器
- (UIViewController *)ba_slideSwitchView:(BASegmentControl *)view viewOfTitle:(NSUInteger)index
{
    BAHomeSegmentControlVC *root = [BAHomeSegmentControlVC new];
    root.title = self.itemArray[index];
    return root;
}

- (void)ba_slideSwitchView:(BASegmentControl *)view didselectTitle:(NSUInteger)index
{
    BAHomeSegmentControlVC *root = view.viewArray[index];
    [root rootLoadData:index];
}

@end
