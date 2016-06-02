//
//  BANewsNetManager.h
//  BABaseProject
//
//  Created by apple on 16/1/13.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BABaseNetManager.h"

@interface BANewsNetManager : BABaseNetManager


//http://c.m.163.com/nc/video/home/1-10.html
//1-10, 从第一条数据开始获取,共获取10条, 11-10, 21-10

/*!
 *  示例1：DemoVC1中的网络获取示例
 *
 *  @param startIndex index
 *
 *  @return DemoVC1中的网络获取示例
 */
+ (id)getVideosWithStartIndex:(NSInteger)startIndex kCompletionHandle;

/*!
 *  示例2：DemoVC11中的网络获取示例
 *
 *  @return DemoVC11中的网络获取示例
 */
+ (id)getDemoVC11DataCompletionHandle:(void(^)(id model, NSError *error))completionHandle;



@end
