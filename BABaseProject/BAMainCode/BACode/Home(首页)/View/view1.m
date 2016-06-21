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
{
    BOOL isShowAnimation;
}
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
//        _tableView.frame = CGRectMake(0, 0, BA_SCREEN_WIDTH, BA_SCREEN_HEIGHT - BA_getTabbarHeight);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorColor = [UIColor redColor];
        
        [self creatData];
        [self modelData];
        [self addSubview:_tableView];
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0 , 0, 0, 0));
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
        
        isShowAnimation = NO;

        [self viewDidLayoutSubviews];
        

    }
    return self;
}



- (void)creatData
{
    [self addCell:@"1、AFNetWorking的完美封装" content:@"封装AFN，实现简单的get和post请求，可以自定义请求头，可以解析json数据、xml数据、data数据，可以获取缓存数据。" class:@"DemoVC1"];
    [self addCell:@"2、清理缓存" content:@"清理网络请求缓存和图片缓存，可清理系统缓存！" class:@"DemoVC2"];
    [self addCell:@"3、点击button倒计时" content:@"两种比较常用的获取倒计时验证码的样式！新增一种自定义警告框，可以点击屏幕消失！新增了一种跑马灯广告效果，希望能帮助部分用户！" class:@"DemoVC3"];
    [self addCell:@"4、友盟分享和友盟登陆的完美封装" content:@"包含：微博、微信、朋友圈、QQ、空间、短信的分享和登陆，可以使用默认列表，也可以自定义单个分享和登陆！" class:@"DemoVC4"];
    [self addCell:@"5、正则表达式最新封装" content:@"包含：手机号码、运营商类型(判断移动、联通、电信)、邮箱、数字、中英文、URL、身份证号码等！还可以文字筛选高亮显示！" class:@"DemoVC5"];
    [self addCell:@"6、本地通知最新完美封装" content:@"最近整理了下本地通知和极光推送，有很多坑都踩过了，刚刚整理出来的完美封装，肯定适合大部分场合，也可以用此封装写闹钟，也提醒事件，都可以！【刚添加了本地通知的跳转事件处理！】如果喜欢，请在git上点个星吧！" class:@"DemoVC6"];
    [self addCell:@"7、webView和WKWebView完美封装" content:@"webView和WKWebView的封装，简单的内置浏览器，有简单的功能，后期有新功能会加上！如果喜欢，请在git上点个星吧！" class:@"DemoVC7"];
    [self addCell:@"8、系统提醒和日历提醒" content:@"最近做了一个预约功能，有用到系统提醒和日历提醒，就写了这个demo！如果喜欢，请在git上点个星吧！" class:@"DemoVC8"];
    [self addCell:@"9、流式布局和线性布局库的使用" content:@"用流式布局和线性布局库MyLayout，写了一个collectionView，如果喜欢，请在git上点个星吧！" class:@"DemoVC9"];
    [self addCell:@"10、collectionView的简单使用" content:@"用View写的写了一个简单的collectionView，可随意添加到任何地方，如果喜欢，请在git上点个星吧！" class:@"DemoVC10"];
    [self addCell:@"11、collectionView的浮动布局" content:@"自适应宽高的collectionView，自定义layout，如果喜欢，请在git上点个星吧！" class:@"DemoVC11"];
    [self addCell:@"12、各种自定义弹框" content:@"各种自定义弹框，系统的、自定义的弹框，如果喜欢，请在git上点个星吧！" class:@"DemoVC12"];

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
    
    /*! 点击立刻取消该cell的选中状态 */
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
    
    /*! 第一种：3d xyz三维坐标刚出现0.1 0.1 1  0.5 s后正常 */
//    cell.layer.transform = CATransform3DMakeScale(0.1,0.1,1);
//    [UIView animateWithDuration:0.6 animations:^{
//        
//        cell.layer.transform = CATransform3DMakeScale(1,1,1);
//        
//    }];
    
    /*! 第二种：卡片式动画 */
    static CGFloat initialDelay = 0.2f;
    static CGFloat stutter = 0.06f;
    
    cell.contentView.transform =  CGAffineTransformMakeTranslation(SCREEN_WIDTH, 0);
    
    [UIView animateWithDuration:1.0f delay:initialDelay + ((indexPath.row) * stutter) usingSpringWithDamping:0.6 initialSpringVelocity:0 options:0 animations:^{
        cell.contentView.transform = CGAffineTransformIdentity;
    } completion:NULL];
    
    /*! 第三种：从下往上 */
    
//    [UIView animateWithDuration:1 animations:^{
//        
//        cell.layer.transform = CATransform3DMakeTranslation(0, 0, 0);
//        
//    }];
    
    /*! 第四种：右下角出来 */
    
//    cell.layer.transform = CATransform3DMakeTranslation(SCREEN_WIDTH, SCREEN_HEIGHT, 0);
//    
//    [UIView animateWithDuration:0.5 animations:^{
//        
//        cell.layer.transform = CATransform3DMakeTranslation(0, 0, 0);
//        
//    }];
    
     /*! 第五种：右上角出现 */
    
//    cell.layer.transform = CATransform3DMakeTranslation(SCREEN_WIDTH, -SCREEN_HEIGHT, 0);

    /*! 第六种：翻转动画 */
//    CATransform3D rotation;
//    rotation = CATransform3DMakeRotation( (90.0*M_PI)/180, 0.0, 0.7, 0.4);
//    rotation.m44 = 1.0/ -600;
//    //阴影
//    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
//    
//    //阴影偏移
//    cell.layer.shadowOffset = CGSizeMake(10, 10);
//    cell.alpha = 0;
//    cell.layer.transform = rotation;
//    //锚点
//    cell.layer.anchorPoint = CGPointMake(0.5, 0.5);
//    [UIView beginAnimations:@"rotation" context:NULL];
//    [UIView setAnimationDuration:0.8];
//    cell.layer.transform = CATransform3DIdentity;
//    cell.alpha = 1;
//    cell.layer.shadowOffset = CGSizeMake(0, 0);
//    [UIView commitAnimations];

    /*! 第七种：扇形动画 */
//    NSArray *array = tableView.indexPathsForVisibleRows;
//    
//    NSIndexPath *firstIndexPath = array[0];
//    //设置anchorPoint﻿
//    cell.layer.anchorPoint = CGPointMake(0, 0.5);
//    
//    //为了防止cell视图移动，重新把cell放回原来的位置﻿
//    cell.layer.position = CGPointMake(0, cell.layer.position.y);
//     //设置cell 按照z轴旋转90度，注意是弧度﻿
//    if (firstIndexPath.row < indexPath.row)
//    {
//        cell.layer.transform = CATransform3DMakeRotation(M_PI_2, 0, 0, 1.0);
//    }
//    else
//    {
//        cell.layer.transform = CATransform3DMakeRotation(- M_PI_2, 0, 0, 1.0);
//    }
//    cell.alpha = 0.0;
//    [UIView animateWithDuration:1 animations:^{
//        
//        cell.layer.transform = CATransform3DIdentity;
//        
//        cell.alpha = 1.0;
//        
//    }];
}

@end
