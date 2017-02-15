//
//  NSMutableArray+BASort.h
//  testDemo
//
//  Created by 博爱 on 2016/11/22.
//  Copyright © 2016年 DS-Team. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSComparisonResult(^BASortComparator)(id obj1, id obj2);
typedef void(^BASortExchangeCallBack)(id obj1, id obj2);

@interface NSMutableArray (BASort)

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
                        didExchange:(BASortExchangeCallBack)sortExchangeCallBack;

// 38.153
/*!
 *  冒泡排序
 *
 *  @param comparator           排序的对象
 *  @param sortStyle            排序的方式（枚举）：升序、相等、降序
 *  @param sortExchangeCallBack 回调排序的结果
 */
- (void)ba_bubbleSortWithComparator:(BASortComparator)comparator
                        didExchange:(BASortExchangeCallBack)sortExchangeCallBack;

// 20.352
/*!
 *  插入排序
 *
 *  @param comparator           排序的对象
 *  @param sortStyle            排序的方式（枚举）：升序、相等、降序
 *  @param sortExchangeCallBack 回调排序的结果
 */
- (void)ba_insertSortWithComparator:(BASortComparator)comparator
                        didExchange:(BASortExchangeCallBack)sortExchangeCallBack;

// 4.752
/*!
 *  快速排序
 *
 *  @param comparator           排序的对象
 *  @param sortStyle            排序的方式（枚举）：升序、相等、降序
 *  @param sortExchangeCallBack 回调排序的结果
 */
- (void)ba_quickSortWithComparator:(BASortComparator)comparator
                       didExchange:(BASortExchangeCallBack)sortExchangeCallBack;

// 8.060
/*!
 *  堆排序
 *
 *  @param comparator           排序的对象
 *  @param sortStyle            排序的方式（枚举）：升序、相等、降序
 *  @param sortExchangeCallBack 回调排序的结果
 */
- (void)ba_heapSortWithComparator:(BASortComparator)comparator
                      didExchange:(BASortExchangeCallBack)sortExchangeCallBack;



@end
