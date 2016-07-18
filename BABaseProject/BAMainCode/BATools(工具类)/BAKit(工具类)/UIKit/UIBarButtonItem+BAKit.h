//
//  UIBarButtonItem+BAKit.h
//  BABaseProject
//
//  Created by 博爱 on 16/7/18.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (BAKit)

/**
 *  快速创建一个显示图片的item
 *
 *  @param action   监听方法
 */
+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon target:(id)target action:(SEL)action;

/**
 *  快速创建一个显示文字的item
 *
 *  @param action   监听方法
 */
+ (UIBarButtonItem *)rightItemWithTitle:(NSString *)title target:(id)target action:(SEL)action;

//左边按钮设置文字
+ (UIBarButtonItem *)leftItemWithTitle:(NSString *)title target:(id)target action:(SEL)action;

//左边按钮设置文字和图片（文字在左，图片在右）
+ (UIBarButtonItem *)leftItemWithTitle:(NSString *)title Icon:(NSString *)icon target:(id)target action:(SEL)action;

//左边按钮设置文字和图片（文字在左，图片在右，按钮宽度实时变）
+ (UIBarButtonItem *)leftChangeItemWithTitle:(NSString *)title Icon:(NSString *)icon target:(id)target action:(SEL)action;

@end

//重新定义RightImageBtn 的方法
@interface RightImageBtn : UIButton

@end
