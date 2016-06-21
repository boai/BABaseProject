//
//  DemoVC12View.h
//  BABaseProject
//
//  Created by 博爱 on 16/6/21.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^selectRowBlock)(UITableView *tableView, NSIndexPath *indexPath, NSArray *dataArray);

@interface DemoVC12View : UIView

@property (nonatomic, strong) UITableView                  *tableView;
@property (nonatomic, copy  ) selectRowBlock                selectBlock;

- (instancetype)initWithFrame:(CGRect)frame withSelectRowBlock:(selectRowBlock)selectRowBlock;



@end
