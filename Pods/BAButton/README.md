# BAButton
自定义button

>**开发中如有问题，可以联系本人**

**新浪微博：@博爱1616**

**QQ：     137361770**

#### 对pod还是不熟的同学，可以看下我的博客，是最新的pod安装和使用方法，

###### http://www.cnblogs.com/boai/p/4977976.html

# 更新记录：

## 2016.04.4 --- 

### 示例展示：

![image](https://raw.githubusercontent.com/boai/BAButton/master/BAButtonDemo/images/image1.png)
![image](https://raw.githubusercontent.com/boai/BAButton/master/BAButtonDemo/images/image2.png)


>##完全实现button的自定义，

### pod 导入：   pod 'BAButton', '~> 1.0.1'
如果发现pod search BAButton 搜索出来的不是最新版本，需要在终端执行cd转换文件路径命令退回到desktop，然后执行pod setup命令更新本地spec缓存（可能需要几分钟），然后再搜索就可以了
具体步骤：
- pod setup : 初始化
- pod repo update : 更新仓库
- pod search BAButton


### 项目中导入头文件：
```
#import <BAButton.h> 即可
```

``` 用枚举展示button的类型：
BAAligenmentStatusNormal, // 默认
BAAligenmentStatusLeft, // 左对齐
BAAligenmentStatusCenter, // 居中对齐
BAAligenmentStatusRight, // 右对齐
BAAligenmentStatusTop, // 图标在上，文本在下(居中)
BAAligenmentStatusBottom, // 图标在下，文本在上(居中)

// 大家下载demo后可能出现图片不显示，只需更换图片即可，注意button的frame哦！
// 此外，此button的titleLAbel只支持一行显示，不支持多行！敬请注意！

// 示例1：
BACustomButton *btn1 = [BACustomButton BA_ShareButton];
[btn1 setBackgroundColor:[UIColor greenColor]];
[btn1 setImage:[UIImage imageNamed:@"btn_share"] forState:UIControlStateNormal];
[btn1 setTitle:@"左对齐[文字左图片右]" forState:UIControlStateNormal];
[btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
btn1.buttonStatus = BAAligenmentStatusLeft;
btn1.buttonCornerRadius = 5.0;
btn1.titleLabel.font = [UIFont systemFontOfSize:15];
btn1.frame = CGRectMake(CGRectGetMinX(btn.frame), CGRectGetMaxY(btn.frame) + 10, 200, 50);
[self.view addSubview:btn1];

// 示例2：
BACustomButton *btn5 = [[BACustomButton alloc] initWitAligenmentStatus:BAAligenmentStatusTop];
[btn5 setBackgroundColor:[UIColor greenColor]];
[btn5 setImage:[UIImage imageNamed:@"btn_share"] forState:UIControlStateNormal];
[btn5 setTitle:@"图片在上，文字在下" forState:UIControlStateNormal];
btn5.titleLabel.font = [UIFont systemFontOfSize:10];
btn5.buttonCornerRadius = 5.0;
[btn5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
btn5.frame = CGRectMake(CGRectGetMinX(btn.frame), CGRectGetMaxY(btn4.frame) + 10, 200, 80);
[self.view addSubview:btn5];

其他示例可下载demo查看源码！
