//
//  view3.m
//  test
//
//  Created by 博爱 on 16/5/11.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "view3.h"

@interface view3 ()
<
UITableViewDelegate,
UITableViewDataSource
>

@end

@implementation view3

- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] init];
//        _tableView.frame = CGRectMake(0, 0, BA_SCREEN_WIDTH, BA_SCREEN_HEIGHT - BA_getTabbarHeight);

        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorColor = [UIColor redColor];
        
        [self addSubview:_tableView];
        
//        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.mas_equalTo(UIEdgeInsetsMake(0 , 0, BA_getTabbarHeight, 0));
//        }];
        
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

- (instancetype)initWithFrame:(CGRect)frame withSelectRowBlock:(selectRowBlock)selectRowBlock
{
    if (self = [super initWithFrame:frame])
    {
        self.selectBlock = selectRowBlock;
        
        self.tableView.hidden = NO;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"view3 第 %ld 行", indexPath.row];
    
    return cell;
}

@end
