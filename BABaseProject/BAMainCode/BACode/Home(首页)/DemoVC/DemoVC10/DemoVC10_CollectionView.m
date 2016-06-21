//
//  DemoVC10_CollectionView.m
//  BABaseProject
//
//  Created by 博爱 on 16/5/27.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC10_CollectionView.h"
#import "DemoVC10Model.h"
#import "DemoVC10Cell.h"
#import "DemoVC10_ReusableView.h"

static NSString * const cellID = @"DemoVC10Cell";
static NSString * const headerID = @"DemoVC10_ReusableView";

@interface DemoVC10_CollectionView ()
<
    UICollectionViewDataSource,
    UICollectionViewDelegate,
    UICollectionViewDelegateFlowLayout
>
@property (nonatomic, strong) UICollectionViewFlowLayout  *flowLayout;

@property (nonatomic, strong) NSMutableArray              *dataArray;


@end

@implementation DemoVC10_CollectionView


- (instancetype)initWithFrame:(CGRect)frame withblock:(selectItemIndexBlock)block
{
    if (self = [super initWithFrame:frame])
    {
        self.indexBlock = block;
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews
{
    self.collectionView.hidden = NO;
    /*! 添加监听者 */
//    [self.collectionView addObserver: self forKeyPath: @"contentOffset" options: NSKeyValueObservingOptionNew context: nil];
}

/*!
 *  监听属性值发生改变时回调
 */
//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
//{
//    CGFloat offset = self.collectionView.contentOffset.y;
//    CGFloat delta = offset / 64.f + 1.f;
//    delta = MAX(0, delta);
//    [self getCurrentViewController].navigationController.navigationBar.alpha = MIN(1, delta);
//}

#pragma mark - ***** setter / getter
- (UICollectionView *)collectionView
{
    if (!_collectionView)
    {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        /*! 横向滑动请改这里：UICollectionViewScrollDirectionHorizontal */
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_flowLayout];
        
        _collectionView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_collectionView];
        
        /*! Masonry用法 */
//        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.mas_equalTo(UIEdgeInsetsMake(0 , 0, 0, 0));
//        }];
        /*! SD用法 */
        _collectionView.sd_layout.spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
        
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
        [_collectionView registerClass:[DemoVC10Cell class] forCellWithReuseIdentifier:cellID];
        [_collectionView registerClass:[DemoVC10_ReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerID];
        
        /*! 默认是正常状态 */
        _cellState = DemoVC10_cellStateNormal;
    }
    return _collectionView;
}

- (NSMutableArray *)dataArray
{
    if (!_dataArray)
    {
        _dataArray = @[].mutableCopy;
        
        NSArray *imageArray = @[@"BACollectionView.bundle/1.png",
                                @"BACollectionView.bundle/2.png",
                                @"BACollectionView.bundle/3.png",
                                @"BACollectionView.bundle/4.png",
                                @"BACollectionView.bundle/5.png",
                                @"BACollectionView.bundle/6.png",
                                @"BACollectionView.bundle/7.png",
                                @"BACollectionView.bundle/8.png",
                                @"BACollectionView.bundle/9.png"
                                ];
        NSArray *descArray = @[@"博爱",
                               @"小明",
                               @"张三",
                               @"我是小明的老师",
                               @"小三"];
        
        for (int j = 0; j < 12; j ++)
        {
            int imageRandomIndex = arc4random_uniform(5);
            int descRandomIndex = arc4random_uniform(5);
            
            DemoVC10Model *model      = [DemoVC10Model new];
            model.imageName     = imageArray[imageRandomIndex];
            model.desc          = descArray[descRandomIndex];
            
            [_dataArray addObject:model];
        }
        
    }
    return _dataArray;
}

#pragma mark - ***** UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DemoVC10Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    
    cell.model = self.dataArray[indexPath.row];
    
    /*! 设置删除按钮 */
    /*! 点击编辑按钮触发事件 */
    if (_cellState == DemoVC10_cellStateNormal)
    {
        /*! 正常情况下，所有删除按钮都隐藏； */
        cell.deleteButton.hidden = YES;
    }
    else
    {
        cell.deleteButton.hidden = NO;
    }
    
    [cell.deleteButton addTarget:self action:@selector(deleteButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

- (IBAction)deleteButtonAction:(UIButton *)sender
{
    /*! 获取cell */
    DemoVC10Cell *cell = (DemoVC10Cell *)[[sender superview] superview];
    /*! 获取cell */
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
    NSLog(@"删除按钮，section:%ld ,   row: %ld",(long)indexPath.section,(long)indexPath.row);

    /*! 删除cell */
//    DemoVC10Model *model = [self.dataArray objectAtIndex:indexPath.row];
    [self.dataArray removeObjectAtIndex:indexPath.row];
    [self.collectionView reloadData];
    NSLog(@"删除按钮，section:%ld ,   row: %ld",(long)indexPath.section,(long)indexPath.row);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.indexBlock(self.collectionView, indexPath, [_dataArray mutableCopy]);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusable = nil;
    if (kind == UICollectionElementKindSectionHeader)
    {
        DemoVC10_ReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerID forIndexPath:indexPath];
        headerView.titleLabel.text = [NSString stringWithFormat:@"此处是分区头：%ld", (long)indexPath.section];
        reusable = headerView;
    }
    return reusable;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(8_0)
{
    /*! 第二种：卡片式动画 */
    static CGFloat initialDelay = 0.2f;
    static CGFloat stutter = 0.06f;
    
    cell.contentView.transform =  CGAffineTransformMakeTranslation(SCREEN_WIDTH, 0);
    
    [UIView animateWithDuration:1.0f delay:initialDelay + ((indexPath.row) * stutter) usingSpringWithDamping:0.6 initialSpringVelocity:0 options:0 animations:^{
        cell.contentView.transform = CGAffineTransformIdentity;
    } completion:NULL];
    
    
    /*! 第七种：扇形动画 */
//    if (indexPath.row % 2 != 0)
//    {
//        cell.transform = CGAffineTransformTranslate(cell.transform, BA_SCREEN_WIDTH/2,0);
//    }
//    else
//    {
//        cell.transform = CGAffineTransformTranslate(cell.transform, -BA_SCREEN_WIDTH/2, 0);
//    }
//    
//    cell.alpha = 0.0;
//    
//    [UIView animateWithDuration:0.7 animations:^{
//        
//        cell.transform = CGAffineTransformIdentity;
//        
//        cell.alpha = 1.0;
//        
//    } completion:^(BOOL finished) {
//    }];
}



#pragma mark - ***** UICollectionViewDelegateFlowLayout
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((SCREEN_WIDTH - 30)/2, (SCREEN_WIDTH - 60)/2 + 20);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(200, 20);
}



@end
