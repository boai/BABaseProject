//
//  DemoVC11_AutoLayout.m
//  BABaseProject
//
//  Created by 博爱 on 16/6/1.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC11_AutoLayout.h"

@interface DemoVC11_AutoLayout ()

/*! 保存每一列的y值 */
@property (nonatomic, strong) NSMutableDictionary  *columYdic;
/*! 布局属性数组 */
@property (nonatomic, strong) NSMutableArray       *attributesArray;

@end

@implementation DemoVC11_AutoLayout

/*! 
 
  控制collectionView的布局
  本质就是计算 每一个item的布局信息(x,y,w,h);
  不规则瀑布流的实现原理:
  找到当前最短列 设置item 坐标
 
 */

- (instancetype)init
{
    if (self = [super init])
    {
        self.columYdic       = [NSMutableDictionary dictionary];
        self.attributesArray = @[].mutableCopy;
    }
    return self;
}

/*! 1、当collectionView布局item时 第一个执行的方法 */
- (void)prepareLayout
{
    /*! 重写layout中的方法 首先必须调用父类 */
    [super prepareLayout];
    
    /*!
     初始化每个item的位置
     通过y值判断最短列
     通过列数 决定y 值字典中 需要的键值对
     */
    for (NSInteger i = 0; i < _columCounts; i++)
    {
        NSString *key = [NSString stringWithFormat:@"%ld", i];
        _columYdic[key] = @(_edgeInsets.top);
    }
    
    /*! 获取collectionView 中的item的个数 */
    NSInteger itemCount = [self.collectionView numberOfItemsInSection:0];
    /*! 遍历得到每个item 设置位置信息 */
    for (NSInteger i = 0; i < itemCount; i++)
    {
        /*! 设置位置信息 */
        [self setItemFrameWithIndex:i];
    }
    
}

/*! 2、单个item位置设置 */
- (void)setItemFrameWithIndex:(NSInteger)index
{
    /*! 
     1, 获取到最短列
     2. 设置每个item的frame
     */
    /*! 定义临时变量 始终记录最小列下标 */
    NSString *minColum = @"0";
    /*! 遍历保存y值得字典 */
    for (NSString *y in _columYdic)
    {
        /*! 找到最短列 */
        if ([_columYdic[minColum] doubleValue] > [_columYdic[y] doubleValue])
        {
            minColum = y;
        }
    }
    
    /*! 分别计算frame的值 */
    /*! 宽 = (总宽 - 2*边距 - (列数 - 1)*间距 ) / 列数 */
    CGFloat w = (self.collectionView.frame.size.width - _edgeInsets.left - _edgeInsets.right - (_columCounts - 1) * _columSpace) / _columCounts;
    /*! x = 左边距 + (宽 + 列间距) * 列号 */
    CGFloat x = _edgeInsets.left + (w + _columSpace) * minColum.doubleValue;
    
    /*! 通过item下标 创建位置对象 */
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
    /*! 
     获取高度
     通过协议 在VC中 求得h 传递在layout中
     */
    CGFloat h = [self.delegate layout:self heightForItemAtIndexPath:indexPath width:w];
    
    /*! 获取y */
    CGFloat y = [_columYdic[minColum] doubleValue];
    
    /*! 
     更新y值
     新y = 旧y + 高 + 行边距
     */
    _columYdic[minColum] = @(y + h + _itemSpace);
    
    /*! 每个item 的布局属性包含frame / bounds/ size */
    /*! 根据indexPath获取对应的属性 */
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    /*! 添加frame */
    attributes.frame = CGRectMake(x, y, w, h);
    /*! 保存在数组中 */
    [_attributesArray addObject:attributes];
}

/*! 3、布局属性 */
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return _attributesArray;
}

/*! 4、设置滚动范围 */
- (CGSize)collectionViewContentSize
{
    NSString *maxY = @"0";
    /*! 获取最大y值所在列号 */
    for (NSString *y in _columYdic)
    {
        if ([_columYdic[y] doubleValue] > [_columYdic[maxY] doubleValue])
        {
            maxY = y;
        }
    }
    /*! 内容高度 */
    CGFloat h = [_columYdic[maxY] doubleValue] + _edgeInsets.bottom;
    return CGSizeMake(0, h);
}




@end
