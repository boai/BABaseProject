//
//  NSMutableArray+BASort.m
//  testDemo
//
//  Created by 博爱 on 2016/11/22.
//  Copyright © 2016年 DS-Team. All rights reserved.
//

#import "NSMutableArray+BASort.h"

@implementation NSMutableArray (BASort)

#pragma mark - 选择排序
// 40.435
/*!
 *  选择排序
 *
 *  @param comparator           排序的对象
 *  @param sortStyle            排序的方式（枚举）：升序、相等、降序
 *  @param sortExchangeCallBack 回调排序的结果
 */
- (void)ba_selectSortWithComparator:(BASortComparator)comparator
                        didExchange:(BASortExchangeCallBack)sortExchangeCallBack
{
    if (self.count == 0)
    {
        return;
    }
    
    for (NSInteger i = 0; i < self.count - 1; i++)
    {
        for (NSInteger j = i + 1; j < self.count; j++)
        {
            if (comparator(self[i], self[j]) == NSOrderedDescending)
            {
                [self ba_exchangeWithIndexA:i indexB:j didExchange:sortExchangeCallBack];
            }
        }
    }
}

#pragma mark - 冒泡排序
// 38.153
/*!
 *  冒泡排序
 *
 *  @param comparator           排序的对象
 *  @param sortStyle            排序的方式（枚举）：升序、相等、降序
 *  @param sortExchangeCallBack 回调排序的结果
 */
- (void)ba_bubbleSortWithComparator:(BASortComparator)comparator
                        didExchange:(BASortExchangeCallBack)sortExchangeCallBack
{
    if (self.count == 0)
    {
        return;
    }
    
    for (NSInteger i = self.count -1; i > 0; i--)
    {
        for (NSInteger j = 0; j < i; j++)
        {
            if (comparator(self[j], self[j + 1]) == NSOrderedDescending)
            {
                [self ba_exchangeWithIndexA:j indexB:(j + 1) didExchange:sortExchangeCallBack];
            }
        }
    }
}

#pragma mark - 插入排序
// 20.352
/*!
 *  插入排序
 *
 *  @param comparator           排序的对象
 *  @param sortStyle            排序的方式（枚举）：升序、相等、降序
 *  @param sortExchangeCallBack 回调排序的结果
 */
- (void)ba_insertSortWithComparator:(BASortComparator)comparator
                        didExchange:(BASortExchangeCallBack)sortExchangeCallBack
{
    for (NSInteger i = 1; i < self.count; i++)
    {
        for (NSInteger j = i; j > 0 && comparator(self[j], self[j - 1]) == NSOrderedAscending; j--)
        {
            [self ba_exchangeWithIndexA:j indexB:(j - 1) didExchange:sortExchangeCallBack];
        }
    }
}

#pragma mark - 快速排序
// 4.752
/*!
 *  快速排序
 *
 *  @param comparator           排序的对象
 *  @param sortStyle            排序的方式（枚举）：升序、相等、降序
 *  @param sortExchangeCallBack 回调排序的结果
 */
- (void)ba_quickSortWithComparator:(BASortComparator)comparator
                       didExchange:(BASortExchangeCallBack)sortExchangeCallBack
{
    if (self.count == 0)
    {
        return;
    }
    [self ba_quickSortWithLowIndex:0
                         highIndex:(self.count - 1)
                        comparator:comparator
                       didExchange:sortExchangeCallBack];
}

- (void)ba_quickSortWithLowIndex:(NSInteger)lowIndex
                       highIndex:(NSInteger)highIndex
                      comparator:(BASortComparator)comparator
                     didExchange:(BASortExchangeCallBack)sortExchangeCallBack
{
    if (lowIndex >= highIndex)
    {
        return;
    }
    
    NSInteger tempIndex = [self ba_quickPartitionWithLowIndex:lowIndex
                                                    highIndex:highIndex
                                                   comparator:comparator
                                                  didExchange:sortExchangeCallBack];
    [self ba_quickSortWithLowIndex:lowIndex highIndex:(tempIndex - 1)
                        comparator:comparator
                       didExchange:sortExchangeCallBack];
    [self ba_quickSortWithLowIndex:(tempIndex + 1) highIndex:highIndex
                        comparator:comparator
                       didExchange:sortExchangeCallBack];
}

