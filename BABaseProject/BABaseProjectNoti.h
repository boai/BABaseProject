//
//  BABaseProjectNoti.h
//  BABaseProject
//
//  Created by 博爱 on 16/5/7.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#ifndef BABaseProjectNoti_h
#define BABaseProjectNoti_h

/*! ************** 本项目框架使用说明 ************** */

#pragma mark - ***** 1、注释规范：

.h 文件：

属性名示例：
/*! 标题Frame */
@property (nonatomic, assign) CGRect          titleLabelFrame;

方法示例：
/*!
 *  是否使用自定义TabVC
 *
 *  @param is YES:使用，NO:使用RDVTabVC
 */
- (void)isBATabVC:(BOOL)is;

.m 文件

属性名 同上;

功能分区：
一级：#pragma mark - *****
二级：#pragma mark
示例：
// #pragma mark - ***** 使用RDVTabBarController 设置
// #pragma mark 初始化各个ViewController
//- (void)setupViewControllers
//{
//    
//}

#pragma mark - ***** 2、其他各种分类、封装使用：
详见各个DemoVC文件夹下各种示例VC






#endif /* BABaseProjectNoti_h */
