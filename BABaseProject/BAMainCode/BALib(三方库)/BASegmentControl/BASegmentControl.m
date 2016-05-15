
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

#import "BASegmentControl.h"

static const CGFloat BA_HeightOfTopScrollView       = 44.0f;
static const CGFloat BA_ImagesHeightOfTopScrollView = 54.0f;

@interface BASegmentControl()

@property (nonatomic, strong) HMSegmentedControl *hmSegmentedControl;

@property (nonatomic,strong) NSArray *sectionImages;
@property (nonatomic,strong) NSArray *sectionSelectedImages;

@end

@implementation BASegmentControl

#pragma mark - ***** 初始化参数
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        [self setupSubView];
    }
    return self;
}

- (void)setupSubView
{
    /*! 创建分布式 */
    [self createTopView];
    [self createRootView];
    _isBuildUI = NO;
}

#pragma mark 初始化图片
- (void)initImagesValues
{
    /*! 创建分布式 */
    [self createImageTopView];
    [self createImagesRootView];
    _isBuildUI = NO;
}

- (id)ba_initWithFrame:(CGRect)frame channelName:(NSArray *)channel source:(UIViewController *)srcController
{
    if (self == [super initWithFrame:frame])
    {
        self.viewArray     = [[NSMutableArray alloc] init];
        self.channelName   = [channel copy];
        _segmentController = srcController;
        [self setupSubView];
    }
    return self;
}

- (id)ba_initWithFrame:(CGRect)frame sectionImages:(NSArray *)sectionImages sectionSelectedImages:(NSArray *)sectionSelectedImages source:(UIViewController *)srcController
{
    if (self == [super initWithFrame:frame])
    {
        self.viewArray       = [[NSMutableArray alloc] init];
        self.sectionImages   = [sectionImages copy];
        self.sectionSelectedImages = [sectionSelectedImages copy];
        _segmentController = srcController;
        [self initImagesValues];
    }
    return self;
}

- (void)setSegmentControlDelegate:(id<BASegmentControlDelegate>)segmentControlDelegate
{
    _segmentControlDelegate = segmentControlDelegate;
    [self ba_buildUI];
}

- (void)setTabItemSelectionIndicatorColor:(UIColor *)tabItemSelectionIndicatorColor
{
    self.hmSegmentedControl.selectionIndicatorColor = tabItemSelectionIndicatorColor;
}

- (void)setTabItemNormalBackgroundColor:(UIColor *)tabItemNormalBackgroundColor
{
    self.hmSegmentedControl.backgroundColor = tabItemNormalBackgroundColor;//[UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1];
}

- (void)setTabItemNormalColor:(UIColor *)tabItemNormalColor
{
    _tabItemNormalColor = tabItemNormalColor;
    self.hmSegmentedControl.titleTextAttributes = @{NSForegroundColorAttributeName : tabItemNormalColor} ;//@{NSForegroundColorAttributeName : [UIColor whiteColor]};
}

- (void)setTabItemSelectedColor:(UIColor *)tabItemSelectedColor
{
    _tabItemSelectedColor = tabItemSelectedColor;
    self.hmSegmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : tabItemSelectedColor};//@{NSForegroundColorAttributeName : [UIColor orangeColor]};
}

- (void)setTabSelectionStyle:(HMSegmentedControlSelectionStyle)tabSelectionStyle
{
    HMSegmentedControlSelectionStyle HMSelectionStyle;
    if (tabSelectionStyle == HMSegmentedControlSelectionStyleTextWidthStripe)
    {
        HMSelectionStyle = HMSegmentedControlSelectionStyleTextWidthStripe;
        
    }else if (tabSelectionStyle == HMSegmentedControlSelectionStyleFullWidthStripe)
    {
        HMSelectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
        
    }else if (tabSelectionStyle == HMSegmentedControlSelectionStyleBox)
    {
        HMSelectionStyle = HMSegmentedControlSelectionStyleBox;
        
    }else if (tabSelectionStyle == HMSegmentedControlSelectionStyleArrow)
    {
        HMSelectionStyle = HMSegmentedControlSelectionStyleArrow;
        
    }
    self.hmSegmentedControl.selectionStyle = HMSelectionStyle;
}

- (void)setTabSelectionIndicatorLocation:(HMSegmentedControlSelectionIndicatorLocation)tabSelectionIndicatorLocation
{
    HMSegmentedControlSelectionIndicatorLocation selectionIndicatorLocation;
    if (tabSelectionIndicatorLocation == HMSegmentedControlSelectionIndicatorLocationUp)
    {
        selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationUp;
        
    }
    else if (tabSelectionIndicatorLocation == HMSegmentedControlSelectionIndicatorLocationDown)
    {
        selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
        
    }
    else if (tabSelectionIndicatorLocation == HMSegmentedControlSelectionIndicatorLocationNone)
    {
        selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationNone;
        
    }
    self.hmSegmentedControl.selectionIndicatorLocation = selectionIndicatorLocation;
}

