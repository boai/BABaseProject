//
//  DemoVC2_05_test.m
//  BABaseProject
//
//  Created by 博爱 on 2016/10/31.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC2_05_test.h"

@interface DemoVC2_05_test ()

@end

@implementation DemoVC2_05_test

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    self.view.backgroundColor = [UIColor yellowColor];
    [self test];
}

- (void)test
{
    NSArray *placeHolderArray = @[@"手机号码验证（不超过11位）：",
                                  @"纯数字验证：",
                                  @"限制输入5位数验证：",
                                  @"带小数点的数字限制(默认只能输入小数位后2位)："
                                  ];
    
    [placeHolderArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        BATextField *textField = [[BATextField alloc] init];
        textField.frame        = CGRectMake(20, 80 + idx * 70, BA_SCREEN_WIDTH - 80, 50);
        textField.placeholder  = placeHolderArray[idx];
        textField.borderStyle  = UITextBorderStyleRoundedRect;
        [self.view addSubview:textField];
        
        if (idx == 0)
        {
            textField.phoneRestrict    = YES;
        }
        else if (idx == 1)
        {
            textField.numberRestrict   = YES;
        }
        else if (idx == 2)
        {
            textField.lengthRestrict   = 5;
        }
        else if (idx == 3)
        {
            textField.decimalsRestrict = YES;
        }
    }];
    
}


@end
