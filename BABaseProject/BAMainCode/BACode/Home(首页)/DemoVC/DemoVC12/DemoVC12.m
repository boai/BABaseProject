//
//  DemoVC12.m
//  BABaseProject
//
//  Created by 博爱 on 16/6/21.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC12.h"
#import "DemoVC12View.h"

@interface DemoVC12 ()

@property (nonatomic, strong) DemoVC12View *view1;

@end

@implementation DemoVC12

- (void)viewDidLoad
{

    
    [self setupSubViews];
}

- (void)setupSubViews
{
    self.view1.hidden = NO;
    
}

- (DemoVC12View *)view1
{
    if (!_view1)
    {
        _view1 = [[DemoVC12View alloc] initWithFrame:CGRectMake(0, 0, BA_SCREEN_WIDTH, BA_SCREEN_HEIGHT) withSelectRowBlock:^(UITableView *tableView, NSIndexPath *indexPath, NSArray *dataArray) {
            
        }];
        [self.view addSubview:_view1];
    }
    return _view1;
}


@end
