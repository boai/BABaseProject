//
//  ViewController.m
//  BAAlertController
//
//  Created by boai on 2017/6/5.
//  Copyright © 2017年 boai. All rights reserved.
//

#import "DemoVC2_05_test3.h"

#import "UIAlertController+BAKit.h"

/*!
 *  获取屏幕宽度和高度
 */
#define BAKit_SCREEN_WIDTH ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)

#define BAKit_SCREEN_HEIGHT ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)

static NSString * const title0 = @"博爱温馨提示";
static NSString * const msg0 = @"欢迎使用 iPhone SE，迄今最高性能的 4 英寸 iPhone。在打造这款手机时，我们在深得人心的 4 英寸设计基础上，从里到外重新构想。它所采用的 A9 芯片，正是在 iPhone 6s 上使用的先进芯片。1200 万像素的摄像头能拍出令人叹为观止的精彩照片和 4K 视频，而 Live Photos 则会让你的照片栩栩如生。这一切，成就了一款外形小巧却异常强大的 iPhone。";
static NSString * const msg1 = @"欢迎使用 iPhone SE，迄今最高性能的 4 英寸 iPhone。在打造这款手机时，我们在深得人心的 4 英寸设计基础上，从里到外重新构想。它所采用的 A9 芯片，正是在 iPhone 6s 上使用的先进芯片。1200 万像素的摄像头能拍出令人叹为观止的精彩照片和 4K 视频，而 Live Photos 则会让你的照片栩栩如生。这一切，成就了一款外形小巧却异常强大的 iPhone。\n对于 MacBook，我们给自己设定了一个几乎不可能实现的目标：在有史以来最为轻盈纤薄的 Mac 笔记本电脑上，打造全尺寸的使用体验。这就要求每个元素都必须重新构想，不仅令其更为纤薄轻巧，还要更加出色。最终我们带来的，不仅是一部新款的笔记本电脑，更是一种对笔记本电脑的前瞻性思考。现在，有了第六代 Intel 处理器、提升的图形处理性能、高速闪存和最长可达 10 小时的电池使用时间*，MacBook 的强大更进一步。\n欢迎使用 iPhone SE，迄今最高性能的 4 英寸 iPhone。在打造这款手机时，我们在深得人心的 4 英寸设计基础上，从里到外重新构想。它所采用的 A9 芯片，正是在 iPhone 6s 上使用的先进芯片。1200 万像素的摄像头能拍出令人叹为观止的精彩照片和 4K 视频，而 Live Photos 则会让你的照片栩栩如生。这一切，成就了一款外形小巧却异常强大的 iPhone。\n对于 MacBook，我们给自己设定了一个几乎不可能实现的目标：在有史以来最为轻盈纤薄的 Mac 笔记本电脑上，打造全尺寸的使用体验。这就要求每个元素都必须重新构想，不仅令其更为纤薄轻巧，还要更加出色。最终我们带来的，不仅是一部新款的笔记本电脑，更是一种对笔记本电脑的前瞻性思考。现在，有了第六代 Intel 处理器、提升的图形处理性能、高速闪存和最长可达 10 小时的电池使用时间*，MacBook 的强大更进一步。";
static NSString * const msg2 = @"请输入账号密码";


@interface DemoVC2_05_test3 ()
<
    UITableViewDelegate,
    UITableViewDataSource
>

@property(nonatomic, strong) UITableView *tableView;
@property(strong, nonatomic) NSArray *dataArray;

@property(nonatomic, strong) NSIndexPath *indexPath;

@end

@implementation DemoVC2_05_test3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupUI];
}

