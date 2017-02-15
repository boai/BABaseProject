//
//  BAPage.h
//  BABaseProject
//
//  Created by 博爱 on 2016/12/16.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BAPage : NSObject

/*!
 *  总共的数据记录数
 */
@property (nonatomic, assign) int count;

/*!
 *  分页数据的大小
 */
@property (nonatomic, assign) int pageSize;

/*!
 *  当前页数
 */
@property (nonatomic, assign) int cuPage;

/*!
 *  是否已到最后一页
 *
 *  @return 是否
 */
- (BOOL)ba_page_isEnd;

/*!
 *  获得下一个页面请求的页码数。
 *
 *  @return 页码数
 */
- (int)ba_page_getNextPage;

@end
