//
//  BABaseCollectionCell.m
//  BABaseProject
//
//  Created by 博爱 on 16/7/6.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BABaseCollectionCell.h"

@implementation BABaseCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
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
    return [BACellDataAdapter ba_cellDataAdapterWithCellReuseIdentifier:NSStringFromClass([self class]) data:data cellHeight:height cellType:type];
}


@end
