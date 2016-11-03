//
//  UIViewController+BAHook.m
//  testDemo
//
//  Created by 博爱 on 2016/11/2.
//  Copyright © 2016年 DS-Team. All rights reserved.
//

#import "UIViewController+BAHook.h"
#import "NSObject+BAHook.h"

#import "BAUserStatistics.h"

@implementation UIViewController (BAHook)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
    
        SEL originalViewWillAppearSelector = @selector(viewWillAppear:);
        SEL swizzledViewWillAppearSelector = @selector(swiz_viewWillAppear:);
        [[self class] ba_swizzlingOriginalSelector:originalViewWillAppearSelector
                                  swizzledSelector:swizzledViewWillAppearSelector];
        
        SEL originalViewWillDisappearSelector = @selector(viewWillDisappear:);
        SEL swizzledViewWillDisappearSelector = @selector(swiz_viewWillDisappear:);
        [[self class] ba_swizzlingOriginalSelector:originalViewWillDisappearSelector
                                  swizzledSelector:swizzledViewWillDisappearSelector];
                
    });
}

- (void)swiz_viewWillAppear:(BOOL)animated
{
    /*! 插入需要执行的代码 */
    [self inject_viewWillAppear];
    /*! 不能干扰原来的代码流程，插入代码结束后要让本来该执行的代码继续执行 */
    [self swiz_viewWillAppear:animated];
}

- (void)swiz_viewWillDisappear:(BOOL)animated
{
    /*! 插入需要执行的代码 */
    [self inject_viewWillDisappear];
    /*! 不能干扰原来的代码流程，插入代码结束后要让本来该执行的代码继续执行 */
    [self swiz_viewWillDisappear:animated];
}

/*! 利用hook 统计所有页面的停留时长 */
- (void)inject_viewWillAppear
{
    NSString *pageID = [self pageEventID:YES];
    if (pageID)
    {
        /*! 这里是给后台发送请求 */
        [BAUserStatistics sendEventToServer:pageID];
    }
}

- (void)inject_viewWillDisappear
{
    NSString *pageID = [self pageEventID:NO];
    if (pageID)
    {
        /*! 这里是给后台发送请求 */
        [BAUserStatistics sendEventToServer:pageID];
    }
}

//- (NSString *)pageEventID:(BOOL)bEnterPage
//{
//    NSString *selfClassName = NSStringFromClass([self class]);
//    NSString *pageEventID = nil;
//    if ([selfClassName isEqualToString:@"HomeViewController"]) {
//        pageEventID = bEnterPage ? @"EVENT_HOME_ENTER_PAGE" : @"EVENT_HOME_LEAVE_PAGE";
//    } else if ([selfClassName isEqualToString:@"DetailViewController"]) {
//        pageEventID = bEnterPage ? @"EVENT_DETAIL_ENTER_PAGE" : @"EVENT_DETAIL_LEAVE_PAGE";
//    }
//    //else if (<#expression#>)...
//    
//    return pageEventID;
//}

- (NSString *)pageEventID:(BOOL)bEnterPage
{
    NSDictionary *configDict = [self dictionaryFromUserStatisticsConfigPlist];
    NSString *selfClassName = NSStringFromClass([self class]);
    return configDict[selfClassName][@"PageEventIDs"][bEnterPage ? @"Enter" : @"Leave"];
}

- (NSDictionary *)dictionaryFromUserStatisticsConfigPlist
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"BADemoUserStatisticsConfig" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    return dic;
}

@end
