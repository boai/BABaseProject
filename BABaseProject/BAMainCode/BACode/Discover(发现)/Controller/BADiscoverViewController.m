//
//  BADiscoverViewController.m
//  BABaseProject
//
//  Created by 博爱 on 16/5/3.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BADiscoverViewController.h"
#import "BASnowView.h"
// 更新 + 变黑
#import "BAUpdatingView.h"
#import "BAFadeBlackView.h"

@interface BADiscoverViewController ()

@property (nonatomic, strong) BAFadeBlackView        *fadeBlackView;
@property (nonatomic, strong) BAUpdatingView         *upDatingView;


@end

@implementation BADiscoverViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setVCBgColor:BA_Green_Color];

    [self test];
}

- (void)test
{
    // 变黑
    self.fadeBlackView = [[BAFadeBlackView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.fadeBlackView];
    
    // loading
    self.upDatingView        = [[BAUpdatingView alloc] initWithFrame:CGRectZero];
    self.upDatingView.center = self.view.center;
    [self.view addSubview:self.upDatingView];
    
    [self getLocationAndFadeShow];
}

- (void)getLocationAndFadeShow {
    
    // 显示出等待页面
    [self.fadeBlackView showFadeBlackView:YES];
    [self.upDatingView show];
    
    
}
@end
