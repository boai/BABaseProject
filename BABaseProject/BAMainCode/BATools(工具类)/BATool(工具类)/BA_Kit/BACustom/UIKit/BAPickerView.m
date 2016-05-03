
/*!
 *  @header BAKit
 *          demoTest
 *
 *  @brief  BAKit
 *
 *  @author 博爱
 *  @copyright    Copyright © 2016年 博爱. All rights reserved.
 *  @version    V1.0
 */

/*!
 *
 *          ┌─┐       ┌─┐
 *       ┌──┘ ┴───────┘ ┴──┐
 *       │                 │
 *       │       ───       │
 *       │  ─┬┘       └┬─  │
 *       │                 │
 *       │       ─┴─       │
 *       │                 │
 *       └───┐         ┌───┘
 *           │         │
 *           │         │
 *           │         │
 *           │         └──────────────┐
 *           │                        │
 *           │                        ├─┐
 *           │                        ┌─┘
 *           │                        │
 *           └─┐  ┐  ┌───────┬──┐  ┌──┘
 *             │ ─┤ ─┤       │ ─┤ ─┤
 *             └──┴──┘       └──┴──┘
 *                 神兽保佑
 *                 代码无BUG!
 */

/*
 
 *********************************************************************************
 *
 * 在使用BAKit的过程中如果出现bug请及时以以下任意一种方式联系我，我会及时修复bug
 *
 * QQ     : 可以添加SDAutoLayout群 497140713 在这里找到我(博爱1616【137361770】)
 * 微博    : 博爱1616
 * Email  : 137361770@qq.com
 * GitHub : https://github.com/boai
 * 博客园  : http://www.cnblogs.com/boai/
 *********************************************************************************
 
 */

#import "BAPickerView.h"

@interface BAPickerView ()
<
    UIPickerViewDataSource,
    UIPickerViewDelegate
>

@property (nonatomic, copy) NSMutableArray *provinces;//省
@property (nonatomic, copy) NSMutableArray *cityArray;//市
@property (nonatomic, copy) NSMutableArray *areaArray;//县

@property (nonatomic, copy) NSMutableArray *selectedArray;

@property (nonatomic, strong) UIPickerView *pickerView;

@property (nonatomic, strong) UIView *chooseCityView;

@end

@implementation BAPickerView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = BA_BGClearColor;
        
        UIView *bgView = [UIView new];
        bgView.frame = CGRectMake(30, (BA_SCREEN_HEIGHT - 300)/2, BA_SCREEN_WIDTH - 60, BA_SCREEN_HEIGHT/3);
        bgView.backgroundColor = BA_White_Color;
        [self addSubview:bgView];
        
        CGRect pickerViewFrame = CGRectMake(0, 0, bgView.frame.size.width, bgView.frame.size.height - 40);
        self.pickerView = [[UIPickerView alloc]initWithFrame:pickerViewFrame];
        self.pickerView.dataSource = self;
        self.pickerView.delegate = self;
        self.pickerView.backgroundColor = [UIColor whiteColor];
        [bgView addSubview:_pickerView];
        
        UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        cancelButton.frame = CGRectMake((bgView.frame.size.width - 200)/3, CGRectGetMaxY(self.pickerView.frame), 100, 35);
        [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [cancelButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [cancelButton addTarget:self action:@selector(removeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:cancelButton];
        
        UIButton *chooseButton = [UIButton buttonWithType:UIButtonTypeCustom];
        chooseButton.frame = CGRectMake(CGRectGetMaxX(cancelButton.frame)+(bgView.frame.size.width - 200)/3, CGRectGetMaxY(self.pickerView.frame), 100, 35);
        [chooseButton setTitle:@"确定" forState:UIControlStateNormal];
        [chooseButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [chooseButton addTarget:self action:@selector(sureBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:chooseButton];
        
        bgView.layer.cornerRadius = 5;
        bgView.layer.borderWidth = 1;
        bgView.layer.borderColor = [[UIColor whiteColor]CGColor];
        bgView.layer.masksToBounds = YES;
        
        /** 确定 */
        chooseButton.layer.cornerRadius = 3;
        chooseButton.layer.borderWidth = 1;
        chooseButton.layer.borderColor = [[UIColor colorWithHexString:@"5AC33B" alpha:1.0f] CGColor];
        chooseButton.layer.masksToBounds = YES;
        
        /** 取消按钮 */
        cancelButton.layer.cornerRadius = 3;
        cancelButton.layer.borderWidth = 1;
        cancelButton.layer.borderColor = [[UIColor colorWithHexString:@"BAB9B9" alpha:1.0f] CGColor];
        cancelButton.layer.masksToBounds = YES;
        
        [self creatData];
    }
    return self;
}

- (void)creatData
{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"area" ofType:@"plist"];
    NSArray *provinceArray = [[NSArray alloc]initWithContentsOfFile:path];
    [provinceArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSMutableArray *temp = [NSMutableArray arrayWithArray:self.provinces];
        [temp addObject:obj[@"state"]];
        
        self.provinces = temp;
    }];
    
    NSMutableArray *citys =[NSMutableArray arrayWithArray:[provinceArray firstObject][@"cities"]];
    [citys enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSMutableArray *temp = [NSMutableArray arrayWithArray:self.cityArray];
        [temp addObject:obj[@"city"]];
        
        self.cityArray = temp;
    }];
    
    self.areaArray = [NSMutableArray arrayWithArray:[citys firstObject][@"areas"]];
    
    self.province = [self.provinces firstObject];
    self.city = [self.cityArray firstObject];
    self.area = 0 == self.areaArray.count ? @"" : [self.areaArray firstObject];
}

