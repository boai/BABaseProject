//
//  BACellDataAdapter.m
//  BABaseProject
//
//  Created by 博爱 on 16/6/28.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BACellDataAdapter.h"

@implementation BACellDataAdapter

/*!
 *  tableView的简单方法
 *
 *  @param cellReuseIdentifiers cellReuseIdentifiers
 *  @param data                 data
 *  @param cellHeight           cellHeight
 *  @param cellType             cellType
 *
 *  @return BACellDataAdapter
 */
+ (BACellDataAdapter *)ba_cellDataAdapterWithCellReuseIdentifier:(NSString *)cellReuseIdentifiers
                                                            data:(id)data
                                                      cellHeight:(CGFloat)cellHeight
                                                        cellType:(NSInteger)cellType
{
    BACellDataAdapter *dataAdapter = [[self class] new];
    dataAdapter.cellReuseIdentifier = cellReuseIdentifiers;
    dataAdapter.data = data;
    dataAdapter.cellHeight = cellHeight;
    dataAdapter.cellType = cellType;
    
    return dataAdapter;
}

/*!
 *  UICollectionView的简单方法
 *
 *  @param cellReuseIdentifiers cellReuseIdentifiers
 *  @param data                 data
 *  @param cellType             cellType
 *
 *  @return BACellDataAdapter
 */
+ (BACellDataAdapter *)ba_collectionCellDataAdapterWithCellReuseIdentifier:(NSString *)cellReuseIdentifiers
                                                                      data:(id)data
                                                                  cellType:(NSInteger)cellType
{
    BACellDataAdapter *dataAdapter = [[self class] new];
    dataAdapter.cellReuseIdentifier = cellReuseIdentifiers;
    dataAdapter.data = data;
    dataAdapter.cellType = cellType;
    
    return dataAdapter;
}


@end
