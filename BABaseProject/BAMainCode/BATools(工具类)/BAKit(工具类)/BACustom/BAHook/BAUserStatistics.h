//
//  BAUserStatistics.h
//  testDemo
//
//  Created by 博爱 on 2016/11/2.
//  Copyright © 2016年 DS-Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BAUserStatistics : NSObject

/**
 *  初始化配置，一般在launchWithOption中调用
 */
+ (void)configure;

+ (void)enterPageViewWithPageID:(NSString *)pageID;

+ (void)leavePageViewWithPageID:(NSString *)pageID;

+ (void)sendEventToServer:(NSString *)eventId;


@end
