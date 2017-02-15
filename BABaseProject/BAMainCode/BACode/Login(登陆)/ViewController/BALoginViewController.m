//
//  BALoginViewController.m
//  test
//
//  Created by 博爱 on 2016/11/25.
//  Copyright © 2016年 博爱. All rights reserved.
//

#import "BALoginViewController.h"
#import "BAUserSqlite.h"
#import "BARegistViewController.h"
#import "BAProfileViewController.h"

#import "BAUserModel.h"


@interface BALoginViewController ()
@property (weak, nonatomic) IBOutlet BATextField *phoneNumTextField;
@property (weak, nonatomic) IBOutlet BATextField *pwdTextField;
@property (weak, nonatomic) IBOutlet UIButton    *loginButton;


- (IBAction)loginButtonAction:(UIButton *)sender;
- (IBAction)registButtonAction:(UIButton *)sender;

@end

@implementation BALoginViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI
{
    self.title = @"登  录";

    _phoneNumTextField.phoneRestrict = YES;
    _phoneNumTextField.textfieldStyle = BATextfieldStylePhone;
    
    NSString *dbPath = [JKDBHelper dbPath];
    NSLog(@"数据库路径：%@", dbPath);
}

- (IBAction)loginButtonAction:(UIButton *)sender
{
    if ([BACommon ba_isNSStringNULL:_phoneNumTextField.text] || [BACommon ba_isNSStringNULL:_pwdTextField.text])
    {
        [self.view BA_showAlertWithTitle:@"手机号码或密码不能为空！"];
        return;
    }
    
    NSString *db_phone = [NSString stringWithFormat:@" WHERE phone = %@ ", _phoneNumTextField.text];

    BAUserSqlite *userSqlite = [BAUserSqlite findFirstByCriteria:db_phone];
    
    if (userSqlite.phone)
    {
        if ([_pwdTextField.text isEqualToString:userSqlite.pwd])
        {
            /*! 登陆成功后，将数据库获取信息赋值给 BAUserModel，并发送通知 */
            BAUserModel *model = [BAUserModel new];
            model.phone        = userSqlite.phone;
            model.nickName     = userSqlite.nickName;
            model.pwd          = userSqlite.pwd;
            model.isLogin      = YES;

            [self.view BA_showAlertWithTitle:@"登陆成功！"];
            NSDictionary *dict =[[NSDictionary alloc] initWithObjectsAndKeys:@"1",@"isLogin", nil];
            
            NSNotification *notification = [NSNotification notificationWithName:BANotioKey_LoginFinish object:nil userInfo:dict];
            
            [BA_NotiCenter postNotification:notification];
            [self.navigationController popViewControllerAnimated:YES];
        }
        else
        {
            [self.view BA_showAlertWithTitle:@"密码错误！，请重新登陆！"];
        }
    }
    else
    {
        _phoneNumTextField.text = nil;
        _pwdTextField.text      = nil;

        [self.view BA_showAlertWithTitle:@"账号不存在，请注册！"];
        [self.navigationController pushViewController:[BARegistViewController new] animated:YES];
    }
}

- (IBAction)registButtonAction:(UIButton *)sender
{
    [self.navigationController pushViewController:[BARegistViewController new] animated:YES];
}

- (void)dealloc
{
    /*! 移除监听 */
//    [self.phoneNumTextField removeObserver:self forKeyPath:@"text"];
    
}

@end
