//
//  DemoVC10Cell.m
//  BABaseProject
//
//  Created by 博爱 on 16/5/30.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC10Cell.h"
#import "DemoVC10Model.h"

@implementation DemoVC10Cell
{
    UILabel      *_descLabel;
    UIImageView  *_imageView;
}

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
    self.imageView.hidden = NO;
    self.descLabel.hidden = NO;
}

- (UIImageView *)imageView
{
    if (!_imageView)
    {
        _imageView = [UIImageView new];
        _imageView.frame = CGRectMake(0, 0, (SCREEN_WIDTH - 30)/2, (SCREEN_WIDTH - 60)/2);
        _imageView.userInteractionEnabled = YES;
        [self.contentView addSubview:self.imageView];
    }
    return _imageView;
}

- (UILabel *)descLabel
{
    if (!_descLabel)
    {
        _descLabel = [UILabel new];
        _descLabel.frame = CGRectMake(0, (SCREEN_WIDTH - 60)/2, (SCREEN_WIDTH - 30)/2, 20);
        
        _descLabel.textColor = [UIColor blackColor];
        _descLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_descLabel];
    }
    return _descLabel;
}

- (void)setModel:(DemoVC10Model *)model
{
    _model = model;
    _imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", model.imageName]];
    _descLabel.text = model.desc;
}


@end
