//
//  BABaseTableViewController.h
//  BABaseProject
//
//  Created by 博爱 on 16/5/4.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BABaseViewController.h"

@interface BABaseTableViewController : BABaseViewController
<
    UITableViewDelegate,
    UITableViewDataSource
>

/*! tableView */
@property (nonatomic, strong,readonly) UITableView *tableView;
/*! 数据源 */
@property (nonatomic, strong,readonly) NSMutableArray *dataArray;

//*****************是否开启头部刷新和脚部刷新 子类可在ViewDidLoad方法设置开启与否 默认都不开启******************************//
/**开启头部刷新*/
@property (nonatomic, assign)   BOOL isOpenHeaderRefresh;
/**开始脚部加载更多*/
@property (nonatomic, assign)   BOOL isOpenFooterRefresh;

//*****************只有开启头部刷新和脚部刷新 下面的方法才被回调子类重写***********************//
/**
 *  头部刷新的回调子类重写
 */
- (void)headerRefresh;
/**
 *  脚部刷新的回调子类重写
 */
- (void)footerRefresh;

@end
