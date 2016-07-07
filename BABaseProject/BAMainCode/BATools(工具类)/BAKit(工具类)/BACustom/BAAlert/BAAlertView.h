//
//  BAAlertView.h
//  BABaseProject
//
//  Created by 博爱 on 16/6/21.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BAAlertView : UIView

/**
 * 初始化一个视图
 */
- (instancetype)initWithTitle:(NSString *)title
                        image:(UIImage *)image
                      message:(NSString *)message
                 buttonTitles:(NSArray *)buttonTitles;

/**
 * 显示/隐藏
 */
- (void)show:(BOOL)animated;
- (void)hide:(BOOL)animated;

/**
 * 事件回调
 */
@property (strong, nonatomic) void (^actionHandler)(NSInteger index);
/**
 * 显示隐藏后回调
 */
@property (strong, nonatomic) void (^didShowHandler)();
@property (strong, nonatomic) void (^didHideHandler)();

@property (copy, nonatomic, readonly  ) NSString  *title;
@property (copy, nonatomic, readonly  ) NSString  *message;
@property (copy, nonatomic, readonly  ) UIImage   *image;
@property (copy, nonatomic, readonly  ) NSArray   *buttonTitles;

@property (assign, nonatomic, readonly) BOOL       onShow;

/*! 背景颜色 */
@property (nonatomic, strong) UIColor  *bgroundColor;
/*! 字体颜色 */
@property (nonatomic, strong) UIColor  *titleColor;


/*! 点击外部，是否隐藏，默认NO */
@property (nonatomic, assign) BOOL      hideWhenTapOutside;

@end

@interface BAAlertView (Show)

+ (instancetype)showTitle:(NSString *)title
                    image:(UIImage *)image
                  message:(NSString *)message
             buttonTitles:(NSArray *)buttonTitles
                  handler:(void(^)(NSInteger index))handler;

+ (instancetype)showTitle:(NSString *)title message:(NSString *)message hideDelay:(CGFloat)delay;
+ (instancetype)showTitle:(NSString *)title message:(NSString *)message;

@end

