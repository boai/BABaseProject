
/*!
 *  @header BAKit
 *          demoTest
 *
 *  @brief  BAKit
 *
 *  @author 博爱
 *  @copyright    Copyright © 2016年 博爱. All rights reserved.
 *  @version    V1.0
 */

/*!
 *
 *          ┌─┐       ┌─┐
 *       ┌──┘ ┴───────┘ ┴──┐
 *       │                 │
 *       │       ───       │
 *       │  ─┬┘       └┬─  │
 *       │                 │
 *       │       ─┴─       │
 *       │                 │
 *       └───┐         ┌───┘
 *           │         │
 *           │         │
 *           │         │
 *           │         └──────────────┐
 *           │                        │
 *           │                        ├─┐
 *           │                        ┌─┘
 *           │                        │
 *           └─┐  ┐  ┌───────┬──┐  ┌──┘
 *             │ ─┤ ─┤       │ ─┤ ─┤
 *             └──┴──┘       └──┴──┘
 *                 神兽保佑
 *                 代码无BUG!
 */

/*
 
 *********************************************************************************
 *
 * 在使用BAKit的过程中如果出现bug请及时以以下任意一种方式联系我，我会及时修复bug
 *
 * QQ     : 可以添加SDAutoLayout群 497140713 在这里找到我(博爱1616【137361770】)
 * 微博    : 博爱1616
 * Email  : 137361770@qq.com
 * GitHub : https://github.com/boai
 * 博客园  : http://www.cnblogs.com/boai/
 *********************************************************************************
 
 */

#import "UIDevice+BAKit.h"
#include <sys/types.h>
#include <sys/sysctl.h>
#include <sys/socket.h>
#include <net/if.h>
#include <net/if_dl.h>

static NSString * const STUniqueIdentifierDefaultsKey = @"STUniqueIdentifier";

@implementation UIDevice (BAKit)

/* 返回平台设备 */
+ (NSString *)devicePlatform
{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithUTF8String:machine];
    free(machine);
    return platform;
}

