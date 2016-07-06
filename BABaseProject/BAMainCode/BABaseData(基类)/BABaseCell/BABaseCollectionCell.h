//
//  BABaseCollectionCell.h
//  BABaseProject
//
//  Created by 博爱 on 16/7/6.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BACellDataAdapter.h"

@class BABaseCollectionCell;

@protocol BABaseCollectionCellDelegate <NSObject>

- (void)ba_customCollectionCell:(BABaseCollectionCell *)cell action:(id)action;

@end

@interface BABaseCollectionCell : UICollectionViewCell

@property (nonatomic, weak) id <BABaseCollectionCellDelegate>   delegate;
@property (nonatomic, weak) BACellDataAdapter                  *dataAdapter;
@property (nonatomic, weak) id                                  data;
@property (nonatomic, weak) NSIndexPath                        *indexPath;
@property (nonatomic, weak) UICollectionView                   *collectionView;
@property (nonatomic, weak) UIViewController                   *controller;
@property (nonatomic      ) BOOL                                displayCell;

- (void)ba_setupCell;
- (void)ba_buildSubview;
- (void)ba_loadContent;
- (void)ba_selectedEvent;
+ (BACellDataAdapter *)ba_dataAdapterWithCellReuseIdentifier:(NSString *)reuseIdentifier
                                                        data:(id)data
                                                  cellHeight:(CGFloat)height
                                                        type:(NSInteger)type;



@end
