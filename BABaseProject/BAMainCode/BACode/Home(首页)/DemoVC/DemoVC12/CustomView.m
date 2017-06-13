//
//  CustomView.m
//  BAAlert
//
//  Created by boai on 2017/5/12.
//  Copyright © 2017年 boai. All rights reserved.
//

#import "CustomView.h"
#import "BAAlert_OC.h"

@interface CustomView ()

@property (nonatomic, strong) UIView        *viewPwdBgView;
@property (nonatomic, strong) UILabel       *titleLabel;
@property (nonatomic, strong) UIView        *lineView1;
@property (nonatomic, strong) UITextField   *pwdTextField;
@property (nonatomic, strong) UIView        *lineView2;
@property (nonatomic, strong) UIButton      *cancleButton;
@property (nonatomic, strong) UIButton      *sureButton;

@property(nonatomic, strong) BAAlert *alert;

@end

@implementation CustomView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    self.viewPwdBgView.backgroundColor = [UIColor whiteColor];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.viewPwdBgView.frame = self.bounds;

    CGFloat min_x = 0;
    CGFloat min_y = 0;
    CGFloat min_w = 0;
    CGFloat min_h = 0;
    CGFloat button_h = 40;
    CGFloat view_w = CGRectGetWidth(self.viewPwdBgView.frame);
    
    min_w = view_w;
    min_h = button_h;
    self.titleLabel.frame = CGRectMake(min_x, min_y,  min_w, min_h);

    min_y = CGRectGetMaxY(self.titleLabel.frame);
    min_h = 1;
    self.lineView1.frame = CGRectMake(min_x, min_y,  min_w, min_h);
    
    min_x = 50;
    min_y = CGRectGetMaxY(self.lineView1.frame) + 20;
    min_w = view_w - 50 * 2;
    min_h = button_h;
    self.pwdTextField.frame = CGRectMake(min_x, min_y,  min_w, min_h);

    min_x = 0;
    min_y = CGRectGetMaxY(self.pwdTextField.frame) + 20;
    min_w = view_w;
    min_h = 1;
    self.lineView2.frame = CGRectMake(min_x, min_y,  min_w, min_h);
    
    min_y = CGRectGetMaxY(self.lineView2.frame);
    min_w = view_w/2;
    min_h = button_h;
    self.cancleButton.frame = CGRectMake(min_x, min_y,  min_w, min_h);

    min_x = CGRectGetMaxX(self.cancleButton.frame);
    self.sureButton.frame = CGRectMake(min_x, min_y,  min_w, min_h);
}

#pragma mark - custom method

- (void)handleButtonAction:(UIButton *)sender
{
    [_pwdTextField resignFirstResponder];
    
    if (self.block)
    {
        self.block(sender.tag);
    }
    if (sender.tag == 1)
    {
        NSLog(@"点击了取消按钮！");
    }
    else
    {
        if (_pwdTextField.text.length < 4 || _pwdTextField.text.length > 8 )
        {
            self.pwdTextField.text = @"";
            BAKit_WeakSelf
            [BAAlert ba_alertShowWithTitle:@"温馨提示：" message:@"请输入正确的密码！" image:nil buttonTitleArray:@[@"确定"] buttonTitleColorArray:@[[UIColor redColor], [UIColor cyanColor]] configuration:^(BAAlert *tempView) {
                BAKit_StrongSelf
                self.alert = tempView;
            } actionBlock:^(NSInteger index) {
                
                [self.alert ba_alertHidden];
            }];
        }
    }
}

- (void)dealloc
{
    [self removeFromSuperview];
}

#pragma mark - setter / getter

- (UIView *)viewPwdBgView
{
    if (!_viewPwdBgView)
    {
        _viewPwdBgView                         = [UIView new];
        
        _viewPwdBgView.layer.masksToBounds     = YES;
        _viewPwdBgView.layer.cornerRadius      = 10.0f;

        [self addSubview:self.viewPwdBgView];
    }
    return _viewPwdBgView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel                    = [UILabel new];
        _titleLabel.textAlignment               = NSTextAlignmentCenter;
        _titleLabel.font                        = [UIFont systemFontOfSize:18];
        _titleLabel.text                        = @"请补全好友姓名，确保信息安全";
        
        [self.viewPwdBgView addSubview:self.titleLabel];
    }
    return _titleLabel;
}

- (UIView *)lineView1
{
    if (!_lineView1)
    {
        _lineView1 = [UIView new];
        _lineView1.backgroundColor = [UIColor lightGrayColor];
        
        [self.viewPwdBgView addSubview:self.lineView1];
    }
    return _lineView1;
}

- (UITextField *)pwdTextField
{
    if (!_pwdTextField)
    {
        _pwdTextField                          = [UITextField new];
        _pwdTextField.borderStyle              = UITextBorderStyleRoundedRect;
        _pwdTextField.textAlignment            = NSTextAlignmentCenter;
        _pwdTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        
        [self.viewPwdBgView addSubview:self.pwdTextField];
    }
    return _pwdTextField;
}

- (UIView *)lineView2
{
    if (!_lineView2)
    {
        _lineView2 = [UIView new];
        _lineView2.backgroundColor = [UIColor lightGrayColor];
        
        [self.viewPwdBgView addSubview:self.lineView2];
    }
    return _lineView2;
}

- (UIButton *)cancleButton
{
    if (!_cancleButton)
    {
        _cancleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancleButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_cancleButton addTarget:self action:@selector(handleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        _cancleButton.backgroundColor = [UIColor greenColor];
        _cancleButton.tag = 1;
        
        [self.viewPwdBgView addSubview:self.cancleButton];
    }
    return _cancleButton;
}

- (UIButton *)sureButton
{
    if (!_sureButton)
    {
        _sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sureButton setTitle:@"确定" forState:UIControlStateNormal];
        [_sureButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_sureButton addTarget:self action:@selector(handleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        _sureButton.backgroundColor = [UIColor redColor];
        _sureButton.tag = 2;
        
        [self.viewPwdBgView addSubview:self.sureButton];
    }
    return _sureButton;
}


@end
