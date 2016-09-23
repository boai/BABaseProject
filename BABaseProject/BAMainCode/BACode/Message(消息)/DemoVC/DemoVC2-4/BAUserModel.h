//
//  BAUserModel.h
//  BABaseProject
//
//  Created by boai on 2016/9/23.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BABaseModel.h"
#import <BaiduMapAPI_Search/BMKGeocodeType.h>
#import <BaiduMapAPI_Search/BMKGeoCodeSearch.h>
#import <BaiduMapAPI_Location/BMKLocationService.h>


@interface BAUserModel : BABaseModel
<
    BMKLocationServiceDelegate,
    BMKGeoCodeSearchDelegate
>
{
    BMKLocationService       *locationManager;
    BMKGeoCodeSearch         *search;
    BMKReverseGeoCodeResult  *searchResult;
}

/*! 当前用户定位坐标 */
@property (nonatomic, assign) CLLocationCoordinate2D   m_local2D;

/*! 当前定位的详细地址 */
@property (nonatomic, copy) NSString                *m_localAddr;

/*! 层次化地址信息 */
@property (nonatomic, copy) BMKAddressComponent     *m_addressDetail;


+ (instancetype)ba_userManager;


@end
