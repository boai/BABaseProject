# BAAlert

目前为止，最为精简的 alert 和 actionSheet 封装！BAAlert 是原 DSAlert 的转移，以后更新都在这里更新，希望大家注意下！

---

## 更新提示：【倒叙更新】

 最新更新时间：2017-05-20 【倒叙】 <br>
 最新Version：【Version：1.1.9】 <br>
 更新内容： <br>
 1.1.9.1、修复动画过度白屏问题  <br>

 
最新更新时间：2017-05-15 【倒叙】 <br>
最新Version：【Version：1.1.8】 <br>
更新内容： <br>
1.1.8.1、精简代码结构，删除多余或者重复代码  <br>
1.1.8.2、规范代码属性和方法命名，原有方法名和属性名有较大改动，忘见谅  <br>
1.1.8.3、重构 actionSheet，新增多种样式  <br>


最新更新时间：2017-05-13 【倒叙】 <br>
最新Version：【Version：1.1.7】 <br>
更新内容： <br>
1.1.7.1、精简代码结构，删除多余或者重复代码  <br>
1.1.7.2、规范代码属性和方法命名，原有方法名和属性名有较大改动，忘见谅  <br>
1.1.7.3、优化部分动画  <br>
1.1.7.4、subView 布局优化  <br>
1.1.7.5、actionSheet 新增自定义文字颜色、title 字体颜色  <br>


最新更新时间：2017-05-10 【倒叙】 <br>
最新Version：【Version：1.1.6】 <br>
更新内容： <br>
1.1.6.1、修复 两个按钮的情况下，button title 只显示最后一个title 的bug！  <br>

最新更新时间：2017-05-10 【倒叙】 <br>
最新Version：【Version：1.1.5】 <br>
更新内容： <br>
1.1.5.1、删除原有封装内部按钮点击事件中 ba_dismissAlertView 方法，此方法可在外部自由调用  <br>

最新更新时间：2017-05-09 【倒叙】 <br>
最新Version：【Version：1.1.4】 <br>
更新内容： <br>
1.1.4.1、pod 更新xib 文件 <br>

最新更新时间：2017-05-08 【倒叙】 <br>
最新Version：【Version：1.1.0】 <br>
更新内容： <br>
1.1.0.1、优化方法名命名规范 <br>
1.1.0.2、新增键盘内部处理 <br>
1.1.0.3、用原生 autoLayout 重构，自定义 alert 的布局再也不是问题了 <br>
1.1.0.4、优化代码结构，修复内在隐藏内存泄漏 <br>
1.1.0.5、新增 BAAlert_OC.h 文件，只需导入 BAAlert_OC.h 一个文件就可以使用 alert 和 actionSheet 了 <br>
1.1.0.6、删除了部分代码和属性，具体见源码 和 demo
 
* 12、终于可以愉快的 pod 导入了，pod 导入：` pod 'BAAlert' ` 【最新版本：1.0.1】
* 11、可以自定义每个按钮的字体颜色了！
* 10、再次设计结构，新增frameWork静态库文件封装，喜欢简洁的你可以直接导入frameWork即可！
* 9、多种炫酷入场、退出动画，让你的APP各种叼！
* 8、新增高斯模糊，枚举选择，简单明了！
* 7、新增是否开启边缘触摸隐藏 alert 默认：关闭，属性：isTouchEdgeHide，可自由开关边缘触摸！
* 6、完美适配横竖屏
* 5、简单的两行搞定一个自定义 alert
* 4、手势触摸隐藏
* 3、可以自定义背景图片、按钮颜色
* 2、可以添加文字和图片，且可以滑动查看
* 1、理论完全兼容目前所有 iOS 系统版本

---

