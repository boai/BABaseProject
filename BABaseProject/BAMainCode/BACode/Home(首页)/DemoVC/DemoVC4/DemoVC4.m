//
//  DemoVC4.m
//  BABaseProject
//
//  Created by 博爱 on 16/5/7.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC4.h"

/*! 友盟分享 */
//#import "UMSocial.h"

@interface DemoVC4 ()

@property (nonatomic, strong) BAButton *shareBtn;
@property (nonatomic, strong) BAButton *QQLoginBtn;

@property (nonatomic, strong) UMSocialUserInfoResponse *dict;

@end

@implementation DemoVC4

- (BAButton *)shareBtn
{
    if (!_shareBtn)
    {
        _shareBtn = [BAButton new];
        _shareBtn.frame = CGRectMake(50, 100, 100, 40);
        [_shareBtn setTitle:@"博爱分享" forState:UIControlStateNormal];
        [_shareBtn setTitleColor:BA_White_Color forState:UIControlStateNormal];
        _shareBtn.titleLabel.font = BA_FontSize(16);
        [_shareBtn jm_setCornerRadius:5 withBackgroundColor:BA_Green_Color];
        _shareBtn.tag = 1001;
        [_shareBtn addTarget:self action:@selector(clickShareBtn:) forControlEvents:UIControlEventTouchUpInside];
        _shareBtn.titleLabel.textAlignment = NSTextAlignmentRight;
        
        [self.view addSubview:_shareBtn];
        
        [_shareBtn ba_shakeView];
    }
    return _shareBtn;
}

- (BAButton *)QQLoginBtn
{
    if (!_QQLoginBtn)
    {
        _QQLoginBtn = [BAButton new];
        _QQLoginBtn.frame = CGRectMake(50, _shareBtn.bottom + 50, 100, 40);
        [_QQLoginBtn setTitle:@"博爱登录" forState:UIControlStateNormal];
        [_QQLoginBtn setTitleColor:BA_White_Color forState:UIControlStateNormal];
        _QQLoginBtn.titleLabel.font = BA_FontSize(16);
        [_QQLoginBtn jm_setCornerRadius:5 withBackgroundColor:BA_Green_Color];
        _QQLoginBtn.tag = 1002;
        [_QQLoginBtn addTarget:self action:@selector(clickShareBtn:) forControlEvents:UIControlEventTouchUpInside];
        _QQLoginBtn.titleLabel.textAlignment = NSTextAlignmentRight;

        [self.view addSubview:_QQLoginBtn];
//        [_QQLoginBtn ba_pulseViewWithTime:5];

    }
    return _QQLoginBtn;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.vcBgColor = BA_White_Color;
//    [self.view ba_createGradientWithColors:@[[]] direction:UIViewLinearGradientDirectionVertical];
    self.shareBtn.hidden = NO;
    self.QQLoginBtn.hidden = NO;
}

