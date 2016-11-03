//
//  UIControl+BAUserStastistics.m
//  testDemo
//
//  Created by 博爱 on 2016/11/2.
//  Copyright © 2016年 DS-Team. All rights reserved.
//

#import "UIControl+BAUserStastistics.h"
#import "NSObject+BAHook.h"
#import "BAEventIDConstant.h"
#import "BAUserStatistics.h"

@implementation UIControl (BAUserStastistics)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL originalSelector = @selector(sendAction:to:forEvent:);
        SEL swizzledSelector = @selector(swiz_sendAction:to:forEvent:);
        [[self class] ba_swizzlingOriginalSelector:originalSelector
                                  swizzledSelector:swizzledSelector];
    });
}


#pragma mark - Method Swizzling

- (void)swiz_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event;
{
    //插入埋点代码
    [self performUserStastisticsAction:action to:target forEvent:event];
    [self swiz_sendAction:action to:target forEvent:event];
}

- (void)performUserStastisticsAction:(SEL)action to:(id)target forEvent:(UIEvent *)event;
{
    //NSLog(@"\n***hook success.\n[1]action:%@\n[2]target:%@ \n[3]event:%@", NSStringFromSelector(action), target, event);
    NSString *eventID = nil;
    // 只统计触摸结束时
    if ([[[event allTouches] anyObject] phase] == UITouchPhaseEnded)
    {
        NSString *actionString = NSStringFromSelector(action);
        NSString *targetName = NSStringFromClass([target class]);
        NSDictionary *configDict = [self dictionaryFromUserStatisticsConfigPlist];
        eventID = configDict[targetName][@"ControlEventIDs"][actionString];
    }
    if (eventID != nil)
    {
        [BAUserStatistics sendEventToServer:eventID];
    }
}

- (NSDictionary *)dictionaryFromUserStatisticsConfigPlist
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"BADemoUserStatisticsConfig" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    return dic;
}

@end
