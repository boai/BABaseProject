//
//  DemoVC2_05_test2.m
//  BABaseProject
//
//  Created by 博爱 on 2016/11/3.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC2_05_test2.h"

@interface DemoVC2_05_test2 ()

@property (nonatomic, strong) UIButton *shareButton;

@end

@implementation DemoVC2_05_test2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    self.title = @"测试按钮点击次数！";
    self.shareButton.hidden = NO;
    
}

- (UIButton *)shareButton
{
    if (!_shareButton)
    {
        _shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _shareButton.frame = CGRectMake(20, 80 + 50 + 20, 100, 50);
        [_shareButton setTitle:@"分 享" forState:UIControlStateNormal];
        [_shareButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _shareButton.backgroundColor = [UIColor redColor];
        
        /*! 注意：这里的方法名一定要和 plist 的方法名一致 */
        [_shareButton addTarget:self action:@selector(onShareBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:_shareButton];
    }
    return _shareButton;
}

- (IBAction)onShareBtnPressed:(UIButton *)sender
{
    
    NSLog(@"你点击了分享按钮！");
}

@end
