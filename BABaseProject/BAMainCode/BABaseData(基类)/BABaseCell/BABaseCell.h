//
//  BABaseCell.h
//  BABaseProject
//
//  Created by 博爱 on 16/7/6.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BACellDataAdapter.h"

@class BABaseCell;

@protocol BABaseCellDelegate <NSObject>

@optional

/*!
 *  BABaseCell 的事件处理
 *
 *  @param cell   BABaseCell type class
 *  @param action action
 */
- (void)ba_customCell:(BABaseCell *)cell action:(id)action;

@end


@interface BABaseCell : UITableViewCell

@property (nonatomic, weak) id <BABaseCellDelegate>   delegate;
@property (nonatomic, weak) BACellDataAdapter        *dataAdapter;
@property (nonatomic, weak) id                        data;
@property (nonatomic, weak) NSIndexPath              *indexPath;
@property (nonatomic, weak) UITableView              *tableView;
@property (nonatomic, weak) UIViewController         *controller;
@property (nonatomic      ) BOOL                      displayCell;


- (void)ba_setupCell;

- (void)ba_buildSubview;

- (void)ba_loadContent;

+ (BACellDataAdapter *)ba_dataAdapterWithCellReuseIdentifier:(NSString *)reuseIdentifier
                                                     data:(id)data
                                               cellHeight:(CGFloat)height
                                                     type:(NSInteger)type;

- (void)ba_setWeakReferenceWithCellDataAdapter:(BACellDataAdapter *)dataAdapter
                                       data:(id)data
                                  indexPath:(NSIndexPath *)indexPath
                                  tableView:(UITableView *)tableView;

- (void)ba_selectedEvent;

- (void)ba_updateWithNewCellHeight:(CGFloat)height
                       animated:(BOOL)animated;














@end
