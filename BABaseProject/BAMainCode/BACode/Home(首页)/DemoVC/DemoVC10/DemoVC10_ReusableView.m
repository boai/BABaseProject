//
//  DemoVC10_ReusableView.m
//  BABaseProject
//
//  Created by 博爱 on 16/5/30.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC10_ReusableView.h"

@implementation DemoVC10_ReusableView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews
{
    self.titleLabel.hidden = NO;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 20)];
        _titleLabel.textColor = [UIColor blackColor];
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}

@end
