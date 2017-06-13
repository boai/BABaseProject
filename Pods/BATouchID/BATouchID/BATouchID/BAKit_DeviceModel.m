//
//  BAKit_DeviceModel.m
//  BATouchID
//
//  Created by boai on 2017/5/24.
//  Copyright © 2017年 boai. All rights reserved.
//

#import "BAKit_DeviceModel.h"
#import <sys/sysctl.h>

@implementation BAKit_DeviceModel

+ (NSString *)ba_deviceGetCurrentDeviceModelDescription
{
    int mib[2];
    size_t len;
    char *machine;
    
    mib[0] = CTL_HW;
    mib[1] = HW_MACHINE;
    sysctl(mib, 2, NULL, &len, NULL, 0);
    machine = malloc(len);
    sysctl(mib, 2, machine, &len, NULL, 0);
    
    NSString *platform = [NSString stringWithCString:machine encoding:NSASCIIStringEncoding];
    free(machine);
    return platform;
}

+ (NSString *)ba_deviceGetCurrentDeviceModel
{
    NSString *platform = [BAKit_DeviceModel ba_deviceGetCurrentDeviceModelDescription];
    
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G";
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6S";
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6S Plus";
    
    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7 A1660";
    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus A1661";
    if ([platform isEqualToString:@"iPhone9,3"]) return @"iPhone 7 A1778";
    if ([platform isEqualToString:@"iPhone9,4"]) return @"iPhone 7 Plus A1784";
    
    if ([platform isEqualToString:@"iPod1,1"])   return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])   return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])   return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])   return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"])   return @"iPod Touch 5G";
    
    if ([platform isEqualToString:@"iPad1,1"])   return @"iPad 1G";
    
    if ([platform isEqualToString:@"iPad2,1"])   return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,2"])   return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,3"])   return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,4"])   return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,5"])   return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad2,6"])   return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad2,7"])   return @"iPad Mini 1G";
    
    if ([platform isEqualToString:@"iPad3,1"])   return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,2"])   return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,3"])   return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,4"])   return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,5"])   return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,6"])   return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad4,1"])   return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,2"])   return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,3"])   return @"iPad Air";
    
    if ([platform isEqualToString:@"iPad4,4"])   return @"iPad Mini 2G ";
    if ([platform isEqualToString:@"iPad4,5"])   return @"iPad Mini 2G ";
    if ([platform isEqualToString:@"iPad4,6"])   return @"iPad Mini 2G ";
    
    if ([platform isEqualToString:@"iPad4,7"])   return @"iPad Mini 3 ";
    if ([platform isEqualToString:@"iPad4,8"])   return @"iPad Mini 3 ";
    if ([platform isEqualToString:@"iPad4,9"])   return @"iPad Mini 3 ";
    
    if ([platform isEqualToString:@"iPad5,1"])   return @"iPad Mini 4 WiFi  ";
    if ([platform isEqualToString:@"iPad5,2"])   return @"iPad Mini 4 WiFi+Cellular ";
    
    if ([platform isEqualToString:@"iPad5,3"])   return @"iPad Air2 ";
    if ([platform isEqualToString:@"iPad5,4"])   return @"iPad Air2 ";
    
    if ([platform isEqualToString:@"iPad6,7"])   return @"iPad Pro WiFi 12.7-inch";
    if ([platform isEqualToString:@"iPad6,8"])   return @"iPad Pro WiFi+Cellular 12.7-inch";
    
    if ([platform isEqualToString:@"iPad6,3"])   return @"iPad Pro WiFi 9.7-inch";
    if ([platform isEqualToString:@"iPad6,4"])   return @"iPad Pro WiFi+Cellular 9.7-inch";
    
    if ([platform isEqualToString:@"i386"])      return @"iPhone Simulator";
    if ([platform isEqualToString:@"x86_64"])    return @"iPhone Simulator";
    return platform;
}

@end