- (NSInteger)ba_quickPartitionWithLowIndex:(NSInteger)lowIndex
                                 highIndex:(NSInteger)highIndex
                                comparator:(BASortComparator)comparator
                               didExchange:(BASortExchangeCallBack)sortExchangeCallBack
{
    id temp = self[lowIndex];
    NSInteger i = lowIndex;
    NSInteger j = highIndex;
    
    while (i < j)
    {
        /*! 跳过大于等于 temp 的元素 */
        while (i < j && comparator(self[j], temp) != NSOrderedAscending)
        {
            j--;
        }
        if (i < j)
        {
            /*! i、j未相遇，说明找到了小于 temp 的元素。交换。 */
            [self ba_exchangeWithIndexA:i indexB:j didExchange:sortExchangeCallBack];
            i++;
        }
        
        /*! 跳过小于等于 temp 的元素 */
        while (i < j && comparator(self[i], temp) != NSOrderedDescending)
        {
            i++;
        }
        if (i < j)
        {
            /*! i、j未相遇，说明找到了大于 temp 的元素。交换。 */
            [self ba_exchangeWithIndexA:i indexB:j didExchange:sortExchangeCallBack];
            j--;
        }
    }
    return i;
}

#pragma mark - 堆排序
// 8.060
/*!
 *  堆排序
 *
 *  @param comparator           排序的对象
 *  @param sortStyle            排序的方式（枚举）：升序、相等、降序
 *  @param sortExchangeCallBack 回调排序的结果
 */
- (void)ba_heapSortWithComparator:(BASortComparator)comparator
                      didExchange:(BASortExchangeCallBack)sortExchangeCallBack
{
    /*! 排序过程中不使用第0位 */
    [self insertObject:[NSNull null] atIndex:0];
    
    /*! 
      构造大顶堆
      遍历所有非终结点，把以它们为根结点的子树调整成大顶堆
      最后一个非终结点位置在本队列长度的一半处
     */
    for (NSInteger index = self.count / 2; index > 0; index --)
    {
        /*! 根结点下沉到合适位置 */
        [self ba_sinkIndex:index
               bottomIndex:(self.count - 1)
                comparator:comparator
               didExchange:sortExchangeCallBack];
    }
    
    /*! 
      完全排序
      从整棵二叉树开始，逐渐剪枝
     */
    for (NSInteger index = self.count - 1; index > 1; index --)
    {
        /*! 每次把根结点放在列尾，下一次循环时将会剪掉 */
        [self ba_exchangeWithIndexA:1 indexB:index didExchange:sortExchangeCallBack];
        
        /*! 下沉根结点，重新调整为大顶堆 */
        [self ba_sinkIndex:1
               bottomIndex:(index - 1)
                comparator:comparator
               didExchange:sortExchangeCallBack];
    }
    
    /*! 排序完成后删除占位元素 */
    [self removeObjectAtIndex:0];
}

/*! 下沉，传入需要下沉的元素位置，以及允许下沉的最底位置 */
- (void)ba_sinkIndex:(NSInteger)sinkIndex
         bottomIndex:(NSInteger)bottomIndex
          comparator:(BASortComparator)comparator
         didExchange:(BASortExchangeCallBack)sortExchangeCallBack
{
    for (NSInteger maxTempIndex = sinkIndex * 2; maxTempIndex <= bottomIndex; maxTempIndex *= 2)
    {
        /*! 如果存在右子结点，并且左子结点比右子结点小 */
        if (maxTempIndex < bottomIndex && (comparator(self[maxTempIndex], self[maxTempIndex + 1]) == NSOrderedAscending))
        {
            /*! 指向右子结点 */
            ++ maxTempIndex;
        }
        /*! 如果最大的子结点元素小于本元素，则本元素不必下沉了 */
        if (comparator(self[maxTempIndex ], self[sinkIndex]) == NSOrderedAscending)
        {
            break;
        }
        /*! 
          否则
          把最大子结点元素上游到本元素位置
         */
        [self ba_exchangeWithIndexA:sinkIndex indexB:maxTempIndex didExchange:sortExchangeCallBack];
        /*! 标记本元素需要下沉的目标位置，为最大子结点原位置 */
        sinkIndex = maxTempIndex;
    }
}

#pragma mark - 交换两个元素
- (void)ba_exchangeWithIndexA:(NSInteger)indexA indexB:(NSInteger)indexB didExchange:(BASortExchangeCallBack)sortExchangeCallBack
{
    id temp = self[indexA];
    self[indexA] = self[indexB];
    self[indexB] = temp;
    
    if (sortExchangeCallBack)
    {
        sortExchangeCallBack(temp, self[indexA]);
    }
}


@end
