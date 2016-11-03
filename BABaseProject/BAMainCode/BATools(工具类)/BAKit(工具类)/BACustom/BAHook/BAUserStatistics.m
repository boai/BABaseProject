//
//  BAUserStatistics.m
//  testDemo
//
//  Created by 博爱 on 2016/11/2.
//  Copyright © 2016年 DS-Team. All rights reserved.
//

#import "BAUserStatistics.h"

@implementation BAUserStatistics

/**
 *  初始化配置，一般在launchWithOption中调用
 */
+ (void)configure
{

}

#pragma mark - ***** 页面统计部分
/*! 进入页面 */
+ (void)enterPageViewWithPageID:(NSString *)pageID
{
    NSLog(@"***模拟发送[进入页面]事件给服务端，页面ID:%@", pageID);
}

/*! 离开页面 */
+ (void)leavePageViewWithPageID:(NSString *)pageID
{
    NSLog(@"***模拟发送[离开页面]事件给服务端，页面ID:%@", pageID);
}

#pragma mark - ***** 自定义事件统计部分
/*! 在这里发送event统计信息给服务端 */
+ (void)sendEventToServer:(NSString *)eventId
{
    NSLog(@"***模拟发送统计事件给服务端，事件ID: %@", eventId);
}


@end
