//
//  BARegistViewController.m
//  test
//
//  Created by 博爱 on 2016/11/25.
//  Copyright © 2016年 博爱. All rights reserved.
//

#import "BARegistViewController.h"
#import "BAUserSqlite.h"

@interface BARegistViewController ()

@property (weak, nonatomic) IBOutlet BATextField *phoneNumTextField;
@property (weak, nonatomic) IBOutlet BATextField *nickNameTextField;
@property (weak, nonatomic) IBOutlet BATextField *pwd1TextField;
@property (weak, nonatomic) IBOutlet BATextField *pwd2TextField;
@property (weak, nonatomic) IBOutlet UIButton    *registButton;

- (IBAction)registButtonAction:(UIButton *)sender;

@end

@implementation BARegistViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI
{
    self.title = @"注  册";
    
//    _phoneNumTextField.phoneRestrict = YES;
//    _phoneNumTextField.textfieldStyle = BATextfieldStylePhone;
    // 0337 6711 76
}

- (IBAction)registButtonAction:(UIButton *)sender
{
    if (![BAKit_RegularExpression ba_regularIsMobileNumber:_phoneNumTextField.text])
    {
        [self.view BA_showAlertWithTitle:@"请输入合法的手机号码！"];
        return;
    }
    if ([BACommon ba_isNSStringNULL:_nickNameTextField.text])
    {
        [self.view BA_showAlertWithTitle:@"昵称不能为空！"];
        return;
    }
    if (![BAKit_RegularExpression ba_regularIsPasswordQualified:_pwd1TextField.text])
    {
        [self.view BA_showAlertWithTitle:@"密码必须为6-8位的字母数字混合！"];
        return;
    }
    if (![_pwd1TextField.text isEqualToString:_pwd2TextField.text])
    {
        [self.view BA_showAlertWithTitle:@"两次密码输入不一致！"];
        return;
    }
    
    BAUserSqlite *userSqlite = [BAUserSqlite new];
    userSqlite.phone         = _phoneNumTextField.text;
    userSqlite.nickName      = _nickNameTextField.text;
    userSqlite.pwd           = _pwd1TextField.text;
    
    BAWeak;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [userSqlite save];
        [weakSelf.view BA_showAlertWithTitle:@"注册成功！"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.navigationController popViewControllerAnimated:YES];
            });
        });
    });
}
@end