- (void)setupUI
{
    self.title = @"BAAlertController";
    self.tableView.hidden = NO;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.tableView.frame = self.view.bounds;
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
        cell.accessoryType = (indexPath.section == 0) ? UITableViewCellAccessoryDisclosureIndicator : UITableViewCellAccessoryNone;
    }
    NSArray *tempArray = self.dataArray[indexPath.section];
    cell.textLabel.text = tempArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    self.indexPath = indexPath;
    if ( 0 == indexPath.section )
    {
        switch ( indexPath.row ) {
            case 0:
            {
                [self alertController1];
            }
                break;
            case 1:
            {
                [self alertController2];
            }
                break;
            case 2:
            {
                [self alertController3];
            }
                break;
            case 3:
            {
                [self alertController4];
            }
                break;
            case 4:
            {
                [self alertController5];
            }
                break;
            case 5:
            {
                [self alertController6];
            }
                break;
                
            default:
                break;
        }
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [UIView new];
    
    UILabel *headerTitle = [UILabel new];
    headerTitle.font = [UIFont systemFontOfSize:14];
    headerTitle.textColor = [UIColor redColor];
    headerTitle.numberOfLines = 0;
    [headerView addSubview:headerTitle];
    
    headerTitle.frame = CGRectMake(20, 0, BAKit_SCREEN_WIDTH - 40, 40);
    headerTitle.text = (0 == section) ? @"UIAlertController 的几种日常用法！" : @"BAAlertController 的特点！";
    
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

#pragma mark - custom method

- (void)alertController1
{
    [UIAlertController ba_alertShowInViewController:self
                                              title:title0
                                            message:msg0
                                   buttonTitleArray:@[@"取 消", @"确 定"]
                              buttonTitleColorArray:@[BAKit_Color_Green, BAKit_Color_Red]
                                              block:^(UIAlertController * _Nonnull alertController, UIAlertAction * _Nonnull action, NSInteger buttonIndex) {
      NSString *msg = [NSString stringWithFormat:@"你点击了第 %ld 个按钮！", (long)buttonIndex];
      BAKit_ShowAlertWithMsg_ios8(msg);
    }];
}

- (void)alertController2
{
    [UIAlertController ba_alertShowInViewController:self
                                              title:title0
                                            message:msg0
                                   buttonTitleArray:@[@"取 消", @"确 定", @"确 定1", @"确 定2"]
                              buttonTitleColorArray:@[BAKit_Color_Green, BAKit_Color_Red]
                                              block:^(UIAlertController * _Nonnull alertController, UIAlertAction * _Nonnull action, NSInteger buttonIndex) {
                                                  NSString *msg = [NSString stringWithFormat:@"你点击了第 %ld 个按钮！", (long)buttonIndex];
                                                  BAKit_ShowAlertWithMsg_ios8(msg);
                                                  
                                              }];
}

- (void)alertController3
{
    // AlertController 的 textField placeholder 数组，根据这个添加 textField
    NSArray *textFieldPlaceholderArray = @[@"用户名/手机号/邮箱", @"密码"];
    [UIAlertController ba_alert2ShowInViewController:self title:msg2 message:nil  buttonTitleArray:@[@"取 消", @"确 定"] buttonTitleColorArray:@[BAKit_Color_Green, BAKit_Color_Red] buttonEnabledNoWithTitleArray:@[@"确 定"] textFieldPlaceholderArray:textFieldPlaceholderArray textFieldConfigurationActionBlock:^(UITextField * _Nullable textField, NSInteger index) {
        // 添加通知，监听 textField 输入的文字变化
        [BAKit_NotiCenter addObserver:self selector:@selector(handleAlertTextFieldDidChangeAction:) name:UITextFieldTextDidChangeNotification object:textField];

        if (index == 0)
        {
            textField.keyboardType = UIKeyboardTypeNumberPad;
        }
        if (index == 1)
        {
            textField.secureTextEntry = YES;
        }
        
    } block:^(UIAlertController * _Nonnull alertController, UIAlertAction * _Nonnull action, NSInteger buttonIndex) {
        UITextField *loginTextField = alertController.textFields[0];
        UITextField *passwordTextField = alertController.textFields[1];

        NSString *msg = [NSString stringWithFormat:@"你点击了第 %ld 个按钮！\n账号：%@\n密码：%@", (long)buttonIndex, loginTextField.text, passwordTextField.text];
        BAKit_ShowAlertWithMsg_ios8(msg);
        [BAKit_NotiCenter removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];

    }];
}

- (void)handleAlertTextFieldDidChangeAction:(NSNotification *)notification
{
    // 通知处理，判断文字输入的长度 大于 3 的时候，确定按钮可点击，否则，不可点击
    UIAlertController *alertController = (UIAlertController *)self.presentedViewController;
    if (alertController)
    {
        UITextField *login = alertController.textFields[0];
        UIAlertAction *sureAction = alertController.actions[1];
        sureAction.enabled = login.text.length > 3;
    }
}

- (void)alertController4
{
    NSMutableAttributedString *attributedTitle = [[NSMutableAttributedString alloc] initWithString:title0 attributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]}];
    
    NSString *result = @"当前用户未 登录 ，是否 登录 ？";
    NSString *keyWord = @"登录";
    
    /*! 关键字添加效果 */
    NSMutableAttributedString *attributedMessage = [[NSMutableAttributedString alloc]initWithString:result];
    
    /*! 获取关键字位置 */
    NSRange range = [result rangeOfString:keyWord];
    
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:[UIColor blackColor],NSKernAttributeName:@2.0,NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle),NSStrokeColorAttributeName:[UIColor blueColor],NSStrokeWidthAttributeName:@2.0,NSVerticalGlyphFormAttributeName:@(0)};
    
    /*! 设置关键字属性 */
    [attributedMessage ba_changeAttributeDict:dic range:range];
    
    [UIAlertController ba_alertAttributedShowInViewController:self
                                              attributedTitle:attributedTitle
                                            attributedMessage:attributedMessage
                                             buttonTitleArray:@[@"取 消", @"确 定"]
                                        buttonTitleColorArray:@[BAKit_Color_Green, BAKit_Color_Red]
                                                        block:^(UIAlertController * _Nonnull alertController, UIAlertAction * _Nonnull action, NSInteger buttonIndex) {
                                                            
                                                            NSString *msg = [NSString stringWithFormat:@"你点击了第 %ld 个按钮！", (long)buttonIndex];
                                                            BAKit_ShowAlertWithMsg_ios8(msg);
    }];
}

