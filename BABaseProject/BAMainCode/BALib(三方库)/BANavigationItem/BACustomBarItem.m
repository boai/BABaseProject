//
//  CustomBarItem.m
//  yrapp
//
//  Created by 博爱 on 16/2/24.
//  Copyright © 2016年 有人科技. All rights reserved.
//

#import "BACustomBarItem.h"


#define Default_Offset 10
// 用NSString设置item时 item的尺寸
#define TitleViewSize CGSizeMake(70, 30)

@implementation BACustomBarItem

- (void)initCustomItemWithType:(ItemType)type andSize:(CGSize)size
{
    self.isCustomView = NO;
    self.itemType = type;
    self.items = [[NSMutableArray alloc] init];
    self.contentBarItem = [UIButton buttonWithType:UIButtonTypeCustom];
    self.contentBarItem.frame = CGRectMake(0, 0, size.width, size.height);
    [self.items addObject:self.contentBarItem];
}

+ (BACustomBarItem *)itemWithTitle:(NSString *)title textColor:(UIColor *)color fontSize:(CGFloat )font itemType:(ItemType)type
{
    BACustomBarItem *item = [[BACustomBarItem alloc] init];
    [item initCustomItemWithType:type andSize:TitleViewSize];
    [item setItemContetnWithType:type];
    [item.contentBarItem setTitle:title forState:(UIControlStateNormal)];
    [item.contentBarItem setTitleColor:color forState:(UIControlStateNormal)];
    [item.contentBarItem.titleLabel setFont:[UIFont systemFontOfSize:font]];
    return item;
}

+ (BACustomBarItem *)itemWithImage:(NSString *)imageName highImage:(NSString *)highImage size:(CGSize)size type:(ItemType)type
{
    BACustomBarItem *item = [[BACustomBarItem alloc] init];
    [item initCustomItemWithType:type andSize:size];
    [item setItemContetnWithType:type];
    [item.contentBarItem setImage:[UIImage imageNamed:imageName] forState:(UIControlStateNormal)];
    [item.contentBarItem setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    return item;
}

+ (BACustomBarItem *)itemWithCustomeView:(UIView *)customView type:(ItemType)type
{
    BACustomBarItem *item = [[BACustomBarItem alloc] init];
    [item initCustomItemWithType:type andSize:customView.frame.size];
    item.isCustomView = YES;
    item.customView = customView;
    customView.frame = item.contentBarItem.bounds;
    [item.contentBarItem addSubview:customView];
    [item setItemContetnWithType:type];
    return item;
}

- (void)setItemContetnWithType:(ItemType)type
{
    if (type == right) {
        
        [self.contentBarItem setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
        [self setOffset:Default_Offset];
    }
    else if (type == left){
        
        [self.contentBarItem setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [self setOffset:-Default_Offset];
    }
}

- (void)setOffset:(CGFloat)offSet
{
    if (self.isCustomView) {
        
        CGRect customViewFrame = self.customView.frame;
        customViewFrame.origin.x = offSet;
        self.customView.frame = customViewFrame;
    }
    else{
    
        [self.contentBarItem setContentEdgeInsets:UIEdgeInsetsMake(0, offSet, 0, -offSet)];
    }
}

- (void)addTarget:(id)target selector:(SEL)selector event:(UIControlEvents)event
{
    [self.contentBarItem addTarget:target action:selector forControlEvents:event];
}

- (void)setItemWithNavigationItem:(UINavigationItem *)navigationItem itemType:(ItemType)type
{
    if (type == center) {
    
        [navigationItem setTitleView:self.contentBarItem];
    }
    else if (type == left){
    
        [navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:self.contentBarItem]];
    }
    else if (type == right){
    
        [navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:self.contentBarItem]];
    }
}


@end
