# BABaseProject
一个基于 MVVM 和 MVC 设计模式的基本项目框架，项目用到的各种类，各种封装，各种三方库的综合项目，欢迎大家使用！ <br>

>**本项目使用内存泄露检测工具[『MLeaksFinder』](http://wereadteam.github.io/2016/02/22/MLeaksFinder/)！** <br>
>**所有demo均检测通过！欢迎大家使用！**

###### 大家有好的需求，或者项目中遇到的重难点，可以在issue里面提需求，一定要记得联系我哈！有时间我会处理的！

**如果大神发现其中代码有bug，希望可以尽快联系本人修复，在此感谢各路大神的帮助** <br>

---

## 1、性能问题 和 MVVM模式优点
* 1.1、开发中遇到的 性能问题：
  * 1.1.1 cell的高度应该提前计算出来
  * 1.1.2 cell的高度必须要先计算出每个子控件的frame，才能确定
  * 1.1.3 如果在cell的set方法计算子控件的位置，会比较耗性能

* 1.2、解决方法：MVVM思想
  * M:模型 <br>
  * V:视图 <br>
  * VM:视图模型（模型包装视图模型，模型+模型对应视图的frame）

* 1.3、MVVM模式的 优点
  * MVVM模式和MVC模式一样，主要目的是分离视图（View）和模型（Model），有几大优点:

  * 1.3.1 低耦合。视图（View）可以独立于Model变化和修改，一个ViewModel可以绑定到不同的"View"上，当View变化的时候Model可以不变，当Model变化的时候View也可以不变。
  * 1.3.2 可重用性。你可以把一些视图逻辑放在一个ViewModel里面，让很多view重用这段视图逻辑。
  * 1.3.3 独立开发。开发人员可以专注于业务逻辑和数据的开发（ViewModel），设计人员可以专注于页面设计。
  * 1.3.4 可测试。界面素来是比较难于测试的，而现在测试可以针对ViewModel来写。

---

## 2、个人简介
方式     | 链接 | 
:----------- | :-----------: | 
微博     | [『博爱1616』](http://weibo.com/2706728003/profile?rightmod=1&wvr=6&mod=personinfo&is_all=1)        |
博客     | [『http://boai.github.io』](http://boai.github.io)   | 
简书     | [『简书』](http://www.jianshu.com/users/95c9800fdf47/latest_articles) | 
简书专题  | [『简书专题链接』](http://www.jianshu.com/collection/072d578bf782) | 
QQ       | `137361770`        | 
iOS 10技术开发群       | `479663605`        | 

为解决广大小白项目中遇到的各种疑难杂症，博爱新建了QQ群 `479663605`，希望广大小白和大神能够积极加入！

**~~老司机也欢迎！~~**

---

## 3、推荐
序号 | 类库 | 简介及功能介绍 
:----------- | :-----------: | :-----------
3.1         | [『BAButton』](https://github.com/boai/BAButton)        | 完全实现 UIButton 的自定义的类库。pod 导入：`pod 'BAButton', '~> 1.0.1'`
3.2         | [pod安装和使用方法](http://www.cnblogs.com/boai/p/4977976.html)        | 对pod还是不熟的同学，可以看下我的博客，是最新的pod安装和使用方法，一直更新！
3.3         | [『BASegmentControl』](https://github.com/boai/BASegmentControl)        | 新增网易新闻的滑动SegmentControl，基于[『HMSegmentedControl』](https://github.com/HeshamMegid/HMSegmentedControl)的完美二次封装！
3.4         | [『BAReminderDemo』](https://github.com/boai/BAReminderDemo)        | 系统提醒和日历提醒，最近做了一个预约功能，有用到系统提醒和日历提醒，就写了这个demo！
3.5         | [『BALocalNotification』](https://github.com/boai/BALocalNotification)        | 本地通知最新完美封装，最近整理了下本地通知和极光推送，有很多坑都踩过了，刚刚整理出来的完美封装，肯定适合大部分场合，也可以用此封装写闹钟，也提醒事件，都可以！如果喜欢，请在git上点个星吧！
3.6         | [『BANetManager』](https://github.com/boai/BANetManager)        | 基于[『AFNetworking 3.1』](https://github.com/AFNetworking/AFNetworking)！最新版本的封装，集成了get/post 方法请求数据，单图/多图上传，视频上传/下载，网络监测 等多种网络请求方式！
3.7         | [『APP中的文字和APP名字的国际化多语言处理』](http://www.cnblogs.com/boai/p/5337558.html)        | 最全、最贴心的国际化处理博客！
3.8         | 3D Touch的纯代码实现方法        | 详见：本demo种的`appdelegate`！

---

## 4、项目简介 和 使用指南
####4.1、项目简介 <br>
**主要使用 MVVM 和 MVC 设计模式，共分为三大类：** <br>

**4.1.1、Main** <br>
- 主要功能：三种tabbarVC，可以自由选择，一种是完全自定义tabbarVC，一种是DVTabBarController，一种是storeboard搭建的tabBarController <br>

**4.1.2、BAMainCode** <br>
- 4.1.2.1、BACode    【主要代码】   如：Home(首页)、Message(消息)、Discover(发现)、Profile(我) <br>
- 4.1.2.2、BABaseData【基类】      如：BABaseVC、BABaseView、BABaseModel <br>
- 4.1.2.3、BALib     【三方库】    如：不能用pod更新的三方库可以放在这里 <br>
- 4.1.2.4、BATools   【工具类】    如：BACategory(分类)、BADataBase(数据库)、BAMacros(宏)、BANetManager(网络类)、BAKit(工具类) <br>
- 4.1.2.5、Resources 【资源】      如：字体、Plist、图片 <br>
- 4.1.2.6、Other     【其他代码】   如： <br>
- 4.1.2.7、BACustom  【其他自定义】 如：暂时不知道放在哪里的自定义文件可放在这里 <br>

**4.1.3、Supporting Files** <br>
- 4.1.3.1 这里暂时放置系统的文件，如：AppDelegate、Main.storyboard、Assets.xcassets、Assets.xcassets、main.m <br>

#### 4.2 使用指南 <br>
使用的时候删除每个VC里面的DemoVC文件夹即可！<br>
DemoVC文件夹：是专门展示各级样例用法的文件夹！

---

## 5、更新记录【倒叙】

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
- - 1、集成get / post / put / delete等常用请求方式的封装
- - 2、集成单图/多图上传，让图片上传更简单，自带压缩处理
- - 3、集成视频上传/下载，和文件下载，让视频的上传下载更方便，支持异步下载【待测试】
- - 5、集成网络监测，让你实时监测你的宝贝APP的网络状态

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

---

## 6、系统要求
⋅⋅⋅该项目最低支持 iOS 7.0 和 Xcode 7.0。（部分动画效果仅支持iOS 8.0）使用时请仔细查看！

---

## 7、感谢
⋅⋅⋅项目中集成了很多网络上民间大神的多年积累的优秀成果，结合自己项目开发中遇到的重难点，和很多开发者向我提起的疑难问题，在下综合整理并优化了下，最终成就了[『BABaseProject』](https://github.com/boai/BABaseProject) <br>
在此，博爱再次感谢各位大神的源码贡献！ <br>
希望开源项目[『BABaseProject』](https://github.com/boai/BABaseProject)能够为众多iOS开发新手提供最简单、最快捷的开源项目！ <br>

---

⋅⋅⋅感谢大家的支持！



