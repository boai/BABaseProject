//
//  DemoVC10_CollectionView.h
//  BABaseProject
//
//  Created by 博爱 on 16/5/27.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^selectItemIndexBlock)(UICollectionView *collection, NSIndexPath *indexPath, NSArray *dataArray);

@interface DemoVC10_CollectionView : UIView

@property (nonatomic, strong) UICollectionView      *collectionView;
@property (nonatomic, strong) NSArray               *dataArray;
@property (nonatomic, copy  ) selectItemIndexBlock   indexBlock;



@end
