//
//  BAHeader.h
//  demoTest
//
//  Created by 博爱 on 16/3/15.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#ifndef BAHeader_h
#define BAHeader_h


// 警告框-一个按钮【VC】
#define BA_SHOW_ALERT(title, msg)  UIAlertController *alert = [UIAlertController alertControllerWithTitle:title  message:msg preferredStyle:UIAlertControllerStyleAlert];\
[alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {\
BALog(@"你点击了确定按钮！");\
}]];\
[self presentViewController:alert animated:YES completion:nil];\
// 警告框-一个按钮【View】
#define BA_SHOW_AlertAtView(msg) [[[UIAlertView alloc] initWithTitle:@"温馨提示：" message:msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil] show];


// weakSelf
#define BA_WEAKSELF typeof(self) __weak weakSelf = self

// 通知
#define BA_Noti [NSNotificationCenter defaultCenter]


#endif /* BAHeader_h */
