
/*!
 *  @header BAKit.h
 *          BABaseProject
 *
 *  @brief  BAKit
 *
 *  @author 博爱
 *  @copyright    Copyright © 2016年 博爱. All rights reserved.
 *  @version    V1.0
 */

//                            _ooOoo_
//                           o8888888o
//                           88" . "88
//                           (| -_- |)
//                            O\ = /O
//                        ____/`---'\____
//                      .   ' \\| |// `.
//                       / \\||| : |||// \
//                     / _||||| -:- |||||- \
//                       | | \\\ - /// | |
//                     | \_| ''\---/'' | |
//                      \ .-\__ `-` ___/-. /
//                   ___`. .' /--.--\ `. . __
//                ."" '< `.___\_<|>_/___.' >'"".
//               | | : `- \`.;`\ _ /`;.`/ - ` : | |
//                 \ \ `-. \_ __\ /__ _/ .-` / /
//         ======`-.____`-.___\_____/___.-`____.-'======
//                            `=---='
//
//         .............................................
//                  佛祖镇楼                  BUG辟易
//          佛曰:
//                  写字楼里写字间，写字间里程序员；
//                  程序人员写程序，又拿程序换酒钱。
//                  酒醒只在网上坐，酒醉还来网下眠；
//                  酒醉酒醒日复日，网上网下年复年。
//                  但愿老死电脑间，不愿鞠躬老板前；
//                  奔驰宝马贵者趣，公交自行程序员。
//                  别人笑我忒疯癫，我笑自己命太贱；
//                  不见满街漂亮妹，哪个归得程序员？

/*
 
 *********************************************************************************
 *
 * 在使用BAKit的过程中如果出现bug请及时以以下任意一种方式联系我，我会及时修复bug
 *
 * QQ     : 博爱1616【137361770】
 * 微博    : 博爱1616
 * Email  : 137361770@qq.com
 * GitHub : https://github.com/boai
 * 博客园  : http://www.cnblogs.com/boai/
 * 博客    : http://boai.github.io
 
 *********************************************************************************
 
 */

#import "UIApplication+AppInfo.h"
#import <Photos/Photos.h>
#import <Contacts/Contacts.h>

@implementation UIApplication (AppInfo)

@dynamic window;

#pragma mark - app基本信息
- (NSString *)appName
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleNameKey];
}

- (NSString *)appVersion
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

- (NSString *)appBuild
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

- (NSString *)appBundleID
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
}

- (NSString *)documentsFolderSizeAsString
{
    NSString *folderPath = [self documentsDirectoryPath];
    
    NSArray *filesArray = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:folderPath error:nil];
    
    unsigned long long int folderSize = 0;
    
    for (NSString *fileName in filesArray)
    {
        NSDictionary *fileDictionary = [[NSFileManager defaultManager] attributesOfItemAtPath:[folderPath stringByAppendingPathComponent:fileName] error:nil];
        folderSize += [fileDictionary fileSize];
    }
    

    NSString *folderSizeStr = [NSByteCountFormatter stringFromByteCount:folderSize countStyle:NSByteCountFormatterCountStyleFile];
    return folderSizeStr;
}

- (int)documentsFolderSizeInBytes
{
    
    NSString *folderPath = [self documentsDirectoryPath];
    
    NSArray *filesArray = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:folderPath error:nil];
    unsigned long long int folderSize = 0;
    
    for (NSString *fileName in filesArray) {
        NSDictionary *fileDictionary = [[NSFileManager defaultManager] attributesOfItemAtPath:[folderPath stringByAppendingPathComponent:fileName] error:nil];
        folderSize += [fileDictionary fileSize];
    }
    return (int)folderSize;
}

- (NSString *)applicationSize
{
    unsigned long long docSize   =  [self sizeOfFolder:[self documentPath]];
    unsigned long long libSize   =  [self sizeOfFolder:[self libraryPath]];
    unsigned long long cacheSize =  [self sizeOfFolder:[self cachePath]];
    
    unsigned long long total = docSize + libSize + cacheSize;
    
    NSString *folderSizeStr = [NSByteCountFormatter stringFromByteCount:total countStyle:NSByteCountFormatterCountStyleFile];
    return folderSizeStr;
}


- (NSString *)documentPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = [paths firstObject];
    return basePath;
}

- (NSString *)libraryPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *basePath = [paths firstObject];
    return basePath;
}

- (NSString *)cachePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *basePath = [paths firstObject];
    return basePath;
}

- (unsigned long long)sizeOfFolder:(NSString *)folderPath
{
    NSArray *contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:folderPath error:nil];
    NSEnumerator *contentsEnumurator = [contents objectEnumerator];
    
    NSString *file;
    unsigned long long folderSize = 0;
    
    while (file = [contentsEnumurator nextObject]) {
        NSDictionary *fileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:[folderPath stringByAppendingPathComponent:file] error:nil];
        folderSize += [[fileAttributes objectForKey:NSFileSize] intValue];
    }
    return folderSize;
}

