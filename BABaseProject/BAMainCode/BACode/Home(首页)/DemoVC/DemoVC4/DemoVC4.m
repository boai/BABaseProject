//
//  DemoVC4.m
//  BABaseProject
//
//  Created by 博爱 on 16/5/7.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC4.h"

// 友盟分享
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
        [_shareBtn setTitleColor:BA_NaviBgBlueColor forState:UIControlStateNormal];
        _shareBtn.titleLabel.font = BA_FontSize(16);
        _shareBtn.tag = 2;
        [_shareBtn addTarget:self action:@selector(clickshareBtn:) forControlEvents:UIControlEventTouchUpInside];
        _shareBtn.titleLabel.textAlignment = NSTextAlignmentRight;
        _shareBtn.backgroundColor = BA_Green_Color;
        
        [self.view addSubview:_shareBtn];
    }
    return _shareBtn;
}

- (BACustomButton *)QQLoginBtn
{
    if (!_QQLoginBtn)
    {
        _QQLoginBtn = [BACustomButton BA_ShareButton];
        _QQLoginBtn.frame = CGRectMake(50, CGRectGetMaxY(_shareBtn.frame) + 50, 100, 40);
        [_QQLoginBtn setTitle:@"QQ登陆" forState:UIControlStateNormal];
        [_QQLoginBtn setTitleColor:BA_NaviBgBlueColor forState:UIControlStateNormal];
        _QQLoginBtn.titleLabel.font = BA_FontSize(16);
        _QQLoginBtn.tag = 2;
        [_QQLoginBtn addTarget:self action:@selector(clickQQLoginBtn:) forControlEvents:UIControlEventTouchUpInside];
        _QQLoginBtn.titleLabel.textAlignment = NSTextAlignmentRight;
        _QQLoginBtn.backgroundColor = BA_Green_Color;

        [self.view addSubview:_QQLoginBtn];
    }
    return _QQLoginBtn;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = BA_White_Color;
    self.shareBtn.hidden = NO;
    self.QQLoginBtn.hidden = NO;
}

#pragma mark 友盟分享
- (IBAction)clickshareBtn:(UIButton *)sender
{
    NSString *shareText = @"测试（博爱demo）分享【博爱之家】！";
    // 注意：图片不能为空
    UIImage *shareImage = [UIImage imageNamed:@"樱花瓣2"];
    NSString *urlSrt = @"http://www.cnblogs.com/boai/";
    
    [[BAShareManage shareManage] BA_UMshareListWithViewControll:self withShareText:shareText image:shareImage url:urlSrt];
}

#pragma mark 友盟登陆
- (IBAction)clickQQLoginBtn:(UIButton *)sender
{
    BAShareManage *manger = [BAShareManage shareManage];
    manger.delegate = self;
    [manger BA_UMLoginListWithViewControll:self];
}

- (void)getUserData:(NSDictionary *)backUserData
{
    BALog(@"友盟登陆: %@", backUserData);
}

@end