- (void)alertController5
{
    [UIAlertController ba_actionSheetShowInViewController:self title:title0 message:nil buttonTitleArray:@[@"safari打开", @"复制链接", @"分享", @"刷新"] buttonTitleColorArray:@[BAKit_Color_Red, BAKit_Color_Green, BAKit_Color_Yellow, BAKit_Color_Orange]  popoverPresentationControllerBlock:^(UIPopoverPresentationController * _Nonnull popover) {
        
        if (popover)
        {
            // 在使用 UITableViewCell 的frame属性获取origin得到的坐标是不变的. 也就是说如果UITableView初始化完毕后,每个cell的坐标是固定的,x不变,y 随index递增的. 经过测试发现,任何一个cell拖拽或则滑动到UITableView的任意相对位置,cell的frame属性都没有改变. 那怎样获取UITableViewCell相对于UITableView的坐标?
            CGRect rectInTableView = [self.tableView rectForRowAtIndexPath:self.indexPath];
            CGRect frame = [self.tableView convertRect:rectInTableView toView:[self.tableView superview]];
            popover.sourceView = self.view;
            popover.sourceRect = frame;
            // 如果用的是按钮点击需要做 iPad 版本适配的话，就需要在次设置
//            popover.sourceView = sender;
//            popover.sourceRect = sender.bounds;
            
            popover.permittedArrowDirections = UIPopoverArrowDirectionAny;
        }
    } block:^(UIAlertController * _Nonnull alertController, UIAlertAction * _Nonnull action, NSInteger buttonIndex) {
        NSString *msg = [NSString stringWithFormat:@"你点击了第 %ld 个按钮！", (long)buttonIndex];
        BAKit_ShowAlertWithMsg_ios8(msg);
        
    }];
}

