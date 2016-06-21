//
//  DemoVC10_CollectionView.h
//  BABaseProject
//
//  Created by 博爱 on 16/5/27.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^selectItemIndexBlock)(UICollectionView *collection, NSIndexPath *indexPath, NSArray *dataArray);

typedef NS_ENUM(NSUInteger, DemoVC10_cellState) {
    /*! 右上角编辑按钮的两种状态 */
    /*! 正常的状态，按钮显示“编辑” */
    DemoVC10_cellStateNormal,
    /*! 正在删除时候的状态，按钮显示“完成” */
    DemoVC10_cellStateDelete
};

@interface DemoVC10_CollectionView : UIView

@property (nonatomic, strong) UICollectionView      *collectionView;
@property (nonatomic, copy  ) selectItemIndexBlock   indexBlock;
@property (nonatomic, assign) DemoVC10_cellState     cellState;

- (instancetype)initWithFrame:(CGRect)frame withblock:(selectItemIndexBlock)block;

@end
