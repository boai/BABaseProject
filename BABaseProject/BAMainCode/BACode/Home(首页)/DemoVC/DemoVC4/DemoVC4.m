//
//  DemoVC4.m
//  BABaseProject
//
//  Created by 博爱 on 16/5/7.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC4.h"

/*! 友盟分享 */
#import "UMSocial.h"

@interface DemoVC4 ()<BAShareManageDelegate>

@property (nonatomic, strong) BACustomButton *shareBtn;
@property (nonatomic, strong) BACustomButton *QQLoginBtn;

@end

@implementation DemoVC4

- (BACustomButton *)shareBtn
{
    if (!_shareBtn)
    {
        _shareBtn = [BACustomButton BA_ShareButton];
        _shareBtn.frame = CGRectMake(50, 100, 100, 40);
        [_shareBtn setTitle:@"分享" forState:UIControlStateNormal];
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

- (BACustomButton *)QQLoginBtn
{
    if (!_QQLoginBtn)
    {
        _QQLoginBtn = [BACustomButton BA_ShareButton];
        _QQLoginBtn.frame = CGRectMake(50, _shareBtn.bottom + 50, 100, 40);
        [_QQLoginBtn setTitle:@"QQ登陆" forState:UIControlStateNormal];
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
    /*! 友盟分享 */
    if (sender.tag == 1001)
    {
        
        BAShareManage *shareManage = [BAShareManage ba_shareManage];
        NSString *shareTitle = @"博爱分享 2.0 版";
        NSString *shareUrlSrt = @"http://boai.github.io";
        NSString *shareContent = [NSString stringWithFormat:@"测试（博爱BABaseProject）分享【博爱之家】！详情点击：%@", shareUrlSrt];
        /*! 注意：图片不能为空 */
//        UIImage *shareImage = [UIImage imageNamed:@"icon1.jpg"];
        /*! 截图分享：先截图，再分享 */
        UIImage *shareImage = [self imageWithScreenshot];
        shareManage.shareManageType = BAShareManageTypeImage;
        [shareManage ba_UMshareListWithViewControll:self title:shareTitle shareContent:shareContent image:shareImage url:shareUrlSrt];
    }
    /*! 友盟登陆 */
    if (sender.tag == 1002)
    {
        BAShareManage *manger = [BAShareManage ba_shareManage];
        manger.delegate = self;
        [manger ba_UMLoginListWithViewControll:self];
    }
}

#pragma mark 友盟登陆BAShareManageDelegate
- (void)getUserData:(NSDictionary *)backUserData
{
    [self BA_showAlert:@"登录成功！"];
    [self.view ba_showAlertView:@"温馨提示：" message:[NSString stringWithFormat:@"友盟登陆成功，返回信息: %@", backUserData]];
    BALog(@"友盟登陆成功，返回信息: %@", backUserData);
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