- (void)setSegmentWidthStyle:(HMSegmentedControlSegmentWidthStyle)segmentWidthStyle
{
    HMSegmentedControlSegmentWidthStyle widthStyle;
    
    if (segmentWidthStyle == HMSegmentedControlSegmentWidthStyleFixed)
    {
        widthStyle = HMSegmentedControlSegmentWidthStyleFixed;
    }
    else if (segmentWidthStyle == HMSegmentedControlSegmentWidthStyleDynamic)
    {
        widthStyle = HMSegmentedControlSegmentWidthStyleDynamic;
    }
    self.hmSegmentedControl.segmentWidthStyle = widthStyle;
}

- (void)setTabItemNormalFont:(CGFloat)fontSize
{
    if (_tabItemNormalColor)
    {
        // 设置了tab颜色
        self.hmSegmentedControl.titleTextAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:fontSize],NSForegroundColorAttributeName : _tabItemNormalColor};
    }
    else
    {
        self.hmSegmentedControl.titleTextAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]};
    }
}

- (void)setTabItemSelectedFont:(CGFloat)fontSize
{
    if (_tabItemSelectedColor)
    {
        //设置了tab颜色
        self.hmSegmentedControl.selectedTitleTextAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:fontSize],NSForegroundColorAttributeName : _tabItemSelectedColor};
    }
    else
    {
        self.hmSegmentedControl.selectedTitleTextAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]};
    }
}

- (void)setVerticalDividerEnabled:(BOOL)verticalDividerEnabled
{
    self.hmSegmentedControl.verticalDividerEnabled = verticalDividerEnabled;
    if (verticalDividerEnabled)
    {
        self.hmSegmentedControl.segmentEdgeInset = UIEdgeInsetsMake(0, 20, 0, 20);
    }
}

- (void)setVerticalDividerColor:(UIColor *)verticalDividerColor
{
    self.hmSegmentedControl.verticalDividerColor = verticalDividerColor;
}

- (void)setVerticalDividerWidth:(CGFloat)verticalDividerWidth
{
    self.hmSegmentedControl.verticalDividerWidth = verticalDividerWidth;
}

#pragma mark - ***** views
#pragma mark 创建标签页
- (void)createTopView
{
    CGFloat viewWidth = CGRectGetWidth(self.frame);
    self.hmSegmentedControl = [[HMSegmentedControl alloc] initWithFrame:CGRectMake(0, 0, viewWidth, BA_HeightOfTopScrollView)];
    //    self.hmSegmentedControl.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
    self.hmSegmentedControl.sectionTitles = _channelName;
    self.hmSegmentedControl.selectedSegmentIndex = 0;
    // 默认colors
    self.hmSegmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [UIColor redColor]};
    self.hmSegmentedControl.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor]};
    self.hmSegmentedControl.backgroundColor = [UIColor whiteColor];
    self.hmSegmentedControl.selectionIndicatorColor = [UIColor redColor];
    // 默认style
    self.hmSegmentedControl.selectionStyle = HMSegmentedControlSelectionStyleTextWidthStripe;
    self.hmSegmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    
    [self addSubview:self.hmSegmentedControl];
    
    __weak typeof(self) weakSelf = self;
    [self.hmSegmentedControl setIndexChangeBlock:^(NSInteger index) {
        [weakSelf segmentClicked:index];
    }];
}

#pragma mark 创建根视图
- (void)createRootView
{
    //创建主滚动视图
    _rootScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, BA_HeightOfTopScrollView , self.bounds.size.width, self.bounds.size.height - BA_HeightOfTopScrollView)];
    _rootScrollView.delegate = self;
    _rootScrollView.pagingEnabled = YES;
    _rootScrollView.userInteractionEnabled = YES;
    _rootScrollView.bounces = NO;
    _rootScrollView.showsHorizontalScrollIndicator = NO;
    _rootScrollView.showsVerticalScrollIndicator = NO;
    _rootScrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
    [self addSubview:_rootScrollView];
}

#pragma mark 创建带有图片的标签页
- (void)createImageTopView
{
    CGFloat viewWidth = CGRectGetWidth(self.frame);
    NSMutableArray *sectionImagesArray = [[NSMutableArray alloc] init];
    [self.sectionImages enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [sectionImagesArray addObject:[UIImage imageNamed:self.sectionImages[idx]]];
    }];
    NSMutableArray *sectionSelectedImagesArray = [[NSMutableArray alloc] init];
    [self.sectionSelectedImages enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [sectionSelectedImagesArray addObject:[UIImage imageNamed:self.sectionSelectedImages[idx]]];
    }];
    
    // Segmented control with images
    self.hmSegmentedControl  = [[HMSegmentedControl alloc] initWithSectionImages:sectionImagesArray
                                                           sectionSelectedImages:sectionSelectedImagesArray];
    self.hmSegmentedControl.frame = CGRectMake(0, 0, viewWidth, BA_ImagesHeightOfTopScrollView);
    //    self.hmSegmentedControl.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
    self.hmSegmentedControl.sectionTitles = _channelName;
    self.hmSegmentedControl.selectedSegmentIndex = 0;
    // 默认colors
    self.hmSegmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [UIColor redColor]};
    self.hmSegmentedControl.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor]};
    self.hmSegmentedControl.backgroundColor = [UIColor whiteColor];
    self.hmSegmentedControl.selectionIndicatorColor = [UIColor redColor];
    // 默认style
    self.hmSegmentedControl.selectionStyle = HMSegmentedControlSelectionStyleTextWidthStripe;
    self.hmSegmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    
    [self addSubview:self.hmSegmentedControl];
    
    __weak typeof(self) weakSelf = self;
    [self.hmSegmentedControl setIndexChangeBlock:^(NSInteger index) {
        [weakSelf segmentClicked:index];
    }];
}

