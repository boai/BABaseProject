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
    
    /**
     *百度地图SDK所有接口均支持百度坐标（BD09）和国测局坐标（GCJ02），用此方法设置您使用的坐标类型.
     *默认是BD09（BMK_COORDTYPE_BD09LL）坐标.
     *如果需要使用GCJ02坐标，需要设置CoordinateType为：BMK_COORDTYPE_COMMON.
     */
    if ([BMKMapManager setCoordinateTypeUsedInBaiduMapSDK:BMK_COORDTYPE_BD09LL]) {
        NSLog(@"经纬度类型设置成功");
    } else {
        NSLog(@"经纬度类型设置失败");
    }
    
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
