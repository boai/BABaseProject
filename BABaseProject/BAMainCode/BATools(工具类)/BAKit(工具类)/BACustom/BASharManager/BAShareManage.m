//
//  ShareManage.m
//  yrapp
//
//  Created by 博爱 on 16/2/3.
//  Copyright © 2016年 有人科技. All rights reserved.
//  友盟分享工具类

#import "BAShareManage.h"

//#import "BAShareAnimationView.h"


#define BAUMSocialManager        [UMSocialManager defaultManager]
#define BAUMSocialShareUIConfig  [UMSocialShareUIConfig shareInstance]

@interface BAShareManage()

@property (nonatomic, strong) UMSocialUserInfoResponse *responseDic;

@end

@implementation BAShareManage

+ (BAShareManage *)ba_shareManage
{
    static BAShareManage *ba_shareManage;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ba_shareManage = [[BAShareManage alloc] init];
    });
    return ba_shareManage;
}

#pragma mark - 判断平台是否安装
- (BOOL)ba_UMSocialIsInstall:(UMSocialPlatformType)platformType
{
    return [BAUMSocialManager isInstall:platformType];
}

#pragma mark - share type
#pragma mark 分享纯文本
- (void)ba_shareTextToPlatformType:(UMSocialPlatformType)platformType
                         shareText:(NSString *)shareText
                    viewController:(UIViewController *)viewController
{
    /*! 创建分享消息对象 */
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    /*! 设置文本 */
    messageObject.text = shareText;
    
    /*! 调用分享接口 */
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:viewController completion:^(id data, NSError *error) {
        if (error) {
            UMSocialLogInfo(@"************Share fail with error %@*********",error);
        }else{
            if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                UMSocialShareResponse *resp = data;
                /*! 分享结果消息 */
                UMSocialLogInfo(@"response message is %@",resp.message);
                /*! 第三方原始返回的数据 */
                UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                
            }else{
                UMSocialLogInfo(@"response data is %@",data);
            }
        }
        [self alertWithError:error];
    }];
}

#pragma mark 分享纯图片
- (void)ba_shareImageToPlatformType:(UMSocialPlatformType)platformType
                         thumbImage:(NSString *)thumbImage
                           bigImage:(NSString *)bigImage
                     viewController:(UIViewController *)viewController
{
    /*! 创建分享消息对象 */
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    /*! 创建图片内容对象 */
    UMShareImageObject *shareObject = [[UMShareImageObject alloc] init];
    /*! 如果有缩略图，则设置缩略图本地 */
    shareObject.thumbImage = [UIImage imageNamed:thumbImage];
    
    [shareObject setShareImage:[UIImage imageNamed:bigImage]];
    
    /*! 设置Pinterest参数 */
    if (platformType == UMSocialPlatformType_Pinterest) {
        [self setPinterstInfo:messageObject];
    }
    
    /*! 设置Kakao参数 */
    if (platformType == UMSocialPlatformType_KakaoTalk) {
        messageObject.moreInfo = @{@"permission" : @1}; // @1 = KOStoryPermissionPublic
    }
    
    /*! 分享消息对象设置分享内容对象 */
    messageObject.shareObject = shareObject;
    
    /*! 调用分享接口 */
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:viewController completion:^(id data, NSError *error) {
        if (error) {
            UMSocialLogInfo(@"************Share fail with error %@*********",error);
        }else{
            if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                UMSocialShareResponse *resp = data;
                /*! 分享结果消息 */
                UMSocialLogInfo(@"response message is %@",resp.message);
                /*! 第三方原始返回的数据 */
                UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                
            }else{
                UMSocialLogInfo(@"response data is %@",data);
            }
        }
        [self alertWithError:error];
    }];
}

#pragma mark 分享网络图片
- (void)ba_shareImageURLToPlatformType:(UMSocialPlatformType)platformType
                            thumbImage:(NSString *)thumbImage
                              imageUrl:(NSString *)imageUrl
                        viewController:(UIViewController *)viewController
{
    /*! 创建分享消息对象 */
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    /*! 创建图片内容对象 */
    UMShareImageObject *shareObject = [[UMShareImageObject alloc] init];
    /*! 如果有缩略图，则设置缩略图，此处为 URL */
//    shareObject.thumbImage = thumbImage;
    UIImageView *imageView = [UIImageView new];
    [imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        [shareObject setShareImage:image];
        
        /*! 设置Pinterest参数 */
        if (platformType == UMSocialPlatformType_Pinterest) {
            [self setPinterstInfo:messageObject];
        }
        
        /*! 设置Kakao参数 */
        if (platformType == UMSocialPlatformType_KakaoTalk) {
            messageObject.moreInfo = @{@"permission" : @1}; // @1 = KOStoryPermissionPublic
        }
        
        /*! 分享消息对象设置分享内容对象 */
        messageObject.shareObject = shareObject;
        
        /*! 调用分享接口 */
        [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:viewController completion:^(id data, NSError *error) {
            if (error) {
                UMSocialLogInfo(@"************Share fail with error %@*********",error);
            }else{
                if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                    UMSocialShareResponse *resp = data;
                    /*! 分享结果消息 */
                    UMSocialLogInfo(@"response message is %@",resp.message);
                    /*! 第三方原始返回的数据 */
                    UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                    
                }else{
                    UMSocialLogInfo(@"response data is %@",data);
                }
            }
            [self alertWithError:error];
        }];

    }];
    
}

#pragma mark 网页分享
- (void)ba_shareWebPageToPlatformType:(UMSocialPlatformType)platformType
                                title:(NSString *)title
                            shareText:(NSString *)shareText
                             imageUrl:(NSString *)imageUrl
                           webpageUrl:(NSString *)webpageUrl
                       viewController:(UIViewController *)viewController
{
    /*! 创建分享消息对象 */
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    BAWeak;
    UIImageView *imageView = [UIImageView new];
    [imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        /*! 创建网页内容对象 */
        UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:title descr:shareText thumImage:image];
        /*! 设置网页地址 */
        shareObject.webpageUrl = webpageUrl;
        
        /*! 分享消息对象设置分享内容对象 */
        messageObject.shareObject = shareObject;
        
        /*! 调用分享接口 */
        [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:viewController completion:^(id data, NSError *error) {
            if (error) {
                UMSocialLogInfo(@"************Share fail with error %@*********",error);
            }else{
                if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                    UMSocialShareResponse *resp = data;
                    /*! 分享结果消息 */
                    UMSocialLogInfo(@"response message is %@",resp.message);
                    /*! 第三方原始返回的数据 */
                    UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                    
                }else{
                    UMSocialLogInfo(@"response data is %@",data);
                }
            }
            [weakSelf alertWithError:error];
        }];

    }];
}

#pragma mark 分享图片和文字
- (void)ba_shareImageAndTextToPlatformType:(UMSocialPlatformType)platformType
                                 shareText:(NSString *)shareText
                                thumbImage:(NSString *)thumbImage
                                  imageUrl:(NSString *)imageUrl
                            viewController:(UIViewController *)viewController

