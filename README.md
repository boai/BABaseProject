# BABaseProject
一个基于 MVVM 和 MVC 设计模式的基本项目框架，项目用到的各种类，各种封装，各种三方库的综合项目，欢迎大家使用！ <br>

>**本项目使用内存泄露检测工具[『MLeaksFinder』](http://wereadteam.github.io/2016/02/22/MLeaksFinder/)！** <br>
>**所有demo均检测通过！欢迎大家使用！**

###### 大家有好的需求，或者项目中遇到的重难点，可以在issue里面提需求，一定要记得联系我哈！有时间我会处理的！

## 1、性能问题 和 MVVM模式优点
#####1.1、开发中遇到的 性能问题：
- 1.1.1 cell的高度应该提前计算出来
- 1.1.2 cell的高度必须要先计算出每个子控件的frame，才能确定
- 1.1.3 如果在cell的set方法计算子控件的位置，会比较耗性能

#####1.2、解决方法：MVVM思想
- M:模型 <br>
- V:视图 <br>
- VM:视图模型（模型包装视图模型，模型+模型对应视图的frame）

#####1.3、MVVM模式的 优点
MVVM模式和MVC模式一样，主要目的是分离视图（View）和模型（Model），有几大优点
- 1.3.1 低耦合。视图（View）可以独立于Model变化和修改，一个ViewModel可以绑定到不同的"View"上，当View变化的时候Model可以不变，当Model变化的时候View也可以不变。
- 1.3.2 可重用性。你可以把一些视图逻辑放在一个ViewModel里面，让很多view重用这段视图逻辑。
- 1.3.3 独立开发。开发人员可以专注于业务逻辑和数据的开发（ViewModel），设计人员可以专注于页面设计。
- 1.3.4 可测试。界面素来是比较难于测试的，而现在测试可以针对ViewModel来写。


## 2、个人简介
- 2.1、[『微博：博爱1616』](http://weibo.com/2706728003/profile?rightmod=1&wvr=6&mod=personinfo&is_all=1) <br>
- 2.2、[『博客』](http://boai.github.io) <br>
- 2.3、[『简书』](http://www.jianshu.com/users/95c9800fdf47/latest_articles) <br>
- 2.4、[『简书专题链接』](http://www.jianshu.com/collection/072d578bf782) <br>

**如果大神发现其中代码有bug，希望可以尽快联系本人修复，在此感谢各路大神的帮助** <br>

## 3、推荐
- 3.1 完全实现 [『BAButton』](https://github.com/boai/BAButton) 的自定义的类库 <br>
pod 导入：   pod 'BAButton', '~> 1.0.1'<br>

- 3.2 [对pod还是不熟的同学，可以看下我的博客，是最新的pod安装和使用方法](http://www.cnblogs.com/boai/p/4977976.html)

- 3.3 新增网易新闻的滑动SegmentControl，基于[『HMSegmentedControl』](https://github.com/HeshamMegid/HMSegmentedControl)的完美二次封装[『BASegmentControl』](https://github.com/boai/BASegmentControl)，可随时取用！ <br>

- 3.4 系统提醒和日历提醒，最近做了一个预约功能，有用到系统提醒和日历提醒，就写了这个demo！详情请看：[『BAReminderDemo』](https://github.com/boai/BAReminderDemo)！

- 3.5 本地通知最新完美封装，最近整理了下本地通知和极光推送，有很多坑都踩过了，刚刚整理出来的完美封装，肯定适合大部分场合，也可以用此封装写闹钟，也提醒事件，都可以！如果喜欢，请在git上点个星吧！详情请看：[『BALocalNotification』](https://github.com/boai/BALocalNotification)！


## 4、项目简介 和 使用指南
####4.1、项目简介 <br>
**主要使用 MVVM 和 MVC 设计模式，共分为三大类：** <br>

**4.1.1、Main** <br>
- 主要功能：两种tabbarVC，可以自由选择，一种是完全自定义tabbarVC，一种是DVTabBarController <br>

**4.1.2、BAMainCode** <br>
- 4.1.2.1、BACode    【主要代码】   如：Home(首页)、Message(消息)、Discover(发现)、Profile(我) <br>
- 4.1.2.2、BABaseData【基类】      如：BABaseVC、BABaseView、BABaseModel <br>
- 4.1.2.3、BALib     【三方库】    如：不能用pod更新的三方库可以放在这里 <br>
- 4.1.2.4、BATools   【工具类】    如：BACategory(分类)、BADataBase(数据库)、BAMacros(宏)、BANetManager(网络类)、BATool(工具类) <br>
- 4.1.2.5、Resources 【资源】      如：字体、Plist、图片 <br>
- 4.1.2.6、Other     【其他代码】   如： <br>
- 4.1.2.7、BACustom  【其他自定义】 如：暂时不知道放在哪里的自定义文件可放在这里 <br>

**4.1.3、Supporting Files** <br>
- 4.1.3.1 这里暂时放置系统的文件，如：AppDelegate、Main.storyboard、Assets.xcassets、Assets.xcassets、main.m <br>

#### 4.2 使用指南 <br>
使用的时候删除每个VC里面的DemoVC文件夹即可！<br>
DemoVC文件夹：是专门展示各级样例用法的文件夹！

## 5、更新记录【倒叙】

##### 2016-05-31  版本：2.0 
- 5.2.07、新增内存泄露检测，使用检测工具[『MLeaksFinder』](http://wereadteam.github.io/2016/02/22/MLeaksFinder/)！

##### 2016-05-30  版本：2.0 
- 5.2.06、新增DemoVC10，collectionView的简单使用，用View写的写了一个简单的collectionView，可随意添加到任何地方，新增编辑功能，能够实现collectionView 的删除！如果喜欢，请在git上点个星吧！

##### 2016-05-30  版本：2.0 
- 5.2.05、新增DemoVC9，流式布局和线性布局库的使用，用流式布局和线性布局库MyLayout，写了一个collectionView，如果喜欢，请在git上点个星吧！

##### 2016-05-25  版本：2.0 
- 5.2.04、新增DemoVC8，系统提醒和日历提醒，最近做了一个预约功能，有用到系统提醒和日历提醒，就写了这个demo！详情请看：[『BAReminderDemo』](https://github.com/boai/BAReminderDemo)！

##### 2016-05-25  版本：2.0 
- 5.2.03、新增DemoVC7，webView和WKWebView完美封装，简单的内置浏览器，有简单的功能，后期有新功能会加上！如果喜欢，请在git上点个星吧！

##### 2016-05-10  版本：2.0 
- 5.2.02、新增DemoVC6，本地通知最新完美封装，最近整理了下本地通知和极光推送，有很多坑都踩过了，刚刚整理出来的完美封装，肯定适合大部分场合，也可以用此封装写闹钟，也提醒事件，都可以！如果喜欢，请在git上点个星吧！详情请看：[『BALocalNotification』](https://github.com/boai/BALocalNotification)！

##### 2016-05-10  版本：2.0 
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

## 6、系统要求
该项目最低支持 iOS 7.0 和 Xcode 7.0。（部分动画效果仅支持iOS 8.0）使用时请仔细查看！

## 7、感谢
项目中集成了很多网络上民间大神的多年积累的优秀成果，结合自己项目开发中遇到的重难点，和很多开发者向我提起的疑难问题，在下综合整理并优化了下，最终成就了[『BABaseProject』](https://github.com/boai/BABaseProject) <br>
在此，博爱再次感谢各位大神的源码贡献！ <br>
希望开源项目[『BABaseProject』](https://github.com/boai/BABaseProject)能够为众多iOS开发新手提供最简单、最快捷的开源项目！ <br>
感谢大家的支持！



