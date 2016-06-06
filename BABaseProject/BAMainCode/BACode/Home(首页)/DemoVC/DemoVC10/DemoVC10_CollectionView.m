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
}

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