{
    /*! 创建分享消息对象 */
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    /*! 设置文本 */
    messageObject.text = shareText;
    
    /*! 创建图片内容对象 */
    UMShareImageObject *shareObject = [[UMShareImageObject alloc] init];
    /*! 如果有缩略图，则设置缩略图 */
//    if (platformType == UMSocialPlatformType_Linkedin) {
//        /*! linkedin仅支持URL图片 */
////        shareObject.thumbImage = thumbImage;
//        [shareObject setShareImage:imageUrl];
//    } else {
        /*! 这里设置默认图片 */
//        shareObject.thumbImage = [UIImage imageNamed:@"icon2.jpg"];
    BAWeak;
    UIImageView *imageView = [UIImageView new];
    [imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        shareObject.shareImage = image;
        
        messageObject.shareObject = shareObject;
        
        [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:viewController completion:^(id data, NSError *error) {
            if (error) {
                UMSocialLogInfo(@"************Share fail with error %@*********",error);
            }else{
                if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                    UMSocialShareResponse *resp = data;
                    /*! 分享结果消息 */
                    UMSocialLogInfo(@"response message is %@",resp.message);
                    /*! 第三方原始返回的数据 */
                    UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                    
                }else{
                    UMSocialLogInfo(@"response data is %@",data);
                }
            }
            [weakSelf alertWithError:error];
        }];

    }];
    
   }

#pragma mark 音乐分享
- (void)ba_shareMusicToPlatformType:(UMSocialPlatformType)platformType
                           title:(NSString *)title
                       shareText:(NSString *)shareText
                        imageUrl:(NSString *)imageUrl
                        musicUrl:(NSString *)musicUrl
                       musicDataUrl:(NSString *)musicDataUrl
                     viewController:(UIViewController *)viewController
{
    /*! 创建分享消息对象 */
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    /*! 创建音乐内容对象 */
    UMShareMusicObject *shareObject = [UMShareMusicObject shareObjectWithTitle:title descr:shareText thumImage:imageUrl];
    /*! 设置音乐网页播放地址 */
    shareObject.musicUrl = musicUrl;
    shareObject.musicDataUrl = musicDataUrl;
    /*! 分享消息对象设置分享内容对象 */
    messageObject.shareObject = shareObject;
    
    /*! 调用分享接口 */
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:viewController completion:^(id data, NSError *error) {
        if (error) {
            UMSocialLogInfo(@"************Share fail with error %@*********",error);
        }else{
            if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                UMSocialShareResponse *resp = data;
                /*! 分享结果消息 */
                UMSocialLogInfo(@"response message is %@",resp.message);
                /*! 第三方原始返回的数据 */
                UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                
            }else{
                UMSocialLogInfo(@"response data is %@",data);
            }
        }
        [self alertWithError:error];
    }];
    
}

#pragma mark 视频分享
- (void)ba_shareVedioToPlatformType:(UMSocialPlatformType)platformType
                              title:(NSString *)title
                          shareText:(NSString *)shareText
                           imageUrl:(NSString *)imageUrl
                           videoUrl:(NSString *)videoUrl
                     viewController:(UIViewController *)viewController
{
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    UMShareVideoObject *shareObject = [UMShareVideoObject shareObjectWithTitle:title descr:shareText thumImage:imageUrl];
    /*! 设置视频网页播放地址 */
    shareObject.videoUrl = videoUrl;
    
    messageObject.shareObject = shareObject;
    
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:viewController completion:^(id data, NSError *error) {
        if (error) {
            UMSocialLogInfo(@"************Share fail with error %@*********",error);
        }else{
            if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                UMSocialShareResponse *resp = data;
                /*! 分享结果消息 */
                UMSocialLogInfo(@"response message is %@",resp.message);
                /*! 第三方原始返回的数据 */
                UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                
            }else{
                UMSocialLogInfo(@"response data is %@",data);
            }
        }
        [self alertWithError:error];
    }];
}

#pragma mark gif 动图分享
- (void)ba_shareEmoticonToPlatformType:(UMSocialPlatformType)platformType
                                 title:(NSString *)title
                             shareText:(NSString *)shareText
                              imageUrl:(NSString *)imageUrl
                           gifFilePath:(NSString *)gifFilePath
                        viewController:(UIViewController *)viewController
{
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    BAWeak;
    UIImageView *imageView = [UIImageView new];
    [imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        UMShareEmotionObject *shareObject = [UMShareEmotionObject shareObjectWithTitle:title descr:shareText thumImage:image];
        
//        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"gif3" ofType:@"gif"];
        NSData *emoticonData = [NSData dataWithContentsOfFile:gifFilePath];
        shareObject.emotionData = emoticonData;
        
        messageObject.shareObject = shareObject;
        
        [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:viewController completion:^(id data, NSError *error) {
            if (error) {
                NSLog(@"************Share fail with error %@*********",error);
            }else{
                if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                    UMSocialShareResponse *resp = data;
                    /*! 分享结果消息 */
                    NSLog(@"response message is %@",resp.message);
                    /*! 第三方原始返回的数据 */
                    NSLog(@"response originalResponse data is %@",resp.originalResponse);
                    
                }else{
                    NSLog(@"response data is %@",data);
                }
            }
            [weakSelf alertWithError:error];
        }];
    }];
}

#pragma mark 文件分享
- (void)ba_shareFileToPlatformType:(UMSocialPlatformType)platformType
                             title:(NSString *)title
                         shareText:(NSString *)shareText
                          imageUrl:(NSString *)imageUrl
                      fileFilePath:(NSString *)fileFilePath
                 fileFileExtension:(NSString *)fileFileExtension
                    viewController:(UIViewController *)viewController
{
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    UMShareFileObject *shareObject = [UMShareFileObject shareObjectWithTitle:title descr:shareText thumImage:imageUrl];
    
    NSString *kFileExtension = fileFileExtension;
//    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"umengFile"
//                                                         ofType:kFileExtension];
    NSData *fileData = [NSData dataWithContentsOfFile:fileFilePath];
    shareObject.fileData = fileData;
    shareObject.fileExtension = kFileExtension;
    
    messageObject.shareObject = shareObject;
    
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:viewController completion:^(id data, NSError *error) {
        if (error) {
            NSLog(@"************Share fail with error %@*********",error);
        }else{
            if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                UMSocialShareResponse *resp = data;
                /*! 分享结果消息 */
                NSLog(@"response message is %@",resp.message);
                /*! 第三方原始返回的数据 */
                NSLog(@"response originalResponse data is %@",resp.originalResponse);
                
            }else{
                NSLog(@"response data is %@",data);
            }
        }
        [self alertWithError:error];
    }];
    
}

