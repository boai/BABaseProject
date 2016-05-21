
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
#import "HMSegmentedControl.h"
#import "view1.h"
#import "view2.h"
#import "view3.h"
#import "view4.h"


@interface BAHomeViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView        *scrollView;
@property (nonatomic, strong) HMSegmentedControl  *segmentedControl;

/*! views */
@property (nonatomic, strong) view1 *views1;
@property (nonatomic, strong) view2 *views2;
@property (nonatomic, strong) view3 *views3;
@property (nonatomic, strong) view4 *views4;


@end

@implementation BAHomeViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
//    [[UINavigationBar appearance] setBarTintColor:BA_White_Color];

//    [self isShowSnowLoadingView:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//    [self.navigationController setNavigationBarHidden:NO animated:YES];

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

#pragma mark - ***** 配置segment
- (void)buildSegment
{
    self.segmentedControl.hidden = NO;
    self.scrollView.hidden = NO;
    self.views1.hidden = NO;
    self.views2.hidden = NO;
    self.views3.hidden = NO;
    self.views4.hidden = NO;
}

- (HMSegmentedControl *)segmentedControl
{
    if (!_segmentedControl)
    {
        _segmentedControl = [[HMSegmentedControl alloc] initWithFrame:CGRectMake(0, 0, BA_SCREEN_WIDTH, 40)];
        /*! 设置标题 */
        _segmentedControl.sectionTitles = @[@"最新",@"排行榜",@"手机",@"新闻",@"游戏",@"数码",@"段子",@"科技"];
        /*! 自适应宽度，随着屏幕滑动自动滚动 */
        _segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
        /*! 默认选中第0个view */
        _segmentedControl.selectedSegmentIndex = 0;
        /*! 标题背景颜色 */
        _segmentedControl.backgroundColor = BA_White_Color;
        /*! 标题默认字体颜色 */
        _segmentedControl.titleTextAttributes = @{NSForegroundColorAttributeName : BA_LightGray_Color, NSFontAttributeName: BA_FontSize(16)};
        /*! 标题选中字体颜色 */
        _segmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : BA_Them_greenColor, NSFontAttributeName: BA_FontSize(18)};
        /*! 标题选中的下划线的颜色 */
        _segmentedControl.selectionIndicatorColor = BA_Them_greenColor;
        /*! 标题选中的下划线的高度 */
        _segmentedControl.selectionIndicatorHeight = 2.0f;
        /*! 标题选中的样式：本样式为下划线 */
        _segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
        /*! 标题选中的下划线的方向：本样式为向下 */
        _segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
        /*! 标题的中间的隔线：默认为：NO */
        _segmentedControl.verticalDividerEnabled = YES;
        /*! 标题的中间的隔线颜色 */
        _segmentedControl.verticalDividerColor = BA_LightGray_Color;
        /*! 标题的中间的隔线宽度 */
        _segmentedControl.verticalDividerWidth = 1.0f;
        
        [self.view addSubview:_segmentedControl];
        
        /*! 标题点击事件 */
        __weak typeof(self) weakSelf = self;
        [_segmentedControl setIndexChangeBlock:^(NSInteger index) {
            [weakSelf.scrollView scrollRectToVisible:CGRectMake(BA_SCREEN_WIDTH * index, 0, BA_SCREEN_WIDTH, 200) animated:YES];
        }];
    }
    return _segmentedControl;
}

- (UIScrollView *)scrollView
{
    if (!_scrollView)
    {
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_segmentedControl.frame), BA_SCREEN_WIDTH, BA_SCREEN_HEIGHT - CGRectGetMaxY(_segmentedControl.frame))];
        self.scrollView.backgroundColor = [UIColor whiteColor];
        self.scrollView.pagingEnabled = YES;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.contentSize = CGSizeMake(BA_SCREEN_WIDTH * (_segmentedControl.sectionTitles.count), BA_SCREEN_HEIGHT - CGRectGetMaxY(_segmentedControl.frame));
        self.scrollView.delegate = self;
        [self.scrollView scrollRectToVisible:CGRectMake(0, 0, BA_SCREEN_WIDTH, self.scrollView.frame.size.height) animated:NO];
        [self.view addSubview:self.scrollView];
    }
    return _scrollView;
}

#pragma mark - ***** UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = scrollView.frame.size.width;
    NSInteger page = scrollView.contentOffset.x / pageWidth;
    
    [_segmentedControl setSelectedSegmentIndex:page animated:YES];
}

- (view1 *)views1
{
    if (!_views1)
    {
        _views1 = [[view1 alloc] initWithFrame:CGRectMake(0, 0, BA_SCREEN_WIDTH, self.scrollView.frame.size.height) withSelectRowBlock:^(UITableView *tableView, NSIndexPath *indexPath, NSArray *dataArray) {
            
        }];
        [self.scrollView addSubview:_views1];
    }
    return _views1;
}

- (view2 *)views2
{
    if (!_views2)
    {
        _views2 = [[view2 alloc] initWithFrame:CGRectMake(BA_SCREEN_WIDTH, 0, BA_SCREEN_WIDTH, self.scrollView.frame.size.height) withSelectRowBlock:^(UITableView *tableView, NSIndexPath *indexPath, NSArray *dataArray) {
            
        }];
        [self.scrollView addSubview:_views2];
    }
    return _views2;
}

- (view3 *)views3
{
    if (!_views3)
    {
        _views3 = [[view3 alloc] initWithFrame:CGRectMake(BA_SCREEN_WIDTH * 2, 0, BA_SCREEN_WIDTH, self.scrollView.frame.size.height) withSelectRowBlock:^(UITableView *tableView, NSIndexPath *indexPath, NSArray *dataArray) {
            
        }];
        [self.scrollView addSubview:_views3];
    }
    return _views3;
}

- (view4 *)views4
{
    if (!_views4)
    {
        _views4 = [[view4 alloc] initWithFrame:CGRectMake(BA_SCREEN_WIDTH * 3, 0, BA_SCREEN_WIDTH, self.scrollView.frame.size.height) withSelectRowBlock:^(UITableView *tableView, NSIndexPath *indexPath, NSArray *dataArray) {
            
        }];
        [self.scrollView addSubview:_views4];
    }
    return _views4;
}


@end
