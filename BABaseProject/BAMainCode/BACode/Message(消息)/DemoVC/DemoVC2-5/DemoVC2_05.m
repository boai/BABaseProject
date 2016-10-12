//
//  DemoVC2_05.m
//  BABaseProject
//
//  Created by boai on 2016/10/11.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC2_05.h"

@interface DemoVC2_05 ()<UITableViewDelegate, UITableViewDataSource>
{
    UIAlertAction      *alertOk;
    UIAlertAction      *alertCancel;
    UIAlertController  *alert;
}
@property (weak, nonatomic  ) IBOutlet UITableView  *m_tableView;
@property (nonatomic, strong) NSArray               *dataArray;

@end

@implementation DemoVC2_05

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    if (alert)
    {
        alert = nil;
    }
    if (alertCancel)
    {
        alertCancel = nil;
    }
    if (alertOk)
    {
        alertOk = nil;
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)ba_setupUI
{
    self.m_tableView.tableFooterView = [UIView new];
    
}

- (NSArray *)dataArray
{
    if (!_dataArray)
    {
        _dataArray = @[@"1、修改 系统 alert 的字体颜色"];
    }
    return _dataArray;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (0 == indexPath.row)
    {
        [self performSelector:@selector(test1)];
    }
}

- (void)test1
{
    alert = [UIAlertController alertControllerWithTitle:@"博爱温馨提示：改变前" message:@"看看字体颜色：改变前" preferredStyle:UIAlertControllerStyleAlert];
    
    alertOk = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了 确定");
    }];
    alertCancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了 取消");
    }];
    [alert addAction:alertOk];
    [alert addAction:alertCancel];
    
    [self presentViewController:alert animated:YES completion:nil];
    /*! 设置字体颜色 */
    [self setAlertTextColor];
}

- (void)setAlertTextColor
{
    /*! 1、首先获得对应的属性 */
    NSArray *propertysListArray = [[UIAlertController class] ba_propertysList];
    NSLog(@"1、获取【UIAlertController】所有的属性名：%@", propertysListArray);

    /*! 2、获得成员变量 */
    NSArray *ivarListArray = [[UIAlertAction class] ba_ivarList];
    NSLog(@"2、获取【UIAlertController】所有的成员变量：%@", ivarListArray);

    for (NSInteger i = 0; i < ivarListArray.count; i++)
    {
        NSString *ivarName = ivarListArray[i];
        if ([ivarName isEqualToString:@"_titleTextColor"])
        {
            [alertOk setValue:BA_Orange_Color forKey:@"titleTextColor"];
            [alertCancel setValue:BA_Green_Color forKey:@"titleTextColor"];
        }
    }
    
    /*! 3、改变显示提示字体颜色 */
    NSArray *propertysListArray2 = [[UIAlertController class] ba_ivarList];
    NSLog(@"3、获取【UIAlertController】所有的成员变量：%@", propertysListArray2);
    for (NSInteger i = 0; i < propertysListArray2.count; i++)
    {
        NSString *ivarName = propertysListArray2[i];
        if ([ivarName isEqualToString:@"_attributedTitle"])
        {
            NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:@"博爱温馨提示：" attributes:@{NSForegroundColorAttributeName:BA_Green_Color}];
            [alert setValue:title forKey:@"attributedTitle"];
        }
        if ([ivarName isEqualToString:@"_attributedMessage"])
        {
//            NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:@"改变颜色和大小后的字体：" attributes:@{NSForegroundColorAttributeName:BA_Cyan_Color, NSFontAttributeName:[UIFont systemFontOfSize:16]}];
            NSString *result = @"改变颜色和大小后的博爱字体：";
            NSString *keyWord = @"博爱";
            
            //关键字添加效果
            NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:result];
            
            //获取关键字位置
            NSRange range = [result rangeOfString:keyWord];
            
            // 阴影
            NSShadow *shadow = [[NSShadow alloc] init];
            shadow.shadowBlurRadius = 1.0;// 模糊程度
            shadow.shadowColor = [UIColor grayColor];
            shadow.shadowOffset = CGSizeMake(1, 3);
            NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:[UIColor blackColor],NSKernAttributeName:@2.0,NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle),NSStrokeColorAttributeName:[UIColor blueColor],NSStrokeWidthAttributeName:@2.0,NSShadowAttributeName:shadow,NSVerticalGlyphFormAttributeName:@(0)};
            
            //设置关键字属性
            [attributedString setAttributes:dic range:range];
            
            [alert setValue:attributedString forKey:@"attributedMessage"];
        }
    }
    
//    // 首先获得对应的属性
//    unsigned int count = 0;
//    objc_property_t *propertys = class_copyPropertyList([UIAlertAction class], &count);
//    for(int i = 0;i < count;i ++){
//        
//        objc_property_t property = propertys[i];
//        //获得属性名对应字符串
//        NSString *propertyName = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
//        NSLog(@"uialertion.property = %@",propertyName);
//    }
//    
//    //获得成员变量
//    Ivar *ivars = class_copyIvarList([UIAlertAction class], &count);
//    for(int i =0;i < count;i ++){
//        
//        Ivar ivar = ivars[i];
//        NSString *ivarName = [NSString stringWithCString:ivar_getName(ivar) encoding:NSUTF8StringEncoding];
//        NSLog(@"uialertion.ivarName = %@",ivarName);
//        if ([ivarName isEqualToString:@"_titleTextColor"]) {
//            
//            [alertOk setValue:[UIColor redColor] forKey:@"titleTextColor"];
//            [alertCancel setValue:[UIColor greenColor] forKey:@"titleTextColor"];
//        }
//    }
//    
//    /********************************************************************/
//    // 改变显示提示字体颜色
//    objc_property_t *propertyss = class_copyPropertyList([UIAlertController class], &count);
//    for(int i = 0;i < count;i ++){
//        
//        objc_property_t propertys = propertyss[i];
//        //获得属性名对应字符串
//        NSString *propertyNames = [NSString stringWithCString:property_getName(propertys) encoding:NSUTF8StringEncoding];
//        NSLog(@"UIAlertController.property = %@",propertyNames);
//    }
//    
//    Ivar *ivarss = class_copyIvarList([UIAlertController class], &count);
//    for(int i =0;i < count;i ++){
//        
//        Ivar ivars = ivarss[i];
//        NSString *ivarNames = [NSString stringWithCString:ivar_getName(ivars) encoding:NSUTF8StringEncoding];
//        
//        NSLog(@"UIAlertController.ivarName = %@",ivarNames);
//        if ([ivarNames isEqualToString:@"_attributedTitle"]) {
//            NSMutableAttributedString *attr = [[NSMutableAttributedString alloc]initWithString:@"博爱温馨提示：改变后" attributes:@{NSForegroundColorAttributeName:[UIColor redColor]}];
//            [alert setValue:attr forKey:@"attributedTitle"];
//        }
//        
//        if ([ivarNames isEqualToString:@"_attributedMessage"]) {
//            NSMutableAttributedString *attr = [[NSMutableAttributedString alloc]initWithString:@"我来看看字体颜色：改变后" attributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:1.0 green:0.5 blue:0.0 alpha:1.0],NSFontAttributeName:[UIFont systemFontOfSize:15]}];
//            [alert setValue:attr forKey:@"attributedMessage"];
//        }
//    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