/* 返回平台设备字符串 */
+ (NSString *)devicePlatformString
{
    NSString *platform = [self devicePlatform];
    // iPhone
    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 2G";
    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"])    return @"iPhone 4 (CDMA)";
    if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"])    return @"iPhone 5 (GSM)";
    if ([platform isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (CDMA)";
    if ([platform isEqualToString:@"iPhone5,3"])    return @"iPhone 5C (GSM)";
    if ([platform isEqualToString:@"iPhone5,4"])    return @"iPhone 5C (Global)";
    if ([platform isEqualToString:@"iPhone6,1"])    return @"iPhone 5S (GSM)";
    if ([platform isEqualToString:@"iPhone6,2"])    return @"iPhone 5S (Global)";
    if ([platform isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    // iPod
    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
    // iPad
    if ([platform isEqualToString:@"iPad1,1"])      return @"iPad 1";
    if ([platform isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([platform isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([platform isEqualToString:@"iPad2,4"])      return @"iPad 2 (32nm)";
    if ([platform isEqualToString:@"iPad2,5"])      return @"iPad mini (WiFi)";
    if ([platform isEqualToString:@"iPad2,6"])      return @"iPad mini (GSM)";
    if ([platform isEqualToString:@"iPad2,7"])      return @"iPad mini (CDMA)";
    if ([platform isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([platform isEqualToString:@"iPad3,2"])      return @"iPad 3 (CDMA)";
    if ([platform isEqualToString:@"iPad3,3"])      return @"iPad 3 (GSM)";
    if ([platform isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([platform isEqualToString:@"iPad3,5"])      return @"iPad 4 (GSM)";
    if ([platform isEqualToString:@"iPad3,6"])      return @"iPad 4 (CDMA)";
    if ([platform isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
    if ([platform isEqualToString:@"iPad4,2"])      return @"iPad Air (Cellular)";
    if ([platform isEqualToString:@"iPad4,3"])      return @"iPad Air (China)";
    if ([platform isEqualToString:@"iPad5,3"])      return @"iPad Air 2 (WiFi)";
    if ([platform isEqualToString:@"iPad5,4"])      return @"iPad Air 2 (Cellular)";
    // iPad mini
    if ([platform isEqualToString:@"iPad4,4"])      return @"iPad mini 2 (WiFi)";
    if ([platform isEqualToString:@"iPad4,5"])      return @"iPad mini 2 (Cellular)";
    if ([platform isEqualToString:@"iPad4,6"])      return @"iPad mini 2 (China)";
    if ([platform isEqualToString:@"iPad4,7"])      return @"iPad mini 3 (WiFi)";
    if ([platform isEqualToString:@"iPad4,8"])      return @"iPad mini 3 (Cellular)";
    if ([platform isEqualToString:@"iPad4,9"])      return @"iPad mini 3 (China)";
    // Simulator
    if ([platform isEqualToString:@"i386"])         return @"Simulator";
    if ([platform isEqualToString:@"x86_64"])       return @"Simulator";
    return platform;
}

/* 是否是IPAD */
+ (BOOL)isiPad
{
    if([[[self devicePlatform] substringToIndex:4] isEqualToString:@"iPad"])
        return YES;
    else
        return NO;
}

/* 是否是iPhone */
+ (BOOL)isiPhone
{
    if([[[self devicePlatform] substringToIndex:6] isEqualToString:@"iPhone"])
        return YES;
    else
        return NO;
}

/* 是否是iPod */
+ (BOOL)isiPod
{
    if([[[self devicePlatform] substringToIndex:4] isEqualToString:@"iPod"])
        return YES;
    else
        return NO;
}

/* 是否是模拟器 */
+ (BOOL)isSimulator
{
    if([[self devicePlatform] isEqualToString:@"i386"]
       || [[self devicePlatform] isEqualToString:@"x86_64"])
        return YES;
    else
        return NO;
}

/* 是否是Retina */
+ (BOOL)isRetina
{
    if ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)]
        && ([UIScreen mainScreen].scale == 2.0
            || [UIScreen mainScreen].scale == 3.0))
        return YES;
    else
        return NO;
}

/* 是否是RetinaHD */
+ (BOOL)isRetinaHD
{
    if ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)]
        && ([UIScreen mainScreen].scale == 3.0))
        return YES;
    else
        return NO;
}

/* 返回IOS版本号 */
+ (NSInteger)iOSVersion
{
    return [[[UIDevice currentDevice] systemVersion] integerValue];
}

/* 返回系统信息 */
+ (NSUInteger)getSysInfo:(uint)typeSpecifier
{
    size_t size = sizeof(int);
    int results;
    int mib[2] = {CTL_HW, typeSpecifier};
    sysctl(mib, 2, &results, &size, NULL, 0);
    return (NSUInteger) results;
}

/* 返回CPU频率 */
+ (NSUInteger)cpuFrequency
{
    return [self getSysInfo:HW_CPU_FREQ];
}

/* 返回总线频率 */
+ (NSUInteger)busFrequency
{
    return [self getSysInfo:HW_BUS_FREQ];
}

/* 返回物理内存大小 */
+ (NSUInteger)ramSize
{
    return [self getSysInfo:HW_MEMSIZE];
}

/* 返回CPU数 */
+ (NSUInteger)cpuNumber
{
    return [self getSysInfo:HW_NCPU];
}

/* 返回总内存 */
+ (NSUInteger)totalMemory
{
    return [self getSysInfo:HW_PHYSMEM];
}

/* 返回非内核内存 */
+ (NSUInteger)userMemory
{
    return [self getSysInfo:HW_USERMEM];
}

/* 返回文件系统空间 */
+ (NSNumber *)totalDiskSpace
{
    NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory()
                                                                                        error:nil];
    return [fattributes objectForKey:NSFileSystemSize];
}

/* 返回文件系统剩余空间 */
+ (NSNumber *)freeDiskSpace
{
    NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory()
                                                                                        error:nil];
    return [fattributes objectForKey:NSFileSystemFreeSize];
}

/* 返回当前设备的mac地址 */
+ (NSString *)macAddress
{
    int                 mib[6];
    size_t              len;
    char                *buf;
    unsigned char       *ptr;
    struct if_msghdr    *ifm; // 从sysctl和路由套接字的接口中获取信息使用的消息格式
    struct sockaddr_dl  *sdl; // 一个链路层的sockaddr结构
    
    mib[0] = CTL_NET; /* network, see socket.h */
    mib[1] = AF_ROUTE; /* Internal Routing Protocol */
    mib[2] = 0;
    mib[3] = AF_LINK; /* Link layer interface */
    mib[4] = NET_RT_IFLIST; /* survey interface list */
    
    if((mib[5] = if_nametoindex("en0")) == 0)
    {
        printf("Error: if_nametoindex error\n");
        return NULL;
    }
    
    if(sysctl(mib, 6, NULL, &len, NULL, 0) < 0)
    {
        printf("Error: sysctl, take 1\n");
        return NULL;
    }
    
    if((buf = malloc(len)) == NULL)
    {
        printf("Could not allocate memory. Rrror!\n");
        return NULL;
    }
    
    if(sysctl(mib, 6, buf, &len, NULL, 0) < 0)
    {
        printf("Error: sysctl, take 2");
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    NSString *outstring = [NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X",
                           *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    // NSString *outstring = [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X",
    //                       *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    free(buf);
    
    return outstring;
}

/* 返回唯一标识符 */
+ (NSString *)uniqueIdentifier
{
    NSString *uuid;
    if([[UIDevice currentDevice] respondsToSelector:@selector(identifierForVendor)])
    {
        // 获取UUID的字符串描述
        uuid = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    }
    else
    {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        uuid = [defaults objectForKey:STUniqueIdentifierDefaultsKey];
        if (!uuid) {
            uuid = [self generateUUID];
            [defaults setObject:uuid forKey:STUniqueIdentifierDefaultsKey];
            [defaults synchronize];
        }
    }
    return uuid;
}

/* 生成一个全新的唯一标识符 */
+ (NSString *)generateUUID
{
    // 创建一个全新的唯一标识符
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    // 从UUID转换为字符串表示
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    CFRelease(theUUID);
    return (__bridge_transfer NSString *)string;
}


@end
