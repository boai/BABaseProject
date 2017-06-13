//
//  DemoVC2.m
//  BABaseProject
//
//  Created by 博爱 on 16/5/4.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC2.h"
#import "UIAlertController+BAKit.h"

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

    self.vcBgColor = BAKit_Color_Green;
    [self clearCache];
}

- (void)clearCache
{
    BAKit_ClearCacheManager *clearCacheManager = [BAKit_ClearCacheManager ba_sharedCache];
    CGFloat cacheSize = [clearCacheManager ba_loadCacheSize];
    
    NSString *clearMessage = [NSString stringWithFormat:@"缓存大小为：%.2fM，确定要清理吗?", cacheSize];
    
    NSArray *buttonTitleArray = @[@"取消", @"确定"];
    NSArray *buttonTitleColorArray = @[BAKit_Color_Green, BAKit_Color_Red];
    [UIAlertController ba_alertShowInViewController:self title:@"温馨提示" message:clearMessage buttonTitleArray:buttonTitleArray buttonTitleColorArray:buttonTitleColorArray block:^(UIAlertController * _Nonnull alertController, UIAlertAction * _Nonnull action, NSInteger buttonIndex) {
            if (buttonIndex == 0)
            {
                return ;
            }
            if (buttonIndex == 1)
            {
                [clearCacheManager ba_myClearCacheAction];
                NSString *msg = [NSString stringWithFormat:@"成功清除缓存：%.2fM",  cacheSize];
                [self.view ba_showAlertView:@"温馨提示：" message:msg];
            }
    }];

}

@end
