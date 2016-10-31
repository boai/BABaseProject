//
//  BABAJumpManager.m
//  博爱微信
//
//  Created by 博爱 on 2016/10/24.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BABAJumpManager.h"

@implementation BABAJumpManager

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


@end
