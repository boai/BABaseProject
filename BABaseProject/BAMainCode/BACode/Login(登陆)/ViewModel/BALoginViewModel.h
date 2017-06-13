//
//  BALoginViewModel.h
//  BABaseProject
//
//  Created by boai on 2017/3/15.
//  Copyright © 2017年 博爱之家. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BALoginViewModel : NSObject

@property (nonatomic, strong) NSString *user_name;
@property (nonatomic, strong) NSString *user_pwd;

@property (nonatomic, strong) RACSubject *successObject;
@property (nonatomic, strong) RACSubject *failureObject;
@property (nonatomic, strong) RACSubject *errorObject;

- (id)loginButtonIsValid;
- (void)login;

@end
