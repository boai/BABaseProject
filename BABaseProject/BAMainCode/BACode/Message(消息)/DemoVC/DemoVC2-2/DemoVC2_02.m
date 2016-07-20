//
//  DemoVC2_02.m
//  BABaseProject
//
//  Created by 博爱 on 16/7/7.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC2_02.h"
#import "DemoVC2_02_classModel.h"
#import "DemoVC2_02_studentCell.h"
#import "DemoVC2_02_HeaderView.h"

static NSString *infoCellFlag = @"DemoVC2_02_studentCell";
static NSString *infoHeadFlag = @"DemoVC2_02_HeaderView";

@interface DemoVC2_02 ()
<
    UITableViewDelegate,
    UITableViewDataSource,
    BABaseHeaderFooterViewDelegate
>
@property (nonatomic, strong) NSMutableArray         *classModels;
@property (nonatomic, strong) UITableView            *tableView;

@property (nonatomic        ) BOOL                    sectionFirstLoad;
@property (nonatomic, weak  ) DemoVC2_02_HeaderView  *tmpHeadView;


@end

@implementation DemoVC2_02

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI
{
    [self createDatas];
    
    [self createTableView];
    
    [self firstLoadDataAnimation];
    
}

#pragma mark - ***** 数据源相关
- (void)createDatas
{
    NSArray *datas = @[
                       @{
                           @"className": @"1601班",
                           @"students" :
                               @[
                                   @{
                                       @"name":@"博爱01",
                                       @"age":@"18",
                                   },
                                   @{
                                       @"name":@"博爱02",
                                       @"age":@"19",
                                       },
                                   @{
                                       @"name":@"博爱03",
                                       @"age":@"15",
                                       },
                                   @{
                                       @"name":@"博爱04",
                                       @"age":@"22",
                                       },
                                   @{
                                       @"name":@"博爱05",
                                       @"age":@"25",
                                       }
                                ]
                        },
                       @{
                           @"className": @"1602班",
                           @"students" :
                               @[
                                   @{
                                       @"name":@"博爱11",
                                       @"age":@"18",
                                       },
                                   @{
                                       @"name":@"博爱12",
                                       @"age":@"19",
                                       },
                                   @{
                                       @"name":@"博爱13",
                                       @"age":@"15",
                                       },
                                   @{
                                       @"name":@"博爱14",
                                       @"age":@"22",
                                       }
                                   ]
                           },
                       @{
                           @"className": @"1603班",
                           @"students" :
                               @[
                                   @{
                                       @"name":@"博爱21",
                                       @"age":@"18",
                                       },
                                   @{
                                       @"name":@"博爱22",
                                       @"age":@"19",
                                       },
                                   @{
                                       @"name":@"博爱23",
                                       @"age":@"15",
                                       },
                                   @{
                                       @"name":@"博爱24",
                                       @"age":@"22",
                                       },
                                   @{
                                       @"name":@"博爱25",
                                       @"age":@"25",
                                       },
                                   @{
                                       @"name":@"博爱26",
                                       @"age":@"26",
                                       }
                                   ]
                           }
                       ];
    BA_Weak;
    [datas enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        DemoVC2_02_classModel *model = [[DemoVC2_02_classModel alloc] initWithDictionary:obj];
        model.expend = NO;
        
        [weakSelf.classModels addObject:model];
    }];
}

- (NSMutableArray *)classModels
{
    if (!_classModels)
    {
        _classModels = @[].mutableCopy;
    }
    return _classModels;
}

#pragma mark - ***** tableView相关


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
