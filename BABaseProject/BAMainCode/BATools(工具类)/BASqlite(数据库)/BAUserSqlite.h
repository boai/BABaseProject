//
//  BAUserSqlite.h
//  BABaseProject
//
//  Created by 博爱 on 2016/11/28.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "JKDBModel.h"

@interface BAUserSqlite : JKDBModel

/*！电话号码 */
@property (nonatomic, copy  ) NSString  *phone;

/*！昵称 */
@property (nonatomic, copy  ) NSString  *nickName;

/*！密码 */
@property (nonatomic, copy  ) NSString  *pwd;

/*！用户识别码：唯一【登录后才有】 */
@property (nonatomic, copy  ) NSString  *userCode;


@end
