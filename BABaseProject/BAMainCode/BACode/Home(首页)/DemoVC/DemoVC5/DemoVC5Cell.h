//
//  DemoVC5Cell.h
//  BABaseProject
//
//  Created by 博爱 on 16/5/9.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    BARegularExpressionTypePhone,
    BARegularExpressionTypeEmail,
    BARegularExpressionTypeUrl,
    BARegularExpressionTypeAllNumber,
    BARegularExpressionTypeIDCardVc,
    BARegularExpressionTypeEnglishAlphabetVc,
    BARegularExpressionTypeuserPsswordVc,
    BARegularExpressionTypeIPAddress,
    BARegularExpressionTypeChinese,
}BARegularExpressionType;

@interface DemoVC5Cell : UITableViewCell<UITextFieldDelegate>

/*! placeHolder */
@property (nonatomic, strong) NSString *placeHolder;
@property (nonatomic, strong) UILabel  *titleLabel;


+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
