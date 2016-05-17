
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


#import "BAHomeSegmentControlVC.h"
#import "view1.h"
#import "view2.h"
#import "view3.h"
#import "view4.h"

@interface BAHomeSegmentControlVC ()

@property (nonatomic, strong) view1 *views1;
@property (nonatomic, strong) view2 *views2;
@property (nonatomic, strong) view3 *views3;
@property (nonatomic, strong) view4 *views4;

@property (nonatomic, assign) CGRect viewFrame;

@end

@implementation BAHomeSegmentControlVC

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
    
    _viewFrame = CGRectMake(0, 0, BA_SCREEN_WIDTH, BA_SCREEN_HEIGHT - BA_getTabbarHeight - BA_StatusBarHeight);
    
    NSLog(@"464646464   %f", BA_SCREEN_HEIGHT - BA_getTabbarHeight - BA_StatusBarHeight);

    self.views1.hidden = NO;
    self.views2.hidden = NO;
    self.views3.hidden = NO;
    self.views4.hidden = NO;
}

// 加载数据
- (void)rootLoadData:(NSInteger)index
{
    if (index == 0)
    {
        [self.view addSubview:_views1];
    }
    else if (index == 1)
    {
        [self.view addSubview:_views2];
    }
    else if (index == 2)
    {
        [self.view addSubview:_views3];
    }
    else if (index == 3)
    {
        [self.view addSubview:_views4];
    }
    else
    {
        self.view.backgroundColor = [self ba_randomColor];
    }
}

- (view1 *)views1
{
    if (!_views1)
    {
        _views1 = [[view1 alloc] initWithFrame:_viewFrame withSelectRowBlock:^(UITableView *tableView, NSIndexPath *indexPath, NSArray *dataArray) {
            
        }];
//        _views1.backgroundColor = [self ba_randomColor];
    }
    return _views1;
}

- (view2 *)views2
{
    if (!_views2)
    {
        _views2 = [[view2 alloc] initWithFrame:_viewFrame withSelectRowBlock:^(UITableView *tableView, NSIndexPath *indexPath, NSArray *dataArray) {
            
        }];
//        _views2.backgroundColor = [self ba_randomColor];
    }
    return _views2;
}

- (view3 *)views3
{
    if (!_views3)
    {
        _views3 = [[view3 alloc] initWithFrame:_viewFrame withSelectRowBlock:^(UITableView *tableView, NSIndexPath *indexPath, NSArray *dataArray) {
            
        }];
//        _views3.backgroundColor = [self ba_randomColor];
    }
    return _views3;
}

- (view4 *)views4
{
    if (!_views4)
    {
        _views4 = [[view4 alloc] initWithFrame:_viewFrame withSelectRowBlock:^(UITableView *tableView, NSIndexPath *indexPath, NSArray *dataArray) {
            
        }];
//        _views4.backgroundColor = [self ba_randomColor];
    }
    return _views4;
}

@end
