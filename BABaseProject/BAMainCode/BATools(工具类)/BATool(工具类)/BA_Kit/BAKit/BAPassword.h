
/*!
 *  @header BAKit.h
 *          demoTest
 *
 *  @brief  BAKit
 *
 *  @author 博爱
 *  @copyright    Copyright © 2016年 博爱. All rights reserved.
 *  @version    V1.0
 */

/*!
 *
 *          ┌─┐       ┌─┐
 *       ┌──┘ ┴───────┘ ┴──┐
 *       │                 │
 *       │       ───       │
 *       │  ─┬┘       └┬─  │
 *       │                 │
 *       │       ─┴─       │
 *       │                 │
 *       └───┐         ┌───┘
 *           │         │
 *           │         │
 *           │         │
 *           │         └──────────────┐
 *           │                        │
 *           │                        ├─┐
 *           │                        ┌─┘
 *           │                        │
 *           └─┐  ┐  ┌───────┬──┐  ┌──┘
 *             │ ─┤ ─┤       │ ─┤ ─┤
 *             └──┴──┘       └──┴──┘
 *                 神兽保佑
 *                 代码无BUG!
 */

/*
 
 *********************************************************************************
 *
 * 在使用BAKit的过程中如果出现bug请及时以以下任意一种方式联系我，我会及时修复bug
 *
 * QQ     : 可以添加SDAutoLayout群 497140713 在这里找到我(博爱1616【137361770】)
 * 微博    : 博爱1616
 * Email  : 137361770@qq.com
 * GitHub : https://github.com/boai
 * 博客园  : http://www.cnblogs.com/boai/
 *********************************************************************************
 
 */

#import <Foundation/Foundation.h>

/**
 *  密码强度级别枚举，从0到6
 */
typedef NS_ENUM(NSInteger, PasswordStrengthLevel)
{
    PasswordStrengthLevelVeryWeak = 0,
    PasswordStrengthLevelWeak,
    PasswordStrengthLevelAverage,
    PasswordStrengthLevelStrong,
    PasswordStrengthLevelVeryStrong,
    PasswordStrengthLevelSecure,
    PasswordStrengthLevelVerySecure
};

/**
 *  这个类添加一些有用的管理密码方法
 */
@interface BAPassword : NSObject

/**
 *  检查密码强度级别
 */
+ (PasswordStrengthLevel)passwordCheckStrength:(NSString *)password;
@end
