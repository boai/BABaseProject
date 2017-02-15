//
//  BAPage.m
//  BABaseProject
//
//  Created by 博爱 on 2016/12/16.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BAPage.h"

@implementation BAPage

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        _count=0;
        _pageSize=10;
        _cuPage=1;
    }
    return self;
}

/*!
 *  是否已到最后一页
 *
 *  @return 是否
 */
- (BOOL)ba_page_isEnd
{
    int maxPage = _cuPage * _pageSize;
    BALog(@"当前页码：%@，pageSize：%@，总条数：%@", _cuPage, _pageSize, _count);
    
    if (maxPage >= _count)
    {
        return YES;
    }
    return NO;
}

/*!
 *  获得下一个页面请求的页码数。
 *
 *  @return 页码数
 */
- (int)ba_page_getNextPage
{
    BALog(@"当前页码：%@，pageSize：%@，总条数：%@", _cuPage, _pageSize, _count);
    if ([self ba_page_isEnd])
    {
        return -1;
    }
    else
    {
        return _cuPage + 1;
    }
}

@end