- (void)alertWithError:(NSError *)error
{
    NSString *result = nil;
    if (!error) {
        result = [NSString stringWithFormat:@"分享成功！"];
    }
    else{
        NSMutableString *str = [NSMutableString string];
        if (error.userInfo) {
            for (NSString *key in error.userInfo) {
                [str appendFormat:@"%@ = %@\n", key, error.userInfo[key]];
            }
        }
        if (error) {
            result = [NSString stringWithFormat:@"Share fail with error code: %d\n%@",(int)error.code, str];
        }
        else{
            result = [NSString stringWithFormat:@"Share fail"];
        }
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"博爱分享"
                                                    message:result
                                                   delegate:nil
                                          cancelButtonTitle:NSLocalizedString(@"sure", @"确定")
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)setPinterstInfo:(UMSocialMessageObject *)messageObj
{
    messageObj.moreInfo = @{@"source_url": @"http://www.umeng.com",
                            @"app_name": @"U-Share",
                            @"suggested_board_name": @"UShareProduce",
                            @"description": @"U-Share: best social bridge"};
}


- (UIImage *)resizeImage:(UIImage *)image size:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, UIScreen.mainScreen.scale);
    CGRect imageRect = CGRectMake(0.0, 0.0, size.width, size.height);
    [image drawInRect:imageRect];
    UIImage *retImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return retImage;
}

#pragma mark - 友盟分享
#pragma mark 注册友盟分享微信
- (void)ba_setupShareConfig
{
    [BAUMSocialManager setUmSocialAppkey:BA_Umeng_Appkey];
    /*! 打开调试log的开关 */
    [BAUMSocialManager openLog:YES];
    
    /*! 获取友盟social版本号 */
    NSLog(@"获取友盟social版本号: %@", [UMSocialGlobal umSocialSDKVersion]);

    /*! 如果你要支持不同的屏幕方向，需要这样设置，否则在iPhone只支持一个竖屏方向 */
//    [UMSocialConfig setSupportedInterfaceOrientations:UIInterfaceOrientationMaskPortrait];
    
    /*! 苹果审核要求,隐藏未安装的应用 的分享选项 */
//    [UMSocialConfig hiddenNotInstallPlatforms:@[UMShareToSina, UMShareToQQ, UMShareToQzone, UMShareToWechatSession, UMShareToWechatTimeline]];
    
    /*! 设置新浪的appKey和appSecret */
    [BAUMSocialManager setPlaform:UMSocialPlatformType_Sina
                           appKey:BA_Sina_AppKey
                        appSecret:BA_SinaAppSecret
                      redirectURL:@"http://sns.whalecloud.com/sin"];
    
    /*! 设置微信的appKey和appSecret */
    [BAUMSocialManager setPlaform:UMSocialPlatformType_WechatSession
                           appKey:BA_WX_APPKEY
                        appSecret:BA_WX_APPSECRET
                      redirectURL:@"http://boai.github.io"];
    
    /*! 设置分享到QQ互联的 appID */
    [BAUMSocialManager setPlaform:UMSocialPlatformType_QQ
                           appKey:BA_QQAppID
                        appSecret:nil
                      redirectURL:@"http://boai.github.io"];
    
    /*! 这段代码是用友盟自带的自定义分享的时候打开！ */
    /*
     * 添加某一平台会加入平台下所有分享渠道，如微信：好友、朋友圈、收藏，QQ：QQ和QQ空间
     * 以下接口可移除相应平台类型的分享，如微信收藏，对应类型可在枚举中查找
     */
    //[[UMSocialManager defaultManager] removePlatformProviderWithPlatformTypes:@[@(UMSocialPlatformType_WechatFavorite)]];

//    UMSocialSnsPlatform *copyPlatform = [[UMSocialSnsPlatform alloc] initWithPlatformName:@"copy"];
//    copyPlatform.displayName = @"复制";
//    copyPlatform.smallImageName = @"icon"; //用于tableView样式的分享列表
//    copyPlatform.bigImageName = @"icon"; //用于actionsheet样式的分享列表
//    copyPlatform.snsClickHandler = ^(UIViewController *presentingController, UMSocialControllerService * socialControllerService, BOOL isPresentInController){ NSLog(@"copy!"); };                                                                                                                                                                                                          [UMSocialConfig addSocialSnsPlatform:@[copyPlatform]];                                                                                                                                                                                                        [UMSocialConfig setSnsPlatformNames:@[UMShareToSina, UMShareToWechatSession, UMShareToWechatTimeline, UMShareToQQ, UMShareToQzone]];
}

#pragma mark 微信分享
- (void)ba_wechatShareWithShareType:(BAUM_SHARE_TYPE)shareType
                 viewController:(UIViewController *)viewController
{
    switch (shareType) {
        case BAUM_SHARE_TYPE_TEXT:
            if ([BACommon ba_isNSStringNULL:_shareText])
            {
                NSLog(@"分享失败：纯文本分享中，文本内容不能为空！");
                [self BA_showAlertWithTitle:@"分享失败：纯文本分享中，文本内容不能为空！"];
                return;
            }
            [self ba_shareTextToPlatformType:UMSocialPlatformType_WechatSession
                                   shareText:_shareText
                              viewController:viewController];
            break;
        case BAUM_SHARE_TYPE_IMAGE:
            if ([BACommon ba_isNSStringNULL:_shareBigImage])
            {
                NSLog(@"分享失败：shareBigImage 不能为空！");
                [self BA_showAlertWithTitle:@"分享失败：shareBigImage 不能为空！" ];
                return;
            }
            [self ba_shareImageToPlatformType:UMSocialPlatformType_WechatSession
                                   thumbImage:nil
                                     bigImage:_shareBigImage
                               viewController:viewController];
            break;
        case BAUM_SHARE_TYPE_IMAGE_URL:
            if ([BACommon ba_isNSStringNULL:_shareImageUrl])
            {
                NSLog(@"分享失败：shareImageUrl 不能为空！");
                [self BA_showAlertWithTitle:@"分享失败：shareImageUrl 不能为空！" ];
                return;
            }
            [self ba_shareImageURLToPlatformType:UMSocialPlatformType_WechatSession
                                      thumbImage:nil
                                        imageUrl:_shareImageUrl
                                  viewController:viewController];
            break;
        case BAUM_SHARE_TYPE_WEB_LINK:
            if ([BACommon ba_isNSStringNULL:_shareWebpageUrl])
            {
                NSLog(@"分享失败：shareWebpageUrl 不能为空！");
                [self BA_showAlertWithTitle:@"分享失败：shareWebpageUrl 不能为空！" ];
                return;
            }
            [self ba_shareWebPageToPlatformType:UMSocialPlatformType_WechatSession
                                          title:_shareTitle
                                      shareText:_shareText
                                       imageUrl:_shareImageUrl
                                     webpageUrl:_shareWebpageUrl
                                 viewController:viewController];
            break;
        case BAUM_SHARE_TYPE_TEXT_IMAGE:
            /*! 注：友盟此方法暂时不能用 */
            if ([BACommon ba_isNSStringNULL:_shareImageUrl])
            {
                NSLog(@"分享失败：shareImageUrl 不能为空！");
                [self BA_showAlertWithTitle:@"分享失败：shareImageUrl 不能为空！" ];
                return;
            }
            [self ba_shareImageAndTextToPlatformType:UMSocialPlatformType_WechatSession
                                           shareText:_shareText
                                          thumbImage:nil
                                            imageUrl:_shareImageUrl
                                      viewController:viewController];
            break;
        case BAUM_SHARE_TYPE_MUSIC_LINK:
            if ([BACommon ba_isNSStringNULL:_shareMusicUrl])
            {
                NSLog(@"分享失败：shareMusicUrl 不能为空！");
                [self BA_showAlertWithTitle:@"分享失败：shareMusicUrl 不能为空！" ];
                return;
            }
            [self ba_shareMusicToPlatformType:UMSocialPlatformType_WechatSession
                                        title:_shareTitle
                                    shareText:_shareText
                                     imageUrl:_shareImageUrl
                                     musicUrl:_shareMusicUrl
                                 musicDataUrl:_shareMusicDataUrl
                               viewController:viewController];
            break;
        case BAUM_SHARE_TYPE_VIDEO_LINK:
            if ([BACommon ba_isNSStringNULL:_shareVideoUrl])
            {
                NSLog(@"分享失败：shareVideoUrl 不能为空！");
                [self BA_showAlertWithTitle:@"分享失败：shareVideoUrl 不能为空！" ];
                return;
            }
            [self ba_shareVedioToPlatformType:UMSocialPlatformType_WechatSession
                                        title:_shareTitle
                                    shareText:_shareText
                                     imageUrl:_shareImageUrl
                                     videoUrl:_shareVideoUrl
                               viewController:viewController];
            break;
        case BAUM_SHARE_TYPE_GIF:
            [self ba_shareEmoticonToPlatformType:UMSocialPlatformType_WechatSession
                                           title:_shareTitle
                                       shareText:_shareText
                                        imageUrl:_shareImageUrl
                                     gifFilePath:_shareGifFilePath
                                  viewController:viewController];
            break;
        case BAUM_SHARE_TYPE_FILE:
                        [self ba_shareFileToPlatformType:UMSocialPlatformType_WechatSession
                                                   title:_shareTitle
                                               shareText:_shareText
                                                imageUrl:_shareImageUrl
                                            fileFilePath:_shareFileFilePath
                                       fileFileExtension:_shareFileFileExtension
                                          viewController:viewController];
            break;
            
        default:
            break;
    }
}

