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
        _titleLabel.font          = [UIFont systemFontOfSize:12];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 0;
//        _titleLabel.backgroundColor = [];
        
        [self.contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (void)setModel:(DemoVC11_model *)model
{
    _model = model;
    
    [_imgview sd_setImageWithURL:[NSURL URLWithString:model.photo_url] placeholderImage:[UIImage imageNamed:@"1"] options:0];

    _titleLabel.text = model.desc;
//    if ([NSString BA_NSStringIsNULL:model.desc])
//    {
//        _titleLabel.text          = @"312313131";
//    }
//    else
//        _titleLabel.text = model.desc;
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    _imgview.frame = CGRectMake(0, 0, layoutAttributes.frame.size.width, layoutAttributes.frame.size.height - 30);
    _titleLabel.frame = CGRectMake(0, _imgview.bottom, _imgview.width, 30);
}


@end
