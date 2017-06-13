//
//  DemoVC12.m
//  BABaseProject
//
//  Created by 博爱 on 16/6/21.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC12.h"

#import "ViewController2.h"
#import "CustomView.h"

/*! 使用方法一：文件夹拖入 */
#import "BAAlert_OC.h"

///*! 使用方法二：pod */
//#import <BAAlert_OC.h>

/*! VC 用 BAKit_ShowAlertWithMsg */
#define BAKit_ShowAlertWithMsg_ios8(msg) UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:msg preferredStyle:UIAlertControllerStyleAlert];\
UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确 定" style:UIAlertActionStyleDefault handler:nil];\
[alert addAction:sureAction];\
[self presentViewController:alert animated:YES completion:nil];


static NSString * const title0 = @"温馨提示";
static NSString * const titleMsg0 = @"欢迎使用 iPhone SE，迄今最高性能的 4 英寸 iPhone。在打造这款手机时，我们在深得人心的 4 英寸设计基础上，从里到外重新构想。它所采用的 A9 芯片，正是在 iPhone 6s 上使用的先进芯片。1200 万像素的摄像头能拍出令人叹为观止的精彩照片和 4K 视频，而 Live Photos 则会让你的照片栩栩如生。这一切，成就了一款外形小巧却异常强大的 iPhone。\n对于 MacBook，我们给自己设定了一个几乎不可能实现的目标：在有史以来最为轻盈纤薄的 Mac 笔记本电脑上，打造全尺寸的使用体验。这就要求每个元素都必须重新构想，不仅令其更为纤薄轻巧，还要更加出色。最终我们带来的，不仅是一部新款的笔记本电脑，更是一种对笔记本电脑的前瞻性思考。现在，有了第六代 Intel 处理器、提升的图形处理性能、高速闪存和最长可达 10 小时的电池使用时间*，MacBook 的强大更进一步。\n欢迎使用 iPhone SE，迄今最高性能的 4 英寸 iPhone。在打造这款手机时，我们在深得人心的 4 英寸设计基础上，从里到外重新构想。它所采用的 A9 芯片，正是在 iPhone 6s 上使用的先进芯片。1200 万像素的摄像头能拍出令人叹为观止的精彩照片和 4K 视频，而 Live Photos 则会让你的照片栩栩如生。这一切，成就了一款外形小巧却异常强大的 iPhone。\n对于 MacBook，我们给自己设定了一个几乎不可能实现的目标：在有史以来最为轻盈纤薄的 Mac 笔记本电脑上，打造全尺寸的使用体验。这就要求每个元素都必须重新构想，不仅令其更为纤薄轻巧，还要更加出色。最终我们带来的，不仅是一部新款的笔记本电脑，更是一种对笔记本电脑的前瞻性思考。现在，有了第六代 Intel 处理器、提升的图形处理性能、高速闪存和最长可达 10 小时的电池使用时间*，MacBook 的强大更进一步。";

static NSString * const titleMsg1 = @"欢迎使用 iPhone SE，迄今最高性能的 4 英寸 iPhone。在打造这款手机时，我们在深得人心的 4 英寸设计基础上，从里到外重新构想。它所采用的 A9 芯片，正是在 iPhone 6s 上使用的先进芯片。1200 万像素的摄像头能拍出令人叹为观止的精彩照片和 4K 视频，而 Live Photos 则会让你的照片栩栩如生。这一切，成就了一款外形小巧却异常强大的 iPhone。";
static NSString * const titleMsg2 = @"对于 MacBook，我们给自己设定了一个几乎不可能实现的目标：在有史以来最为轻盈纤薄的 Mac 笔记本电脑上，打造全尺寸的使用体验。这就要求每个元素都必须重新构想，不仅令其更为纤薄轻巧，还要更加出色。最终我们带来的，不仅是一部新款的笔记本电脑，更是一种对笔记本电脑的前瞻性思考。现在，有了第六代 Intel 处理器、提升的图形处理性能、高速闪存和最长可达 10 小时的电池使用时间*，MacBook 的强大更进一步。";

@interface DemoVC12 ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView  *tableView;

@property (nonatomic, strong) BAAlert        *alertView1;
@property (nonatomic, strong) BAAlert        *alertView2;
@property (nonatomic, strong) BAAlert        *alertView3;
@property (nonatomic, strong) BAAlert        *alertView4;
@property (nonatomic, strong) BAAlert        *alertView5;

@property (nonatomic, strong) BAActionSheet  *actionSheet;

@property(nonatomic, strong) CustomView *customView;

@property (strong, nonatomic) NSArray        *dataArray;

@end

@implementation DemoVC12


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.estimatedRowHeight = 44.f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.title = @"BAAlert-OC";
}

