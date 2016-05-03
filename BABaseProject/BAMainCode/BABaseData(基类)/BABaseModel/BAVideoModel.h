//
//  BAVideoModel.h
//  BABaseProject
//
//  Created by apple on 16/1/13.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BABaseModel.h"


@class Videosidlist,Videolist;
@interface BAVideoModel : BABaseModel

///*
// 1.遇到字典则新建类型
// 2.解析的实现 由底层 向上
// */
//
///*
// ESJsonFormat插件的使用
// window->ESJsonFormat-> input Json
// 1.生成时,会弹出输入框,要求输入即将生成的类的类名
// 2.生成以后,要查看生成的属性,修改系统关键字
// 
// */
//
////http://c.m.163.com/nc/video/home/1-10.html
//


@property (nonatomic, copy) NSString *videoHomeSid;

@property (nonatomic, strong) NSArray<Videosidlist *> *videoSidList;

@property (nonatomic, strong) NSArray<Videolist *> *videoList;

@end

@interface Videosidlist : NSObject

@property (nonatomic, copy) NSString *sid;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *imgsrc;

@end

@interface Videolist : NSObject

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *replyid;

@property (nonatomic, copy) NSString *mp4_url;

@property (nonatomic, assign) NSInteger playCount;

@property (nonatomic, copy) NSString *replyBoard;

@property (nonatomic, copy) NSString *vid;

@property (nonatomic, assign) NSInteger length;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *m3u8Hd_url;

@property (nonatomic, copy) NSString *ptime;

@property (nonatomic, copy) NSString *cover;

@property (nonatomic, copy) NSString *videosource;

@property (nonatomic, copy) NSString *mp4Hd_url;

@property (nonatomic, assign) NSInteger playersize;

@property (nonatomic, assign) NSInteger replyCount;

@property (nonatomic, copy) NSString *m3u8_url;

@end

