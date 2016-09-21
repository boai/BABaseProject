//
//  DemoVC2.m
//  BABaseProject
//
//  Created by 博爱 on 16/5/4.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC2.h"

@interface DemoVC2 ()

@end

@implementation DemoVC2

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self isShowSnowLoadingView:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self isShowSnowLoadingView:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.vcBgColor = BA_Green_Color;
    [self clearCache];
}

- (void)clearCache
{
    BAClearCacheManager *clearCacheManager = [BAClearCacheManager ba_sharedCache];
    CGFloat cacheSize = [clearCacheManager ba_loadCacheSize];

    NSString *clearMessage = [NSString stringWithFormat:@"缓存大小为%.2fM确定要清理吗?", cacheSize];

    BA_WEAKSELF;
    [self BAAlertWithTitle:@"温馨提示：" message:clearMessage andOthers:@[@"取 消", @"确 定"] animated:YES action:^(NSInteger index) {
        
        if (index == 0)
        {
            return ;
        }
        if (index == 1)
        {
            [clearCacheManager ba_myClearCacheAction];
            NSString *msg = [NSString stringWithFormat:@"成功清除缓存：%.2fM",  cacheSize];
            [weakSelf.view ba_showAlertView:@"温馨提示：" message:msg];
        }
        
    }];
    
}

@end
