//
//  DemoVC2_05.m
//  BABaseProject
//
//  Created by boai on 2016/10/11.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC2_05.h"
#import "DemoVC2_05_test.h"


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
                       @"3、修改 textField 属性"
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
}

- (void)test1
{
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:@"博爱温馨提示：" attributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]}];
    
    NSString *result = @"改变颜色和大小后的博爱字体：";
    NSString *keyWord = @"博爱";
    
    /*! 关键字添加效果 */
    NSMutableAttributedString *attributedMessage = [[NSMutableAttributedString alloc]initWithString:result];
    
    /*! 获取关键字位置 */
    NSRange range = [result rangeOfString:keyWord];
    
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:[UIColor blackColor],NSKernAttributeName:@2.0,NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle),NSStrokeColorAttributeName:[UIColor blueColor],NSStrokeWidthAttributeName:@2.0,NSVerticalGlyphFormAttributeName:@(0)};
    
    /*! 设置关键字属性 */
    [attributedMessage ba_changeAttributeDict:dic range:range];
    
    /*! 系统 alert */
    [UIAlertController showAlertInViewController:self
                                       withTitle:@"Test Alert"
                          mutableAttributedTitle:title
                                         message:@"Test Message"
                        mutableAttributedMessage:attributedMessage
                               buttonTitlesArray:@[@"First Other", @"Second Other"]
                           buttonTitleColorArray:@[[UIColor greenColor], [UIColor blackColor]]
                                        tapBlock:^(UIAlertController * _Nonnull controller, UIAlertAction * _Nonnull action, NSInteger buttonIndex) {
                                            NSLog(@"你点击了第 %ld 个按钮！", (long)buttonIndex);
                                        }];
}

- (void)test2
{
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:@"博爱温馨提示：" attributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]}];
    NSString *result = @"改变颜色和大小后的博爱字体：";
    NSString *keyWord = @"博爱";
    
    /*! 关键字添加效果 */
    NSMutableAttributedString *attributedMessage = [[NSMutableAttributedString alloc]initWithString:result];
    
    /*! 获取关键字位置 */
    NSRange range = [result rangeOfString:keyWord];
    
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:[UIColor blackColor],NSKernAttributeName:@2.0,NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle),NSStrokeColorAttributeName:[UIColor blueColor],NSStrokeWidthAttributeName:@2.0,NSVerticalGlyphFormAttributeName:@(0)};
    
    /*! 设置关键字属性 */
    [attributedMessage ba_changeAttributeDict:dic range:range];
    
    [UIAlertController showActionSheetInViewController:self
                                             withTitle:@"Test Action Sheet"
                                mutableAttributedTitle:title
                                               message:@"Test Message"
                              mutableAttributedMessage:attributedMessage
                                     buttonTitlesArray:@[@"First Other", @"Second Other", @"取 消"]
                                 buttonTitleColorArray:@[[UIColor redColor], [UIColor yellowColor], [UIColor greenColor]]
#if TARGET_OS_IOS
                    popoverPresentationControllerBlock:^(UIPopoverPresentationController *popover){
                        
                        popover.sourceView = self.view;
                        popover.sourceRect = self.view.frame;
                    }
#endif
                                              tapBlock:^(UIAlertController * _Nonnull controller, UIAlertAction * _Nonnull action, NSInteger buttonIndex) {
                                                  NSLog(@"你点击了第 %ld 个按钮！", (long)buttonIndex);
                                              }];
}

- (void)test3
{
    DemoVC2_05_test *vc = [DemoVC2_05_test new];
    [self.navigationController pushViewController:vc animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
