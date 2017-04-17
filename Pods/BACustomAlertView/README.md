# BACustomAlertView
一个完全实现自定义的alertView！目前为止，最为精简的alert封装，以后alert就用博爱的[『BACustomAlertView』](https://github.com/boai/BACustomAlertView)了！

---

## 更新提示：【倒叙更新】

#### version 1.0.* 【2016.开发 ing...】
* 正在努力完善中...
* 高斯模糊马上就要来了
* 更多的动画特效，让你的 alert 狂拽炫酷刁炸天！
* 如果你有更好的建议，可以给博爱提 issue 哦！
* 也可以加入我们的大家庭：QQ群 `479663605`，希望广大小白和大神能够积极加入！
 
#### version 1.0.5 【2016.08.16 已上架】
* 4、重新设计了demo，使得新用户更快上手！
* 3、再次设计结构，两种封装方法创建 alert ，无论大神还是小白都能够运用自如！
* 2、优化规范整体代码结构及注释，你想要的功能一目了然！
* 1、新增是否开启边缘触摸隐藏 alert 默认：关闭，属性：isTouchEdgeHide，可自由开关边缘触摸！
 
#### version 1.0.4 【2016.08.13 已上架】
* 6、完美适配横竖屏
* 5、简单的两行搞定一个自定义 alert
* 4、手势触摸隐藏
* 3、可以自定义背景图片、按钮颜色
* 2、可以添加文字和图片，且可以滑动查看
* 1、理论完全兼容目前所有 iOS 系统版本

#### ~~注：目前此版本只支持竖屏适配，小伙伴儿记得哦！~~

---

## 0、安装和导入示例：
* 0.1、pod 导入【当前最新版本：1.0.4】：<br> ` pod 'BACustomAlertView' ` <br>导入头文件：<br>`  #import <BACustomAlertView.h> `
* 0.2、下载demo，把 BACustomAlertView 文件夹拖入项目即可，<br>导入头文件：<br>`  #import "BACustomAlertView.h" `

---

## 1、代码示例：
* 1.1 类似系统 alert【加边缘手势消失】
```
/*! 1、类似系统 alert【加边缘手势消失】 */
        _alertView1 = [[BACustomAlertView alloc] ba_showTitle:@"博爱温馨提示："
                                                      message:titleMsg1
                                                        image:nil
                                                 buttonTitles:@[@"取消", @"确定"]];
        /*! 显示alert */
        [_alertView1 ba_showAlertView];
        
        BAWeak;
        _alertView1.buttonActionBlock = ^(NSInteger index){
            if (index == 0)
            {
                NSLog(@"点击了取消按钮！");
                /*! 隐藏alert */
                [weakSelf.alertView1 ba_dismissAlertView];
            }
            else if (index == 1)
            {
                NSLog(@"点击了确定按钮！");
                /*! 隐藏alert */
                [weakSelf.alertView1 ba_dismissAlertView];
            }
        };
```
![alert1.png](https://github.com/boai/BACustomAlertView/blob/master/images/alert1.png)

* 1.2 自定义按钮颜色
```
        /*! 2、自定义按钮颜色 */
        _alertView2 = [[BACustomAlertView alloc] ba_showTitle:@"博爱温馨提示："
                                                      message:titleMsg2
                                                        image:nil
                                                 buttonTitles:@[@"取消", @"确定"]];
        /*! 自定义按钮文字颜色 */
        _alertView2.buttonTitleColor = [UIColor orangeColor];
        /*! 显示alert */
        [_alertView2 ba_showAlertView];
        BAWeak;
        _alertView2.buttonActionBlock = ^(NSInteger index){
            if (index == 0)
            {
                NSLog(@"点击了取消按钮！");
                /*! 隐藏alert */
                [weakSelf.alertView2 ba_dismissAlertView];
            }
            else if (index == 1)
            {
                NSLog(@"点击了确定按钮！");
                /*! 隐藏alert */
                [weakSelf.alertView2 ba_dismissAlertView];
            }
        };
```
![alert2.png](https://github.com/boai/BACustomAlertView/blob/master/images/alert2.png)

* 1.3 自定义背景图片
```
        /*! 3、自定义背景图片 */
        _alertView3 = [[BACustomAlertView alloc] ba_showTitle:@"博爱温馨提示："
                                                      message:titleMsg1
                                                        image:nil
                                                 buttonTitles:@[@"取消", @"确定"]];
        /*! 自定义按钮文字颜色 */
        _alertView3.buttonTitleColor = [UIColor orangeColor];
        /*! 自定义alert的背景图片 */
        _alertView3.bgImageName = @"背景.jpg";
        /*! 显示alert */
        [_alertView3 ba_showAlertView];
        BAWeak;
        _alertView3.buttonActionBlock = ^(NSInteger index){
            if (index == 0)
            {
                NSLog(@"点击了取消按钮！");
                /*! 隐藏alert */
                [weakSelf.alertView3 ba_dismissAlertView];
            }
            else if (index == 1)
            {
                NSLog(@"点击了确定按钮！");
                /*! 隐藏alert */
                [weakSelf.alertView3 ba_dismissAlertView];
            }
        };
```
![alert3.png](https://github.com/boai/BACustomAlertView/blob/master/images/alert3.png)

* 1.4 自定义背景图片
```
        /*! 4、内置图片和文字，可滑动查看 */
        _alertView4 = [[BACustomAlertView alloc] ba_showTitle:@"博爱温馨提示："
                                                      message:titleMsg1
                                                        image:[UIImage imageNamed:@"美女.jpg"]
                                                 buttonTitles:@[@"取消", @"确定"]];
        /*! 自定义按钮文字颜色 */
        _alertView4.buttonTitleColor = [UIColor orangeColor];
        /*! 自定义alert的背景图片 */
        _alertView4.bgImageName = @"背景.jpg";
        /*! 是否显示动画效果 */
        _alertView4.isShowAnimate = YES;
        /*! 显示alert */
        [_alertView4 ba_showAlertView];
        BAWeak;
        _alertView4.buttonActionBlock = ^(NSInteger index){
            if (index == 0)
            {
                NSLog(@"点击了取消按钮！");
                /*! 隐藏alert */
                [weakSelf.alertView4 ba_dismissAlertView];
            }
            else if (index == 1)
            {
                NSLog(@"点击了确定按钮！");
                /*! 隐藏alert */
                [weakSelf.alertView4 ba_dismissAlertView];
            }
        };
```
![alert4.png](https://github.com/boai/BACustomAlertView/blob/master/images/alert4.png)

* 1.5 自定义背景图片
```
        /*! 5、完全自定义alert */
        UIView *view1 = [UIView new];
        view1.frame = CGRectMake(30, 100, SCREENWIDTH - 60, 200);
        view1.backgroundColor = [UIColor yellowColor];
        view1.layer.masksToBounds = YES;
        view1.layer.cornerRadius = 10.0f;
        //    view1.clipsToBounds = YES;
        
        _titleLabel = [UILabel new];
        _titleLabel.frame = CGRectMake(0, 0, view1.frame.size.width, 40);
        _titleLabel.text = @"测试title";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:18];
        _titleLabel.backgroundColor = [UIColor greenColor];
        [view1 addSubview:_titleLabel];
        
        _chooseBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, view1.frame.size.height - 40, view1.frame.size.width, 40)];
        [_chooseBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_chooseBtn setBackgroundColor:[UIColor redColor]];
        [_chooseBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_chooseBtn addTarget:self action:@selector(chooseBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [view1 addSubview:_chooseBtn];

        _alertView5 = [[BACustomAlertView alloc] initWithCustomViewiew:view1];
        [_alertView5 ba_showAlertView];
```

```
- (void)chooseBtnClick:(UIButton *)sender
{
    NSLog(@"点击了取消按钮！");
    /*! 隐藏alert */
    [_alertView5 ba_dismissAlertView];
}
```
![alert5.png](https://github.com/boai/BACustomAlertView/blob/master/images/alert5.png)

## 2、图片示例：
![alert6.png](https://github.com/boai/BACustomAlertView/blob/master/images/alert0.png)

---

## 3、个人简介
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

## 4、推荐
序号 | 类库 | 简介及功能介绍 
:----------- | :-----------: | :-----------
3.1         | [『BAButton』](https://github.com/boai/BAButton)        | 完全实现 UIButton 的自定义的类库。pod 导入：`pod 'BAButton', '~> 1.0.1'`
3.2         | [pod安装和使用方法](http://www.cnblogs.com/boai/p/4977976.html)        | 对pod还是不熟的同学，可以看下我的博客，是最新的pod安装和使用方法，一直更新！
3.3         | [『BASegmentControl』](https://github.com/boai/BASegmentControl)        | 新增网易新闻的滑动SegmentControl，基于[『HMSegmentedControl』](https://github.com/HeshamMegid/HMSegmentedControl)的完美二次封装！
3.4         | [『BAReminderDemo』](https://github.com/boai/BAReminderDemo)        | 系统提醒和日历提醒，最近做了一个预约功能，有用到系统提醒和日历提醒，就写了这个demo！
3.5         | [『BALocalNotification』](https://github.com/boai/BALocalNotification)        | 本地通知最新完美封装，最近整理了下本地通知和极光推送，有很多坑都踩过了，刚刚整理出来的完美封装，肯定适合大部分场合，也可以用此封装写闹钟，也提醒事件，都可以！如果喜欢，请在git上点个星吧！
3.6         | [『BANetManager』](https://github.com/boai/BANetManager)        | 基于[『AFNetworking 3.1』](https://github.com/AFNetworking/AFNetworking)！最新版本的封装，集成了get/post 方法请求数据，单图/多图上传，视频上传/下载，网络监测 等多种网络请求方式！
3.7         | [『APP中的文字和APP名字的国际化多语言处理』](http://www.cnblogs.com/boai/p/5337558.html)        | 最全、最贴心的国际化处理博客！
3.8         | 3D Touch的纯代码实现方法        | 详见：[『BABaseProject』](https://github.com/boai/BABaseProject)的`appdelegate`！
3.9         | [『BACustomAlertView』](https://github.com/boai/BACustomAlertView)       | 目前为止，最为精简的alert封装，以后alert就用博爱的[『BACustomAlertView』](https://github.com/boai/BACustomAlertView)！

---

## 5、系统要求

    该项目最低支持 iOS 7.0 ，理论支持目前所有 iOS 系统版本！


---
## 6、感谢

感谢[『陆晓峰』](https://github.com/zeR0Lu)大神的鼎力相助，得以完成如此完美的[『BACustomAlertView』](https://github.com/boai/BACustomAlertView)！<br>
    你们的使用就是对博爱最大的鼓励，博爱将继续一如既往的为大家提供最简单的开放源码！
    再次感谢大家对博爱的支持！<br>
    谢谢！

---