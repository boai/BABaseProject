//
//  BACommon.h
//  博爱微信
//
//  Created by 博爱 on 2016/10/24.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Foundation/NSObject.h>
#import <CoreLocation/CoreLocation.h>


@interface BACommon : NSObject

/*!
 *  将图片保存到应用程序沙盒中去,imageNameString的格式为 @"upLoad.png"
 *
 *  @param image           image description
 *  @param imageNameString imageNameString description
 */
+ (void)ba_saveImagetoLocal:(UIImage*)image imageName:(NSString *)imageNameString;

/*!
 *  与服务端连接已断开,请检查您的网络连接是否正常.
 */
+ (void)ba_showNoReachabileTips;

/*!
 *  添加系统的加载菊花 Only ActivityView
 *
 *  @param viewToLoadData viewToLoadData description
 *  @param aStyle         aStyle description
 *  @param color          color description
 */
+ (void)ba_addLoadingViewInView:(UIView *)viewToLoadData
     activityIndicatorViewStyle:(UIActivityIndicatorViewStyle)aStyle
                     usingColor:(UIColor *)color;

/*!
 *  移除已添加的系统菊花
 *
 *  @param viewToLoadData viewToLoadData description
 */
+ (void)ba_removeLoadingViewInView:(UIView *)viewToLoadData;

/*!
 *  从 Bundle 读取 plist 文件
 *
 *  @param fileName 文件名（如：city.plist）
 *  @param typeName 类型（前面写了后面可不写）
 *
 *  @return return value description
 */
+ (NSDictionary *)ba_dictFromBundleWithName:(NSString*)fileName withType:(NSString*)typeName;

/*!
 *  判断是否打开定位
 *
 *  @return YES / NO
 */
+ (BOOL)isLocationOpen;




@end
