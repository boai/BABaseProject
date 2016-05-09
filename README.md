# BABaseProject
一个基于 MVVM 和 MVC 设计模式的基本项目框架，项目用到的各种类，各种封装，各种三方库的综合项目，欢迎大家使用！

## 1、性能问题 和 MVVM模式优点
####1.1、开发中遇到的 性能问题：
- 1.1.1、cell的高度应该提前计算出来
- 1.1.2、cell的高度必须要先计算出每个子控件的frame，才能确定
- 1.1.3、如果在cell的set方法计算子控件的位置，会比较耗性能

####1.2、解决方法：MVVM思想
M:模型
V:视图
VM:视图模型（模型包装视图模型，模型+模型对应视图的frame）

####1.3、MVVM模式的 优点
MVVM模式和MVC模式一样，主要目的是分离视图（View）和模型（Model），有几大优点
- 1.3.1、低耦合。视图（View）可以独立于Model变化和修改，一个ViewModel可以绑定到不同的"View"上，当View变化的时候Model可以不变，当Model变化的时候View也可以不变。
- 1.3.2、可重用性。你可以把一些视图逻辑放在一个ViewModel里面，让很多view重用这段视图逻辑。
- 1.3.3、独立开发。开发人员可以专注于业务逻辑和数据的开发（ViewModel），设计人员可以专注于页面设计，使用Expression Blend可以很容易设计界面并生成xaml代码。
- 1.3.4、可测试。界面素来是比较难于测试的，而现在测试可以针对ViewModel来写。


## 2、个人简介
**2.1、新浪微博：@博爱1616** <br>
**2.2、QQ：     137361770** <br>
**2.3、博客：http://boai.github.io** <br>
**2.4、博客园：http://www.cnblogs.com/boai/** <br>
**2.5、简书：http://www.jianshu.com/users/95c9800fdf47/latest_articles** <br>

**如果大神发现其中代码有bug，希望可以尽快联系本人修复，在此感谢各路大神的帮助** <br>

## 3、推荐
#### 3.1 完全实现 [『UIButton』](https://github.com/boai/BAButton) 的自定义的类库 <br>
**pod 导入：   pod 'BAButton', '~> 1.0.1'** <br>

如果发现pod search BAButton 搜索出来的不是最新版本，需要在终端执行cd转换文件路径命令退回到desktop，然后执行pod setup命令更新本地spec缓存（可能需要几分钟），然后再搜索就可以了 <br>
具体步骤：
- pod setup : 初始化
- pod repo update : 更新仓库
- pod search BAButton

#### [对pod还是不熟的同学，可以看下我的博客，是最新的pod安装和使用方法](http://www.cnblogs.com/boai/p/4977976.html)


## 4、项目简介 和 使用指南
####4.1、项目简介 <br>
**主要使用 MVVM 和 MVC 设计模式，共分为三大类：** <br>

**4.1.1、Main** <br>
主要功能：两种tabbarVC，可以自由选择，一种是完全自定义tabbarVC，一种是DVTabBarController <br>

**4.1.2、BAMainCode** <br>
- 4.1.2.1、BACode    【主要代码】   如：Home(首页)、Message(消息)、Discover(发现)、Profile(我) <br>
- 4.1.2.2、BABaseData【基类】      如：BABaseVC、BABaseView、BABaseModel <br>
- 4.1.2.3、BALib     【三方库】    如：不能用pod更新的三方库可以放在这里 <br>
- 4.1.2.4、BATools   【工具类】    如：BACategory(分类)、BADataBase(数据库)、BAMacros(宏)、BANetManager(网络类)、BATool(工具类) <br>
- 4.1.2.5、Resources 【资源】      如：字体、Plist、图片 <br>
- 4.1.2.6、Other     【其他代码】   如： <br>
- 4.1.2.7、BACustom  【其他自定义】 如：暂时不知道放在哪里的自定义文件可放在这里 <br>

**3、Supporting Files** <br>
- 3.1这里暂时放置系统的文件，如：AppDelegate、Main.storyboard、Assets.xcassets、Assets.xcassets、main.m <br>

#### 4.2 使用指南 <br>
使用的时候删除每个VC里面的DemoVC文件夹即可！<br>
DemoVC文件夹：是专门展示各级样例用法的文件夹！

## 5、更新记录

#### 2016-05-07  版本：1.0
- 1.13、解决tableview的分割线短一截【详见HomeVC】
- 1.12、新增全局键盘弹起收回处理
- 1.11、新增DemoVC4：友盟分享和登陆的完美封装！
- 1.10、新增BABaseProjectNoti.h文件，本文档的各种规范都在此说明！

#### 2016-05-06  版本：1.0
- 1.09、新增DemoVC3：点击button倒计时，两种比较常用的获取倒计时验证码的样式！
- 1.08、新增封装：BAAutoSizeWithWH，功能：实现文字的宽高自适应！
- 1.07、添加网络判断
- 1.06、优化所有注释：格式统一为 /*! 计算frame */

#### 2016-05-05  版本：1.0
- 1.05、完善AFN网络框架封装，实现清理缓存，自定义请求头功能！
- 1.04、添加两种tabbarVC，可以自由选择，一种是完全自定义tabbarVC，一种是DVTabBarController <br>

#### 2016-05-04  版本：1.0
- 1.03、添加雪花加载动画 
- 1.02、整理优化各级目录 
- 1.01、创建框架 

## 6、系统要求
该项目最低支持 iOS 7.0 和 Xcode 7.0。（部分动画效果仅支持iOS 8.0）使用时请仔细查看！




