//
//  DemoVC11_AutoLayout.h
//  BABaseProject
//
//  Created by 博爱 on 16/6/1.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BALayout;

@protocol DemoVC11_AutoLayoutDelegate <NSObject>

/*!
 *  item的高度
 *
 *  @param layout    layout description
 *  @param indexPath indexPath description
 *  @param width     width description
 *
 *  @return 根据item的宽度返回item的高度
 */
- (CGFloat)layout:(BALayout *)layout heightForItemAtIndexPath:(NSIndexPath *)indexPath width:(CGFloat)width;

@end

@interface DemoVC11_AutoLayout : UICollectionViewLayout

/*! 影响item (x, y, w, h)的布局属性 */
/*! 列数 */
@property (nonatomic, assign) NSInteger     columCounts;
/*! 列间距 */
@property (nonatomic, assign) NSInteger     columSpace;
/*! 行间距 */
@property (nonatomic, assign) NSInteger     itemSpace;
/*! 边距 */
@property (nonatomic, assign) UIEdgeInsets  edgeInsets;

@property (nonatomic, assign) id<DemoVC11_AutoLayoutDelegate>delegate;


@end
