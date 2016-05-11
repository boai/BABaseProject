//
//  view4.h
//  test
//
//  Created by 博爱 on 16/5/11.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^selectRowBlock)(UITableView *tableView, NSIndexPath *indexPath, NSArray *dataArray);

@interface view4 : UIView

@property (nonatomic, strong) UITableView                  *tableView;
@property (nonatomic, copy  ) selectRowBlock                selectBlock;

- (instancetype)initWithFrame:(CGRect)frame withSelectRowBlock:(selectRowBlock)selectRowBlock;

@end
