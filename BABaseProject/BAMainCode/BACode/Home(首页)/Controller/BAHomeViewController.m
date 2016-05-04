//
//  BAHomeViewController.m
//  BABaseProject
//
//  Created by 博爱 on 16/5/3.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BAHomeViewController.h"

@interface BAHomeViewController ()

@end

@implementation BAHomeViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setVCBgColor:BA_White_Color];
    
    [self setupNavi];
    // 判断网络
    [self networkChangeWith:self];
}

- (void)setupNavi
{
//    UIImage *image = [UIImage imageNamed:@"14"];
//    [self set_leftBarButtonItemWithImage] = image;
//    self.set_leftBarButtonItemWithImage = [UIImage imageNamed:@"14"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
