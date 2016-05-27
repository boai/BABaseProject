##UIAlertView、UIActionSheet、UIAlertController封装 objective-c版本

###安装
####cocoapods安装

```ruby
platform :ios, '6.0'
pod 'LBXAlertAction'
```

####手动导入：
将LBXAlertAction文件夹中的所有文件拽入项目中
导入主头文件：#import "LBXAlertAction.h"

##使用说明

###UIAlertView形式示例

```obj-c
[LBXAlertAction showAlertWithTitle:@"标题"
msg:@"提示消息内容"
buttonsStatement:@[@"取消",@"确认1",@"确认2",@"确认3",@"确认4",@"确认5",@"确认6"]
chooseBlock:^(NSInteger buttonIdx) {

NSArray* array = @[@"取消",@"确认1",@"确认2",@"确认3",@"确认4",@"确认5",@"确认6"];

//按钮按顺序输出
NSLog(@"u choose:%@",array[buttonIdx]);
}];
```

###UIActionSheet形式示例

```obj-c
[LBXAlertAction showActionSheetWithTitle:@"标题"
message:@"ios8系统之后才会显示本消息内容"
cancelButtonTitle:@"取消"
destructiveButtonTitle:@"destruct"
otherButtonTitle:@[@"items1",@"items2",@"items3"]
chooseBlock:^(NSInteger buttonIdx) {

//取消为0，destructiveButtonTitle从1开始，如果输入为nil，则otherButtonTitle从1开始，否则从2开始
NSLog(@"%ld",buttonIdx);
}];
```