#pragma mark --
#pragma mark -- UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return 0 == component ? self.provinces.count : 1 == component ? self.cityArray.count : self.areaArray.count;
}

#pragma mark -- UIPickerViewDelegate
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"area" ofType:@"plist"];
    NSArray *provinceArray = [[NSArray alloc]initWithContentsOfFile:path];
    
    if (0 == component) {
        
        self.selectedArray = provinceArray[row][@"cities"];
        
        NSMutableArray *temp = [NSMutableArray arrayWithArray:self.cityArray];
        [temp removeAllObjects];
        self.cityArray = temp;
        
        [self.selectedArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            NSMutableArray *temp = [NSMutableArray arrayWithArray:self.cityArray];
            [temp addObject:obj[@"city"]];
            
            self.cityArray = temp;
        }];
        
        self.areaArray = [NSMutableArray arrayWithArray:[self.selectedArray firstObject][@"areas"]];
        [pickerView reloadComponent:1];
        [pickerView selectRow:0 inComponent:1 animated:YES];
        
        [pickerView reloadComponent:2];
        [pickerView selectRow:0 inComponent:2 animated:YES];
        
    }else if (1 == component) {
        
        if (0 == self.selectedArray.count) {
            self.selectedArray = [provinceArray firstObject][@"cities"];
        }
        
        self.areaArray = [NSMutableArray arrayWithArray:[self.selectedArray objectAtIndex:row][@"areas"]];
        [pickerView reloadComponent:2];
        [pickerView selectRow:0 inComponent:2 animated:YES];
    }
    
    NSInteger provinces = [_pickerView selectedRowInComponent:0];
    NSInteger city = [_pickerView selectedRowInComponent:1];
    NSInteger area = [_pickerView selectedRowInComponent:2];
    
    self.province = self.provinces[provinces];
    self.city = self.cityArray[city];
    self.area = 0 == self.areaArray.count ? @"" : self.areaArray[area];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return 0 == component ? self.provinces[row] : 1 == component ? self.cityArray[row] : 0 == self.areaArray.count ? nil : self.areaArray[row];
}

#pragma mark -- show and hidden
- (void)showInView:(UIView *)view {
    
    self.frame = CGRectMake(0, view.frame.size.height, self.frame.size.width, self.frame.size.height);
    [view addSubview:self];
    
    [UIView animateWithDuration:0.3f animations:^{
        
        self.frame = CGRectMake(0, view.frame.size.height - self.frame.size.height, self.frame.size.width, self.frame.size.height);
    }];
}

- (void)hiddenPickerView {
    
    // 开始动画
    //    [self animationbegin:sender];
    
    [UIView animateWithDuration:0.3f animations:^{
        
        self.frame = CGRectMake(0, self.frame.origin.y + self.frame.size.height, self.frame.size.width, self.frame.size.height);
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
    }];
}

- (void)animationbegin:(UIView *)view {
    /* 放大缩小 */
    
    // 设定为缩放
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    // 动画选项设定
    animation.duration = 0.1; // 动画持续时间
    animation.repeatCount = -1; // 重复次数
    animation.autoreverses = YES; // 动画结束时执行逆动画
    
    // 缩放倍数
    animation.fromValue = [NSNumber numberWithFloat:1.0]; // 开始时的倍率
    animation.toValue = [NSNumber numberWithFloat:0.9]; // 结束时的倍率
    
    // 添加动画
    [view.layer addAnimation:animation forKey:@"scale-layer"];
    
}

- (IBAction)removeBtnClick:(id)sender {
    // 开始动画
    [self animationbegin:sender];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (IBAction)sureBtnClick:(id)sender {
    // 开始动画
    [self animationbegin:sender];
    
    NSString *province = [self protectString:self.province];
    NSString *city = [self protectString:self.city];
    NSString *area = [self protectString:self.area];
    
    NSString *selectCity = [NSString stringWithFormat:@"%@%@%@",province, city, area];

    //delegate
    [self.delegate getSelectCity:selectCity];
    
    [self removeBtnClick:nil];
}

- (NSString *)protectString:(NSString *)string
{
    if (string == nil || [string isKindOfClass:NULL]) {
        string = @"";
    }
    return string;
}

#pragma mark -- setter getter
- (NSMutableArray *)provinces {
    if (!_provinces) {
        self.provinces = [@[] mutableCopy];
    }
    return _provinces;
}

- (NSMutableArray *)cityArray {
    if (!_cityArray) {
        self.cityArray = [@[] mutableCopy];
    }
    return _cityArray;
}

- (NSMutableArray *)areaArray {
    if (!_areaArray) {
        self.areaArray = [@[] mutableCopy];
    }
    return _areaArray;
}

- (NSMutableArray *)selectedArray {
    if (!_selectedArray) {
        self.selectedArray = [@[] mutableCopy];
    }
    return _selectedArray;
}


@end
