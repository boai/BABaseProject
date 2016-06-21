
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
/**
 *  给UITableView类添加许多有用的方法
 */
@interface UITableView (BAKit)

/**
 *  UITableView初始化
 */
+ (UITableView *)initWithFrame:(CGRect)frame                                    // 结构
                         style:(UITableViewStyle)style                          // 风格
            cellSeparatorStyle:(UITableViewCellSeparatorStyle)cellSeparatorStyle// 分割线风格
                separatorInset:(UIEdgeInsets)separatorInset                     // 边缘偏移
                    dataSource:(id <UITableViewDataSource>)dataSource           // 数据源
                      delegate:(id <UITableViewDelegate>)delegate;              // 委托

/**
 *  给定行列获取下一个索引路径
 */
- (NSIndexPath *)getNextIndexPath:(NSUInteger)row
                       forSection:(NSUInteger)section;

/**
 *  给定行列获取上一个索引路径
 */
- (NSIndexPath *)getPreviousIndexPath:(NSUInteger)row
                           forSection:(NSUInteger)section;

/**
 *  A block combine a series of method calls
 *
 *  @param block A block combine a series of method calls.
 */
- (void)updateWithBlock:(void (^)(UITableView *tableView))block;

/**
 *  Scrolls the receiver until a row or section location on the screen.
 *
 *  @param row            Row index in section. NSNotFound is a valid value for scrolling to a section with zero rows.
 *  @param section        Section index in table.
 *  @param scrollPosition A constant that identifies a relative position in the receiving table view (top, middle, bottom) for row when scrolling concludes.
 *  @param animated       YES if you want to animate the change in position,
 NO if it should be immediate.
 */
- (void)scrollToRow:(NSUInteger)row inSection:(NSUInteger)section atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated;

/**
 *   Inserts the row in the receiver at the locations identified by the indexPath, with an option to animate the insertion.
 *
 *  @param indexPath An NSIndexPath object representing a row index and section index that together identify a row in the table view.
 *  @param animation A constant that either specifies the kind of animation to perform when inserting the cell or requests no animation.
 */
- (void)insertRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation;

/**
 *   Inserts a row in the receiver with an option to animate the insertion.
 *
 *  @param row       Row index in section.
 *  @param section   Section index in table.
 *  @param animation A constant that either specifies the kind of animation to perform when inserting the cell or requests no animation.
 */
- (void)insertRow:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

@end
