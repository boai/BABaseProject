//
//  DemoVC11.m
//  BABaseProject
//
//  Created by 博爱 on 16/6/1.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC11.h"
#import "DemoVC11_model.h"
#import "DemoVC11_Cell.h"
#import "DemoVC11_AutoLayout.h"
#import "BANewsNetManager.h"

static NSString * const DemoVC11_cellID = @"DemoVC11_Cell";

@interface DemoVC11 ()
<
    UICollectionViewDataSource,
    UICollectionViewDelegate,
    DemoVC11_AutoLayoutDelegate
>
{
    int page;
}
@property (nonatomic, strong) UICollectionView  *collectionView;
@property (nonatomic, strong) NSMutableArray    *dataArray;
@property (nonatomic, strong) BANewsNetManager  *netManager;

@end

@implementation DemoVC11

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupLayout];
}

- (void)setupLayout
{
    self.collectionView.hidden = NO;
    /*! 添加上下拉刷新 */
    [self setupRefreshView];
}

#pragma mark - ***** setter / getter
- (UICollectionView *)collectionView
{
    if (!_collectionView)
    {
        DemoVC11_AutoLayout *layout     = [DemoVC11_AutoLayout new];
        /*! 列数 */
        layout.columCounts              = 3;
        /*! 列间距 */
        layout.columSpace               = 5;
        /*! 行间距 */
        layout.itemSpace                = 5;
        /*! 边距 */
        layout.edgeInsets               = UIEdgeInsetsMake(10, 10, 10, 10);
        layout.delegate                 = self;
        

        _collectionView                 = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = BAKit_Color_Yellow;
        _collectionView.delegate        = self;
        _collectionView.dataSource      = self;
        
        [self.view addSubview:_collectionView];
        /*! 滚动条隐藏 */
        _collectionView.showsVerticalScrollIndicator = NO;
        
        [_collectionView registerClass:[DemoVC11_Cell class] forCellWithReuseIdentifier:DemoVC11_cellID];
        
        _collectionView.sd_layout.spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
    }
    return _collectionView;
}

- (NSMutableArray *)dataArray
{
    if (!_dataArray)
    {
        _dataArray = @[].mutableCopy;
    }
    return _dataArray;
}

#pragma mark - ***** 添加上下拉刷新
- (void)setupRefreshView
{
    BA_WEAKSELF;
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
//    [self.collectionView addHeaderRefresh:^{
        [self loadNewData];
//    }];
    // 马上进入刷新状态
    [self.collectionView.mj_header beginRefreshing];
    
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    [self.collectionView addFooterRefresh:^{
        [weakSelf loadMoreData];
    }];
    
    self.collectionView.mj_footer.automaticallyHidden = true;
}

- (void)loadNewData
{
    [self getDataWithHead:YES];
}

- (void)loadMoreData
{
    [self getDataWithHead:NO];
}

#pragma mark - *****  接口数据
- (void)getDataWithHead:(BOOL)isHead
{
    if (isHead)
    {
        page = 1;
    }
    else
    {
        if (page < 2)
        {
            page = 2;
        }
    }
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:@(page).stringValue, @"page", @"", @"per_page", nil];;
    
    BA_WEAKSELF;
//    [self BA_showAlert:BA_Loading];
    [self ba_showBallLoadingView:YES];
    [BANewsNetManager postDemoVC11DataWithParameters:parameters completionHandle:^(id model, NSError *error) {
        
//        [weakSelf BA_hideProgress];
        [weakSelf ba_showBallLoadingView:NO];

        if (isHead)
        {
            [weakSelf.collectionView.mj_header endRefreshing];
        }
        else
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.collectionView.mj_footer endRefreshing];
            });
        }
        
        if (!error)
        {
            if (model)
            {
                if (isHead) [weakSelf.dataArray removeAllObjects];
                else page++;
                
                NSArray *array = (NSArray *)model;
                [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    [weakSelf.dataArray addObject:obj];
                }];
                
                [GCDQueue executeInMainQueue:^{
                    weakSelf.collectionView.contentOffset = CGPointZero;
                    [weakSelf.collectionView reloadData];
                }];
            }
            else
            {
                if (page > 1)
                {
//                    [(MJRefreshAutoGifFooter *)weakSelf.collectionView.mj_footer setTitle:@"空空如也" forState:MJRefreshStateIdle];
                }
                else
                {
//                    [(MJRefreshAutoGifFooter *)weakSelf.collectionView.mj_footer setTitle:@"" forState:MJRefreshStateIdle];
                }
            }
        }
        else
        {
            [weakSelf BA_showAlertWithTitle:@"解析错误！"];
        }
    }];
}

#pragma mark - ***** UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DemoVC11_Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DemoVC11_cellID forIndexPath:indexPath];
    DemoVC11_model *model = self.dataArray[indexPath.row];
    cell.model          = model;
    cell.backgroundColor = BAKit_Color_Green;
    
    if (![cell.model.desc ba_stringIsNotBlank])
    {
        cell.titleLabel.text = @(indexPath.item).stringValue;
    }
    else
    {
        cell.titleLabel.text = cell.model.desc;
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *msg = [NSString stringWithFormat:@"你点击了第 %ld 个item！", (long)indexPath.item];
    [self.view ba_showAlertView:@"温馨提示：" message:msg];
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(8_0)
{
    /*! 第二种：卡片式动画 */
//    static CGFloat initialDelay = 0.2f;
//    static CGFloat stutter = 0.06f;
//    
//    cell.contentView.transform =  CGAffineTransformMakeTranslation(SCREEN_WIDTH, 0);
//    
//    [UIView animateWithDuration:1.0f delay:initialDelay + ((indexPath.row) * stutter) usingSpringWithDamping:0.6 initialSpringVelocity:0 options:0 animations:^{
//        cell.contentView.transform = CGAffineTransformIdentity;
//    } completion:NULL];
    
    
    /*! 第七种：扇形动画 */
    if (indexPath.row % 2 != 0)
    {
        cell.transform = CGAffineTransformTranslate(cell.transform, BA_SCREEN_WIDTH/2,0);
    }
    else
    {
        cell.transform = CGAffineTransformTranslate(cell.transform, -BA_SCREEN_WIDTH/2, 0);
    }

    cell.alpha = 0.0;

    [UIView animateWithDuration:0.7 animations:^{

        cell.transform = CGAffineTransformIdentity;

        cell.alpha = 1.0;
        
    } completion:^(BOOL finished) {
    }];
}

#pragma mark - ***** DemoVC11_AutoLayoutDelegate 设置图片高度
- (CGFloat) layout:(BALayout *)layout heightForItemAtIndexPath:(NSIndexPath *)indexpath width:(CGFloat)width
{
    DemoVC11_model *model = self.dataArray[indexpath.row];
    CGFloat height        = width * model.height.doubleValue / model.width.doubleValue + 25;
    return height;
}








@end
