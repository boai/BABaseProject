//
//  UIButton+BAHook.h
//  BABaseProject
//
//  Created by 博爱 on 2016/11/3.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (BAHook)

@property (nonatomic, assign) NSInteger  buttonClickedCount;
@property (nonatomic, copy) void (^ButtonCurrentActionBlock)() ;

@end