#pragma mark 微信朋友圈分享
- (void)ba_wechatTimeLineShareWithShareType:(BAUM_SHARE_TYPE)shareType
                             viewController:(UIViewController *)viewController
{
    switch (shareType) {
        case BAUM_SHARE_TYPE_TEXT:
            if ([BACommon ba_isNSStringNULL:_shareText])
            {
                NSLog(@"分享失败：纯文本分享中，文本内容不能为空！");
                [self BA_showAlertWithTitle:@"分享失败：纯文本分享中，文本内容不能为空！"];
                return;
            }
            [self ba_shareTextToPlatformType:UMSocialPlatformType_WechatTimeLine
                                   shareText:_shareText
                              viewController:viewController];
            break;
        case BAUM_SHARE_TYPE_IMAGE:
            if ([BACommon ba_isNSStringNULL:_shareBigImage])
            {
                NSLog(@"分享失败：shareBigImage 不能为空！");
                [self BA_showAlertWithTitle:@"分享失败：shareBigImage 不能为空！" ];
                return;
            }
            [self ba_shareImageToPlatformType:UMSocialPlatformType_WechatTimeLine
                                   thumbImage:nil
                                     bigImage:_shareBigImage
                               viewController:viewController];
            break;
        case BAUM_SHARE_TYPE_IMAGE_URL:
            if ([BACommon ba_isNSStringNULL:_shareImageUrl])
            {
                NSLog(@"分享失败：shareImageUrl 不能为空！");
                [self BA_showAlertWithTitle:@"分享失败：shareImageUrl 不能为空！" ];
                return;
            }
            [self ba_shareImageURLToPlatformType:UMSocialPlatformType_WechatTimeLine
                                      thumbImage:nil
                                        imageUrl:_shareImageUrl
                                  viewController:viewController];
            break;
        case BAUM_SHARE_TYPE_WEB_LINK:
            if ([BACommon ba_isNSStringNULL:_shareWebpageUrl])
            {
                NSLog(@"分享失败：shareWebpageUrl 不能为空！");
                [self BA_showAlertWithTitle:@"分享失败：shareWebpageUrl 不能为空！" ];
                return;
            }
            [self ba_shareWebPageToPlatformType:UMSocialPlatformType_WechatTimeLine
                                          title:_shareTitle
                                      shareText:_shareText
                                       imageUrl:_shareImageUrl
                                     webpageUrl:_shareWebpageUrl
                                 viewController:viewController];
            break;
        case BAUM_SHARE_TYPE_TEXT_IMAGE:
            /*! 注：友盟此方法暂时不能用 */
            if ([BACommon ba_isNSStringNULL:_shareImageUrl])
            {
                NSLog(@"分享失败：shareImageUrl 不能为空！");
                [self BA_showAlertWithTitle:@"分享失败：shareImageUrl 不能为空！" ];
                return;
            }
            [self ba_shareImageAndTextToPlatformType:UMSocialPlatformType_WechatTimeLine
                                           shareText:_shareText
                                          thumbImage:nil
                                            imageUrl:_shareImageUrl
                                      viewController:viewController];
            break;
        case BAUM_SHARE_TYPE_MUSIC_LINK:
            if ([BACommon ba_isNSStringNULL:_shareMusicUrl])
            {
                NSLog(@"分享失败：shareMusicUrl 不能为空！");
                [self BA_showAlertWithTitle:@"分享失败：shareMusicUrl 不能为空！" ];
                return;
            }
            [self ba_shareMusicToPlatformType:UMSocialPlatformType_WechatTimeLine
                                        title:_shareTitle
                                    shareText:_shareText
                                     imageUrl:_shareImageUrl
                                     musicUrl:_shareMusicUrl
                                 musicDataUrl:_shareMusicDataUrl
                               viewController:viewController];
            break;
        case BAUM_SHARE_TYPE_VIDEO_LINK:
            if ([BACommon ba_isNSStringNULL:_shareVideoUrl])
            {
                NSLog(@"分享失败：shareVideoUrl 不能为空！");
                [self BA_showAlertWithTitle:@"分享失败：shareVideoUrl 不能为空！" ];
                return;
            }
            [self ba_shareVedioToPlatformType:UMSocialPlatformType_WechatTimeLine
                                        title:_shareTitle
                                    shareText:_shareText
                                     imageUrl:_shareImageUrl
                                     videoUrl:_shareVideoUrl
                               viewController:viewController];
            break;
        case BAUM_SHARE_TYPE_GIF:
            NSLog(@"分享失败：受 微信朋友圈 平台限制，不能分享 gif 动图到 微信朋友圈！");
            [self BA_showAlertWithTitle:@"分享失败：受 微信朋友圈 平台限制，不能分享 gif 动图到 微信朋友圈！"];
            return;
            //            [self ba_shareEmoticonToPlatformType:UMSocialPlatformType_WechatTimeLine
            //                                           title:_shareTitle
            //                                       shareText:_shareText
            //                                        imageUrl:_shareImageUrl
            //                                     gifFilePath:_shareGifFilePath
            //                                  viewController:viewController];
            break;
        case BAUM_SHARE_TYPE_FILE:
            NSLog(@"分享失败：受 微信朋友圈 平台限制，不能分享文件到 微信朋友圈！");
            [self BA_showAlertWithTitle:@"分享失败：受 微信朋友圈 平台限制，不能分享文件到 微信朋友圈！"];
            return;
            //            [self ba_shareFileToPlatformType:UMSocialPlatformType_WechatTimeLine
            //                                       title:_shareTitle
            //                                   shareText:_shareText
            //                                    imageUrl:_shareImageUrl
            //                                fileFilePath:_shareFileFilePath
            //                           fileFileExtension:_shareFileFileExtension
            //                              viewController:viewController];
            break;
            
        default:
            break;
    }
}

