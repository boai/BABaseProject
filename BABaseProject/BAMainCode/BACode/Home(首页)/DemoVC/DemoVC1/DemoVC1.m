//
//  DemoVC1.m
//  BABaseProject
//
//  Created by 博爱 on 16/5/4.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC1.h"
#import "BANewsNetManager.h"

@interface DemoVC1 ()

@end

@implementation DemoVC1


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self isShowSnowLoadingView:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self isShowSnowLoadingView:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setVCBgColor:BA_Yellow_Color];
    [self getData];
}

- (void)getData
{
    [BANewsNetManager getVideosWithStartIndex:1 completionHandle:^(id model, NSError *error) {
        
        if (!error)
        {
            BALog(@"model: %@", model);
            [self BA_showAlert:@"数据解析成功！请查看！"];
        }
        else
        {
            BALog(@"解析数据有误！");
            [self BA_showAlert:@"解析数据有误！请检查！"];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