#pragma mark - UITableViewDataSource / UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if ( !cell )
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.textLabel.numberOfLines = 0;
        
        cell.accessoryType = 0 == indexPath.section?UITableViewCellAccessoryDisclosureIndicator:UITableViewCellAccessoryNone;
        cell.selectionStyle = 0 == indexPath.section?UITableViewCellSelectionStyleDefault:UITableViewCellSelectionStyleNone;
    }
    NSArray *tempArray = self.dataArray[indexPath.section];
    cell.textLabel.text = tempArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ( 0 == indexPath.section )
    {
        [self showAlertAction:indexPath.row + 1];
    }else if ( 1 == indexPath.section )
    {
        switch ( indexPath.row ) {
            case 0:
            {
                [self actionSheet1];
            }
                break;
            case 1:
            {
                [self actionSheet2];
            }
                break;
            case 2:
            {
                [self actionSheet3];
            }
                break;
            default:
                break;
        }
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [UIView new];
    
    UILabel *headerTitle = [UILabel new];
    headerTitle.font = [UIFont systemFontOfSize:14];
    headerTitle.textColor = [UIColor redColor];
    headerTitle.numberOfLines = 0;
    [headerView addSubview:headerTitle];
    
    headerTitle.frame = CGRectMake(20, 0, SCREENWIDTH - 40, 40);

    if (0 == section)
    {
        headerTitle.text = @"BAAlert 的几种日常用法，高斯模糊、炫酷动画，应有尽有！";
    }
    else if (1 == section)
    {
        headerTitle.text = @"BAActionSheet";
    }
    else if (2 == section)
    {
        headerTitle.text = @"BAAlert特点";
    }
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return FLT_MIN;
}

#pragma mark - 点击事件
- (void)showAlertAction:(NSInteger)index
{
    switch (index) {
        case 1:
            [self performSelector:@selector(alert1)];
            break;
        case 2:
            [self performSelector:@selector(alert2)];
            break;
        case 3:
            [self performSelector:@selector(alert3)];
            break;
        case 4:
            [self performSelector:@selector(alert4)];
            break;
        case 5:
            [self performSelector:@selector(alert5)];
            break;
        
        default:
            break;
    }
}

- (void)actionSheet1
{
    NSMutableArray *dataArray = [NSMutableArray array];
    NSArray *contentArray = @[@"微信支付", @"支付宝", @"预付款账户"];
    NSArray *subContentArray = @[@"", @"18588888888", @"余额：￥480.00"];
    NSArray *imageArray = @[@"123.png", @"背景.jpg", @"美女.jpg"];
    
    for (NSInteger i = 0; i < contentArray.count; i++)
    {
        BAActionSheetModel *model = [BAActionSheetModel new];
        model.imageUrl = imageArray[i];
        model.content = contentArray[i];
        model.subContent = subContentArray[i];
        
        [dataArray addObject:model];
    }
    BAKit_WeakSelf
    [BAActionSheet ba_actionSheetShowWithConfiguration:^(BAActionSheet *tempView) {
        
        BAKit_StrongSelf
        tempView.title = @"支付方式";
        tempView.dataArray = dataArray;
        tempView.isTouchEdgeHide = NO;
        tempView.showAnimate = YES;
        
        self.actionSheet = tempView;
    } actionBlock:^(NSIndexPath *indexPath, BAActionSheetModel *model) {
        BAKit_ShowAlertWithMsg_ios8(model.content);
    }];
}

- (void)actionSheet2
{
    NSMutableArray *dataArray = [NSMutableArray array];
    NSArray *contentArray = @[@"微信支付", @"支付宝", @"预付款账户"];

    for (NSInteger i = 0; i < contentArray.count; i++)
    {
        BAActionSheetModel *model = [BAActionSheetModel new];
//        model.imageUrl = imageArray[i];
        model.content = contentArray[i];
//        model.subContent = subContentArray[i];
        
        [dataArray addObject:model];
    }
    BAKit_WeakSelf
    [BAActionSheet ba_actionSheetShowWithConfiguration:^(BAActionSheet *tempView) {
        
        BAKit_StrongSelf
//        tempView.title = @"支付方式";
        tempView.dataArray = dataArray;
        tempView.actionSheetType = BAActionSheetTypeCustom;
        //        tempView.isTouchEdgeHide = NO;
        
        self.actionSheet = tempView;
    } actionBlock:^(NSIndexPath *indexPath, BAActionSheetModel *model) {
        BAKit_ShowAlertWithMsg_ios8(model.content);
    }];
}

