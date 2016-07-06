//
//  BAMessageViewController.m
//  BABaseProject
//
//  Created by 博爱 on 16/5/3.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BAMessageViewController.h"


@interface BAMessageViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource
>
@property (nonatomic, strong) UITableView     *tableView;
@property (nonatomic, strong) NSMutableArray  *titlesArray;
@property (nonatomic, strong) NSMutableArray  *classNamesArray;
@property (nonatomic, strong) NSMutableArray  *contentsArray;

@end

@implementation BAMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setVCBgColor:BA_Yellow_Color];
    self.title = @"消 息";
    
    [self setupUI];
}

- (void)setupUI
{
    [self creatData];
    self.tableView.hidden = NO;
}

- (void)creatData
{
    [self addCell:@"2-1、31131316" content:@"封装AFN，实现简单的get和post请求，可以自定义请求头，可以解析json数据、xml数据、data数据，可以获取缓存数据。" class:@"DemoVC2_01"];
//    [self addCell:@"2、清理缓存" content:@"清理网络请求缓存和图片缓存，可清理系统缓存！" class:@"DemoVC2"];
}

- (void)addCell:(NSString *)title content:(NSString *)content class:(NSString *)className
{
    [self.titlesArray addObject:title];
    [self.classNamesArray addObject:className];
    [self.contentsArray  addObject:content];
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

- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorColor = [UIColor redColor];
        
        [self.view addSubview:_tableView];
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0 , 0, 0, 0));
        }];
        
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titlesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = self.contentsArray[indexPath.row];
    
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
        
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    /*! 点击立刻取消该cell的选中状态 */
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
