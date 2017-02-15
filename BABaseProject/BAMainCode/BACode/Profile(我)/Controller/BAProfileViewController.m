//
//  BAProfileViewController.m
//  BABaseProject
//
//  Created by 博爱 on 16/5/3.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BAProfileViewController.h"
#import "BAProfileHeadCell.h"
#import "BALoginViewController.h"

#define BAProfile_Title   @"title"
#define BAProfile_Image   @"image"

#define BAProfile_CellID  @"BAProfileHeadCell"
#define BAProfile_CellID2 @"BAProfileCell"

@interface BAProfileViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource
>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) BALoginViewController *loginVC;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation BAProfileViewController

#pragma mark - life cycle
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];


}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
}

#pragma mark - 私有方法
- (void)setupUI
{
    self.title                     = @"我 的";
    self.view.backgroundColor      = BA_Red_Color;
    
    self.tableView.delegate        = self;
    self.tableView.dataSource      = self;
    self.tableView.tableFooterView = [UIView new];
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:BAProfile_CellID2];

    _loginVC                       = [BALoginViewController new];
    [self addNoti];
}

- (void)openAppWithAlert:(NSString *)msg
{
    [self.view ba_showAlertView:@"网页打开APP，带传参：" message:msg];
}

#pragma mark - 通知
- (void)addNoti
{
    [BA_NotiCenter addObserver:self selector:@selector(loginFinishAction:) name:BANotioKey_LoginFinish object:nil];
}

#pragma mark - UITableView Delegate / UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return (1 == section) ? 4:1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (0 == indexPath.section)
    {
        //        BAProfileHeadCell *headCell = [tableView dequeueReusableCellWithIdentifier:@"BAProfileHeadCell"];
        BAProfileHeadCell *headCell = [BAProfileHeadCell dequeueCellFromNibIndex:indexPath.section identify:BAProfile_CellID tableView:tableView];
        headCell.model = BAUSERSHARE;
        return headCell;
    }
    else
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:BAProfile_CellID2];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        if (1 == indexPath.section)
        {
            NSDictionary *dict = self.dataArray[indexPath.row];
            cell.textLabel.text  = dict[BAProfile_Title];
            cell.imageView.image = BA_ImageName(dict[BAProfile_Image]);
        }
        else if (2 == indexPath.section)
        {
            cell.textLabel.text = @"表情";
            cell.imageView.image = BA_ImageName(@"profileVC.bundle/MoreExpressionShops");
        }
        else if (3 == indexPath.section)
        {
            cell.textLabel.text = @"设置";
            cell.imageView.image = BA_ImageName(@"profileVC.bundle/MoreSetting");
        }
        
        return cell;
    }
    return [UITableViewCell new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (0 == indexPath.section) ? 82:42;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return (0 == section) ? 15:20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return FLT_MIN;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (!BAUSERSHARE.isLogin)
    {
        [BAJumpManager ba_gotoLoginVCWithViewController:self];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (1 == indexPath.section)
    {
        if ([cell respondsToSelector:@selector(setSeparatorInset:)])
        {
            [cell setSeparatorInset:UIEdgeInsetsMake(0, 15, 0, 0)];
        }
        if ([cell respondsToSelector:@selector(setLayoutMargins:)])
        {
            [cell setLayoutMargins:UIEdgeInsetsMake(0, 15, 0, 0)];
        }
    }
}

#pragma mark - Custom Delegate


#pragma mark - event response
- (void)loginFinishAction:(NSNotification *)noti
{
    NSDictionary *dict = noti.userInfo;
    if ([dict[@"isLogin"] isEqualToString:@"1"])
    {
        [self.tableView reloadData];
    }
}

#pragma mark - getters and setters
- (NSArray *)dataArray
{
    if (!_dataArray)
    {
        _dataArray = @[
                       @{
                           BAProfile_Title : @"相册",
                           BAProfile_Image : @"profileVC.bundle/MoreMyAlbum"
                           },
                       @{
                           BAProfile_Title : @"收藏",
                           BAProfile_Image : @"profileVC.bundle/MoreMyFavorites"
                           },
                       @{
                           BAProfile_Title : @"钱包",
                           BAProfile_Image : @"profileVC.bundle/MoreMyBankCard"
                           },
                       @{
                           BAProfile_Title : @"卡包",
                           BAProfile_Image : @"profileVC.bundle/MyCardPackageIcon"
                           }
                       ];
        
    }
    return _dataArray;
}

#pragma mark - dealloc
- (void)dealloc
{
//    [BA_NotiCenter removeObserver:self];
    [BA_NotiCenter removeObserver:self name:BANotioKey_LoginFinish object:nil];

}

@end
