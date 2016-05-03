//
//  BAShareManage.h
//  yrapp
//
//  Created by 博爱 on 16/2/3.
//  Copyright © 2016年 有人科技. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef  void (^RRBlock)(NSInteger index,UILabel *sheetLab,id ShareType);


@interface BAShareManageView : UIView


/*
 *  为actionsheet上小视图
 *  按照 高度120（90（按钮60*60）+30）来设计
 */

@property (nonatomic,strong) UIButton *sheetBtn;

@property (nonatomic,strong) UILabel *sheetLab;

///要分享到的平台
@property (nonatomic) id  shareType;



@property (nonatomic,copy) RRBlock block;


- (void)selectedIndex:(RRBlock)block;

@end
