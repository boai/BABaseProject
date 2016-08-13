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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
#ifdef BA_SIMULATOR_TEST
    [self.view ba_showAlertView:@"温馨提示：" message:@"请在真机中运行！"];
#endif
}

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
        _titlesArray = @[@"1、本APP设置的跳转",
                         @"2、跳到WIFI界面" ,
                         @"3、跳到General界面",
                         @"4、跳到About关于本机界面",
                         @"5、跳到Accessibility辅助功能界面",
                         @"6、跳到AirplaneModeOn飞行模式界面",
                         @"7、跳到Auto-Lock自动锁屏时间界面" ,
                         @"8、跳到Brightness自动锁定界面",
                         @"9、跳到MICROPHONE麦克风界面",
                         @"10、跳到CONTACTS通讯录界面",
                         @"11、跳到Bluetooth蓝牙界面" ,
                         @"12、跳到DATE_AND_TIME日期和时间界面",
                         @"13、跳到FaceTime界面",
                         @"14、跳到Keyboard界面",
                         @"15、跳到iCloud界面"
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

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 圆角弧度半径
    CGFloat cornerRadius = 6.f;
    // 设置cell的背景色为透明，如果不设置这个的话，则原来的背景色不会被覆盖
    cell.backgroundColor = UIColor.clearColor;
    
    // 创建一个shapeLayer
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    CAShapeLayer *backgroundLayer = [[CAShapeLayer alloc] init]; //显示选中
    // 创建一个可变的图像Path句柄，该路径用于保存绘图信息
    CGMutablePathRef pathRef = CGPathCreateMutable();
    // 获取cell的size
    // 第一个参数,是整个 cell 的 bounds, 第二个参数是距左右两端的距离,第三个参数是距上下两端的距离
    CGRect bounds = CGRectInset(cell.bounds, 10, 0);
    
    // CGRectGetMinY：返回对象顶点坐标
    // CGRectGetMaxY：返回对象底点坐标
    // CGRectGetMinX：返回对象左边缘坐标
    // CGRectGetMaxX：返回对象右边缘坐标
    // CGRectGetMidX: 返回对象中心点的X坐标
    // CGRectGetMidY: 返回对象中心点的Y坐标
    
    // 这里要判断分组列表中的第一行，每组section的第一行，每组section的中间行
    
    // CGPathAddRoundedRect(pathRef, nil, bounds, cornerRadius, cornerRadius);
    if (indexPath.row == 0)
    {
        // 初始起点为cell的左下角坐标
        CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds));
        // 起始坐标为左下角，设为p，（CGRectGetMinX(bounds), CGRectGetMinY(bounds)）为左上角的点，设为p1(x1,y1)，(CGRectGetMidX(bounds), CGRectGetMinY(bounds))为顶部中点的点，设为p2(x2,y2)。然后连接p1和p2为一条直线l1，连接初始点p到p1成一条直线l，则在两条直线相交处绘制弧度为r的圆角。
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds), CGRectGetMidX(bounds), CGRectGetMinY(bounds), cornerRadius);
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
        // 终点坐标为右下角坐标点，把绘图信息都放到路径中去,根据这些路径就构成了一块区域了
        CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds));
        CGPathCloseSubpath(pathRef);
        
    }
    else if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section]-1)
    {
        // 初始起点为cell的左上角坐标
        CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds));
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds), CGRectGetMidX(bounds), CGRectGetMaxY(bounds), cornerRadius);
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
        // 添加一条直线，终点坐标为右下角坐标点并放到路径中去
        CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds));
    }
    else
    {
        // 添加cell的rectangle信息到path中（不包括圆角）
        CGPathAddRect(pathRef, nil, bounds);
    }
    // 把已经绘制好的可变图像路径赋值给图层，然后图层根据这图像path进行图像渲染render
    layer.path = pathRef;
    backgroundLayer.path = pathRef;
    // 注意：但凡通过Quartz2D中带有creat/copy/retain方法创建出来的值都必须要释放
    CFRelease(pathRef);
    // 按照shape layer的path填充颜色，类似于渲染render
    //     layer.fillColor = [UIColor colorWithWhite:1.f alpha:0.8f].CGColor;
    layer.fillColor = [UIColor whiteColor].CGColor;
    layer.strokeColor = [UIColor lightGrayColor].CGColor;
    
    // view大小与cell一致
    UIView *roundView = [[UIView alloc] initWithFrame:bounds];
    // 添加自定义圆角后的图层到roundView中
    [roundView.layer insertSublayer:layer atIndex:0];
    roundView.backgroundColor = UIColor.clearColor;
    // cell的背景view
    cell.backgroundView = roundView;
    
    // 以上方法存在缺陷当点击cell时还是出现cell方形效果，因此还需要添加以下方法
    // 如果你 cell 已经取消选中状态的话,那以下方法是不需要的.
    UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:bounds];
    backgroundLayer.fillColor = [UIColor cyanColor].CGColor;
    [selectedBackgroundView.layer insertSublayer:backgroundLayer atIndex:0];
    selectedBackgroundView.backgroundColor = UIColor.clearColor;
    cell.selectedBackgroundView = selectedBackgroundView;
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
