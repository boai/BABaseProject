//
//  DemoVC7.m
//  BABaseProject
//
//  Created by 博爱 on 16/5/25.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC7.h"
#import "BAWebViewController.h"

@interface DemoVC7 ()

@property (nonatomic, strong) UITextField * textView;

@property (nonatomic, strong) UIButton * submitBtn;

@end

@implementation DemoVC7

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.textView.hidden = NO;
    self.submitBtn.hidden = NO;

}

- (UITextField *)textView
{
    if(!_textView)
    {
        _textView = ({
            UITextField * textField = [[UITextField alloc]initWithFrame:CGRectMake(10, 100, BA_SCREEN_WIDTH - 20, 40)];
            textField.placeholder = @"请输入网址";
            textField.borderStyle = UITextBorderStyleRoundedRect;
            textField.clearButtonMode = UITextFieldViewModeAlways;
            textField.keyboardType = UIKeyboardTypeURL;
//            textField.layer.borderColor = [UIColor colorWithWhite:0.797 alpha:1.000].CGColor;
//            textField.layer.borderWidth = 0.5f;
            textField;
        });
        [self.view addSubview:_textView];
    }
    return _textView;
}


- (UIButton *)submitBtn
{
    if (!_submitBtn)
    {
        _submitBtn = ({
            UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(BA_SCREEN_WIDTH/2 -75, CGRectGetMaxY(self.textView.frame)+50, 150, 44)];
//            btn.backgroundColor = [UIColor colorWithRed:0.226 green:0.780 blue:1.000 alpha:1.000];
            [btn setTitle:@"确 定" forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
            [btn jm_setCornerRadius:5 withBackgroundColor:BA_Orange_Color];
            btn;
        });
        [self.view addSubview:_submitBtn];
    }
    return _submitBtn;
}

- (IBAction)btnAction:(UIButton *)btn
{
    NSString * url = self.textView.text;
    if(!url.length) url = @"http://m.jd.com/";
    
    if (![url hasPrefix:@"http://"])
    {
        url = [NSString stringWithFormat:@"http://%@",url];
    }
    else if ([BARegularExpression ba_isUrl:url])
    {
        url = url;
    }
    else
    {
        [self.view ba_showAlertView:@"温馨提示：" message:@"不能识别的URL！"];
        return;
    }
    
    BAWebViewController * web = [[BAWebViewController alloc]init];
    web.urlString = url;
    web.title = @"博爱浏览器";
    [self.navigationController pushViewController:web animated:YES];
}


@end
