//
//  CustomView.h
//  BAAlert
//
//  Created by boai on 2017/5/12.
//  Copyright © 2017年 boai. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^HandleButtonActionBlock)(NSInteger index);

@interface CustomView : UIView

@property(nonatomic, copy) HandleButtonActionBlock block;

@end
