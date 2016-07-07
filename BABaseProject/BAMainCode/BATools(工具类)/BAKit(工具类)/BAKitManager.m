//
//  BAKitManager.m
//  BABaseProject
//
//  Created by 博爱 on 16/7/7.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BAKitManager.h"

@interface BAKitManager ()

@property (nonatomic, weak) __kindof UIView *tempView;   //temp View,use to set view

@property (nonatomic, weak) __kindof UIControl *tempControl;   //temp control,use to set control sub class

@end

@implementation BAKitManager

- (__kindof UIView *)tempView
{
    if (!_tempView)
    {
        if ([self.main isKindOfClass:[UIView class]])
        {
            _tempView = self.main;
        }
    }
    return _tempView;
}

- (__kindof UIControl *)tempControl
{
    if (!_tempControl)
    {
        if ([self.main isKindOfClass:[UIControl class]])
        {
            _tempControl = self.main;
        }
    }
    return _tempControl;
}


@end