#pragma mark 新浪微博分享
- (void)ba_sinaShareWithShareType:(BAUM_SHARE_TYPE)shareType
                   viewController:(UIViewController *)viewController
{
    shareType = BAUM_SHARE_TYPE_TEXT_IMAGE;
    if (_shareText && _shareWebpageUrl)
    {
        _shareText = [NSString stringWithFormat:@"%@，分享自：@博爱1616，详见链接：%@", _shareText, _shareWebpageUrl];
    }
    switch (shareType) {
        case BAUM_SHARE_TYPE_TEXT:
            if ([BACommon ba_isNSStringNULL:_shareText])
            {
                NSLog(@"分享失败：纯文本分享中，文本内容不能为空！");
                [self BA_showAlertWithTitle:@"分享失败：纯文本分享中，文本内容不能为空！"];
                return;
            }
            [self ba_shareTextToPlatformType:UMSocialPlatformType_Sina
                                   shareText:_shareText
                              viewController:viewController];
            break;
        case BAUM_SHARE_TYPE_IMAGE:
            if ([BACommon ba_isNSStringNULL:_shareBigImage])
            {
                NSLog(@"分享失败：shareBigImage 不能为空！");
                [self BA_showAlertWithTitle:@"分享失败：shareBigImage 不能为空！" ];
                return;
            }
            [self ba_shareImageToPlatformType:UMSocialPlatformType_Sina
                                   thumbImage:nil
                                     bigImage:_shareBigImage
                               viewController:viewController];
            break;
        case BAUM_SHARE_TYPE_IMAGE_URL:
            if ([BACommon ba_isNSStringNULL:_shareImageUrl])
            {
                NSLog(@"分享失败：shareImageUrl 不能为空！");
                [self BA_showAlertWithTitle:@"分享失败：shareImageUrl 不能为空！" ];
                return;
            }
            [self ba_shareImageURLToPlatformType:UMSocialPlatformType_Sina
                                      thumbImage:nil
                                        imageUrl:_shareImageUrl
                                  viewController:viewController];
            break;
        case BAUM_SHARE_TYPE_WEB_LINK:
            if ([BACommon ba_isNSStringNULL:_shareWebpageUrl])
            {
                NSLog(@"分享失败：shareWebpageUrl 不能为空！");
                [self BA_showAlertWithTitle:@"分享失败：shareWebpageUrl 不能为空！" ];
                return;
            }
            [self ba_shareWebPageToPlatformType:UMSocialPlatformType_Sina
                                          title:_shareTitle
                                      shareText:_shareText
                                       imageUrl:_shareImageUrl
                                     webpageUrl:_shareWebpageUrl
                                 viewController:viewController];
            break;
        case BAUM_SHARE_TYPE_TEXT_IMAGE:
            /*! 注：友盟此方法暂时只对新浪分享有用 */
            if ([BACommon ba_isNSStringNULL:_shareImageUrl])
            {
                NSLog(@"分享失败：shareImageUrl 不能为空！");
                [self BA_showAlertWithTitle:@"分享失败：shareImageUrl 不能为空！" ];
                return;
            }
            [self ba_shareImageAndTextToPlatformType:UMSocialPlatformType_Sina
                                           shareText:_shareText
                                          thumbImage:nil
                                            imageUrl:_shareImageUrl
                                      viewController:viewController];
            break;
        case BAUM_SHARE_TYPE_MUSIC_LINK:
            if ([BACommon ba_isNSStringNULL:_shareMusicUrl])
            {
                NSLog(@"分享失败：shareMusicUrl 不能为空！");
                [self BA_showAlertWithTitle:@"分享失败：shareMusicUrl 不能为空！" ];
                return;
            }
            [self ba_shareMusicToPlatformType:UMSocialPlatformType_Sina
                                        title:_shareTitle
                                    shareText:_shareText
                                     imageUrl:_shareImageUrl
                                     musicUrl:_shareMusicUrl
                                 musicDataUrl:_shareMusicDataUrl
                               viewController:viewController];
            break;
        case BAUM_SHARE_TYPE_VIDEO_LINK:
            if ([BACommon ba_isNSStringNULL:_shareVideoUrl])
            {
                NSLog(@"分享失败：shareVideoUrl 不能为空！");
                [self BA_showAlertWithTitle:@"分享失败：shareVideoUrl 不能为空！" ];
                return;
            }
            [self ba_shareVedioToPlatformType:UMSocialPlatformType_Sina
                                        title:_shareTitle
                                    shareText:_shareText
                                     imageUrl:_shareImageUrl
                                     videoUrl:_shareVideoUrl
                               viewController:viewController];
            break;
        case BAUM_SHARE_TYPE_GIF:
            NSLog(@"分享失败：受 新浪微博 平台限制，不能分享 gif 动图到 新浪微博！");
            [self BA_showAlertWithTitle:@"分享失败：受 新浪微博 平台限制，不能分享 gif 动图到 新浪微博！"];
            return;
//            [self ba_shareEmoticonToPlatformType:UMSocialPlatformType_Sina
//                                           title:_shareTitle
//                                       shareText:_shareText
//                                        imageUrl:_shareImageUrl
//                                     gifFilePath:_shareGifFilePath
//                                  viewController:viewController];
            break;
        case BAUM_SHARE_TYPE_FILE:
            NSLog(@"分享失败：受 新浪微博 平台限制，不能分享文件到 新浪微博！");
            [self BA_showAlertWithTitle:@"分享失败：受 新浪微博 平台限制，不能分享文件到 新浪微博！"];
            return;
            //            [self ba_shareFileToPlatformType:UMSocialPlatformType_QQ
            //                                       title:_shareTitle
            //                                   shareText:_shareText
            //                                    imageUrl:_shareImageUrl
            //                                fileFilePath:_shareFileFilePath
            //                           fileFileExtension:_shareFileFileExtension
            //                              viewController:viewController];
            break;
            
        default:
            break;
    }
}

