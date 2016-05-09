//
//  DemoVC5Cell.m
//  BABaseProject
//
//  Created by 博爱 on 16/5/9.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC5Cell.h"

@implementation DemoVC5Cell
{
    UITextField  *_textField;
}

// 注意：cell是用initWithStyle初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        // 添加所有子控件
        [self setUpAllChildView];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

// 添加所有子控件
- (void)setUpAllChildView
{
    _titleLabel                 = [UILabel new];
    _titleLabel.font            = [UIFont boldSystemFontOfSize:15];
//    _titleLabel.textAlignment = 
    
    _textField                  = [UITextField new];
    _textField.font          = BA_FontSize(14);
//    _textField.placeholder = self.placeHolder;
    _textField.placeholder = @"请输入字符串";
    _textField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    _textField.returnKeyType = UIReturnKeyNext;
    _textField.clearsOnBeginEditing = YES;
    _textField.adjustsFontSizeToFitWidth = YES;
    _textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//设置对齐方式
    _textField.delegate = self;
    _textField.borderStyle = UITextBorderStyleRoundedRect;

    [self.contentView BA_AddSubViewsWithArray:@[_titleLabel, _textField]];
    
    _titleLabel.sd_layout
    .topSpaceToView(self.contentView, 0)
    .leftSpaceToView(self.contentView, 20)
    .widthIs(100)
    .heightIs(44);
    
    _textField.sd_layout
    .topSpaceToView(self.contentView, 5)
    .leftSpaceToView(_titleLabel, 10)
    .rightSpaceToView(self.contentView, 20)
    .heightIs(34);
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *cellID = @"DemoVC5Cell";
    id cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil)
    {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    
    return cell;
}

#pragma mark --UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //收起键盘
    [_textField resignFirstResponder];
    NSString *inputText = textField.text;
    [self judgeTextFieldResultType:inputText];
    
    return YES;
}


@end
