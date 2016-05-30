//
//  DemoVC10_CollectionView.m
//  BABaseProject
//
//  Created by 博爱 on 16/5/27.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC10_CollectionView.h"

@interface DemoVC10_CollectionView ()
<
    UICollectionViewDelegate,
    UICollectionViewDataSource
>


@end

@implementation DemoVC10_CollectionView


- (instancetype)initWithFrame:(CGRect)frame withDataArray:(NSArray *) block:(selectItemIndexBlock)block
{
    if (self = [super initWithFrame:frame])
    {
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews
{
    
}




@end
