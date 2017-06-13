//
//  DemoVC5Cell.m
//  BABaseProject
//
//  Created by 博爱 on 16/5/9.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC5Cell.h"

@implementation DemoVC5Cell

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
    _textField.returnKeyType = UIReturnKeyDone;
    _textField.clearsOnBeginEditing = YES;
    _textField.adjustsFontSizeToFitWidth = YES;
    _textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    //设置对齐方式
    _textField.borderStyle = UITextBorderStyleRoundedRect;

    [self.contentView ba_AddSubViewsWithArray:@[_titleLabel, _textField]];
    
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

@end

@implementation DemoVC5Cell2

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
    UILabel *labelS = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, BA_SCREEN_WIDTH, 20)];
    labelS.backgroundColor = [UIColor clearColor];

    //输入框
    _normalTextView = [[UITextView alloc]initWithFrame:CGRectMake(20, 20, BA_SCREEN_WIDTH - 40, 80)];
    _normalTextView.layer.cornerRadius = 5;
    _normalTextView.font = BA_FontSize(14);
    _normalTextView.textColor = BAKit_Color_Black;
    _normalTextView.returnKeyType = UIReturnKeyDone;
    _normalTextView.keyboardType = UIKeyboardTypeDefault;
    _normalTextView.autocorrectionType = UITextAutocorrectionTypeYes; //开启自动纠错
    _normalTextView.editable = YES;
    _normalTextView.scrollEnabled = YES;
    _normalTextView.showsHorizontalScrollIndicator = NO;
    _normalTextView.showsVerticalScrollIndicator = NO;
    
    _hightlightTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.normalTextView.frame)+10, CGRectGetMaxY(self.normalTextView.frame)+10,CGRectGetWidth(self.normalTextView.frame)-20, 32)];
    _hightlightTextField.borderStyle = UITextBorderStyleRoundedRect;
    _hightlightTextField.backgroundColor = BAKit_Color_White;
    _hightlightTextField.textAlignment = NSTextAlignmentLeft;
    _hightlightTextField.placeholder = @"请输入高亮显示的字符串";
    _hightlightTextField.font = BA_FontSize(14);
    _hightlightTextField.textColor = BAKit_Color_Black;
    _hightlightTextField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    _hightlightTextField.returnKeyType = UIReturnKeyNext;
    _hightlightTextField.clearsOnBeginEditing = YES;
    _hightlightTextField.adjustsFontSizeToFitWidth = YES;
    _hightlightTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//设置对齐方式
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(_normalTextView.frame), CGRectGetMaxY(_hightlightTextField.frame)+10,50, 30)];
    label.text = @"结果:";
    label.textAlignment = NSTextAlignmentCenter;
    label.font = BA_FontSize(14);
    
    _resultLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(label.frame), CGRectGetMaxY(label.frame)+5, CGRectGetWidth(_normalTextView.frame), 80)];
    _resultLabel.layer.borderWidth = 1;
    _resultLabel.layer.borderColor = BAKit_Color_Black.CGColor;
    _resultLabel.layer.cornerRadius = 5;
    _resultLabel.layer.masksToBounds = YES;
    _resultLabel.adjustsFontSizeToFitWidth = YES;
    _resultLabel.backgroundColor = [UIColor whiteColor];
    _resultLabel.numberOfLines = 0;
    _resultLabel.textAlignment = NSTextAlignmentLeft;
    _resultLabel.font = BA_FontSize(14);
    
    [self.contentView ba_AddSubViewsWithArray:@[labelS, _normalTextView, _hightlightTextField, label, _resultLabel]];
        
}

+ (instancetype)DemoVC5Cell2WithTableView:(UITableView *)tableView
{
    static NSString *cellID = @"DemoVC5Cell2";
    id cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil)
    {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    
    return cell;
}

@end


