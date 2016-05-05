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
    CGRect titleSize = [_viewModel.titleLabel boundingRectWithSize:CGSizeMake(titleW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:BA_FontSize(15)} context:nil];
//    CGFloat titleH = [self baauto];
    _titleLabelFrame = (CGRect){{titleX, titleY}, titleSize.size};

    /*! 内容Frame */
    CGFloat contentLabelX = titleX;
    CGFloat contentLabelY = CGRectGetMaxY(_titleLabelFrame) + BAStatusCellMargin;
    CGFloat contentLabelW = BA_SCREEN_WIDTH - 2 * BAStatusCellMargin;
    CGRect contentLabelSize = [_viewModel.contentLabel boundingRectWithSize:CGSizeMake(contentLabelW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:BA_FontSize(14)} context:nil];
    _contentLabelFrame = (CGRect){{contentLabelX, contentLabelY}, contentLabelSize.size};

    /*! 计算cell高度 */
    self.cellHeight = CGRectGetMaxY(_contentLabelFrame) + BAStatusCellMargin * 0.5;
}

@end