//#pragma mark - Privacy data access

- (BOOL)applicationHasAccessToLocationData
{
    if ([CLLocationManager authorizationStatus]==kCLAuthorizationStatusNotDetermined||[CLLocationManager authorizationStatus]==kCLAuthorizationStatusRestricted||[CLLocationManager authorizationStatus]==kCLAuthorizationStatusDenied)
    {
        return NO;
    }
     #if __IPHONE_8_0
     #else
      if ([CLLocationManager authorizationStatus]==kCLAuthorizationStatusAuthorized)
          return YES;
     #endif
      
    return NO;
}

- (BOOL)applicationhasAccessToAddressBook
{
    BOOL hasAccess = NO;
#if __IPHONE_9_0
    if ([CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts]==CNAuthorizationStatusAuthorized)
    {
        hasAccess=YES;
    }
#else
    switch (ABAddressBookGetAuthorizationStatus())
    {
        case kABAuthorizationStatusNotDetermined:
            hasAccess = NO;
            break;
        case kABAuthorizationStatusRestricted:
            hasAccess = NO;
            break;
        case kABAuthorizationStatusDenied:
            hasAccess = NO;
            break;
        case kABAuthorizationStatusAuthorized:
            hasAccess = YES;
            break;
    }
#endif
    
    return hasAccess;
}

- (BOOL)applicationHasAccessToCalendar
{
    
    BOOL hasAccess = NO;
    
    switch ([EKEventStore authorizationStatusForEntityType:EKEntityTypeEvent])
    {
        case EKAuthorizationStatusNotDetermined:
            hasAccess = NO;
            break;
        case EKAuthorizationStatusRestricted:
            hasAccess = NO;
            break;
        case EKAuthorizationStatusDenied:
            hasAccess = NO;
            break;
        case EKAuthorizationStatusAuthorized:
            hasAccess = YES;
            break;
    }
    
    return hasAccess;
}


- (BOOL)applicationHasAccessToReminders
{
    BOOL hasAccess = NO;
    switch ([EKEventStore authorizationStatusForEntityType:EKEntityTypeReminder])
    {
        case EKAuthorizationStatusNotDetermined:
            hasAccess = NO;
            break;
        case EKAuthorizationStatusRestricted:
            hasAccess = NO;
            break;
        case EKAuthorizationStatusDenied:
            hasAccess = NO;
            break;
        case EKAuthorizationStatusAuthorized:
            hasAccess = YES;
            break;
    }
    
    return hasAccess;
}


- (BOOL)applicationHasAccessToPhotosLibrary
{
    BOOL hasAccess = NO;

#if __IPHONE_8_0
    int author = [PHPhotoLibrary authorizationStatus];
    if (author==PHAuthorizationStatusAuthorized) {
        hasAccess=YES;
    }
    
#else
    int author = [ALAssetsLibrary authorizationStatus];
    if(author== ALAuthorizationStatusAuthorized)
    {
        hasAccess=YES;
    }
#endif
    return hasAccess;
}
/**
 *  麦克风开启
 *
 *  @warning
 */
- (void)applicationHasAccessToMicrophone:(grantBlock)flag
{
    //检测麦克风功能是否打开
    [[AVAudioSession sharedInstance]requestRecordPermission:^(BOOL granted) {
      
        flag(granted);
        
    }];
}

- (NSString *)documentsDirectoryPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    
    return documentsPath;
}
-(void)registerNotifications
{
   #if __IPHONE_8_0

    //注册推送
    if ([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0)
    {
       // [UIApplication sharedApplication]
        
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings
                                                                             settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge)
                                                                             categories:nil]];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
        //远程推送
        
    }
    #else
    //这里还是原来的代码
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:UIRemoteNotificationTypeAlert| UIRemoteNotificationTypeBadge| UIRemoteNotificationTypeSound];
    #endif

}
//-(UIViewController *)getCurrentViewConttoller
//{
//   // UIViewController *vc=nil;
//      UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
//    if ([topController isKindOfClass:[RESideMenu class]]) {
//        RESideMenu *mainVC=((RESideMenu *)topController);
//       UINavigationController *nav = (UINavigationController *)mainVC.contentViewController;
//        topController=nav.topViewController;
//    }
//    while (topController.presentedViewController) {
//        topController = topController.presentedViewController;
//    }
//      return topController;
//}
- (UIViewController*) topMostController
{
    UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
    //  Getting topMost ViewController
    while ([topController presentedViewController])	topController = [topController presentedViewController];
    //  Returning topMost ViewController
    return topController;
}
//
- (UIViewController*)getCurrentViewConttoller
{
    UIViewController *currentViewController = [self topMostController];
    
    while ([currentViewController isKindOfClass:[UINavigationController class]] && [(UINavigationController*)currentViewController topViewController])
        currentViewController = [(UINavigationController*)currentViewController topViewController];
        while (currentViewController.presentedViewController) {
            currentViewController = currentViewController.presentedViewController;
        }
    return currentViewController;
}

@end