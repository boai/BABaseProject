//
//  DemoVC2_03.m
//  BABaseProject
//
//  Created by 博爱 on 16/7/14.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC2_03.h"

@interface DemoVC2_03 ()
<
    UITableViewDelegate,
    UITableViewDataSource
>
@property (nonatomic, strong) UITableView  *tableView;
@property (nonatomic, strong) NSArray      *titlesArray;

@end

@implementation DemoVC2_03

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.vcBgColor = BA_Yellow_Color;
    self.title = @"各种系统设置的跳转";
    
    self.tableView.hidden = NO;
}

/*! 调用父类中的处理方法 */
- (void)ba_netUse4Gnet
{
    BALog(@"使用3G/4G网络情况处理方法调用！");
}

- (NSArray *)titlesArray
{
    if (!_titlesArray)
    {
        _titlesArray = @[@"本APP设置的跳转",
                         @"跳到WIFI界面" ,
                         @"跳到General界面",
                         @"跳到About关于本机界面",
                         @"跳到Accessibility辅助功能界面",
                         @"跳到AirplaneModeOn飞行模式界面",
                         @"跳到Auto-Lock自动锁屏时间界面" ,
                         @"跳到Brightness自动锁定界面",
                         @"跳到MICROPHONE麦克风界面",
                         @"跳到CONTACTS通讯录界面",
                         @"跳到Bluetooth蓝牙界面" ,
                         @"跳到DATE_AND_TIME日期和时间界面",
                         @"跳到FaceTime界面",
                         @"跳到Keyboard界面",
                         @"跳到iCloud界面"
                         ];

    }
    return _titlesArray;
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
    
    cell.textLabel.text = self.titlesArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*! 点击立刻取消该cell的选中状态 */
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
            [self ba_gotoSystermSettings];
            break;
        case 1:
            [self ba_gotoSystermWIFISettings];
            break;
        case 2:
            [self ba_gotoSystermGeneralSettings];
            break;
        case 3:
            [self ba_gotoSystermAboutSettings];
            break;
        case 4:
            [self ba_gotoSystermAccessibilitySettings];
            break;
        case 5:
            [self ba_gotoSystermAirplaneModeOnSettings];
            break;
        case 6:
            [self ba_gotoSystermAutoLockSettings];
            break;
        case 7:
            [self ba_gotoSystermBrightnessSettings];
            break;
        case 8:
            [self ba_gotoSystermMICROPHONESettings];
            break;
        case 9:
            [self ba_gotoSystermCONTACTSSettings];
            break;
        case 10:
            [self ba_gotoSystermBluetoothSettings];
            break;
        case 11:
            [self ba_gotoSystermDATE_AND_TIMESettings];
            break;
        case 12:
            [self ba_gotoSystermFaceTimeSettings];
            break;
        case 13:
            [self ba_gotoSystermKeyboardSettings];
            break;
        case 14:
            [self ba_gotoSystermiCloudSettings];
            break;
            
            

        default:
            break;
    }
}



@end
