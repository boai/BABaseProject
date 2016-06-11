//
//  BAPublishViewController.m
//  BABaseProject
//
//  Created by 博爱之家 on 16/6/11.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BAPublishViewController.h"

@interface BAPublishViewController ()

@property (nonatomic, strong) UIBarButtonItem *rightItem;

@end

@implementation BAPublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:BA_Green_Color];
    
    /*! 设置导航条 */
    [self setUpNavgationBar];
}

- (void)setUpNavgationBar
{
    self.title = @"我的发布";
    // left
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:0 target:self action:@selector(dismiss)];
    
    // right
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"发送" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [btn sizeToFit];
    
    // 监听按钮点击
//    [btn addTarget:self action:@selector(compose) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    rightItem.enabled = NO;
    self.navigationItem.rightBarButtonItem = rightItem;
    _rightItem = rightItem;
}

- (void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismiss];
}

@end