## 0、安装、导入示例和源码地址：
* 0.1、pod 导入：` pod 'BAAlert' ` ` pod 'BAAlert-Swift' ` 【最新版本：1.1.9】
* 0.2、使用方法2：下载demo，把 BAAlert 文件夹拖入项目即可，<br>
导入头文件：<br>
`  #import "BAAlert_OC.h" `<br>
* 0.3、项目源码地址：<br>
 OC 版 ：[https://github.com/BAHome/BAAlert](https://github.com/BAHome/BAAlert)<br>
 swift 版 ：[https://github.com/BAHome/BAAlert-Swift](https://github.com/BAHome/BAAlert-Swift)<br>

---

## 1、图片示例：

<!--![BAAlert.gif](https://github.com/BAHome/BAAlert/blob/master/BAAlert.gif)-->

---

## 2、代码示例：
* 2.1 类似系统 alert【加边缘手势消失】、高斯模糊背景

```

- (void)alert1
{
    BAKit_WeakSelf
    /*! 第一种封装使用示例 */
    [BAAlert ba_alertShowWithTitle:title0 message:titleMsg0 image:nil buttonTitleArray:@[@"取消",@"确定",@"确定2",@"确定3"] buttonTitleColorArray:@[[UIColor redColor], [UIColor greenColor], [UIColor grayColor], [UIColor purpleColor]] configuration:^(BAAlert *tempView) {
        BAKit_StrongSelf
        //        temp.bgColor       = [UIColor colorWithRed:0 green:1.0 blue:0 alpha:0.3];
        /*! 开启边缘触摸隐藏alertView */
        tempView.isTouchEdgeHide = NO;
        /*! 添加高斯模糊的样式 */
        tempView.blurEffectStyle = BAAlertBlurEffectStyleLight;
        /*! 开启动画 */
        //        temp.isShowAnimate   = YES;
        //        /*! 进出场动画样式 默认为：1 */
        //        temp.animatingStyle  = 1;
        self.alertView1 = tempView;
    } actionBlock:^(NSInteger index) {
        BAKit_StrongSelf
        [self.alertView1 ba_alertHidden];
        if (index == 1)
        {
            NSLog(@"点击了确定按钮！");
            ViewController2 *vc2 = [ViewController2 new];
            vc2.title = @"alert1";
            [self.navigationController pushViewController:vc2 animated:YES];
        }
    }];
}

- (void)alert2
{
//    /*! 2、自定义按钮颜色 */
    BAKit_WeakSelf
    [BAAlert ba_alertShowWithTitle:@"温馨提示：" message:titleMsg2 image:nil buttonTitleArray:@[@"取消", @"跳转VC2"] buttonTitleColorArray:@[[UIColor redColor], [UIColor greenColor]] configuration:^(BAAlert *tempView) {
        BAKit_StrongSelf
        /*! 自定义按钮文字颜色 */
        //    tempView.buttonTitleColor = [UIColor orangeColor];
        tempView.bgColor = [UIColor colorWithRed:1.0 green:1.0 blue:0 alpha:0.3];
        
        /*! 是否开启进出场动画 默认：NO，如果 YES ，并且同步设置进出场动画枚举为默认值：1 */
        tempView.showAnimate = YES;
        tempView.animatingStyle  = BAAlertAnimatingStyleShake;

        self.alertView2 = tempView;

    } actionBlock:^(NSInteger index) {
        BAKit_StrongSelf
        [self.alertView2 ba_alertHidden];
        if (index == 0)
        {
            NSLog(@"点击了取消按钮！");
        }
        else if (index == 1)
        {
            NSLog(@"点击了确定按钮！");
            ViewController2 *vc2 = [ViewController2 new];
            vc2.title = @"alert2";
            [self.navigationController pushViewController:vc2 animated:YES];
        }
    }];
}

- (void)alert3
{
    /*! 3、自定义背景图片 */
    BAKit_WeakSelf
    [BAAlert ba_alertShowWithTitle:@"温馨提示：" message:titleMsg1 image:nil buttonTitleArray:@[@"取消", @"确定"] buttonTitleColorArray:@[[UIColor redColor], [UIColor greenColor]] configuration:^(BAAlert *tempView) {
        BAKit_StrongSelf
        /*! 自定义按钮文字颜色 */
        //    tempView.buttonTitleColor = [UIColor orangeColor];
        /*! 自定义alert的背景图片 */
        tempView.bgImageName      = @"背景.jpg";
        /*! 开启动画，并且设置动画样式，默认：1 */
//        tempView.showAnimate = YES;
        
        /*! 没有开启动画，直接进出场动画样式，默认开启动画 */
        tempView.animatingStyle  = BAAlertAnimatingStyleFall;
        
        self.alertView3 = tempView;
    } actionBlock:^(NSInteger index) {
        BAKit_StrongSelf
        [self.alertView3 ba_alertHidden];
        if (index == 0)
        {
            NSLog(@"点击了取消按钮！");
        }
        else if (index == 1)
        {
            NSLog(@"点击了确定按钮！");
            ViewController2 *vc2 = [ViewController2 new];
            vc2.title = @"alert3";
            [self.navigationController pushViewController:vc2 animated:YES];
        }
    }];
}

- (void)alert4
{
    /*! 4、内置图片和文字，可滑动查看 */
    BAKit_WeakSelf
    [BAAlert ba_alertShowWithTitle:@"温馨提示：" message:titleMsg1 image:[UIImage imageNamed:@"美女.jpg"] buttonTitleArray:@[@"取消", @"跳转VC2"] buttonTitleColorArray:@[[UIColor redColor], [UIColor greenColor]] configuration:^(BAAlert *tempView) {
        BAKit_StrongSelf
        /*! 自定义按钮文字颜色 */
        //    tempView.buttonTitleColor = [UIColor orangeColor];
        /*! 自定义alert的背景图片 */
        tempView.bgImageName = @"背景.jpg";
        /*! 是否显示动画效果 */
        tempView.showAnimate = YES;
        self.alertView4 = tempView;
    } actionBlock:^(NSInteger index) {
        BAKit_StrongSelf
        [self.alertView4 ba_alertHidden];
        if (index == 0)
        {
            NSLog(@"点击了取消按钮！");
        }
        else if (index == 1)
        {
            NSLog(@"点击了确定按钮！");
            ViewController2 *vc2 = [ViewController2 new];
            vc2.title = @"alert4";
            [self.navigationController pushViewController:vc2 animated:YES];
        }
    }];
}

```

* 2.5 完全自定义alert，具体看 demo 源码

```
- (void)alert5
{
    /*! 5、完全自定义alert */
    _customView = [CustomView new];
    self.customView.frame = CGRectMake(50, SCREENHEIGHT - 300, SCREENWIDTH - 50 * 2, 162);

    BAKit_WeakSelf
    [BAAlert ba_alertShowCustomView:self.customView configuration:^(BAAlert *tempView) {
        BAKit_StrongSelf
        tempView.isTouchEdgeHide = YES;
        tempView.animatingStyle = BAAlertAnimatingStyleScale;
        self.alertView5 = tempView;
    }];
    
    self.customView.block = ^(NSInteger index) {
        BAKit_StrongSelf
        if (index == 1)
        {
            [self.alertView5 ba_alertHidden];
        }
    };
}


```

* 2.6 actionSheet，样式一：带图片、title、subTitle

```
- (void)actionSheet1
{
    NSMutableArray *dataArray = [NSMutableArray array];
    NSArray *contentArray = @[@"微信支付", @"支付宝", @"预付款账户"];
    NSArray *subContentArray = @[@"", @"18588888888", @"余额：￥480.00"];
    NSArray *imageArray = @[@"123.png", @"背景.jpg", @"美女.jpg"];
    
    for (NSInteger i = 0; i < contentArray.count; i++)
    {
        BAActionSheetModel *model = [BAActionSheetModel new];
        model.imageUrl = imageArray[i];
        model.content = contentArray[i];
        model.subContent = subContentArray[i];
        
        [dataArray addObject:model];
    }
    BAKit_WeakSelf
    [BAActionSheet ba_actionSheetShowWithConfiguration:^(BAActionSheet *tempView) {
        
        BAKit_StrongSelf
        tempView.title = @"支付方式";
        tempView.dataArray = dataArray;
        tempView.isTouchEdgeHide = NO;
        
        self.actionSheet = tempView;
    } actionBlock:^(NSIndexPath *indexPath, BAActionSheetModel *model) {
        BAKit_ShowAlertWithMsg_ios8(model.content);
    }];
}
```

* 2.7 actionSheet，样式二：类似微博得 actionSheet

```
- (void)actionSheet2
{
    NSMutableArray *dataArray = [NSMutableArray array];
    NSArray *contentArray = @[@"微信支付", @"支付宝", @"预付款账户"];

    for (NSInteger i = 0; i < contentArray.count; i++)
    {
        BAActionSheetModel *model = [BAActionSheetModel new];
//        model.imageUrl = imageArray[i];
        model.content = contentArray[i];
//        model.subContent = subContentArray[i];
        
        [dataArray addObject:model];
    }
    BAKit_WeakSelf
    [BAActionSheet ba_actionSheetShowWithConfiguration:^(BAActionSheet *tempView) {
        
        BAKit_StrongSelf
//        tempView.title = @"支付方式";
        tempView.dataArray = dataArray;
        tempView.actionSheetType = BAActionSheetTypeCustom;
        //        tempView.isTouchEdgeHide = NO;
        
        self.actionSheet = tempView;
    } actionBlock:^(NSIndexPath *indexPath, BAActionSheetModel *model) {
        BAKit_ShowAlertWithMsg_ios8(model.content);
    }];
}
```

* 2.8 actionSheet，样式三：可展开二级菜单

```
- (void)actionSheet3
{
    NSArray *contentArray = @[@"微信支付", @"支付宝", @"预付款账户", @"中行"];
    NSArray <NSArray *>*subContentArray = @[
                                            @[@"微信支付1", @"微信支付2", @"微信支付3"],
                                            @[@"支付宝1", @"支付宝2", @"支付宝3", @"支付宝4"],
                                            @[],
                                            @[@"中行1", @"中行2", @"中行3", @"中行4", @"中行5", @"中行6", @"中行7", @"中行2", @"中行3", @"中行4", @"中行5", @"中行6", @"中行7", @"中行2", @"中行3", @"中行4", @"中行5", @"中行6", @"中行7", @"中行2", @"中行3", @"中行4", @"中行5", @"中行6", @"中行7"]
                                            ];
    
    NSMutableArray *dataArray = @[].mutableCopy;
    for (NSInteger i = 0; i < contentArray.count; i++)
    {
        BAActionSheetModel *model = [BAActionSheetModel new];
        model.content = contentArray[i];
        
        NSMutableArray *mutArray = @[].mutableCopy;
        for (NSInteger j = 0; j < subContentArray[i].count; j ++)
        {
            BAActionSheetSubContentModel *subContentModel = [BAActionSheetSubContentModel new];
            subContentModel.subContent = subContentArray[i][j];
            [mutArray addObject:subContentModel];
        }
        model.subContentArray = mutArray;
        
        [dataArray addObject:model];
    }
    
    BAKit_WeakSelf
    [BAActionSheet ba_actionSheetShowWithConfiguration:^(BAActionSheet *tempView) {
        
        BAKit_StrongSelf
        tempView.title = @"支付方式";
        tempView.dataArray = dataArray;
        tempView.actionSheetType = BAActionSheetTypeExpand;
        //        tempView.isTouchEdgeHide = NO;
        
        self.actionSheet = tempView;
    } actionBlock:^(NSIndexPath *indexPath, BAActionSheetModel *model) {
        if (model.subContentArray.count > 0)
        {
            BAKit_ShowAlertWithMsg_ios8(model.subContentArray[indexPath.row].subContent);
        }
        else
        {
            BAKit_ShowAlertWithMsg_ios8(model.content);
        }
    }];
}

```

## 3、系统要求

    该项目最低支持 iOS 7.0 和 Xcode 8.0，理论支持目前所有 iOS 系统版本！
	
---






