
/*!
 *  @header BAKit
 *          demoTest
 *
 *  @brief  BAKit
 *
 *  @author 博爱
 *  @copyright    Copyright © 2016年 博爱. All rights reserved.
 *  @version    V1.0
 */

/*!
 *
 *          ┌─┐       ┌─┐
 *       ┌──┘ ┴───────┘ ┴──┐
 *       │                 │
 *       │       ───       │
 *       │  ─┬┘       └┬─  │
 *       │                 │
 *       │       ─┴─       │
 *       │                 │
 *       └───┐         ┌───┘
 *           │         │
 *           │         │
 *           │         │
 *           │         └──────────────┐
 *           │                        │
 *           │                        ├─┐
 *           │                        ┌─┘
 *           │                        │
 *           └─┐  ┐  ┌───────┬──┐  ┌──┘
 *             │ ─┤ ─┤       │ ─┤ ─┤
 *             └──┴──┘       └──┴──┘
 *                 神兽保佑
 *                 代码无BUG!
 */

/*
 
 *********************************************************************************
 *
 * 在使用BAKit的过程中如果出现bug请及时以以下任意一种方式联系我，我会及时修复bug
 *
 * QQ     : 可以添加SDAutoLayout群 497140713 在这里找到我(博爱1616【137361770】)
 * 微博    : 博爱1616
 * Email  : 137361770@qq.com
 * GitHub : https://github.com/boai
 * 博客园  : http://www.cnblogs.com/boai/
 *********************************************************************************
 
 */

#import "UIScrollView+BAKit.h"

@implementation UIScrollView (BAKit)
/* UIScrollView 初始化 */

+ (UIScrollView *)initWithFrame:(CGRect)frame                       // 结构
                    contentSize:(CGSize)contentSize                 // 内容大小
                  clipsToBounds:(BOOL)clipsToBounds                 // 剪切边界，默认值是NO
                  pagingEnabled:(BOOL)pagingEnabled                 // 翻页，默认值是NO
           showScrollIndicators:(BOOL)showScrollIndicators          // 指标显示，默认YES
                       delegate:(id<UIScrollViewDelegate>)delegate  // 委托
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:frame];
    [scrollView setDelegate:delegate];
    [scrollView setPagingEnabled:pagingEnabled];
    [scrollView setClipsToBounds:clipsToBounds];
    [scrollView setShowsVerticalScrollIndicator:showScrollIndicators];
    [scrollView setShowsHorizontalScrollIndicator:showScrollIndicators];
    [scrollView setContentSize:contentSize];
    
    return scrollView;
}

/** 添加头部刷新 */
- (void)addHeaderRefresh:(MJRefreshComponentRefreshingBlock)refreshBlock
{
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:refreshBlock];
}

/** 开始头部刷新 */
- (void)beginHeaderRefresh
{
    [self.mj_header beginRefreshing];
}

/** 结束头部刷新 */
- (void)endHeaderRefresh
{
    [self.mj_header endRefreshing];
}

/** 添加底部刷新 */
- (void)addFooterRefresh:(MJRefreshComponentRefreshingBlock)refreshBlock
{
    self.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:refreshBlock];
}

/** 开始底部刷新 */
- (void)beginFooterRefresh
{
    [self.mj_footer beginRefreshing];
}

/** 结束底部刷新 */
- (void)endFooterRefresh
{
    [self.mj_footer endRefreshing];
}

/*!
 *  移除底部刷新
 */
-(void)removeFootRefresh
{
    [self.mj_footer removeFromSuperview];
    self.mj_footer = nil;
}

@end
