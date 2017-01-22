//
//  BAProfileViewController.m
//  BABaseProject
//
//  Created by 博爱 on 16/5/3.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BAProfileViewController.h"

@interface BAProfileViewController ()

@end

@implementation BAProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"我 的";
    self.view.backgroundColor = BA_Red_Color;

}

- (void)openAppWithAlert:(NSString *)msg
{
    [self.view ba_showAlertView:@"网页打开APP，带传参：" message:msg];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
