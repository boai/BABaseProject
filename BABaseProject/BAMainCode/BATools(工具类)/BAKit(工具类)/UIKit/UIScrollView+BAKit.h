
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

#import <UIKit/UIKit.h>
#import <MJRefresh.h>

/**
 *  给UIScrollView类添加许多有用的方法
 */
@interface UIScrollView (BAKit)

/**
 *  UIScrollView 初始化
 */

+ (UIScrollView *)initWithFrame:(CGRect)frame                       // 结构
                    contentSize:(CGSize)contentSize                 // 内容大小
                  clipsToBounds:(BOOL)clipsToBounds                 // 剪切边界，默认值是NO
                  pagingEnabled:(BOOL)pagingEnabled                 // 翻页，默认值是NO
           showScrollIndicators:(BOOL)showScrollIndicators          // 指标显示，默认YES
                       delegate:(id<UIScrollViewDelegate>)delegate; // 委托

/** 添加头部刷新 */
- (void)addHeaderRefresh:(MJRefreshComponentRefreshingBlock)refreshBlock;

/** 开始头部刷新 */
- (void)beginHeaderRefresh;

/** 结束头部刷新 */
- (void)endHeaderRefresh;

/** 添加底部刷新 */
- (void)addFooterRefresh:(MJRefreshComponentRefreshingBlock)refreshBlock;

/** 开始底部刷新 */
- (void)beginFooterRefresh;

/** 结束底部刷新 */
- (void)endFooterRefresh;

/*!
 *  移除底部刷新
 */
-(void)removeFootRefresh;

@end
