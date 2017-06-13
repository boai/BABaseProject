//
//  BAKit_DeviceModel.h
//  BATouchID
//
//  Created by boai on 2017/5/24.
//  Copyright © 2017年 boai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BAKit_DeviceModel : NSObject

/*
 获取设备描述
 */
+ (NSString *)ba_deviceGetCurrentDeviceModelDescription;

/*
 由获取到的设备描述，来匹配设备型号
 */
+ (NSString *)ba_deviceGetCurrentDeviceModel;

@end