#pragma mark 创建带有图片的根视图
- (void)createImagesRootView
{
    //创建主滚动视图
    _rootScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, BA_ImagesHeightOfTopScrollView , self.bounds.size.width, self.bounds.size.height - BA_ImagesHeightOfTopScrollView)];
    _rootScrollView.delegate = self;
    _rootScrollView.pagingEnabled = YES;
    _rootScrollView.userInteractionEnabled = YES;
    _rootScrollView.bounces = NO;
    _rootScrollView.showsHorizontalScrollIndicator = NO;
    _rootScrollView.showsVerticalScrollIndicator = NO;
    _rootScrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
    [self addSubview:_rootScrollView];
}

/*!
 *  跳转指定segment
 *
 *  @param index 当前的segmentBar
 */
- (void)ba_changeSlideAtSegmentIndex:(NSInteger)index
{
    [self segmentClicked:index];
    [self.hmSegmentedControl setSelectedSegmentIndex:index animated:YES];
}

#pragma mark - ***** 创建控件
#pragma mark 创建子视图UI
- (void)ba_buildUI
{
    NSUInteger number = [self.segmentControlDelegate ba_numberOfTitle:self];
    for (int i=0; i<number; i++)
    {
        UIViewController *vc = [self.segmentControlDelegate ba_slideSwitchView:self viewOfTitle:i];
        [_viewArray addObject:vc];
        [_rootScrollView addSubview:vc.view];
        // 增加子控制器
        [_segmentController addChildViewController:vc];
    }
    _isBuildUI = YES;
    // 选中第一个view
    if (self.segmentControlDelegate && [self.segmentControlDelegate respondsToSelector:@selector(ba_slideSwitchView:didselectTitle:)])
    {
        [self.segmentControlDelegate ba_slideSwitchView:self didselectTitle:_userSelectedChannelID ];
    }
    // 创建完子视图UI才需要调整布局
    [self setNeedsLayout];
}

#pragma mark  当横竖屏切换时可通过此方法调整布局
- (void)layoutSubviews
{
    //创建完子视图UI才需要调整布局
    if (_isBuildUI) {
        //更新主视图的总宽度
        _rootScrollView.contentSize = CGSizeMake(self.bounds.size.width * [_viewArray count], 0);
        
        //更新主视图各个子视图的宽度
        for (int i = 0; i < [_viewArray count]; i++) {
            UIViewController *listVC = _viewArray[i];
            listVC.view.frame = CGRectMake(0+_rootScrollView.bounds.size.width*i, 0,
                                           _rootScrollView.bounds.size.width, _rootScrollView.bounds.size.height);
        }
        //滚动到选中的视图
        [_rootScrollView setContentOffset:CGPointMake((_userSelectedChannelID )*self.bounds.size.width, 0) animated:NO];
    }
}


#pragma mark - ***** 顶部滚动视图逻辑方法
- (void)segmentClicked:(NSInteger)index
{
    [self.rootScrollView setContentOffset:CGPointMake(index * self.bounds.size.width, 0) animated:NO];
    if (self.segmentControlDelegate && [self.segmentControlDelegate respondsToSelector:@selector(ba_slideSwitchView:didselectTitle:)])
    {
        [self.segmentControlDelegate ba_slideSwitchView:self didselectTitle:index];
    }
    _userSelectedChannelID = index;
}

- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl
{
    NSLog(@"Selected index %ld (via UIControlEventValueChanged)", (long)segmentedControl.selectedSegmentIndex);
}

- (void)uisegmentedControlChangedValue:(UISegmentedControl *)segmentedControl
{
    NSLog(@"Selected index %ld", (long)segmentedControl.selectedSegmentIndex);
}

#pragma mark 主视图逻辑方法
// 滚动视图开始时
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if (scrollView == _rootScrollView)
    {
        _userContentOffsetX = scrollView.contentOffset.x;
    }
}
// 滚动视图结束
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == _rootScrollView)
    {
        //判断用户是否左滚动还是右滚动
        if (_userContentOffsetX < scrollView.contentOffset.x)
        {
            _isLeftScroll = YES;
        }
        else
        {
            _isLeftScroll = NO;
        }
    }
}
// 滚动视图释放滚动
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView == _rootScrollView)
    {
        //调整顶部滑条按钮状态
        int index = (int)scrollView.contentOffset.x/self.bounds.size.width ;
        [self.hmSegmentedControl setSelectedSegmentIndex:index animated:YES];
        [self segmentClicked:index];
    }
}


@end
