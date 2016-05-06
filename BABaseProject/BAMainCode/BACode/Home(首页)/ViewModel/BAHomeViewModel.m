//
//  BAHomeViewModel.m
//  BABaseProject
//
//  Created by 博爱 on 16/5/4.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BAHomeViewModel.h"
#import "BAHomeVCModel.h"

@implementation BAHomeViewModel

- (void)setViewModel:(BAHomeVCModel *)viewModel
{
    _viewModel = viewModel;
    
    /*! 计算frame */
    [self setupCellFrame];
}

- (void)setupCellFrame
{
    /*! 标题Frame */
    CGFloat titleX = BAStatusCellMargin;
    CGFloat titleY = titleX;
    CGFloat titleW = BA_SCREEN_WIDTH - 2 * BAStatusCellMargin;
    CGFloat titleH = [BAAutoSizeWithWH BA_AutoSizeOfHeghtWithText:_viewModel.titleLabel font:[UIFont boldSystemFontOfSize:15] width:titleW];
    _titleLabelFrame = (CGRect){{titleX, titleY}, {titleW, titleH}};

    /*! 内容Frame */
    CGFloat contentLabelX = titleX;
    CGFloat contentLabelY = CGRectGetMaxY(_titleLabelFrame) + BAStatusCellMargin;
    CGFloat contentLabelW = BA_SCREEN_WIDTH - 2 * BAStatusCellMargin;
    CGFloat contentLabelH = [BAAutoSizeWithWH BA_AutoSizeOfHeghtWithText:_viewModel.contentLabel font:BA_FontSize(15) width:titleW];
    _contentLabelFrame = (CGRect){{contentLabelX, contentLabelY}, {contentLabelW, contentLabelH}};

    /*! 计算cell高度 */
    self.cellHeight = CGRectGetMaxY(_contentLabelFrame) + BAStatusCellMargin * 0.5;
}

@end
