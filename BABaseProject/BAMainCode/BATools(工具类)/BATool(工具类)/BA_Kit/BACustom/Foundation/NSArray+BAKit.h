
/*!
 *  @header BAKit
 *          demoTest
 *
 *  @brief  BAKit
 *
 *  @author 博爱
 *  @copyright    Copyright © 2016年 博爱. All rights reserved.
 *  @version    V1.0
 */

/*!
 *
 *          ┌─┐       ┌─┐
 *       ┌──┘ ┴───────┘ ┴──┐
 *       │                 │
 *       │       ───       │
 *       │  ─┬┘       └┬─  │
 *       │                 │
 *       │       ─┴─       │
 *       │                 │
 *       └───┐         ┌───┘
 *           │         │
 *           │         │
 *           │         │
 *           │         └──────────────┐
 *           │                        │
 *           │                        ├─┐
 *           │                        ┌─┘
 *           │                        │
 *           └─┐  ┐  ┌───────┬──┐  ┌──┘
 *             │ ─┤ ─┤       │ ─┤ ─┤
 *             └──┴──┘       └──┴──┘
 *                 神兽保佑
 *                 代码无BUG!
 */

/*
 
 *********************************************************************************
 *
 * 在使用BAKit的过程中如果出现bug请及时以以下任意一种方式联系我，我会及时修复bug
 *
 * QQ     : 可以添加SDAutoLayout群 497140713 在这里找到我(博爱1616【137361770】)
 * 微博    : 博爱1616
 * Email  : 137361770@qq.com
 * GitHub : https://github.com/boai
 * 博客园  : http://www.cnblogs.com/boai/
 *********************************************************************************
 
 */

#import <Foundation/Foundation.h>

/**
 *  给NSArray类添加许多有用的方法
 */
@interface NSArray (BAKit)

/**
 *  获取在安全模式下给定索引的对象（如果自身是空的则无）
 */
- (id)safeObjectAtIndex:(NSUInteger)index;

/**
 *  创建反向数组
 */
- (NSArray *)reversedArray;

/**
 *  转换成JSON的NSString
 */
- (NSString *)arrayToJson;

/**
 *  模拟阵列当作一个圆。当它超出范围，重新开始
 */
- (id)objectAtCircleIndex:(NSInteger)index;

/**
 *  将指定的数组创建反向数组
 */
+ (NSArray *)reversedArray:(NSArray *)array;

/**
 *  将指定的数组转换成JSON的NSString
 */
+ (NSString *)arrayToJson:(NSArray *)array;

/**
 *   Returns the object located at a random index.
 *
 *  @return The object in the array with a random index value.
 */
- (nullable id)randomObject;

/**
 *   Returns the object located at index, or return nil when out of bounds.
 It's similar to `objectAtIndex:`, but it never throw exception.
 *
 *  @param index The object located at index.
 *
 *  @return Returns the object located at index, or return nil when out of bounds.
 It's similar to `objectAtIndex:`, but it never throw exception.
 */
- (nullable id)objectOrNilAtIndex:(NSUInteger)index;


@end
