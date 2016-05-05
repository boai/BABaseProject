//
//  BANewsNetManager.h
//  BABaseProject
//
//  Created by apple on 16/1/13.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BABaseNetManager.h"
#import "BAVideoModel.h"

@interface BANewsNetManager : BABaseNetManager


//http://c.m.163.com/nc/video/home/1-10.html
//1-10, 从第一条数据开始获取,共获取10条, 11-10, 21-10

+ (id)getVideosWithStartIndex:(NSInteger)startIndex kCompletionHandle;



@end
