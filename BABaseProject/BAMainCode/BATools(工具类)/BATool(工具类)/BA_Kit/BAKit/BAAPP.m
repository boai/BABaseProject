
/*!
 *  @header BAKit.h
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

#import "BAAPP.h"

NSString *const BABundleName               = @"CFBundleName";
NSString *const BABundleVersion            = @"CFBundleVersion";
NSString *const BABundleShortVersionString = @"CFBundleShortVersionString";

static NSString *BAHasBeenOpened = @"BAHasBeenOpened";
static NSString *BAHasBeenOpenedForCurrentVersion = @"";


@implementation BAAPP

+ (void)onFirstStart:(void (^ _Nullable)(BOOL isFirstStart))block {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL hasBeenOpened = [defaults boolForKey:BAHasBeenOpened];
    if (hasBeenOpened != true) {
        [defaults setBool:YES forKey:BAHasBeenOpened];
        [defaults synchronize];
    }
    
    block(!hasBeenOpened);
}

+ (void)onFirstStartForCurrentVersion:(void (^ _Nullable)(BOOL isFirstStartForCurrentVersion))block {
    BAHasBeenOpenedForCurrentVersion = [NSString stringWithFormat:@"%@%@", BAHasBeenOpened, BA_APP_Version];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL hasBeenOpenedForCurrentVersion = [defaults boolForKey:BAHasBeenOpenedForCurrentVersion];
    if (hasBeenOpenedForCurrentVersion != true) {
        [defaults setBool:YES forKey:BAHasBeenOpenedForCurrentVersion];
        [defaults synchronize];
    }
    
    block(!hasBeenOpenedForCurrentVersion);
}

+ (void)onFirstStartForVersion:(NSString * _Nonnull)version block:(void (^ _Nullable)(BOOL isFirstStartForCurrentVersion))block {
    NSString *STHasBeenOpenedForVersion = [NSString stringWithFormat:@"%@%@", BAHasBeenOpened, version];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL hasBeenOpenedForVersion = [defaults boolForKey:BAHasBeenOpenedForCurrentVersion];
    if (hasBeenOpenedForVersion != true) {
        [defaults setBool:YES forKey:STHasBeenOpenedForVersion];
        [defaults synchronize];
    }
    
    block(!hasBeenOpenedForVersion);
}

+ (BOOL)isFirstStart {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL hasBeenOpened = [defaults boolForKey:BAHasBeenOpened];
    if (hasBeenOpened != true) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)isFirstStartForCurrentVersion {
    BAHasBeenOpenedForCurrentVersion = [NSString stringWithFormat:@"%@%@", BAHasBeenOpened, BA_APP_Version];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL hasBeenOpenedForCurrentVersion = [defaults boolForKey:BAHasBeenOpenedForCurrentVersion];
    if (hasBeenOpenedForCurrentVersion != true) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)isFirstStartForVersion:(NSString * _Nonnull)version {
    NSString *STHasBeenOpenedForVersion = [NSString stringWithFormat:@"%@%@", BAHasBeenOpened, version];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL hasBeenOpenedForVersion = [defaults boolForKey:STHasBeenOpenedForVersion];
    if (hasBeenOpenedForVersion != true) {
        return YES;
    } else {
        return NO;
    }
}

@end
