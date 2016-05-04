//
//  BAHomeViewCell.m
//  BABaseProject
//
//  Created by 博爱 on 16/5/4.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BAHomeViewCell.h"
#import "BAHomeVCModel.h"
#import "BAHomeViewModel.h"

@implementation BAHomeViewCell
{
    UILabel *_titleLabel;
    UILabel *_contentLabel;
}

// 注意：cell是用initWithStyle初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        // 添加所有子控件
        [self setUpAllChildView];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

// 添加所有子控件
- (void)setUpAllChildView
{
    _titleLabel                 = [UILabel new];
    _titleLabel.font            = BA_FontSize(15);
    _titleLabel.textColor       = BA_TEXTGrayColor;

    _contentLabel               = [UILabel new];
    _contentLabel.font          = BA_FontSize(14);
    _titleLabel.textColor       = [UIColor lightGrayColor];
    _contentLabel.numberOfLines = 0;
    
    [self.contentView BA_AddSubViewsWithArray:@[_titleLabel, _contentLabel]];
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *cellID = @"BAHomeViewCell";
    id cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil)
    {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    
    return cell;
}

/*
 问题：
 1.cell的高度应该提前计算出来
 2.cell的高度必须要先计算出每个子控件的frame，才能确定
 3.如果在cell的setStatus方法计算子控件的位置，会比较耗性能
 
 解决:MVVM思想
 M:模型
 V:视图
 VM:视图模型（模型包装视图模型，模型+模型对应视图的frame）
 */
- (void)setSubViewFrame:(BAHomeViewModel *)subViewFrame
{
    _subViewFrame = subViewFrame;
    
    // 设置frame
    [self setUpFrame];
    // 设置data
    [self setUpData];
}

- (void)setUpFrame
{
    _titleLabel.frame   = _subViewFrame.titleLabelFrame;
    _contentLabel.frame = _subViewFrame.contentLabelFrame;
}

- (void)setUpData
{
    BAHomeVCModel *model = _subViewFrame.viewModel;
    
    _titleLabel.text     = model.titleLabel;
    _contentLabel.text   = model.contentLabel;
}
@end
