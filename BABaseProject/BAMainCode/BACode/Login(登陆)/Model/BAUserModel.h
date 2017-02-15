//
//  BAUserModel.h
//  test
//
//  Created by 博爱 on 2016/11/25.
//  Copyright © 2016年 博爱. All rights reserved.
//

#import "BABaseModel.h"

#define BAUSERSHARE [BAUserModel sharedBAUserModel]

@interface BAUserModel : BABaseModel

/*！电话号码 */
@property (nonatomic, copy  ) NSString  *phone;

/*！昵称 */
@property (nonatomic, copy  ) NSString  *nickName;

/*！密码 */
@property (nonatomic, copy  ) NSString  *pwd;

/*！用户识别码：唯一【登录后才有】 */
@property (nonatomic, copy  ) NSString  *userCode;

@property (nonatomic, assign) BOOL       isLogin;


+ (BAUserModel *)sharedBAUserModel;


@end
