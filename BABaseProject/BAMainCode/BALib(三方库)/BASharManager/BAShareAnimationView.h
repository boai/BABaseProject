//
//  BAShareAnimationView.h
//  yrapp
//
//  Created by 博爱 on 16/2/3.
//  Copyright © 2016年 有人科技. All rights reserved.
//

#import <UIKit/UIKit.h>

// 选择位置
typedef void (^CLBlock)(NSInteger index,id shareType);

// 选择按钮
typedef void(^CLBtnBlock)(UIButton *btn);

@interface BAShareAnimationView : UIView

@property (nonatomic,copy) CLBlock block;
@property (nonatomic,copy) CLBtnBlock btnBlock;

/*!
 *  初始化动画视图
 *
 *  @param titlearray title数组
 *  @param picarray   图标数组
 *
 *  @return id
 */
- (id)initWithTitleArray:(NSArray *)titlearray picarray:(NSArray *)picarray title:(NSString *)title;

/*!
 *  视图展示
 */
- (void)show;

/*!
 *  选中的index
 */
- (void)selectedWithIndex:(CLBlock)block;

/*!
 *  按钮block
 */
- (void)CLBtnBlock:(CLBtnBlock)block;

@end
