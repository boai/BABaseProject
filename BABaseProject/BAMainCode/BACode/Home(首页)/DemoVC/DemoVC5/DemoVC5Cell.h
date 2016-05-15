//
//  DemoVC5Cell.h
//  BABaseProject
//
//  Created by 博爱 on 16/5/9.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface DemoVC5Cell : UITableViewCell

/*! placeHolder */
@property (nonatomic, strong) NSString     *placeHolder;
@property (nonatomic, strong) UILabel      *titleLabel;
@property (nonatomic, strong) UITextField  *textField;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end

@interface DemoVC5Cell2 : UITableViewCell

/*!
 *  输入正常的字符串
 */
@property (nonatomic,strong) UITextView          *normalTextView;

/*!
 *  输入需要高亮显示的文字
 */
@property (nonatomic,strong) UITextField         *hightlightTextField;

/*!
 *  显示高亮显示的结果
 */
@property (nonatomic,strong) UILabel             *resultLabel;

@property (nonatomic,copy  ) NSString            *normalStr;

@property (nonatomic,strong) NSAttributedString  *attributeStr;



+ (instancetype)DemoVC5Cell2WithTableView:(UITableView *)tableView;

@end
