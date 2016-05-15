//
//  BAHomeViewCell.h
//  BABaseProject
//
//  Created by 博爱 on 16/5/4.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BAHomeViewModel;
@interface BAHomeViewCell : UITableViewCell

@property (nonatomic, strong) BAHomeViewModel *subViewFrame;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
