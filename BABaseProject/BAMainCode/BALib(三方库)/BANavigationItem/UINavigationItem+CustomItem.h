//
//  UINavigationItem+CustomItem.h
//  yrapp
//
//  Created by 博爱 on 16/2/24.
//  Copyright © 2016年 有人科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BACustomBarItem.h"
@interface UINavigationItem (CustomItem)

- (BACustomBarItem *)setItemWithTitle:(NSString *)title textColor:(UIColor *)color fontSize:(CGFloat)font itemType:(ItemType)type;

- (BACustomBarItem *)setItemWithImage:(NSString *)imageName highImage:(NSString *)highImage size:(CGSize)size type:(ItemType)type;

- (BACustomBarItem *)setItemWithCustomView:(UIView *)customView itemType:(ItemType)type;

@end