#pragma mark qq分享
- (void)ba_qqShareWithShareType:(BAUM_SHARE_TYPE)shareType
                 viewController:(UIViewController *)viewController
{
    switch (shareType) {
        case BAUM_SHARE_TYPE_TEXT:
            if ([BACommon ba_isNSStringNULL:_shareText])
            {
                NSLog(@"分享失败：纯文本分享中，文本内容不能为空！");
                [self BA_showAlertWithTitle:@"分享失败：纯文本分享中，文本内容不能为空！"];
                return;
            }
            [self ba_shareTextToPlatformType:UMSocialPlatformType_QQ
                                   shareText:_shareText
                              viewController:viewController];
            break;
        case BAUM_SHARE_TYPE_IMAGE:
            if ([BACommon ba_isNSStringNULL:_shareBigImage])
            {
                NSLog(@"分享失败：shareBigImage 不能为空！");
                [self BA_showAlertWithTitle:@"分享失败：shareBigImage 不能为空！" ];
                return;
            }
            [self ba_shareImageToPlatformType:UMSocialPlatformType_QQ
                                   thumbImage:nil
                                     bigImage:_shareBigImage
                               viewController:viewController];
            break;
        case BAUM_SHARE_TYPE_IMAGE_URL:
            if ([BACommon ba_isNSStringNULL:_shareImageUrl])
            {
                NSLog(@"分享失败：shareImageUrl 不能为空！");
                [self BA_showAlertWithTitle:@"分享失败：shareImageUrl 不能为空！" ];
                return;
            }
            [self ba_shareImageURLToPlatformType:UMSocialPlatformType_QQ
                                      thumbImage:nil
                                        imageUrl:_shareImageUrl
                                  viewController:viewController];
            break;
        case BAUM_SHARE_TYPE_WEB_LINK:
            if ([BACommon ba_isNSStringNULL:_shareWebpageUrl])
            {
                NSLog(@"分享失败：shareWebpageUrl 不能为空！");
                [self BA_showAlertWithTitle:@"分享失败：shareWebpageUrl 不能为空！" ];
                return;
            }
            [self ba_shareWebPageToPlatformType:UMSocialPlatformType_QQ
                                          title:_shareTitle
                                      shareText:_shareText
                                       imageUrl:_shareImageUrl
                                     webpageUrl:_shareWebpageUrl
                                 viewController:viewController];
            break;
        case BAUM_SHARE_TYPE_TEXT_IMAGE:
            /*! 注：友盟此方法暂时不能用 */
            if ([BACommon ba_isNSStringNULL:_shareImageUrl])
            {
                NSLog(@"分享失败：shareImageUrl 不能为空！");
                [self BA_showAlertWithTitle:@"分享失败：shareImageUrl 不能为空！" ];
                return;
            }
            [self ba_shareImageAndTextToPlatformType:UMSocialPlatformType_QQ
                                           shareText:_shareText
                                          thumbImage:nil
                                            imageUrl:_shareImageUrl
                                      viewController:viewController];
            break;
        case BAUM_SHARE_TYPE_MUSIC_LINK:
            if ([BACommon ba_isNSStringNULL:_shareMusicUrl])
            {
                NSLog(@"分享失败：shareMusicUrl 不能为空！");
                [self BA_showAlertWithTitle:@"分享失败：shareMusicUrl 不能为空！" ];
                return;
            }
            [self ba_shareMusicToPlatformType:UMSocialPlatformType_QQ
                                        title:_shareTitle
                                    shareText:_shareText
                                     imageUrl:_shareImageUrl
                                     musicUrl:_shareMusicUrl
                                 musicDataUrl:_shareMusicDataUrl
                               viewController:viewController];
            break;
        case BAUM_SHARE_TYPE_VIDEO_LINK:
            if ([BACommon ba_isNSStringNULL:_shareVideoUrl])
            {
                NSLog(@"分享失败：shareVideoUrl 不能为空！");
                [self BA_showAlertWithTitle:@"分享失败：shareVideoUrl 不能为空！" ];
                return;
            }
            [self ba_shareVedioToPlatformType:UMSocialPlatformType_QQ
                                        title:_shareTitle
                                    shareText:_shareText
                                     imageUrl:_shareImageUrl
                                     videoUrl:_shareVideoUrl
                               viewController:viewController];
            break;
        case BAUM_SHARE_TYPE_GIF:
                NSLog(@"分享失败：受 QQ 平台限制，不能分享 gif 动图到 QQ！");
                [self BA_showAlertWithTitle:@"分享失败：受 QQ 平台限制，不能分享 gif 动图到 QQ！"];
                return;
//            [self ba_shareEmoticonToPlatformType:UMSocialPlatformType_QQ
//                                           title:_shareTitle
//                                       shareText:_shareText
//                                        imageUrl:_shareImageUrl
//                                     gifFilePath:_shareGifFilePath
//                                  viewController:viewController];
            break;
        case BAUM_SHARE_TYPE_FILE:
            NSLog(@"分享失败：受 QQ 平台限制，不能分享文件到 QQ！");
            [self BA_showAlertWithTitle:@"分享失败：受 QQ 平台限制，不能分享文件到 QQ！"];
            return;
//            [self ba_shareFileToPlatformType:UMSocialPlatformType_QQ
//                                       title:_shareTitle
//                                   shareText:_shareText
//                                    imageUrl:_shareImageUrl
//                                fileFilePath:_shareFileFilePath
//                           fileFileExtension:_shareFileFileExtension
//                              viewController:viewController];
            break;
            
        default:
            break;
    }
}

