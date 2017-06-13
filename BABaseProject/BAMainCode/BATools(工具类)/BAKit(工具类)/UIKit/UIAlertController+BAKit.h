
/*!
 *  @header BAKit.h
 *          BABaseProject
 *
 *  @brief  BAKit
 *
 *  @author 博爱
 *  @copyright    Copyright © 2016年 博爱. All rights reserved.
 *  @version    V1.0
 */

//                            _ooOoo_
//                           o8888888o
//                           88" . "88
//                           (| -_- |)
//                            O\ = /O
//                        ____/`---'\____
//                      .   ' \\| |// `.
//                       / \\||| : |||// \
//                     / _||||| -:- |||||- \
//                       | | \\\ - /// | |
//                     | \_| ''\---/'' | |
//                      \ .-\__ `-` ___/-. /
//                   ___`. .' /--.--\ `. . __
//                ."" '< `.___\_<|>_/___.' >'"".
//               | | : `- \`.;`\ _ /`;.`/ - ` : | |
//                 \ \ `-. \_ __\ /__ _/ .-` / /
//         ======`-.____`-.___\_____/___.-`____.-'======
//                            `=---='
//
//         .............................................
//                  佛祖镇楼                  BUG辟易
//          佛曰:
//                  写字楼里写字间，写字间里程序员；
//                  程序人员写程序，又拿程序换酒钱。
//                  酒醒只在网上坐，酒醉还来网下眠；
//                  酒醉酒醒日复日，网上网下年复年。
//                  但愿老死电脑间，不愿鞠躬老板前；
//                  奔驰宝马贵者趣，公交自行程序员。
//                  别人笑我忒疯癫，我笑自己命太贱；
//                  不见满街漂亮妹，哪个归得程序员？

/*
 
 *********************************************************************************
 *
 * 在使用BAKit的过程中如果出现bug请及时以以下任意一种方式联系我，我会及时修复bug
 *
 * QQ     : 可以添加ios开发技术群 479663605 在这里找到我(博爱1616【137361770】)
 * 微博    : 博爱1616
 * Email  : 137361770@qq.com
 * GitHub : https://github.com/boai
 * 博客    : http://boaihome.com
 
 *********************************************************************************
 
 */

#import <UIKit/UIKit.h>

#if TARGET_OS_IOS
typedef void (^UIAlertControllerPopoverPresentationControllerBlock) (UIPopoverPresentationController * __nonnull popover);
#endif

/**
 按钮点击事件 block

 @param alertController alertController
 @param action UIAlertAction
 @param buttonIndex buttonIndex
 */
typedef void (^BAKit_AlertControllerButtonActionBlock) (UIAlertController * __nonnull alertController, UIAlertAction * __nonnull action, NSInteger buttonIndex);

/**
 textField 配置信息 block

 @param textField textField
 @param index index
 */
typedef void (^BAKit_AlertControllerTextFieldConfigurationActionBlock)(UITextField * _Nullable textField, NSInteger index);

@interface UIAlertController (BAKit)

/**
 快速创建一个系统 普通 UIAlertController-Alert
 
 @param viewController 显示的VC
 @param title title
 @param message message
 @param buttonTitleArray 按钮数组
 @param buttonTitleColorArray 按钮颜色数组，默认：系统蓝色，如果颜色数组个数小于title数组个数，则全部为默认蓝色
 @param block block
 @return UIAlertController-Alert
 */
+ (nonnull instancetype)ba_alertShowInViewController:(nonnull UIViewController *)viewController
                                               title:(nullable NSString *)title
                                             message:(nullable NSString *)message
                                    buttonTitleArray:(nullable NSArray *)buttonTitleArray
                               buttonTitleColorArray:(nullable NSArray <UIColor *>*)buttonTitleColorArray
                                               block:(nullable BAKit_AlertControllerButtonActionBlock)block;

/**
 快速创建一个系统 普通 带 textField 的 UIAlertController-Alert
 
 @param viewController 显示的VC
 @param title title
 @param message message
 @param buttonTitleArray 按钮数组
 @param buttonTitleColorArray 按钮颜色数组，默认：系统蓝色，如果颜色数组个数小于title数组个数，则全部为默认蓝色
 @param buttonEnabledNoWithTitleArray 初始化的时候按钮为 EnabledNo 状态 的 title 数组
 @param textFieldPlaceholderArray textFieldPlaceholderArray 需要添加的 textField placeholder 数组
 @param textFieldConfigurationActionBlock textField 配置信息 block
 @param block block
 @return 普通 带 textField 的 UIAlertController-Alert
 */
