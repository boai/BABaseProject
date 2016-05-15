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

#pragma mark - ***** 2、项目简介 和 使用指南
#### 2.1 项目简介 <br>
**主要使用 MVVM 设计模式 和 MVC 设计模式，共分为三大类：** <br>

**1、Main** <br>
主要功能：两种tabbarVC，可以自由选择，一种是完全自定义tabbarVC，一种是DVTabBarController <br>

**2、BAMainCode** <br>
- 2.1 BACode    【主要代码】   如：Home(首页)、Message(消息)、Discover(发现)、Profile(我) <br>
- 2.2 BABaseData【基类】      如：BABaseVC、BABaseView、BABaseModel <br>
- 2.3 BALib     【三方库】    如：不能用pod更新的三方库可以放在这里 <br>
- 2.4 BATools   【工具类】    如：BACategory(分类)、BADataBase(数据库)、BAMacros(宏)、BANetManager(网络类)、BATool(工具类) <br>
- 2.5 Resources 【资源】      如：字体、Plist、图片 <br>
- 2.6 Other     【其他代码】   如： <br>
- 2.7 BACustom  【其他自定义】 如：暂时不知道放在哪里的自定义文件可放在这里 <br>

**3、Supporting Files** <br>
- 3.1这里暂时放置系统的文件，如：AppDelegate、Main.storyboard、Assets.xcassets、Assets.xcassets、main.m <br>

#### 2.2 使用指南 <br>
使用的时候删除每个VC里面的DemoVC文件夹即可！<br>
DemoVC文件夹：是专门展示各级样例用法的文件夹！





#endif /* BABaseProjectNoti_h */