#pragma mark Qzone分享
- (void)ba_qZoneShareWithShareType:(BAUM_SHARE_TYPE)shareType
                 viewController:(UIViewController *)viewController
{
    switch (shareType) {
        case BAUM_SHARE_TYPE_TEXT:
            if ([BACommon ba_isNSStringNULL:_shareText])
            {
                NSLog(@"分享失败：纯文本分享中，文本内容不能为空！");
                [self BA_showAlertWithTitle:@"分享失败：纯文本分享中，文本内容不能为空！"];
                return;
            }
            [self ba_shareTextToPlatformType:UMSocialPlatformType_Qzone
                                   shareText:_shareText
                              viewController:viewController];
            break;
        case BAUM_SHARE_TYPE_IMAGE:
            if ([BACommon ba_isNSStringNULL:_shareBigImage])
            {
                NSLog(@"分享失败：shareBigImage 不能为空！");
                [self BA_showAlertWithTitle:@"分享失败：shareBigImage 不能为空！" ];
                return;
            }
            [self ba_shareImageToPlatformType:UMSocialPlatformType_Qzone
                                   thumbImage:nil
                                     bigImage:_shareBigImage
                               viewController:viewController];
            break;
        case BAUM_SHARE_TYPE_IMAGE_URL:
            if ([BACommon ba_isNSStringNULL:_shareImageUrl])
            {
                NSLog(@"分享失败：shareImageUrl 不能为空！");
                [self BA_showAlertWithTitle:@"分享失败：shareImageUrl 不能为空！" ];
                return;
            }
            [self ba_shareImageURLToPlatformType:UMSocialPlatformType_Qzone
                                      thumbImage:nil
                                        imageUrl:_shareImageUrl
                                  viewController:viewController];
            break;
        case BAUM_SHARE_TYPE_WEB_LINK:
            if ([BACommon ba_isNSStringNULL:_shareWebpageUrl])
            {
                NSLog(@"分享失败：shareWebpageUrl 不能为空！");
                [self BA_showAlertWithTitle:@"分享失败：shareWebpageUrl 不能为空！" ];
                return;
            }
            [self ba_shareWebPageToPlatformType:UMSocialPlatformType_Qzone
                                          title:_shareTitle
                                      shareText:_shareText
                                       imageUrl:_shareImageUrl
                                     webpageUrl:_shareWebpageUrl
                                 viewController:viewController];
            break;
        case BAUM_SHARE_TYPE_TEXT_IMAGE:
            /*! 注：友盟此方法暂时不能用 */
            if ([BACommon ba_isNSStringNULL:_shareImageUrl])
            {
                NSLog(@"分享失败：shareImageUrl 不能为空！");
                [self BA_showAlertWithTitle:@"分享失败：shareImageUrl 不能为空！" ];
                return;
            }
            [self ba_shareImageAndTextToPlatformType:UMSocialPlatformType_Qzone
                                           shareText:_shareText
                                          thumbImage:nil
                                            imageUrl:_shareImageUrl
                                      viewController:viewController];
            break;
        case BAUM_SHARE_TYPE_MUSIC_LINK:
            if ([BACommon ba_isNSStringNULL:_shareMusicUrl])
            {
                NSLog(@"分享失败：shareMusicUrl 不能为空！");
                [self BA_showAlertWithTitle:@"分享失败：shareMusicUrl 不能为空！" ];
                return;
            }
            [self ba_shareMusicToPlatformType:UMSocialPlatformType_Qzone
                                        title:_shareTitle
                                    shareText:_shareText
                                     imageUrl:_shareImageUrl
                                     musicUrl:_shareMusicUrl
                                 musicDataUrl:_shareMusicDataUrl
                               viewController:viewController];
            break;
        case BAUM_SHARE_TYPE_VIDEO_LINK:
            if ([BACommon ba_isNSStringNULL:_shareVideoUrl])
            {
                NSLog(@"分享失败：shareVideoUrl 不能为空！");
                [self BA_showAlertWithTitle:@"分享失败：shareVideoUrl 不能为空！" ];
                return;
            }
            [self ba_shareVedioToPlatformType:UMSocialPlatformType_Qzone
                                        title:_shareTitle
                                    shareText:_shareText
                                     imageUrl:_shareImageUrl
                                     videoUrl:_shareVideoUrl
                               viewController:viewController];
            break;
        case BAUM_SHARE_TYPE_GIF:
            NSLog(@"分享失败：受 QQ空间 平台限制，不能分享 gif 动图到 QQ空间！");
            [self BA_showAlertWithTitle:@"分享失败：受 QQ空间 平台限制，不能分享 gif 动图到 QQ空间！"];
            return;
            //            [self ba_shareEmoticonToPlatformType:UMSocialPlatformType_QQ
            //                                           title:_shareTitle
            //                                       shareText:_shareText
            //                                        imageUrl:_shareImageUrl
            //                                     gifFilePath:_shareGifFilePath
            //                                  viewController:viewController];
            break;
        case BAUM_SHARE_TYPE_FILE:
            NSLog(@"分享失败：受 QQ空间 平台限制，不能分享文件到 QQ空间！");
            [self BA_showAlertWithTitle:@"分享失败：受 QQ空间 平台限制，不能分享文件到 QQ空间！"];
            return;
            //            [self ba_shareFileToPlatformType:UMSocialPlatformType_QQ
            //                                       title:_shareTitle
            //                                   shareText:_shareText
            //                                    imageUrl:_shareImageUrl
            //                                fileFilePath:_shareFileFilePath
            //                           fileFileExtension:_shareFileFileExtension
            //                              viewController:viewController];
            break;
            
        default:
            break;
    }
}

#pragma mark - 分享列表
- (void)ba_shareListWithShareType:(BAUM_SHARE_TYPE)shareType
                   viewController:(UIViewController *)viewController
{
    BAWeak;
    BAUMSocialShareUIConfig.sharePageGroupViewConfig.sharePageGroupViewPostionType = UMSocialSharePageGroupViewPositionType_Bottom;
    BAUMSocialShareUIConfig.sharePageScrollViewConfig.shareScrollViewPageItemStyleType = UMSocialPlatformItemViewBackgroudType_IconAndBGRadius;
    BAUMSocialShareUIConfig.shareTitleViewConfig.shareTitleViewTitleString = @"博爱分享";
    BAUMSocialShareUIConfig.shareTitleViewConfig.shareTitleViewTitleColor = [UIColor purpleColor];
    BAUMSocialShareUIConfig.shareCancelControlConfig.shareCancelControlText = @"取消分享";
    /*! 在这里预设自己需要分享的平台 */
    [UMSocialUIManager setPreDefinePlatforms:@[
                                            @(UMSocialPlatformType_WechatSession),
                                            @(UMSocialPlatformType_WechatTimeLine),
                                            @(UMSocialPlatformType_QQ),
                                            @(UMSocialPlatformType_Qzone),
                                            @(UMSocialPlatformType_Sina)]];
    
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        
        if (platformType == UMSocialPlatformType_QQ)
        {
            [weakSelf ba_qqShareWithShareType:shareType
                               viewController:viewController];
        }
        else if (platformType == UMSocialPlatformType_Qzone)
        {
            [weakSelf ba_qZoneShareWithShareType:shareType
                                 viewController:viewController];
        }
        else if (platformType == UMSocialPlatformType_WechatSession)
        {
            [weakSelf ba_wechatShareWithShareType:shareType
                               viewController:viewController];
        }
        else if (platformType == UMSocialPlatformType_WechatTimeLine)
        {
            [weakSelf ba_wechatTimeLineShareWithShareType:shareType
                                   viewController:viewController];
        }
        else if (platformType == UMSocialPlatformType_Sina)
        {
            [weakSelf ba_sinaShareWithShareType:shareType
                                   viewController:viewController];
        }
    }];
}

#pragma mark - 友盟登录

#pragma mark 微信登录
- (void)ba_wechatLoginWithViewController:(UIViewController *)viewController
                   isGetAuthWithUserInfo:(BOOL)isGetAuthWithUserInfo
                           loginCallback:(BAUMLoginCallback)loginCallback
{
    [self ba_UMLoginWithPlatformType:UMSocialPlatformType_WechatSession
                      viewController:viewController
               isGetAuthWithUserInfo:isGetAuthWithUserInfo
                       loginCallback:loginCallback];
}

#pragma mark QQ登录
- (void)ba_qqLoginWithViewController:(UIViewController *)viewController
               isGetAuthWithUserInfo:(BOOL)isGetAuthWithUserInfo
                       loginCallback:(BAUMLoginCallback)loginCallback
{
    [self ba_UMLoginWithPlatformType:UMSocialPlatformType_QQ
                      viewController:viewController
               isGetAuthWithUserInfo:isGetAuthWithUserInfo
                       loginCallback:loginCallback];
}