- (void)actionSheet3
{
    NSArray *contentArray = @[@"微信支付", @"支付宝", @"预付款账户", @"中行"];
    NSArray <NSArray *>*subContentArray = @[
                                            @[@"微信支付1", @"微信支付2", @"微信支付3"],
                                            @[@"支付宝1", @"支付宝2", @"支付宝3", @"支付宝4"],
                                            @[],
                                            @[@"中行1", @"中行2", @"中行3", @"中行4", @"中行5", @"中行6", @"中行7", @"中行2", @"中行3", @"中行4", @"中行5", @"中行6", @"中行7", @"中行2", @"中行3", @"中行4", @"中行5", @"中行6", @"中行7", @"中行2", @"中行3", @"中行4", @"中行5", @"中行6", @"中行7"]
                                            ];
    
    NSMutableArray *dataArray = @[].mutableCopy;
    for (NSInteger i = 0; i < contentArray.count; i++)
    {
        BAActionSheetModel *model = [BAActionSheetModel new];
        model.content = contentArray[i];
        
        NSMutableArray *mutArray = @[].mutableCopy;
        for (NSInteger j = 0; j < subContentArray[i].count; j ++)
        {
            BAActionSheetSubContentModel *subContentModel = [BAActionSheetSubContentModel new];
            subContentModel.subContent = subContentArray[i][j];
            [mutArray addObject:subContentModel];
        }
        model.subContentArray = mutArray;
        
        [dataArray addObject:model];
    }
    
    BAKit_WeakSelf
    [BAActionSheet ba_actionSheetShowWithConfiguration:^(BAActionSheet *tempView) {
        
        BAKit_StrongSelf
        tempView.title = @"支付方式";
        tempView.dataArray = dataArray;
        tempView.actionSheetType = BAActionSheetTypeExpand;
        //        tempView.isTouchEdgeHide = NO;
        
        self.actionSheet = tempView;
    } actionBlock:^(NSIndexPath *indexPath, BAActionSheetModel *model) {
        if (model.subContentArray.count > 0)
        {
            BAKit_ShowAlertWithMsg_ios8(model.subContentArray[indexPath.row].subContent);
        }
        else
        {
            BAKit_ShowAlertWithMsg_ios8(model.content);
        }
    }];
}


- (void)alert1
{
    BAKit_WeakSelf
    /*! 第一种封装使用示例 */
    [BAAlert ba_alertShowWithTitle:title0 message:titleMsg0 image:nil buttonTitleArray:@[@"取消",@"确定",@"确定2",@"确定3"] buttonTitleColorArray:@[[UIColor redColor], [UIColor greenColor], [UIColor grayColor], [UIColor purpleColor]] configuration:^(BAAlert *tempView) {
        BAKit_StrongSelf
        //        temp.bgColor       = [UIColor colorWithRed:0 green:1.0 blue:0 alpha:0.3];
        /*! 开启边缘触摸隐藏alertView */
        tempView.isTouchEdgeHide = YES;
        /*! 添加高斯模糊的样式 */
        tempView.blurEffectStyle = BAAlertBlurEffectStyleLight;
        /*! 开启动画 */
                tempView.showAnimate   = YES;
        //        /*! 进出场动画样式 默认为：1 */
        //        tempView.animatingStyle  = 1;
        self.alertView1 = tempView;
    } actionBlock:^(NSInteger index) {
        BAKit_StrongSelf
        [self.alertView1 ba_alertHidden];
        if (index == 1)
        {
            NSLog(@"点击了确定按钮！");
            ViewController2 *vc2 = [ViewController2 new];
            vc2.title = @"alert1";
            [self.navigationController pushViewController:vc2 animated:YES];
        }
    }];
}

- (void)alert2
{
//    /*! 2、自定义按钮颜色 */
    BAKit_WeakSelf
    [BAAlert ba_alertShowWithTitle:@"温馨提示：" message:titleMsg2 image:nil buttonTitleArray:@[@"取消", @"跳转VC2"] buttonTitleColorArray:@[[UIColor redColor], [UIColor greenColor]] configuration:^(BAAlert *tempView) {
        BAKit_StrongSelf
        /*! 自定义按钮文字颜色 */
        //    tempView.buttonTitleColor = [UIColor orangeColor];
        tempView.bgColor = [UIColor colorWithRed:1.0 green:1.0 blue:0 alpha:0.3];
        tempView.isTouchEdgeHide = YES;

        /*! 是否开启进出场动画 默认：NO，如果 YES ，并且同步设置进出场动画枚举为默认值：1 */
        tempView.showAnimate = YES;
        tempView.animatingStyle  = BAAlertAnimatingStyleShake;

        self.alertView2 = tempView;

    } actionBlock:^(NSInteger index) {
        BAKit_StrongSelf
        [self.alertView2 ba_alertHidden];
        if (index == 0)
        {
            NSLog(@"点击了取消按钮！");
        }
        else if (index == 1)
        {
            NSLog(@"点击了确定按钮！");
            ViewController2 *vc2 = [ViewController2 new];
            vc2.title = @"alert2";
            [self.navigationController pushViewController:vc2 animated:YES];
        }
    }];
}

