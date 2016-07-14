//
//  BACustomBarItem.h
//  yrapp
//
//  Created by 博爱 on 16/2/24.
//  Copyright © 2016年 有人科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum{

    left,
    center,
    right

}ItemType;

@interface BACustomBarItem : NSObject

@property (nonatomic, strong) UIBarButtonItem *fixBarItem;
@property (nonatomic, strong) UIButton *contentBarItem;
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, assign) ItemType itemType;
@property (nonatomic, strong) UIView *customView;
@property (nonatomic, assign) BOOL isCustomView;

/*!
 *  自定义文字naviBar
 *
 *  @param title 标题
 *  @param color 字体颜色
 *  @param font  字体大小
 *  @param type  居左、居中、居右
 *
 *  @return 自定义文字naviBar
 */
+ (BACustomBarItem *)itemWithTitle:(NSString *)title textColor:(UIColor *)color fontSize:(CGFloat)font itemType:(ItemType)type;

/*!
 *  自定义图片naviBar
 *
 *  @param imageName 图片名字
 *  @param highImage 高亮图片名字
 *  @param size      大小
 *  @param type      居左、居中、居右
 *
 *  @return 自定义图片naviBar
 */
+ (BACustomBarItem *)itemWithImage:(NSString *)imageName highImage:(NSString *)highImage size:(CGSize)size type:(ItemType)type;

/*!
 *  自定义View 的naviBar
 *
 *  @param customView 自定义View
 *  @param type       居左、居中、居右
 *
 *  @return 自定义View 的naviBar
 */
+ (BACustomBarItem *)itemWithCustomeView:(UIView *)customView type:(ItemType)type;

/*!
 *  系统的naviBar
 *
 *  @param navigationItem navigationItem
 *  @param type           居左、居中、居右
 */
- (void)setItemWithNavigationItem:(UINavigationItem *)navigationItem itemType:(ItemType)type;

/*!
 *  target事件
 *
 *  @param target   target
 *  @param selector selector
 *  @param event    event
 */
- (void)addTarget:(id)target selector:(SEL)selector event:(UIControlEvents)event;

/*!
 *设置item偏移量
 *@param offSet 正值向左偏，负值向右偏
 */
- (void)setOffset:(CGFloat)offSet;

@end