#pragma mark 友盟分享和登陆
- (IBAction)clickShareBtn:(UIButton *)sender
{
    BAWeak;
    /*! 友盟分享 */
    if (sender.tag == 1001)
    {
        /*! 分享标题 */
        BASHAREMANAGER.shareTitle = @"博爱分享 2.1 版";
        /*! 分享摘要 */
        BASHAREMANAGER.shareText = @"博爱分享 2.1 版：好帅啊！基于友盟最新版本：6.1.0版本封装！赶紧来用！";
        /*! 分享大图【URL】 */
        //        BASHAREMANAGER.shareBigImage = @"icon2.jpg";
        /*! 分享缩略图或者大图【URL】 */
        BASHAREMANAGER.shareImageUrl = @"http://e.hiphotos.baidu.com/image/pic/item/7af40ad162d9f2d303f4c1e5abec8a136227ccd7.jpg";
        
        /*! 分享网页 */
        //        BASHAREMANAGER.shareWebpageUrl = @"http://boai.github.io";
        BASHAREMANAGER.shareWebpageUrl = @"http://www.cnblogs.com/boai/";
        /*! 分享音乐 URL【音乐网页播放地址】 */
        BASHAREMANAGER.shareMusicUrl = @"http://c.y.qq.com/v8/playsong.html?songid=108782194&source=yqq#wechat_redirect";
        /*! 分享音乐 DataUrl */
        BASHAREMANAGER.shareMusicDataUrl = @"http://music.huoxing.com/upload/20130330/1364651263157_1085.mp3";
        /*! 分享视频 URL【视频网页播放地址】 */
        BASHAREMANAGER.shareVideoUrl = @"http://video.sina.com.cn/p/sports/cba/v/2013-10-22/144463050817.html";
        /*! 分享 gif 动图路径 */
        BASHAREMANAGER.shareGifFilePath = [[NSBundle mainBundle] pathForResource:@"gif2" ofType:@"gif"];
        /*! 分享文件路径 */
        BASHAREMANAGER.shareFileFilePath = [[NSBundle mainBundle] pathForResource:@"BAUmengFile.txt" ofType:nil];
        /*! 分享文件后缀类型 */
        BASHAREMANAGER.shareFileFileExtension = @"txt";
        
        /*! 分享类型必传的参数详见类型封装【最常用的就是：BAUM_SHARE_TYPE_WEB_LINK】 */
        [BASHAREMANAGER ba_shareListWithShareType:BAUM_SHARE_TYPE_WEB_LINK viewController:self];
    }
    /*! 友盟登陆 */
    if (sender.tag == 1002)
    {
        
        [BASHAREMANAGER ba_loginListWithViewController:self isGetAuthWithUserInfo:YES loginCallback:^(UMSocialUserInfoResponse *response) {
            // 授权信息【具体返回参数要看平台，每个平台返回的数据不一样！如：新浪微博没有返回 openid 】
            NSString *msg = [NSString stringWithFormat:@"登陆成功，获取用户名：%@", response.name];
            [weakSelf BAAlertWithTitle:@"温馨提示：" message:msg andOthers:@[@"确 定"] animated:YES action:^(NSInteger index) {
                if (index)
                {
                    return ;
                }
            }];
            weakSelf.dict = response;
            NSLog(@"登陆返回信息 uid: %@", response.uid);
            NSLog(@"登陆返回信息 openid: %@", response.openid);
            NSLog(@"登陆返回信息 accessToken: %@", response.accessToken);
            NSLog(@"登陆返回信息 refreshToken: %@", response.refreshToken);
            NSLog(@"登陆返回信息 expiration: %@", response.expiration);
            
            // 用户信息
            NSLog(@"登陆返回信息 name: %@", response.name);
            NSLog(@"登陆返回信息 iconurl: %@", response.iconurl);
            NSLog(@"登陆返回信息 gender: %@", response.gender);
            
            // 第三方平台SDK源数据
            NSLog(@"登陆返回信息 originalResponse: %@", response.originalResponse);
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                if (weakSelf.dict)
                {
                    [BASHAREMANAGER ba_cancelAuthWithPlatformType:UMSocialPlatformType_QQ];
                    BASHAREMANAGER.authOpFinish = ^{
                        NSString *msg = [NSString stringWithFormat:@"清除授权成功！"];
                        [weakSelf BA_showAlertWithTitle:msg];
                    };
                }

            });
            
        }];
        
/*!
 登陆返回信息：
 登陆返回信息 uid: 2D05134F80401D12A763CDF3***6
 登陆返回信息 openid: 2D05134F80401D12A763CDF***331B6
 登陆返回信息 accessToken: 0B818C0CA00BE5149***FECDE397
 登陆返回信息 refreshToken: (null)
 登陆返回信息 expiration: 2017-03-09 05:42:08 +0000
 登陆返回信息 name: 博爱1616
 登陆返回信息 iconurl: http://q.qlogo.cn/qqapp/1105285308/2D05134F80401D12A763CDF3287331B6/100
 登陆返回信息 gender: 男
 登陆返回信息 originalResponse: {
     city = "";
     figureurl = "http://qzapp.qlogo.cn/qzapp/1105285308/2D05134F80401D12A763CDF328***";
     "figureurl_1" = "http://qzapp.qlogo.cn/qzapp/1105285308/2D05134F80401D12A763CDF3***";
     "figureurl_2" = "http://qzapp.qlogo.cn/qzapp/1105285308/2D05134F80401D12A763CDF328***";
     "figureurl_qq_1" = "http://q.qlogo.cn/qqapp/1105285308/2D05134F80401D12A763CDF32873***";
     "figureurl_qq_2" = "http://q.qlogo.cn/qqapp/1105285308/2D05134F80401D12A763CDF3287***";
     gender = "男";
     "is_lost" = 0;
     "is_yellow_vip" = 0;
     "is_yellow_year_vip" = 0;
     level = 0;
     msg = "";
     nickname = "博爱1616";
     province = "";
     ret = 0;
     vip = 0;
     "yellow_vip_level" = 0;
 }
 */
    }
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    _shareBtn = nil;
    _QQLoginBtn = nil;
}