- (void)alert3
{
    /*! 3、自定义背景图片 */
    BAKit_WeakSelf
    [BAAlert ba_alertShowWithTitle:@"温馨提示：" message:titleMsg1 image:nil buttonTitleArray:@[@"取消", @"确定"] buttonTitleColorArray:@[[UIColor redColor], [UIColor greenColor]] configuration:^(BAAlert *tempView) {
        BAKit_StrongSelf
        /*! 自定义按钮文字颜色 */
        //    tempView.buttonTitleColor = [UIColor orangeColor];
        /*! 自定义alert的背景图片 */
        tempView.bgImageName      = @"背景.jpg";
        /*! 开启动画，并且设置动画样式，默认：1 */
//        tempView.showAnimate = YES;
        
        /*! 没有开启动画，直接进出场动画样式，默认开启动画 */
        tempView.animatingStyle  = BAAlertAnimatingStyleFall;
        
        self.alertView3 = tempView;
    } actionBlock:^(NSInteger index) {
        BAKit_StrongSelf
        [self.alertView3 ba_alertHidden];
        if (index == 0)
        {
            NSLog(@"点击了取消按钮！");
        }
        else if (index == 1)
        {
            NSLog(@"点击了确定按钮！");
            ViewController2 *vc2 = [ViewController2 new];
            vc2.title = @"alert3";
            [self.navigationController pushViewController:vc2 animated:YES];
        }
    }];
}

- (void)alert4
{
    /*! 4、内置图片和文字，可滑动查看 */
    BAKit_WeakSelf
    [BAAlert ba_alertShowWithTitle:@"温馨提示：" message:titleMsg1 image:[UIImage imageNamed:@"美女.jpg"] buttonTitleArray:@[@"取消", @"跳转VC2"] buttonTitleColorArray:@[[UIColor redColor], [UIColor greenColor]] configuration:^(BAAlert *tempView) {
        BAKit_StrongSelf
        /*! 自定义按钮文字颜色 */
        //    tempView.buttonTitleColor = [UIColor orangeColor];
        /*! 自定义alert的背景图片 */
        tempView.bgImageName = @"背景.jpg";
        /*! 是否显示动画效果 */
        tempView.showAnimate = YES;
        self.alertView4 = tempView;
    } actionBlock:^(NSInteger index) {
        BAKit_StrongSelf
        [self.alertView4 ba_alertHidden];
        if (index == 0)
        {
            NSLog(@"点击了取消按钮！");
        }
        else if (index == 1)
        {
            NSLog(@"点击了确定按钮！");
            ViewController2 *vc2 = [ViewController2 new];
            vc2.title = @"alert4";
            [self.navigationController pushViewController:vc2 animated:YES];
        }
    }];
}

- (void)alert5
{
    /*! 5、完全自定义alert */
    _customView = [CustomView new];
    self.customView.frame = CGRectMake(50, SCREENHEIGHT - 300, SCREENWIDTH - 50 * 2, 162);

    BAKit_WeakSelf
    [BAAlert ba_alertShowCustomView:self.customView configuration:^(BAAlert *tempView) {
        BAKit_StrongSelf
        tempView.isTouchEdgeHide = YES;
        tempView.animatingStyle = BAAlertAnimatingStyleScale;
        self.alertView5 = tempView;
    }];
    
    self.customView.block = ^(NSInteger index) {
        BAKit_StrongSelf
        if (index == 1)
        {
            [self.alertView5 ba_alertHidden];
        }
    };
}

- (BOOL)prefersStatusBarHidden {
    return false;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.tableView.frame = self.view.bounds;
    
}

#pragma mark - setter / getter

- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        [self.view addSubview:self.tableView];
    }
    return _tableView;
}

- (NSArray *)dataArray
{
    if ( !_dataArray )
    {
        _dataArray = [NSArray arrayWithObjects:@[@"1、类似系统alert【加边缘手势消失】",
                                                 @"2、自定义按钮颜色",
                                                 @"3、自定义背景图片",
                                                 @"4、内置图片和文字，可滑动查看",
                                                 @"5、完全自定义alert"
                                                 ],
                      @[@"1、actionsheet 默认样式：title、subTitle、image",
                        @"2、actionsheet custom样式，类似于微博的 actionsheet",
                        @"3、actionsheet 展开选择样式，可以展开收回"],
                      @[@"1、手势触摸隐藏开关，可随时开关\n2、可以自定义背景图片、背景颜色、按钮颜色\n3、可以添加文字和图片，且可以滑动查看！\n4、横竖屏适配完美\n5、有各种炫酷动画展示你的alert\n6、可以自定义按钮颜色\n7、理论完全兼容现有所有 iOS 系统版本"
                        ], nil];
    }
    return _dataArray;
}

@end
