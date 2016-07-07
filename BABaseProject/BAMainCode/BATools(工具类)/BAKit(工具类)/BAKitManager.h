//
//  BAKitManager.h
//  BABaseProject
//
//  Created by 博爱 on 16/7/7.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class BAKitManager;

typedef BAKitManager *(^ba_sting)(NSString *);
typedef BAKitManager *(^ba_color)(UIColor *);


@interface BAKitManager : NSObject

/* category use,overlook */
@property (nonatomic, weak) id main;           //clear is UIControl or UIView

@property (nonatomic, weak) __kindof UILabel *ba_label;


@end
