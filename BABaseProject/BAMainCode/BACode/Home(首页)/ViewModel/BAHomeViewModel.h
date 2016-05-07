//
//  BAHomeViewModel.h
//  BABaseProject
//
//  Created by 博爱 on 16/5/4.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BABaseViewModel.h"

@class BAHomeVCModel;
@interface BAHomeViewModel : BABaseViewModel

/*! model */
@property (nonatomic, strong) BAHomeVCModel  *viewModel;

/*! 标题Frame */
@property (nonatomic, assign) CGRect          titleLabelFrame;

/*! 内容Frame */
@property (nonatomic, assign) CGRect          contentLabelFrame;

/*! cell的高度 */
@property (nonatomic, assign) CGFloat         cellHeight;


@end
