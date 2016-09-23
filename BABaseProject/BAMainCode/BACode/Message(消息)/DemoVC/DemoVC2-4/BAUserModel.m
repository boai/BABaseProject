//
//  BAUserModel.m
//  BABaseProject
//
//  Created by boai on 2016/9/23.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BAUserModel.h"

@implementation BAUserModel

+ (instancetype)ba_userManager
{
    static BAUserModel *user = nil;
    static dispatch_once_t once_token;
    dispatch_once(&once_token, ^{
        user = [[BAUserModel alloc] init];

//        [user initUserLocalParam];
        
    });
    
    return user;
}

//- (void)initUserLocalParam
//{
//    _m_local2D.latitude           = 23.0017f;
//    _m_local2D.longitude          = 113.3416f;
//    _m_localAddr                  = @"广东省广州市番禺区汉溪大道290号";
//    _m_addressDetail              = [[BMKAddressComponent alloc] init];
//    _m_addressDetail.province     = @"广东省";
//    _m_addressDetail.streetNumber = @"290号";
//    _m_addressDetail.streetName   = @"汉溪大道";
//    _m_addressDetail.district     = @"番禺区";
//    _m_addressDetail.city         = @"广州市";
//}


@end
