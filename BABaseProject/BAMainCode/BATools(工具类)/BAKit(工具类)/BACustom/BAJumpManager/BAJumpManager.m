//
//  BAJumpManager.m
//  博爱微信
//
//  Created by 博爱 on 2016/10/24.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BAJumpManager.h"
#import "AppDelegate.h"
#import "BALoginViewController.h"

//@interface UIViewController (TopViewController)
//
//- (UIViewController *)ba_getTopViewController;
//
//@end
//
//@implementation UIViewController (TopViewController)
//
//- (UIViewController *)ba_getTopViewController
//{
//    UIViewController *topViewController = self;
//    
//    UIViewController *above;
//    while ((above = topViewController.presentedViewController)) {
//        topViewController = above;
//    }
//    
//    return topViewController;
//}
//
//@end

@implementation BAJumpManager

+ (BAJumpManager *)sharedBAJumpManager
{
//    NSAssert(0, @"这是一个单例对象，请使用+(NetAPIManager *)sharedInstance方法");
    /*! 为单例对象创建的静态实例，置为nil，因为对象的唯一性，必须是static类型 */
    static id sharedBAJumpManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedBAJumpManager = [[super allocWithZone:NULL] init];
    });
    return sharedBAJumpManager;
}

/*！
 *  重写allocWithZone方法，保证alloc或者init创建的实例不会产生新实例，因为该类覆盖了allocWithZone方法，所以只能通过其父类分配内存，即[super allocWithZone]
 *
 */
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    return [self sharedBAJumpManager];
}

- (id)copy
{
    return self;
}

+ (id)copyWithZone:(struct _NSZone *)zone
{
    return [self sharedBAJumpManager];
}


/*! 
    注意：跳转的格式，需要与后台一起定义
 {
     "className" : "MessageViewController",
     "method" : "refresh",
     "properties" : {
         "msgId": 1223030330,
         "msgType": 3
     }
 };
 
 className：跳转目标界面的类名，
 method：类的实例方法，
 properties：实例方法调用所需的参数。
 */
+ (void)ba_jumpVCWtihDict:(NSDictionary *)dict navi:(UINavigationController *)navi
{
    Class class = NSClassFromString(dict[@"className"]);
    
    UIViewController *vc = [[class alloc] init];
    
    NSDictionary *properties = dict[@"properties"];
    [properties enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        /*! 如果没有这个字段或obj为nil，让它报错好了，这样就知道问题出在哪了 */
        [vc setValue:obj forKey:key];
    }];
    
//    SEL selector = NSSelectorFromString(dict[@"method"]);
//    [vc performSelector:selector];
    [navi pushViewController:vc animated:YES];
}

/*!
 *  全局中转类
 *
 *  @param dict 跳转需要的参数
 */
+ (void)ba_jumpToVCWtihDict:(NSDictionary *)dict
{
    if ([BACommon ba_isNSDictionaryNULL:dict])
    {
        return;
    }
    
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UIViewController *viewController = app.window.rootViewController;
    
    /*! 跳转 VC 的标识 */
    NSString *actionType    = [dict objectForKey:@"actionType"];
    NSString *actionParam   = [dict objectForKey:@"actionParam"];
    
    
}

+ (void)ba_gotoLoginVCWithViewController:(UIViewController *)viewController
{
    if (!viewController)
    {
        AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
        viewController = app.window.rootViewController;
    }
    if (BAUSERSHARE.isLogin)
    {
        [viewController.view ba_showAlertView:@"温馨提示：" message:@"当前用户已登录，请勿重复登录！"];
        return ;
    }
//    [viewController BAAlertWithTitle:@"温馨提示：" message:@"当前用户未 登录 ，是否 登录 ？"  andOthers:@[@"取 消", @"登 录"] animated:YES action:^(NSInteger index) {
//        if (index == 1)
//        {
//            [viewController.navigationController pushViewController:[BALoginViewController new] animated:YES];
//        }
//
//    }];
    
    [BAJUMPMANAGERShare ba_loginAlertWithViewController:viewController];
}

- (void)ba_loginAlertWithViewController:(UIViewController *)viewController
{
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:@"博爱温馨提示：" attributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]}];
    
    NSString *result = @"当前用户未 登录 ，是否 登录 ？";
    NSString *keyWord = @"登录";
    
    /*! 关键字添加效果 */
    NSMutableAttributedString *attributedMessage = [[NSMutableAttributedString alloc]initWithString:result];
    
    /*! 获取关键字位置 */
    NSRange range = [result rangeOfString:keyWord];
    
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:[UIColor blackColor],NSKernAttributeName:@2.0,NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle),NSStrokeColorAttributeName:[UIColor blueColor],NSStrokeWidthAttributeName:@2.0,NSVerticalGlyphFormAttributeName:@(0)};
    
    /*! 设置关键字属性 */
    [attributedMessage ba_changeAttributeDict:dic range:range];
    
    BAWeak;
    /*! 系统 alert */
    [UIAlertController showAlertInViewController:viewController
                                       withTitle:@"温馨提示："
                          mutableAttributedTitle:title
                                         message:@"当前用户未登录，是否登录？"
                        mutableAttributedMessage:attributedMessage
                               buttonTitlesArray:@[@"取 消", @"登 录"]
                           buttonTitleColorArray:@[BA_Green_Color, BA_Red_Color]
                                        tapBlock:^(UIAlertController * _Nonnull controller, UIAlertAction * _Nonnull action, NSInteger buttonIndex) {
                                            if (1 == buttonIndex)
                                            {
                                                BALoginViewController *loginVC = [[BALoginViewController alloc] init];
                                                [viewController.navigationController pushViewController:loginVC animated:YES];
                                            }
                                        }];
}


@end
