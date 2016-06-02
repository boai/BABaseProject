//
//  DemoVC11_Cell.m
//  BABaseProject
//
//  Created by 博爱 on 16/6/2.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC11_Cell.h"
#import "DemoVC11_model.h"

@interface DemoVC11_Cell ()

@property (nonatomic, retain) UIImageView *imgview;
@property (nonatomic, strong) UILabel     *titleLabel;

@end

@implementation DemoVC11_Cell

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
    self.imgview.hidden    = NO;
    self.titleLabel.hidden = NO;
}

- (UIImageView *)imgview
{
    if (!_imgview)
    {
        _imgview = [[UIImageView alloc]init];
        [self.contentView addSubview:_imgview];
    }
    return _imgview;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel               = [[UILabel alloc]init];
        _titleLabel.textColor     = [UIColor redColor];
        _titleLabel.font          = [UIFont systemFontOfSize:15];
        _titleLabel.text          = @"312313131";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        
        [self.contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (void)setModel:(DemoVC11_model *)model
{
    _model = model;
    
    [_imgview setImageWithURL:[NSURL URLWithString:model.photo_url] placeholderImage:@""];
    _titleLabel.text = model.desc;
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    _imgview.frame = CGRectMake(0, 0, layoutAttributes.frame.size.width, layoutAttributes.frame.size.height);
    _titleLabel.frame = CGRectMake(CGRectGetMinX(_imgview.frame), _imgview.bottom + 5, _imgview.width, 20);
}


@end
