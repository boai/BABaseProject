//
//  view1.m
//  test
//
//  Created by 博爱 on 16/5/11.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "view1.h"
#import "BAHomeViewModel.h"
#import "BAHomeVCModel.h"
#import "BAHomeViewCell.h"

@interface view1 ()
<
    UITableViewDelegate,
    UITableViewDataSource
>
@property (nonatomic, strong) NSMutableArray  *titlesArray;
@property (nonatomic, strong) NSMutableArray  *classNamesArray;
@property (nonatomic, strong) NSMutableArray  *contentsArray;

@property (nonatomic, strong) NSMutableArray  *dataArray;

/*！ viewModel:BAHomeViewModel */
@property (nonatomic, strong) NSMutableArray  *statusFrames;




@end

@implementation view1

- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] init];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorColor = [UIColor redColor];
        
        [self creatData];
        [self modelData];
        [self addSubview:_tableView];
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0 , 0, BA_getTabbarHeight, 0));
        }];
        
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

- (instancetype)initWithFrame:(CGRect)frame withSelectRowBlock:(selectRowBlock)selectRowBlock
{
    if (self = [super initWithFrame:frame])
    {
        self.selectBlock = selectRowBlock;
                
        self.tableView.hidden = NO;
        [self viewDidLayoutSubviews];
    }
    return self;
}

- (void)creatData
{
    [self addCell:@"1、测试AFN数据请求" content:@"封装AFN，实现简单的get和post请求，可以自定义请求头，可以解析json数据、xml数据、data数据，可以获取缓存数据。" class:@"DemoVC1"];
    [self addCell:@"2、清理缓存" content:@"清理网络请求缓存和图片缓存，可清理系统缓存！" class:@"DemoVC2"];
    [self addCell:@"3、点击button倒计时" content:@"两种比较常用的获取倒计时验证码的样式！" class:@"DemoVC3"];
    [self addCell:@"4、友盟分享和友盟登陆的完美封装" content:@"包含：微博、微信、朋友圈、QQ、空间、短信的分享和登陆，可以使用默认列表，也可以自定义单个分享和登陆！" class:@"DemoVC4"];
    [self addCell:@"5、正则表达式最新封装" content:@"包含：手机号码、运营商类型(判断移动、联通、电信)、邮箱、数字、中英文、URL、身份证号码等！还可以文字筛选高亮显示！" class:@"DemoVC5"];

}

- (void)addCell:(NSString *)title content:(NSString *)content class:(NSString *)className
{
    [self.titlesArray addObject:title];
    [self.classNamesArray addObject:className];
    [self.contentsArray  addObject:content];
}

- (void)modelData
{
    for (int i = 0; i < self.titlesArray.count; i ++)
    {
        BAHomeVCModel *model = [BAHomeVCModel new];
        model.titleLabel = self.titlesArray[i];
        model.contentLabel = self.contentsArray[i];
        
        [self.dataArray addObject:model];
    }
    
    // 模型转换视图模型 BAHomeVCModel -> BAHomeViewModel
    NSMutableArray *statusF = [NSMutableArray array];
    for (BAHomeVCModel *model in self.dataArray)
    {
        BAHomeViewModel *subViewFrame = [[BAHomeViewModel alloc] init];
        subViewFrame.viewModel = model;
        [statusF addObject:subViewFrame];
    }
    [self.statusFrames addObjectsFromArray:statusF];
}

- (NSMutableArray *)dataArray
{
    if (!_dataArray)
    {
        _dataArray = @[].mutableCopy;
    }
    return _dataArray;
}

- (NSMutableArray *)titlesArray
{
    if (!_titlesArray)
    {
        _titlesArray = @[].mutableCopy;
    }
    return _titlesArray;
}

- (NSMutableArray *)classNamesArray
{
    if (!_classNamesArray)
    {
        _classNamesArray = @[].mutableCopy;
    }
    return _classNamesArray;
}

- (NSMutableArray *)contentsArray
{
    if (!_contentsArray)
    {
        _contentsArray = @[].mutableCopy;
    }
    return _contentsArray;
}

- (NSMutableArray *)statusFrames
{
    if (!_statusFrames)
    {
        _statusFrames = @[].mutableCopy;
    }
    return _statusFrames;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statusFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 创建cell
    BAHomeViewCell *cell = [BAHomeViewCell cellWithTableView:tableView];
    // 获取DemoVC15_ViewModel模型
    BAHomeViewModel *subViewFrame = self.statusFrames[indexPath.row];
    // 给cell传递模型
    cell.subViewFrame = subViewFrame;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *className = self.classNamesArray[indexPath.row];
    Class class = NSClassFromString(className);
    if (class)
    {
        UIViewController *vc = class.new;
        vc.title = self.titlesArray[indexPath.row];
        [[self getCurrentViewController].navigationController pushViewController:vc animated:YES];
    }
    
    // 点击立刻取消该cell的选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 获取ViewModel模型
    BAHomeViewModel *subViewFrame = self.statusFrames[indexPath.row];
    return subViewFrame.cellHeight;
}

#pragma mark - ***** 解决tableview的分割线短一截
- (void)viewDidLayoutSubviews
{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)])
    {
        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])
    {
        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
    {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}




@end
