//
//  BABaseCell.m
//  BABaseProject
//
//  Created by 博爱 on 16/7/6.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BABaseCell.h"

@implementation BABaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self ba_setupCell];
        
        [self ba_buildSubview];
    }
    
    return self;
}

- (void)ba_setupCell
{

}

- (void)ba_buildSubview
{

}

- (void)ba_loadContent
{

}

- (void)ba_selectedEvent
{
    
}

+ (BACellDataAdapter *)ba_dataAdapterWithCellReuseIdentifier:(NSString *)reuseIdentifier
                                                        data:(id)data
                                                  cellHeight:(CGFloat)height
                                                        type:(NSInteger)type
{
    NSString *tmpReuseIdentifier = reuseIdentifier.length <= 0? NSStringFromClass([self class]) : reuseIdentifier;
    return [BACellDataAdapter ba_cellDataAdapterWithCellReuseIdentifier:tmpReuseIdentifier data:data cellHeight:height cellType:type];
}

- (void)ba_setWeakReferenceWithCellDataAdapter:(BACellDataAdapter *)dataAdapter
                                          data:(id)data
                                     indexPath:(NSIndexPath *)indexPath
                                     tableView:(UITableView *)tableView
{
    _dataAdapter = dataAdapter;
    _data        = data;
    _indexPath   = indexPath;
    _tableView   = tableView;
}

- (void)ba_updateWithNewCellHeight:(CGFloat)height
                          animated:(BOOL)animated
{
    if (self.tableView && self.dataAdapter)
    {
        if (animated)
        {
            self.dataAdapter.cellHeight = height;
            [self.tableView beginUpdates];
            [self.tableView endUpdates];
            
        }
        else
        {
            self.dataAdapter.cellHeight = height;
            [self.tableView reloadData];
        }

    }
    
}

@end
