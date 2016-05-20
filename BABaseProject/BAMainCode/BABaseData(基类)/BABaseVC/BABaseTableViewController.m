
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

#import "BABaseTableViewController.h"

@interface BABaseTableViewController ()

@end

@implementation BABaseTableViewController
@synthesize tableView = _tableView;
@synthesize dataArray = _dataArray;


// 加载视图
- (void)loadView
{
    [super loadView];
    // 自定制视图
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // 添加tableView
    [self.view addSubview:self.tableView];

}

// 视图将要出现
- (void)viewWillAppear:(BOOL)animated
{
    
}
// 视图已经出现
- (void)viewDidAppear:(BOOL)animated
{
}
// 视图将要消失
- (void)viewWillDisappear:(BOOL)animated
{
    
}
// 视图已经消失
- (void)viewDidDisappear:(BOOL)animated
{
}
// 收到系统内存警告
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,self.view.top,self.view.width ,self.view.height - self.view.bottom - self.view.top) style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        // 去掉下面没有数据呈现的cell
        self.tableView.tableFooterView = [[UIView alloc]init];
    }
    return _tableView;
}

#pragma mark - UITableViewDelegate - 子类重写
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"测试数据-%02ld",(long)indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}

- (NSMutableArray *)dataArray
{
    if (!_dataArray ) {
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
}

#pragma mark - ***** 注册是否开启头部刷新and脚部刷新
- (void)setIsOpenHeaderRefresh:(BOOL)isOpenHeaderRefresh
{
    _isOpenHeaderRefresh = isOpenHeaderRefresh;
    if (isOpenHeaderRefresh)
    {
        BA_WEAKSELF;
        weakSelf.tableView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
            [weakSelf headerRefresh];
        }];
    }
    else
    {
        BALog(@"不开启头部刷新");
    }
}

- (void)setIsOpenFooterRefresh:(BOOL)isOpenFooterRefresh
{
    _isOpenFooterRefresh = isOpenFooterRefresh;
    if (isOpenFooterRefresh)
    {
        BA_WEAKSELF;
        self.tableView.mj_footer = [MJRefreshFooter footerWithRefreshingBlock:^{
            // 进入刷新状态后会自动调用这个block
            [weakSelf footerRefresh];
        }];
    }
    else
    {
        NSLog(@"不开启头脚部刷新");
    }
}

#pragma mark - ***** 头部刷新and脚部刷新
- (void)headerRefresh
{
    
}
- (void)footerRefresh
{
    
}



@end
