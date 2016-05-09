
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

#import "BATouchID.h"
#import <LocalAuthentication/LocalAuthentication.h>

@implementation BATouchID

/* 显示TouchID警示 */
+ (void)showTouchIDAuthenticationWithReason:(NSString *)reason
                                 completion:(void (^)(TouchIDResult result))completion
{
    LAContext *context = [[LAContext alloc] init];
    
    NSError *error = nil;
    // 确定是否能评估一个特定的策略
    if([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                            error:&error])
    {
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                localizedReason:reason
                          reply:^(BOOL success, NSError *error) {
            if(success)
            {
                completion(TouchIDResultSuccess);
            }
            else
            {
                switch(error.code)
                {
                    case LAErrorAuthenticationFailed:
                        completion(TouchIDResultAuthenticationFailed);
                        break;
                    case LAErrorUserCancel:
                        completion(TouchIDResultUserCancel);
                        break;
                    case LAErrorUserFallback:
                        completion(TouchIDResultUserFallback);
                        break;
                    case LAErrorSystemCancel:
                        completion(TouchIDResultSystemCancel);
                        break;
                    default:
                        completion(TouchIDResultError);
                        break;
                }
            }
        }];
    }
    else
    {
        switch(error.code)
        {
            case LAErrorPasscodeNotSet:
                completion(TouchIDResultPasscodeNotSet);
                break;
            case LAErrorTouchIDNotAvailable:
                completion(TouchIDResultNotAvailable);
                break;
            case LAErrorTouchIDNotEnrolled:
                completion(TouchIDResultNotEnrolled);
                break;
            default:
                completion(TouchIDResultError);
                break;
        }
    }
}
@end
