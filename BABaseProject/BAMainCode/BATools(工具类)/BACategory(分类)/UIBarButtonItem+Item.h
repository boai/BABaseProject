//
//  UIBarButtonItem+Item.h
//  博爱微博
//
//  Created by 孙博岩 on 15/8/1.
//  Copyright © 2015年 boai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Item)

+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;


@end
