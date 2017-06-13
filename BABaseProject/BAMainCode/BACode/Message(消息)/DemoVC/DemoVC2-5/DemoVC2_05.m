//
//  DemoVC2_05.m
//  BABaseProject
//
//  Created by boai on 2016/10/11.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC2_05.h"
#import "DemoVC2_05_test.h"
#import "DemoVC2_05_test2.h"
#import "DemoVC2_05_test3.h"

@interface DemoVC2_05 ()<UITableViewDelegate, UITableViewDataSource>
{
    UIAlertAction      *alertOk;
    UIAlertAction      *alertCancel;
    UIAlertController  *alert;
}
@property (weak, nonatomic  ) IBOutlet UITableView  *m_tableView;
@property (nonatomic, strong) NSArray               *dataArray;

@end

@implementation DemoVC2_05

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    if (alert)
    {
        alert = nil;
    }
    if (alertCancel)
    {
        alertCancel = nil;
    }
    if (alertOk)
    {
        alertOk = nil;
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)ba_setupUI
{
    self.m_tableView.tableFooterView = [UIView new];
    
}

- (NSArray *)dataArray
{
    if (!_dataArray)
    {
        _dataArray = @[@"1、修改 系统 alert 的字体颜色",
                       @"2、修改 系统 actionSheet 的字体颜色",
                       @"3、修改 textField 属性",
                       @"4、面向切面编程(Aspect-Oriented Programming)：Method Swizzling、Hook与代码注入"
                       ];
    }
    return _dataArray;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (0 == indexPath.row)
    {
        [self performSelector:@selector(test1)];
    }
    else if (1 == indexPath.row)
    {
        [self performSelector:@selector(test2)];
    }
    else if (2 == indexPath.row)
    {
        [self performSelector:@selector(test3)];
    }
    else if (3 == indexPath.row)
    {
        [self performSelector:@selector(test4)];
    }
}

- (void)test1
{
    [self.navigationController pushViewController:[DemoVC2_05_test3 new] animated:YES];
}

- (void)test2
{
    [self.navigationController pushViewController:[DemoVC2_05_test3 new] animated:YES];
}

- (void)test3
{
    DemoVC2_05_test *vc = [DemoVC2_05_test new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)test4
{
    DemoVC2_05_test2 *vc = [DemoVC2_05_test2 new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
