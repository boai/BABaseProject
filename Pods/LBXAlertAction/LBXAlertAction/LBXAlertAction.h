//
//  LBXAlertAction.h
//
//
//  Created by lbxia on 15/10/27.
//  Copyright © 2015年 lbxia. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 @brief  封装UIAlertView、UIActionSheet、UIAlertController
         根据不同系统版本，对应选择，方便调用
 */
@interface LBXAlertAction : NSObject

/**
 *  模式对话框，选择一项（UIAlertView与与UIAlertController封装，根据不同ios版本对应选择调用方法）
 *
 *  @param title      标题
 *  @param message    提示内容
 *  @param arrayItems 按钮数组，“取消按钮” 请放第一个，系统显示有默认效果,example:@[@"取消",@"确认1",@"确认2",@"确认3",@"确认4",@"确认5",@"确认6"]
 *  @param block      点击事件，返回按钮顺序
 */
+ (void)showAlertWithTitle:(NSString*)title
                       msg:(NSString*)message
          buttonsStatement:(NSArray<NSString*>*)arrayItems
               chooseBlock:(void (^)(NSInteger buttonIdx))block;


/**
 *    显示UIActionSheet模式对话框，UIActionSheet与UIAlertController封装，根据不同ios版本对应选择调用方法。
 *
 *  @param title                  标题
 *  @param message                消息内容,大于ios8.0才会显示
 *  @param cancelString           取消按钮文本
 *  @param destructiveButtonTitle 特殊标记按钮，默认红色文字显示
 *  @param otherButtonArray       其他按钮数组,如 @[@"items1",@"items2",@"items3"]
 *  @param block                  返回block,buttonIdx:cancelString,destructiveButtonTitle分别为0、1,
 otherButtonTitle从后面开始，如果destructiveButtonTitle没有，buttonIndex1开始，反之2开始
 */
+ (void)showActionSheetWithTitle:(NSString*)title
                         message:(NSString*)message
               cancelButtonTitle:(NSString*)cancelString
          destructiveButtonTitle:(NSString*)destructiveButtonTitle
                otherButtonTitle:(NSArray<NSString*>*)otherButtonArray
                     chooseBlock:(void (^)(NSInteger buttonIdx))block;



#pragma mark ---历史接口，兼容过去代码，新使用请使用上面的最新接口

/**
 @brief  模式对话框，选择一项（UIAlertView与与UIAlertController封装，根据不同ios版本对应选择调用方法）
 @param title        标题
 @param msg          提示内容
 @param block        返回点击的按钮index,按照buttonsStatement按钮的顺序，从0开始
 @param cancelString 取消按钮 文本，必须以nil结束
 */
+ (void)showAlertWithTitle:(NSString*)title
                       msg:(NSString*)msg
               chooseBlock:(void (^)(NSInteger buttonIdx))block
          buttonsStatement:(NSString*)cancelString, ...;

/**
 @brief  显示UIActionSheet模式对话框，UIActionSheet与UIAlertController封装，根据不同ios版本对应选择调用方法。
 @param title                  标题
 @param message                消息内容,大于ios8.0才会显示
 @param block                  返回block,buttonIdx:cancelString,destructiveButtonTitle分别为0、1,
                               otherButtonTitle从后面开始，如果destructiveButtonTitle没有，buttonIndex1开始，反之2开始
 @param cancelString           取消文本
 @param destructiveButtonTitle 特殊标记按钮，默认红色文字显示
 @param otherButtonTitle       其他选项,必须以nil结束
 */
+ (void)showActionSheetWithTitle:(NSString*)title
                         message:(NSString*)message
                     chooseBlock:(void (^)(NSInteger buttonIdx))block
               cancelButtonTitle:(NSString*)cancelString
          destructiveButtonTitle:(NSString*)destructiveButtonTitle
                otherButtonTitle:(NSString*)otherButtonTitle,...;






@end
