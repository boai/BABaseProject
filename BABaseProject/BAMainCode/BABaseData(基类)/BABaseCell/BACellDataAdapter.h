//
//  BACellDataAdapter.h
//  BABaseProject
//
//  Created by 博爱 on 16/6/28.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BACellDataAdapter : NSObject


/*!
 *  The tableView.
 */
@property (nonatomic, weak  ) UITableView       *tableView;

/*!
 *  The collectionView.
 */
@property (nonatomic, weak  ) UICollectionView  *collectionView;

/*!
 *  indexPath.
 */
@property (nonatomic, weak  ) NSIndexPath       *indexPath;

@property (nonatomic, strong) NSString          *cellReuseIdentifier;

@property (nonatomic, strong) id                 data;

@property (nonatomic) CGFloat     cellHeight;

@property (nonatomic) NSInteger   cellType;

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
                                                        cellType:(NSInteger)cellType;

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
                                                                  cellType:(NSInteger)cellType;


@end
