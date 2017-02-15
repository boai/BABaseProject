//
//  UMSocialUIManager.h
//  UMSocialSDK
//
//  Created by umeng on 16/8/10.
//  Copyright © 2016年 UMeng+. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UMSocialShareUIConfig.h"

@interface UMSocialUIManager : NSObject

#pragma mark - 6.1新增API

/**
 *  显示分享面板
 *
 *  @param sharePlatformSelectionBlock 回调block
 */
+ (void)showShareMenuViewInWindowWithPlatformSelectionBlock:(UMSocialSharePlatformSelectionBlock)sharePlatformSelectionBlock;

/**
 *  设置预定义平台
 *
 *  @param preDefinePlatforms 预定于平台数组@see UMSocialPlatformType.
 *  开发者需要自己预定义自己需要的平台。
 *  此函数需要在UMSocialSharePlatformSelectionBlock之前调用，
 *  传入的平台必须是合法并且是core模块已经检测到的已经存在的平台，不然会被过滤掉(此条款是上线appStore审核的条件，开发者必须注意)
 */
+(void)setPreDefinePlatforms:(NSArray*)preDefinePlatforms;

@end

