//
//  NSString+NSNumber.h
//  testDemo
//
//  Created by 博爱 on 2016/11/7.
//  Copyright © 2016年 DS-Team. All rights reserved.
//

#import <UIKit/UIKit.h>

/*! 源码：https://github.com/lyb5834/YBAttributeTextTapAction */

@protocol BAAttributeTapActionDelegate <NSObject>

@optional
/**
 *  YBAttributeTapActionDelegate
 *
 *  @param string  点击的字符串
 *  @param range   点击的字符串range
 *  @param index 点击的字符在数组中的index
 */
- (void)ba_attributeTapReturnString:(NSString *)string
                              range:(NSRange)range
                              index:(NSInteger)index;
@end

@interface BAAttributeModel : NSObject

@property (nonatomic, copy) NSString *str;

@property (nonatomic, assign) NSRange range;

@end





@interface UILabel (BAAttributeTextTapAction)

/**
 *  是否打开点击效果，默认是打开
 */
@property (nonatomic, assign) BOOL enabledTapEffect;

/**
 *  给文本添加点击事件Block回调
 *
 *  @param strings  需要添加的字符串数组
 *  @param tapClick 点击事件回调
 */
- (void)ba_addAttributeTapActionWithStrings:(NSArray <NSString *> *)strings
                                 tapClicked:(void (^) (NSString *string , NSRange range , NSInteger index))tapClick;

/**
 *  给文本添加点击事件delegate回调
 *
 *  @param strings  需要添加的字符串数组
 *  @param delegate delegate
 */
- (void)ba_addAttributeTapActionWithStrings:(NSArray <NSString *> *)strings
                                   delegate:(id <BAAttributeTapActionDelegate> )delegate;

@end

