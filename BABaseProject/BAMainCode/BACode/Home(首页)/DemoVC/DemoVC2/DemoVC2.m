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
    CGFloat cacheSize = [[SDImageCache sharedImageCache] getSize];
    
    NSString *clearMessage = cacheSize >= 1024*1024 ? [NSString stringWithFormat:@"清理缓存（%.2fM）", cacheSize / 1024 / 1024] : [NSString stringWithFormat:@"清理缓存（%.2fK）", cacheSize / 1024];
    [self BAAlertWithTitle:@"温馨提示：" message:clearMessage andOthers:@[@"确 定"] animated:YES action:^(NSInteger index) {
        
        if (index == 0)
        {
            // 清除内存缓存
            [[[SDWebImageManager sharedManager] imageCache] clearMemory];
            // 清除系统缓存
            [[NSURLCache sharedURLCache] removeAllCachedResponses];
            
//            [[[SDWebImageManager sharedManager] imageCache] cleanDisk];
        }
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
