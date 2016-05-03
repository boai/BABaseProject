//
//  UIScrollView+BARefresh.h
//  BABaseProject
//
//  Created by apple on 16/1/13.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIScrollView (BARefresh)

/** 添加头部刷新 */
- (void)BA_addHeaderRefresh:(MJRefreshComponentRefreshingBlock)refreshBlock;

/** 开始头部刷新 */
- (void)BA_beginHeaderRefresh;

/** 结束头部刷新 */
- (void)BA_endHeaderRefresh;

/** 添加底部刷新 */
- (void)BA_addFooterRefresh:(MJRefreshComponentRefreshingBlock)refreshBlock;

/** 开始底部刷新 */
- (void)BA_beginFooterRefresh;

/** 结束底部刷新 */
- (void)BA_endFooterRefresh;


@end
