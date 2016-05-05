# BABaseProject
一个基本项目框架，项目用到的各种类，各种封装，各种三方库的综合项目，欢迎大家使用！

## 1、个人简介
**新浪微博：@博爱1616** <br>
**QQ：     137361770** <br>
**博客：http://boai.github.io** <br>
**博客园：http://www.cnblogs.com/boai/** <br>
**简书：http://www.jianshu.com/users/95c9800fdf47/latest_articles** <br>

**如果大神发现其中代码有bug，希望可以尽快联系本人修复，在此感谢各路大神的帮助** <br>

## 2、推荐
#### 2.1 完全实现 [『UIButton』](https://github.com/boai/BAButton) 的自定义的类库 <br>
**pod 导入：   pod 'BAButton', '~> 1.0.1'** <br>

如果发现pod search BAButton 搜索出来的不是最新版本，需要在终端执行cd转换文件路径命令退回到desktop，然后执行pod setup命令更新本地spec缓存（可能需要几分钟），然后再搜索就可以了 <br>
具体步骤：
- pod setup : 初始化
- pod repo update : 更新仓库
- pod search BAButton

#### [对pod还是不熟的同学，可以看下我的博客，是最新的pod安装和使用方法](http://www.cnblogs.com/boai/p/4977976.html)


## 3、项目简介 和 使用指南
#### 3.1 项目简介 <br>
**主要使用MVVM模式，共分为三大类：** <br>
**1、Main** <br>
主要功能：两种tabbarVC，可以自由选择，一种是完全自定义tabbarVC，一种是DVTabBarController <br>
**2、BAMainCode** <br>
- 2.1 BACode【主要代码】如：Home(首页)、Message(消息)、Discover(发现)、Profile(我) <br>
- 2.2 BABaseData【基类】 如：BABaseVC、BABaseView、BABaseModel <br>
- 2.3 BALib【三方库】如：不能用pod更新的三方库可以放在这里 <br>
- 2.4 BATools【工具类】如：BACategory(分类)、BADataBase(数据库)、BAMacros(宏)、BANetManager(网络类)、BATool(工具类) <br>
- 2.5 Resources【资源】如：字体、Plist、图片 <br>
- 2.6 Other【其他代码】如： <br>
- 2.7 BACustom【其他自定义】如：暂时不知道放在哪里的自定义文件可放在这里 <br>
**3、Supporting Files** <br>
- 这里暂时放置系统的文件，如：AppDelegate、Main.storyboard、Assets.xcassets、Assets.xcassets、main.m <br>

#### 3.2 使用指南 <br>
使用的时候删除每个VC里面的DemoVC文件夹即可！<br>
DemoVC文件夹：是专门展示各级样例用法的文件夹！

## 4、更新记录

#### 2016-05-05  版本：1.0
- 1.4、添加两种tabbarVC，可以自由选择，一种是完全自定义tabbarVC，一种是DVTabBarController <br>

#### 2016-05-04  版本：1.0
- 1.1、创建框架 <br>
- 1.2、整理优化各级目录 <br>
- 1.3、添加雪花加载动画 <br>

## 5、系统要求
该项目最低支持 iOS 7.0 和 Xcode 7.0。（部分动画效果仅支持iOS 8.0）使用时请仔细查看！




