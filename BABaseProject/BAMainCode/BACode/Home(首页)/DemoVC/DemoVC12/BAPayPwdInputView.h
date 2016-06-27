//
//  BAPayPwdInputView.h
//  BABaseProject
//
//  Created by 博爱 on 16/6/27.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BAPayPwdInputView : UIView

/*! 支付密码长度 */
@property (assign, nonatomic) NSUInteger length;
/*! 输入完成回调 */
@property (copy, nonatomic) void (^inputDidCompletion)(NSString *pwd);


@end
