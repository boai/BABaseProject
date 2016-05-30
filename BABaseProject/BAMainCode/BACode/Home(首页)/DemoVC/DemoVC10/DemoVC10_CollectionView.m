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

static NSString *cellID = @"DemoVC10Cell";
static NSString *headerID = @"DemoVC10_ReusableView";

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
    
    return cell;
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
    return UIEdgeInsetsMake(20, 20, 10, 20);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((SCREEN_WIDTH - 30)/2, (SCREEN_WIDTH - 30)/2 + 20);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(200, 20);
}



@end
