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
