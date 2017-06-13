# BABaseProject
[![BAHome Team Name](https://img.shields.io/badge/Team-BAHome-brightgreen.svg?style=flat)](https://github.com/BAHome "BAHome Team")
![](https://img.shields.io/badge/platform-iOS-red.svg) ![](https://img.shields.io/badge/language-Objective--C-orange.svg) 
![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 
 [![](https://img.shields.io/badge/微博-博爱1616-red.svg)](http://weibo.com/538298123)

## 1、功能及简介
* 1、iOS 开发常用的控件封装，如：[BAButton](https://github.com/BAHome/BAButton)、[BAPickView](https://github.com/BAHome/BAPickView)、[BATextView](https://github.com/BAHome/BATextView)、[BATouchID](https://github.com/BAHome/BATouchID)、[BANetManager](https://github.com/BAHome/BANetManager)、[BAAlert](https://github.com/BAHome/BAAlert)<br>
* 2、常用功能封装，如：倒计时、跑马灯等
* 3、常用第三方SDK demo，如：友盟分享登录封装、百度地图详细 demo
* 4、web OC 交互，详见demo
* 5、常用 动画 封装
* 6、常用 网络库 封装，如：[BANetManager](https://github.com/BAHome/BANetManager)
* 7、AOP 切面编程
* 8、runtime 封装使用，详见demo
* 9、渐变navi 封装，详见demo
* 10、NSMutableAttributedString 的完美封装
* 11、3D Touch使用demo
* 12、正则表达式封装
* 13、BAKit 系列封装逐渐开放，目前项目中已添加部分封装
* 等等，内容太多，详见demo

## 2、图片示例
<!--![BAButton1](https://github.com/BAHome/BAButton/blob/master/Images/BAButton1.png)
![BAButton2](https://github.com/BAHome/BAButton/blob/master/Images/BAButton2.png)
![BAButton4](https://github.com/BAHome/BAButton/blob/master/Images/BAButton4.png)-->

## 3、项目目录 和 使用指南
#### 项目简介 <br>
**主要使用 MVVM 和 MVC 设计模式，共分为三大类：** <br>

1、Main <br>

* 主要功能：三种tabbarVC，可以自由选择，一种是完全自定义tabbarVC，一种是DVTabBarController，一种是storeboard搭建的tabBarController <br>

2、BAMainCode <br>

- 2.1、BACode    【主要代码】   如：Home(首页)、Message(消息)、Discover(发现)、Profile(我) <br>
- 2.2、BABaseData【基类】      如：BABaseVC、BABaseView、BABaseModel <br>
- 2.3、BALib     【三方库】    如：不能用pod更新的三方库可以放在这里 <br>
- 2.4、BATools   【工具类】    如：BACategory(分类)、BADataBase(数据库)、BAMacros(宏)、BANetManager(网络类)、BAKit(工具类) <br>
- 2.5、Resources 【资源】      如：字体、Plist、图片 <br>
- 2.6、Other     【其他代码】   如： <br>
- 2.7、BACustom  【其他自定义】 如：暂时不知道放在哪里的自定义文件可放在这里 <br>

3、Supporting Files <br>

- 这里暂时放置系统的文件，如：AppDelegate、Main.storyboard、Assets.xcassets、Assets.xcassets、main.m <br>

#### 使用指南 <br>
使用的时候删除每个VC里面的DemoVC文件夹即可！<br>
DemoVC文件夹：是专门展示各级样例用法的文件夹！

4、项目源码地址：<br>
 OC 版 ：[https://github.com/boai/BABaseProject](https://github.com/boai/BABaseProject)<br>

## 4、BABaseProject 的类结构及 demo 示例
<!--![BAButton3](https://github.com/BAHome/BAButton/blob/master/Images/BAButton3.png)-->
详见源码！

## 5、更新记录：【倒叙】
 欢迎使用 [【BAHome】](https://github.com/BAHome) 系列开源代码 ！
 如有更多需求，请前往：[【https://github.com/BAHome】](https://github.com/BAHome) 
 
 最新更新时间：2017-06-13 【倒叙】 <br>
 最新Version：【Version：2.2.1】 <br>
 更新内容： <br>
 2.2.1.1、新增 BAKit 系列部分源码，如：BAKit_Define.h 、BAKit_NSString.h、BAKit_UserDefaults、NSDate+BAKit.h、NSDateFormatter+BAKit.h 里面有大部分改动，代码更规范，质量更高 <br>
 
 最新更新时间：2017-06-03 【倒叙】 <br>
 最新Version：【Version：2.2.0】 <br>
 更新内容： <br>
 2.2.0.1、新增 [BAHome](https://github.com/BAHome)系列精品源码封装及使用demo <br>
 2.2.0.2、使用pod 方法导入 [BANetManager](https://github.com/BAHome/BANetManager) <br>
 2.2.0.3、新增 BAButton demo [BAButton](https://github.com/BAHome/BAButton) <br>
 2.2.0.4、重构 正则表达封装 demo <br>
 2.2.0.5、修复系统提醒和日历提醒封装崩溃的bug，添加iOS 10对应的所有权限 <br>
 2.2.0.6、新增 BAAlert demo [BAButton](https://github.com/BAHome/BAAlert) <br>
 2.2.0.7、重构百度地图demo <br>
 2.2.0.7、修复跑马灯文字过段时间重复的bug <br>
 2.2.0.8、新增倒计时 button 功能封装，两行代码搞定倒计时 button <br>

##### 2016-10-12  版本：2.1
- 5.2.30、新增 NSMutableAttributedString 的完美封装，详见：【消息】栏目DemoVC02-6！

##### 2016-10-11  版本：2.1
- 5.2.29、新增 runtime 的常用方法，优化部分代码结构，新增部分宏定义！详见：【消息】栏目DemoVC02-5！

##### 2016-10-08  版本：2.1
- 5.2.28、新增百度地图正反向地理编码的使用！详见：【消息】栏目DemoVC02-4！

##### 2016-09-20  版本：2.1
- 5.2.27、新增百度地图定位、大头针等功能的简单封装！详见：【消息】栏目DemoVC02-4！

##### 2016-08-25  版本：2.1
- 5.2.26、友盟分享和登陆 2.0 版本，欢迎之前使用的同学们赶紧更新！详见：`demoVC4`！

##### 2016-07-25  版本：2.1
- 5.2.25、新增3D Touch！详见：`appdelegate`！

##### 2016-07-24  版本：2.1
- 5.2.24、新增CAReplicatorLayer动画！详见：homeVC种demoVC1！

##### 2016-07-23  版本：2.1
- 5.2.23、新增渐变navi！详见：【消息】第二个tabbar【消息】使用！

##### 2016-07-20  版本：2.1
- 5.2.22、新增cell的展开与收回！详见：【消息】栏目DemoVC02-2！

##### 2016-07-08  版本：2.1
- 5.2.21、新增上下拉刷新的最简单写法，你肯定没用过的写法！详见：【首页】栏目DemoVC11中的网络请求写法！

##### 2016-07-05  版本：2.1
- 5.2.20、新增BAKitManager，用链式写法封装常用UIkit控件！详见：【消息】栏目DemoVC2-1中的cell的label写法！

##### 2016-07-04  版本：2.1
- 5.2.19、【消息】栏目，新增DemoVC2-1，封装baseCell，tableView的高级用法1，！详见：【消息】栏目DemoVC2-1！

##### 2016-07-03  版本：2.1
- 5.2.18、新增tabbar第二个按钮【消息】栏目，里面都是常用控件的高级用法，！详见：BAMessageViewController！

##### 2016-06-23  版本：2.0
- 5.2.17、新增跑马灯广告处理，横向、垂直滚动广告，新增点击事件处理！详见：DemoVC3！

##### 2016-06-21  版本：2.0
- 5.2.16、新增DemoVC12：五种自定义警告框的方法，系统alert、actionSheet的封装，详见：DemoVC12！

##### 2016-06-19  版本：2.0 
- 5.2.16、优化网络类的封装：
  - 1、集成get / post / put / delete等常用请求方式的封装
  - 2、集成单图/多图上传，让图片上传更简单，自带压缩处理
  - 3、集成视频上传/下载，和文件下载，让视频的上传下载更方便，支持异步下载【待测试】
  - 5、集成网络监测，让你实时监测你的宝贝APP的网络状态

##### 2016-06-14  版本：2.0 
- 5.2.15、正则表达式更新：验证身份证号（15位或18位数字）【最全的身份证校验，带校验省份、生日】，详见：DemoVC5！
- 5.2.14、新增webView的高度获取，详见：DemoVC7！
- 5.2.13、新增cell 的五种动画显示方式！详见：HomeVC！

##### 2016-06-13  版本：2.0 
- 5.2.12、新增了一种跑马灯广告效果，希望能帮助部分用户！详见：DemoVC3！

##### 2016-06-04  版本：2.0 
- 5.2.11、新增StoreBoard版的tabbar，具体使用详情请看appdelegate，已修复使用StoreBoard不能更改tabbar选中颜色的问题！
- 5.2.10、APP中的文字和APP名字的国际化多语言处理，详情请看：[『APP中的文字和APP名字的国际化多语言处理』](http://www.cnblogs.com/boai/p/5337558.html)！
- 5.2.09、重新封装全新AFN的网络类，基于[『AFNetworking 3.1』](https://github.com/AFNetworking/AFNetworking)！最新版本的封装，集成了get/post 方法请求数据，单图/多图上传，视频上传/下载，网络监测 等多种网络请求方式，详情请看：[『BANetManager』](https://github.com/boai/BANetManager)！

##### 2016-06-03  版本：2.0 
- 5.2.08、新增DemoVC11，collectionView的浮动布局，自适应宽高的item，

##### 2016-05-31  版本：2.0 
- 5.2.07、新增内存泄露检测，使用检测工具[『MLeaksFinder』](http://wereadteam.github.io/2016/02/22/MLeaksFinder/)！

##### 2016-05-30  版本：2.0 
- 5.2.06、新增DemoVC10，collectionView的简单使用，用View写的写了一个简单的collectionView，可随意添加到任何地方，新增编辑功能，能够实现collectionView 的删除！如果喜欢，请在git上点个星吧！
- 5.2.05、新增DemoVC9，流式布局和线性布局库的使用，用流式布局和线性布局库MyLayout，写了一个collectionView，如果喜欢，请在git上点个星吧！

##### 2016-05-25  版本：2.0 
- 5.2.04、新增DemoVC8，系统提醒和日历提醒，最近做了一个预约功能，有用到系统提醒和日历提醒，就写了这个demo！详情请看：[『BAReminderDemo』](https://github.com/boai/BAReminderDemo)！
- 5.2.03、新增DemoVC7，webView和WKWebView完美封装，简单的内置浏览器，有简单的功能，后期有新功能会加上！如果喜欢，请在git上点个星吧！

##### 2016-05-10  版本：2.0 
- 5.2.02、新增DemoVC6，本地通知最新完美封装，最近整理了下本地通知和极光推送，有很多坑都踩过了，刚刚整理出来的完美封装，肯定适合大部分场合，也可以用此封装写闹钟，也提醒事件，都可以！如果喜欢，请在git上点个星吧！详情请看：[『BALocalNotification』](https://github.com/boai/BALocalNotification)！
- 5.2.01、新增网易新闻的滑动SegmentControl，基于[『HMSegmentedControl』](https://github.com/HeshamMegid/HMSegmentedControl)的完美二次封装[『BASegmentControl』](https://github.com/boai/BASegmentControl)，可随时取用！

##### 2016-05-10  版本：1.0 
- 5.1.17、新增最贴心的正则表达式封装：车型和车牌号验证、昵称、姓名验证、使用常用的两种正则判断方法！
- 5.1.16、优化DemoVC5，新增一段文字关键字筛选高亮显示！ <br>

##### 2016-05-09  版本：1.0 
- 5.1.15、新增DemoVC5：最贴心的正则表达式封装！
- 5.1.14、优化部分代码和代码结构！ <br>

##### 2016-05-07  版本：1.0
- 5.1.13、解决tableview的分割线短一截【详见HomeVC】
- 5.1.12、新增全局键盘弹起收回处理
- 5.1.11、新增DemoVC4：友盟分享和登陆的完美封装！
- 5.1.10、新增BABaseProjectNoti.h文件，本文档的各种规范都在此说明！ <br>

##### 2016-05-06  版本：1.0
- 5.1.09、新增DemoVC3：点击button倒计时，两种比较常用的获取倒计时验证码的样式！
- 5.1.08、新增封装：BAAutoSizeWithWH，功能：实现文字的宽高自适应！
- 5.1.07、添加网络判断
- 5.1.06、优化所有注释：格式统一为 /*! 计算frame */ <br>

##### 2016-05-05  版本：1.0
- 5.1.05、完善AFN网络框架封装，实现清理缓存，自定义请求头功能！
- 5.1.04、添加两种tabbarVC，可以自由选择，一种是完全自定义tabbarVC，一种是DVTabBarController <br>

##### 2016-05-04  版本：1.0
- 5.1.03、添加雪花加载动画 
- 5.1.02、整理优化各级目录 
- 5.1.01、创建框架 

## 6、bug 反馈 和 联系方式
> 1、开发中遇到 bug，希望小伙伴儿们能够及时反馈与我们 BAHome 团队，我们必定会认真对待每一个问题！ <br>

> 2、联系方式 <br> 
QQ群：479663605  【注意：此群为 2 元 付费群，介意的小伙伴儿勿扰！】<br> 
博爱QQ：137361770 <br> 
博爱微博：[![](https://img.shields.io/badge/微博-博爱1616-red.svg)](http://weibo.com/538298123) <br> 

## 7、开发环境 和 支持版本
> 开发使用 Xcode Version 8.3.2 (8E2002) ，理论上支持所有 iOS 版本，如有版本适配问题，请及时反馈！多谢合作！

## 8、感谢
> 感谢 BAHome 团队成员倾力合作，后期会推出一系列 常用 UI 控件的封装，大家有需求得也可以在 issue 提出，如果合理，我们会尽快推出新版本！<br>

> BAHome 的发展离不开小伙伴儿的信任与推广，再次感谢各位小伙伴儿的支持！