- (void)alertController6
{
    NSMutableAttributedString *attributedTitle = [[NSMutableAttributedString alloc] initWithString:title0 attributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]}];
    
    NSString *result = @"当前用户未 登录 ，是否 登录 ？";
    NSString *keyWord = @"登录";
    
    /*! 关键字添加效果 */
    NSMutableAttributedString *attributedMessage = [[NSMutableAttributedString alloc]initWithString:result];
    
    /*! 获取关键字位置 */
    NSRange range = [result rangeOfString:keyWord];
    
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:[UIColor blackColor],NSKernAttributeName:@2.0,NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle),NSStrokeColorAttributeName:[UIColor blueColor],NSStrokeWidthAttributeName:@2.0,NSVerticalGlyphFormAttributeName:@(0)};
    
    /*! 设置关键字属性 */
    [attributedMessage ba_changeAttributeDict:dic range:range];
    
    [UIAlertController ba_actionSheetAttributedShowInViewController:self attributedTitle:attributedTitle attributedMessage:attributedMessage buttonTitleArray:@[@"safari打开", @"复制链接", @"分享", @"刷新"] buttonTitleColorArray:@[BAKit_Color_Red, BAKit_Color_Green, BAKit_Color_Yellow, BAKit_Color_Orange] popoverPresentationControllerBlock:^(UIPopoverPresentationController * _Nonnull popover) {
        if (popover)
        {
            // 在使用 UITableViewCell 的frame属性获取origin得到的坐标是不变的. 也就是说如果UITableView初始化完毕后,每个cell的坐标是固定的,x不变,y 随index递增的. 经过测试发现,任何一个cell拖拽或则滑动到UITableView的任意相对位置,cell的frame属性都没有改变. 那怎样获取UITableViewCell相对于UITableView的坐标?
            CGRect rectInTableView = [self.tableView rectForRowAtIndexPath:self.indexPath];
            CGRect frame = [self.tableView convertRect:rectInTableView toView:[self.tableView superview]];
            popover.sourceView = self.view;
            popover.sourceRect = frame;
            // 如果用的是按钮点击需要做 iPad 版本适配的话，就需要在次设置
            //            popover.sourceView = sender;
            //            popover.sourceRect = sender.bounds;
            
            popover.permittedArrowDirections = UIPopoverArrowDirectionAny;
        }
    } block:^(UIAlertController * _Nonnull alertController, UIAlertAction * _Nonnull action, NSInteger buttonIndex) {
        NSString *msg = [NSString stringWithFormat:@"你点击了第 %ld 个按钮！", (long)buttonIndex];
        BAKit_ShowAlertWithMsg_ios8(msg);
        
    }];
}

#pragma mark - setter / getter

- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [UITableView new];
        self.tableView.delegate = self;
        self.tableView.dataSource =  self;
        self.tableView.estimatedRowHeight = 44;
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.backgroundColor = BAKit_Color_Gray_11;
        
        [self.view addSubview:self.tableView];
    }
    return _tableView;
}

- (NSArray *)dataArray
{
    if ( !_dataArray )
    {
        _dataArray = [NSArray arrayWithObjects:@[@"1、普通的 UIAlertController-alert，可以自由设置按钮数量、按钮颜色",
                                                 @"2、普通的 UIAlertController-alert，可以自由设置按钮数量、按钮颜色【多按钮样式，颜色数组和title数组个数不等】",
                                                 @"3、普通的 带 textField 的 UIAlertController-alert，可添加一个或者多个 textField",
                                                 @"4、NSMutableAttributedString 的UIAlertController-alert，可以自由设置 NSMutableAttributedString（title、message）按钮数量、按钮颜色",
                                                 @"5、普通的 UIAlertController-actionSheet，可以自由设置按钮数量、按钮颜色",
                                                 @"6、NSMutableAttributedString 的UIAlertController-actionSheet，可以自由设置 NSMutableAttributedString（title、message）按钮数量、按钮颜色",
                                                 ],
                      @[@"1、用分类封装系统的 UIAlertController，代码无侵入，简洁高效，一个block 搞定系统alert 和 actionSheet，\n2、可以自定义按钮数量、按钮颜色【多按钮样式，颜色数组和title数组个数不等情况下，默认蓝色】\n3、可以自定义 NSMutableAttributedString 的 alert 和 actionSheet，让你的 alert 更加炫酷\n4、理论完全兼容现有 iOS 8 以上系统版本"
                        ], nil];
    }
    return _dataArray;
}


@end
