
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
    /*! 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法） */
    BACustomMJHeader *header = [BACustomMJHeader headerWithRefreshingBlock:refreshBlock];
    /*! 设置文字 */
//    [header setTitle:@"下拉博爱为您刷新！" forState:MJRefreshStateIdle];
//    [header setTitle:@"松开博爱再为您刷新！" forState:MJRefreshStatePulling];
//    [header setTitle:@"感谢博爱的刷新 ..." forState:MJRefreshStateRefreshing];
    
    /*! 设置字体 */
    header.stateLabel.font = [UIFont systemFontOfSize:15];
    header.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:14];
    
    /*! 设置颜色 */
    header.stateLabel.textColor = [UIColor redColor];
    header.lastUpdatedTimeLabel.textColor = [UIColor blueColor];
    header.automaticallyChangeAlpha = YES;
    self.mj_header = header;
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
    /*! 原生上拉刷新 */
//    self.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:refreshBlock];
    /*! 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法） */
    BACustomMJFooter *footer = [BACustomMJFooter footerWithRefreshingBlock:refreshBlock];
    /*! 隐藏刷新状态的文字 */
    footer.refreshingTitleHidden = YES;
    footer.automaticallyChangeAlpha = YES;
    self.mj_footer = footer;
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