- (BOOL)willDealloc
{
    return NO;
}

//获取屏幕截屏方法
- (UIImage *)capture
{
//    UIWindow *window = [UIApplication sharedApplication].keyWindow;
//    
//    UIGraphicsBeginImageContextWithOptions(window.bounds.size, false, [UIScreen mainScreen].scale);
//    [window drawViewHierarchyInRect:window.bounds afterScreenUpdates:false];
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    return image;
    
    UIGraphicsBeginImageContextWithOptions(self.navigationController.view.bounds.size, self.navigationController.view.opaque, 0.0);
    
    [self.navigationController.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage*)mcScreenShotWithObject:(id)target
                          shotSize:(CGSize)size
                          isOpaque:(BOOL)opaque
                            isSave:(BOOL)isSave
                          saveName:(NSString*)name{
    UIGraphicsBeginImageContextWithOptions(size, opaque, [UIScreen mainScreen].scale);
    if ([target isKindOfClass:[UIView class]]) {
        UIView *view = (UIView*)target;
        [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    }else if ([target isKindOfClass:[UIViewController class]]){
        UIViewController *viewController = (UIViewController*)target;
        [viewController.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    }else{
        NSAssert([target isKindOfClass:[UIView class]] || [target isKindOfClass:[UIViewController class]], @"数据源有问题，请检查并更新!");
    }
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    if (isSave) {
        NSString * filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"DocumentPath"];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        [fileManager createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:nil];
        [fileManager createFileAtPath:[filePath stringByAppendingPathComponent:[NSString stringWithFormat:@"/%@.png",(name && ![name isEqualToString:@""])?name:@"image"]] contents:UIImagePNGRepresentation(image) attributes:nil];
        NSLog(@"====>>%@ Path:%@%@",(name && ![name isEqualToString:@""])?name:@"image", filePath,[NSString stringWithFormat:@"/%@.png",(name && ![name isEqualToString:@""])?name:@"image"]);
    }
    
    return image;
}

- (NSData *)dataWithScreenshotInPNGFormat
{
    CGSize imageSize = CGSizeZero;
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    if (UIInterfaceOrientationIsPortrait(orientation)) imageSize = [UIScreen mainScreen].bounds.size;
    else imageSize = CGSizeMake([UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width);
    
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    for (UIWindow *window in [[UIApplication sharedApplication] windows]) {
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, window.center.x, window.center.y);
        CGContextConcatCTM(context, window.transform);
        CGContextTranslateCTM(context, -window.bounds.size.width * window.layer.anchorPoint.x, -window.bounds.size.height * window.layer.anchorPoint.y);
        if (orientation == UIInterfaceOrientationLandscapeLeft) {
            CGContextRotateCTM(context, M_PI_2);
            CGContextTranslateCTM(context, 0, -imageSize.width);
        } else if (orientation == UIInterfaceOrientationLandscapeRight) {
            CGContextRotateCTM(context, -M_PI_2);
            CGContextTranslateCTM(context, -imageSize.height, 0);
        } else if (orientation == UIInterfaceOrientationPortraitUpsideDown) {
            CGContextRotateCTM(context, M_PI);
            CGContextTranslateCTM(context, -imageSize.width, -imageSize.height);
        }
        if ([window respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
            [window drawViewHierarchyInRect:window.bounds afterScreenUpdates:YES];
        } else {
            [window.layer renderInContext:context];
        }
        CGContextRestoreGState(context);
    }
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return UIImagePNGRepresentation(image);
}

- (UIImage *)imageWithScreenshot
{
    NSData *imageData = [self dataWithScreenshotInPNGFormat];
    return [UIImage imageWithData:imageData];
}

@end
