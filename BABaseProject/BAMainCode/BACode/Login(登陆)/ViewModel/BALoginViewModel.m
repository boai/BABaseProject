//
//  BALoginViewModel.m
//  BABaseProject
//
//  Created by boai on 2017/3/15.
//  Copyright © 2017年 博爱之家. All rights reserved.
//

#import "BALoginViewModel.h"
#import "BAUserSqlite.h"

@interface BALoginViewModel ()

@property (nonatomic, strong) RACSignal *user_name_signal;
@property (nonatomic, strong) RACSignal *user_pwd_signal;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation BALoginViewModel

- (instancetype)init
{
    if (self = [super init])
    {
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    _user_name_signal = RACObserve(self, user_name);
    _user_pwd_signal = RACObserve(self, user_pwd);
    _successObject = [RACSubject subject];
    _failureObject = [RACSubject subject];
    _errorObject = [RACSubject subject];
    
}

- (id)loginButtonIsValid
{
    RACSignal *isValid = [RACSignal combineLatest:@[_user_name_signal, _user_pwd_signal] reduce:^id(NSString *user_name, NSString *user_pwd){
        return @(user_name.length >= 6 && user_pwd.length >= 6);
    }];
    return isValid;
}

- (void)login
{
    /*! 网络请求进行登录 */
    _dataArray = @[_user_name, _user_pwd];
    
    /*! 业务逻辑失败和网络请求失败发送fail或者error信号并传参 */
    
    
    if ([BACommon ba_isNSStringNULL:_user_name] || [BACommon ba_isNSStringNULL:_user_pwd])
    {
        [self BA_showAlertWithTitle:@"手机号码或密码不能为空！"];
        return;
    }

    NSString *db_phone = [NSString stringWithFormat:@" WHERE phone = %@ ", _user_name];

    BAUserSqlite *userSqlite = [BAUserSqlite findFirstByCriteria:db_phone];

    if (userSqlite.phone)
    {
        if ([_user_pwd isEqualToString:userSqlite.pwd])
        {
            /*! 成功发送成功的信号 */
            [_successObject sendNext:_dataArray];
        }
        else
        {
            [_failureObject sendNext:_dataArray];
        }
    }
    else
    {
        [_errorObject sendNext:_dataArray];
    }
}

@end