+ (nonnull instancetype)ba_alert2ShowInViewController:(nonnull UIViewController *)viewController
                                                title:(nullable NSString *)title
                                              message:(nullable NSString *)message
                                     buttonTitleArray:(nullable NSArray *)buttonTitleArray
                                buttonTitleColorArray:(nullable NSArray <UIColor *> *)buttonTitleColorArray
                        buttonEnabledNoWithTitleArray:(NSArray <NSString *> *_Nullable)buttonEnabledNoWithTitleArray
                            textFieldPlaceholderArray:(NSArray <NSString *> *_Nullable)textFieldPlaceholderArray
                    textFieldConfigurationActionBlock:(nullable BAKit_AlertControllerTextFieldConfigurationActionBlock)textFieldConfigurationActionBlock
                                                block:(nullable BAKit_AlertControllerButtonActionBlock)block;

/**
 快速创建一个系统 attributedTitle UIAlertController-Alert
 
 @param viewController 显示的VC
 @param attributedTitle attributedTitle
 @param attributedMessage attributedMessage
 @param buttonTitleArray 按钮数组
 @param buttonTitleColorArray 按钮颜色数组，默认：系统蓝色，如果颜色数组个数小于title数组个数，则全部为默认蓝色
 @param block block
 @return UIAlertController-Alert
 */
+ (nonnull instancetype)ba_alertAttributedShowInViewController:(nonnull UIViewController *)viewController
                                               attributedTitle:(nullable NSMutableAttributedString *)attributedTitle
                                             attributedMessage:(nullable NSMutableAttributedString *)attributedMessage
                                              buttonTitleArray:(nullable NSArray *)buttonTitleArray
                                         buttonTitleColorArray:(nullable NSArray <UIColor *>*)buttonTitleColorArray
                                                         block:(nullable BAKit_AlertControllerButtonActionBlock)block;


/**
 快速创建一个系统 普通 UIAlertController-ActionSheet
 
 @param viewController 显示的VC
 @param title title
 @param message message
 @param buttonTitleArray 按钮数组
 @param buttonTitleColorArray 按钮颜色数组，默认：系统蓝色，如果颜色数组个数小于title数组个数，则全部为默认蓝色
 @param popoverPresentationControllerBlock popoverPresentationControllerBlock description
 @param block block
 @return UIAlertController-ActionSheet
 */
+ (nonnull instancetype)ba_actionSheetShowInViewController:(nonnull UIViewController *)viewController
                                                                title:(nullable NSString *)title
                                                                  message:(nullable NSString *)message
                                                        buttonTitleArray:(nullable NSArray *)buttonTitleArray
                                                    buttonTitleColorArray:(nullable NSArray <UIColor *>*)buttonTitleColorArray
#if TARGET_OS_IOS
                                       popoverPresentationControllerBlock:(nullable UIAlertControllerPopoverPresentationControllerBlock)popoverPresentationControllerBlock
#endif
                                                                block:(nullable BAKit_AlertControllerButtonActionBlock)block;

/**
 快速创建一个系统 attributedTitle UIAlertController-ActionSheet
 
 @param viewController 显示的VC
 @param attributedTitle attributedTitle
 @param attributedMessage attributedMessage
 @param buttonTitleArray 按钮数组
 @param buttonTitleColorArray 按钮颜色数组，默认：系统蓝色，如果颜色数组个数小于title数组个数，则全部为默认蓝色
 @param popoverPresentationControllerBlock popoverPresentationControllerBlock description
 @param block block
 @return UIAlertController-ActionSheet
 */
+ (nonnull instancetype)ba_actionSheetAttributedShowInViewController:(nonnull UIViewController *)viewController
                                                     attributedTitle:(nullable NSMutableAttributedString *)attributedTitle
                                                   attributedMessage:(nullable NSMutableAttributedString *)attributedMessage
                                                    buttonTitleArray:(nullable NSArray *)buttonTitleArray
                                               buttonTitleColorArray:(nullable NSArray <UIColor *>*)buttonTitleColorArray
#if TARGET_OS_IOS
                                  popoverPresentationControllerBlock:(nullable UIAlertControllerPopoverPresentationControllerBlock)popoverPresentationControllerBlock
#endif
                                                               block:(nullable BAKit_AlertControllerButtonActionBlock)block;

@end
