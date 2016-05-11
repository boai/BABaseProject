//
//  BAHomeSegmentControlVC.m
//  BABaseProject
//
//  Created by 博爱 on 16/5/11.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BAHomeSegmentControlVC.h"
#import "view1.h"
#import "view2.h"
#import "view3.h"
#import "view4.h"

@interface BAHomeSegmentControlVC ()

@property (nonatomic, strong) view1 *views1;
@property (nonatomic, strong) view2 *views2;
@property (nonatomic, strong) view3 *views3;
@property (nonatomic, strong) view4 *views4;

@property (nonatomic, assign) CGRect viewFrame;

@end

@implementation BAHomeSegmentControlVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setVCBgColor:BA_White_Color];
    
    _viewFrame = CGRectMake(0, 0, BA_SCREEN_WIDTH, BA_SCREEN_HEIGHT - BA_getTabbarHeight - BA_StatusBarHeight);
    
    NSLog(@"464646464   %f", BA_SCREEN_HEIGHT - BA_getTabbarHeight - BA_StatusBarHeight);

    self.views1.hidden = NO;
    self.views2.hidden = NO;
    self.views3.hidden = NO;
    self.views4.hidden = NO;
}

// 加载数据
- (void)rootLoadData:(NSInteger)index
{
    if (index == 0)
    {
        [self.view addSubview:_views1];
    }
    else if (index == 1)
    {
        [self.view addSubview:_views2];
    }
    else if (index == 2)
    {
        [self.view addSubview:_views3];
    }
    else if (index == 3)
    {
        [self.view addSubview:_views4];
    }
    else
    {
        self.view.backgroundColor = [self ba_randomColor];
    }
}

- (view1 *)views1
{
    if (!_views1)
    {
        _views1 = [[view1 alloc] initWithFrame:_viewFrame withSelectRowBlock:^(UITableView *tableView, NSIndexPath *indexPath, NSArray *dataArray) {
            
        }];
//        _views1.backgroundColor = [self ba_randomColor];
    }
    return _views1;
}

- (view2 *)views2
{
    if (!_views2)
    {
        _views2 = [[view2 alloc] initWithFrame:_viewFrame withSelectRowBlock:^(UITableView *tableView, NSIndexPath *indexPath, NSArray *dataArray) {
            
        }];
//        _views2.backgroundColor = [self ba_randomColor];
    }
    return _views2;
}

- (view3 *)views3
{
    if (!_views3)
    {
        _views3 = [[view3 alloc] initWithFrame:_viewFrame withSelectRowBlock:^(UITableView *tableView, NSIndexPath *indexPath, NSArray *dataArray) {
            
        }];
//        _views3.backgroundColor = [self ba_randomColor];
    }
    return _views3;
}

- (view4 *)views4
{
    if (!_views4)
    {
        _views4 = [[view4 alloc] initWithFrame:_viewFrame withSelectRowBlock:^(UITableView *tableView, NSIndexPath *indexPath, NSArray *dataArray) {
            
        }];
//        _views4.backgroundColor = [self ba_randomColor];
    }
    return _views4;
}

@end
