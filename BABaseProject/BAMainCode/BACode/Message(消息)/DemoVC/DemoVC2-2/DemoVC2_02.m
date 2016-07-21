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
                                       @"age":@(18),
                                   },
                                   @{
                                       @"name":@"博爱02",
                                       @"age":@(19),
                                       },
                                   @{
                                       @"name":@"博爱03",
                                       @"age":@(15),
                                       },
                                   @{
                                       @"name":@"博爱04",
                                       @"age":@(22),
                                       },
                                   @{
                                       @"name":@"博爱05",
                                       @"age":@(25),
                                       }
                                ]
                        },
                       @{
                           @"className": @"1602班",
                           @"students" :
                               @[
                                   @{
                                       @"name":@"博爱11",
                                       @"age":@(22),
                                       },
                                   @{
                                       @"name":@"博爱12",
                                       @"age":@(19),
                                       },
                                   @{
                                       @"name":@"博爱13",
                                       @"age":@(15),
                                       },
                                   @{
                                       @"name":@"博爱14",
                                       @"age":@(22),
                                       }
                                   ]
                           },
                       @{
                           @"className": @"1603班",
                           @"students" :
                               @[
                                   @{
                                       @"name":@"博爱21",
                                       @"age":@(8),
                                       },
                                   @{
                                       @"name":@"博爱22",
                                       @"age":@(9),
                                       },
                                   @{
                                       @"name":@"博爱23",
                                       @"age":@(5),
                                       },
                                   @{
                                       @"name":@"博爱24",
                                       @"age":@(28),
                                       },
                                   @{
                                       @"name":@"博爱25",
                                       @"age":@(22),
                                       },
                                   @{
                                       @"name":@"博爱26",
                                       @"age":@(26),
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
- (UITableView *)createTableViewWithDelegate:(id)delegate frame:(CGRect)frame
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    tableView.delegate = delegate;
    tableView.dataSource = delegate;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
     
    tableView.showsVerticalScrollIndicator = NO;
    tableView.showsHorizontalScrollIndicator = NO;
    
    [tableView registerClass:[DemoVC2_02_studentCell class] forCellReuseIdentifier:infoCellFlag];
    [tableView registerClass:[DemoVC2_02_HeaderView class] forHeaderFooterViewReuseIdentifier:infoHeadFlag];
    
    return tableView;
}

- (void)createTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate                       = self;
    self.tableView.dataSource                     = self;
    self.tableView.separatorStyle                 = UITableViewCellSeparatorStyleNone;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.showsVerticalScrollIndicator   = NO;
    
    [self.tableView registerClass:[DemoVC2_02_studentCell class] forCellReuseIdentifier:infoCellFlag];
    [self.tableView registerClass:[DemoVC2_02_HeaderView class] forHeaderFooterViewReuseIdentifier:infoHeadFlag];
    
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sectionFirstLoad == NO ? 0:_classModels.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    DemoVC2_02_classModel *model = _classModels[section];
    return model.expend == YES ? model.students.count:0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DemoVC2_02_studentCell *cell = [tableView dequeueReusableCellWithIdentifier:infoCellFlag];
    DemoVC2_02_classModel *classModel = _classModels[indexPath.section];
    DemoVC2_02_studentModel *studentModel = classModel.students[indexPath.row];
    cell.data = studentModel;
    cell.indexPath = indexPath;
    
    [cell ba_loadContent];
    
    return cell;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    DemoVC2_02_HeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:infoHeadFlag];
    headerView.delegate = self;
    headerView.data = _classModels[section];
    headerView.section = section;
    
    [headerView ba_loadContent];
    
    if (section == 0)
    {
        self.tmpHeadView = headerView;
    }
    
    DemoVC2_02_classModel *model = _classModels[section];
    if (model.expend == YES)
    {
        [headerView ba_extendStateAnimated:NO];
    }
    else
    {
        [headerView ba_normalStateAnimated:NO];
    }
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DemoVC2_02_studentCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell ba_showSelectedAnimation];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)ba_customHeaderFooterView:(BABaseHeaderFooterView *)customHeaderFooterView action:(id)action
{
    NSInteger section = customHeaderFooterView.section;
    DemoVC2_02_classModel *model = _classModels[section];
    
    DemoVC2_02_HeaderView *headerView = (DemoVC2_02_HeaderView *)customHeaderFooterView
    ;
    if (model.expend == YES)
    {
        /*! 收回 */
        model.expend = NO;
        [headerView ba_normalStateAnimated:YES];
        
        NSMutableArray *indexPaths = [NSMutableArray array];
        [model.students enumerateObjectsUsingBlock:^(DemoVC2_02_studentModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [indexPaths addObject:[NSIndexPath indexPathForItem:idx inSection:section]];
        }];
        [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    }
    else
    {
        /*! 展开 */
        model.expend = YES;
        [headerView ba_extendStateAnimated:YES];
        
        NSMutableArray *indexPaths = [NSMutableArray array];
        [model.students enumerateObjectsUsingBlock:^(DemoVC2_02_studentModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [indexPaths addObject:[NSIndexPath indexPathForItem:idx inSection:section]];
        }];
        [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    }
    
}


- (void)firstLoadDataAnimation
{
    BA_Weak;
    [GCDQueue executeInMainQueue:^{
        
        /*! Extend sections */
        weakSelf.sectionFirstLoad = YES;
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, weakSelf.classModels.count)];
        [weakSelf.tableView insertSections:indexSet withRowAnimation:UITableViewRowAnimationFade
         ];
        
        [GCDQueue executeInMainQueue:^{
            
            /*! Extend cells */
            [weakSelf ba_customHeaderFooterView:weakSelf.tmpHeadView action:nil];
            
        } afterDelaySecs:0.4f];
        
    } afterDelaySecs:0.3f];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
