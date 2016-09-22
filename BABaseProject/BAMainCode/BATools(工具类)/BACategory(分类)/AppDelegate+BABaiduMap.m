//
//  AppDelegate+BABaiduMap.m
//  BABaseProject
//
//  Created by boai on 2016/9/22.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "AppDelegate+BABaiduMap.h"


@implementation AppDelegate (BABaiduMap)

/*!
 *  配置百度地图
 */
- (void)ba_setupBaiduMap
{
    /*! 要使用百度地图，请先启动BaiduMapManager */
    _mapManager = [[BMKMapManager alloc]init];
    BOOL ret = [_mapManager start:BA_BaiDuMapAppKey generalDelegate:self];
    if (!ret)
    {
        NSLog(@"manager start failed!");
    }
}

- (void)onGetNetworkState:(int)iError
{
    if (0 == iError) {
        NSLog(@"联网成功");
    }
    else{
        NSLog(@"onGetNetworkState %d",iError);
    }
}

- (void)onGetPermissionState:(int)iError
{
    if (0 == iError)
    {
        NSLog(@"授权成功");
    }
    else
    {
        NSLog(@"onGetPermissionState %d",iError);
    }
}

@end