#pragma mark QZone登录
- (void)ba_qZoneLoginWithViewController:(UIViewController *)viewController
                  isGetAuthWithUserInfo:(BOOL)isGetAuthWithUserInfo
                          loginCallback:(BAUMLoginCallback)loginCallback
{
    [self ba_UMLoginWithPlatformType:UMSocialPlatformType_Qzone
                      viewController:viewController
               isGetAuthWithUserInfo:isGetAuthWithUserInfo
                       loginCallback:loginCallback];
}

#pragma mark 微博登录
- (void)ba_sinaLoginWithViewController:(UIViewController *)viewController
                 isGetAuthWithUserInfo:(BOOL)isGetAuthWithUserInfo
                       loginCallback:(BAUMLoginCallback)loginCallback
{
    [self ba_UMLoginWithPlatformType:UMSocialPlatformType_Sina
                      viewController:viewController
               isGetAuthWithUserInfo:isGetAuthWithUserInfo
                       loginCallback:loginCallback];
}

#pragma mark - 友盟登录列表
- (void)ba_loginListWithViewController:(UIViewController *)viewController
                 isGetAuthWithUserInfo:(BOOL)isGetAuthWithUserInfo
                         loginCallback:(BAUMLoginCallback)loginCallback
{
    BAWeak;
    BAUMSocialShareUIConfig.sharePageGroupViewConfig.sharePageGroupViewPostionType = UMSocialSharePageGroupViewPositionType_Bottom;
    BAUMSocialShareUIConfig.sharePageScrollViewConfig.shareScrollViewPageItemStyleType = UMSocialPlatformItemViewBackgroudType_IconAndBGRadius;
    BAUMSocialShareUIConfig.shareTitleViewConfig.shareTitleViewTitleString = @"博爱登录";
    BAUMSocialShareUIConfig.shareTitleViewConfig.shareTitleViewTitleColor = [UIColor redColor];
    BAUMSocialShareUIConfig.shareCancelControlConfig.shareCancelControlText = @"取消登录";
    /*! 在这里预设自己需要登录的平台 */
    [UMSocialUIManager setPreDefinePlatforms:@[
                                            @(UMSocialPlatformType_WechatSession),
                                            @(UMSocialPlatformType_QQ),
                                            @(UMSocialPlatformType_Qzone),
                                            @(UMSocialPlatformType_Sina)]];
    
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        
        if (platformType == UMSocialPlatformType_QQ)
        {
            [weakSelf ba_qqLoginWithViewController:viewController
                             isGetAuthWithUserInfo:isGetAuthWithUserInfo
                                     loginCallback:loginCallback];
        }
        else if (platformType == UMSocialPlatformType_Qzone)
        {
            [weakSelf ba_qZoneLoginWithViewController:viewController
                                isGetAuthWithUserInfo:isGetAuthWithUserInfo
                                        loginCallback:loginCallback];
        }
        else if (platformType == UMSocialPlatformType_WechatSession)
        {
            [weakSelf ba_wechatLoginWithViewController:viewController
                                 isGetAuthWithUserInfo:isGetAuthWithUserInfo
                                         loginCallback:loginCallback];
        }
        else if (platformType == UMSocialPlatformType_Sina)
        {
            [weakSelf ba_sinaLoginWithViewController:viewController
                               isGetAuthWithUserInfo:isGetAuthWithUserInfo
                                       loginCallback:loginCallback];
        }
    }];
}

- (void)ba_UMLoginWithPlatformType:(UMSocialPlatformType)platformType
                    viewController:(UIViewController *)viewController
             isGetAuthWithUserInfo:(BOOL)isGetAuthWithUserInfo
                     loginCallback:(BAUMLoginCallback)loginCallback
{
    BAWeak;
    if (isGetAuthWithUserInfo)
    {
        [BAUMSocialManager getUserInfoWithPlatform:platformType currentViewController:nil completion:^(id result, NSError *error) {
            
            [weakSelf callbackWithResult:result
                                   error:error
                           loginCallback:loginCallback];
        }];
    }
    else
    {
        [BAUMSocialManager authWithPlatform:UMSocialPlatformType_WechatSession currentViewController:nil completion:^(id result, NSError *error) {
            [weakSelf callbackWithResult:result
                                   error:error
                           loginCallback:loginCallback];
        }];
    }
}

- (void)callbackWithResult:(id)result
                     error:(NSError *)error
             loginCallback:(BAUMLoginCallback)loginCallback
{
    NSString *message = nil;
    
    if (error) {
        message = @"登录失败，获取用户信息失败！";
        UMSocialLogInfo(@"登录失败，获取用户信息失败！error %@",error);
    }else{
        if ([result isKindOfClass:[UMSocialUserInfoResponse class]]) {
            
            UMSocialUserInfoResponse *resp = result;
            self.responseDic = resp;
            if (loginCallback)
            {
                loginCallback(resp);
            }
        }else{
            message = @"登录失败，获取用户信息失败！";
        }
    }
    
    if (message) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"UserInfo"
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:NSLocalizedString(@"sure", @"确定")
                                              otherButtonTitles:nil];
        [alert show];
    }
}

#pragma mark - 清除授权
- (void)ba_cancelAuthWithPlatformType:(UMSocialPlatformType)platformType
{
    BAWeak;
    if (self.responseDic)
    {
        [BAUMSocialManager cancelAuthWithPlatform:platformType completion:^(id result, NSError *error) {
            self.responseDic = nil;
            if (weakSelf.authOpFinish)
            {
                weakSelf.authOpFinish();
            }
//            NSString *msg = [NSString stringWithFormat:@"清除授权成功！"];
//            [weakSelf BA_showAlertWithTitle:msg];
        }];
    }
    else
    {
        [self BA_showAlertWithTitle:@"您还没有授权信息，不能清除授权！"];
    }
}

- (NSString *)authInfoString:(UMSocialUserInfoResponse *)resp
{
    NSMutableString *string = [NSMutableString new];
    if (resp.uid) {
        [string appendFormat:@"uid = %@\n", resp.uid];
    }
    if (resp.openid) {
        [string appendFormat:@"openid = %@\n", resp.openid];
    }
    if (resp.accessToken) {
        [string appendFormat:@"accessToken = %@\n", resp.accessToken];
    }
    if (resp.refreshToken) {
        [string appendFormat:@"refreshToken = %@\n", resp.refreshToken];
    }
    if (resp.expiration) {
        [string appendFormat:@"expiration = %@\n", resp.expiration];
    }
    if (resp.name) {
        [string appendFormat:@"name = %@\n", resp.name];
    }
    if (resp.iconurl) {
        [string appendFormat:@"iconurl = %@\n", resp.iconurl];
    }
    if (resp.gender) {
        [string appendFormat:@"gender = %@\n", resp.gender];
    }
    return string;
}

@end

