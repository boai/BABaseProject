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
    /*! cell中的描述文本 */
    UILabel      *_descLabel;
    /*! cell中的图片 */
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
    self.deleteButton.hidden = NO;
}

- (UIImageView *)imageView
{
    if (!_imageView)
    {
        _imageView = [UIImageView new];
        _imageView.frame = CGRectMake(0, 0, (BA_SCREEN_WIDTH - 30)/2, (BA_SCREEN_WIDTH - 60)/2);
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
        _descLabel.frame = CGRectMake(0, (BA_SCREEN_WIDTH - 60)/2, (BA_SCREEN_WIDTH - 30)/2, 20);
        
        _descLabel.textColor = [UIColor blackColor];
        _descLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_descLabel];
    }
    return _descLabel;
}

- (UIButton *)deleteButton
{
    if (!_deleteButton)
    {
        _deleteButton = [[UIButton alloc] initWithFrame:CGRectMake((BA_SCREEN_WIDTH - 30)/2 - 35, 5, 30, 30)];
        [self.deleteButton setImage:[UIImage imageNamed:@"BACollectionView.bundle/close.png"] forState:UIControlStateNormal];
        /*! 先设置不可见 */
        [self.deleteButton setHidden:YES];
        [self.contentView addSubview:self.deleteButton];
    }
    return _deleteButton;
}

- (void)setModel:(DemoVC10Model *)model
{
    _model = model;
    _imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", model.imageName]];
    _descLabel.text = model.desc;
}


@end
