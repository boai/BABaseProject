//
//  BAAlertView.m
//  BABaseProject
//
//  Created by 博爱 on 16/6/21.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BAAlertView.h"
#import "BAModal.h"

#define kBAAlertWidth        BA_SCREEN_WIDTH - 50
#define kBAAlertPaddingV     11
#define kBAAlertPaddingH     18
#define kBAAlertRadius       13
#define kBAAlertButtonHeight 40

@interface BAAlertView ()

@property (strong, nonatomic) UIView          *backgroundView;
@property (strong, nonatomic) UIView          *containerView;
@property (strong, nonatomic) UIScrollView    *scrollView;
@property (strong, nonatomic) UILabel         *titleLabel;
@property (strong, nonatomic) UIImageView     *imageView;
@property (strong, nonatomic) UILabel         *messageLabel;
@property (strong, nonatomic) NSMutableArray  *buttons;
@property (strong, nonatomic) NSMutableArray  *lines;

@end

@implementation BAAlertView
{
    BAModal  *_modal;
    BOOL      _didLayouted;
    
    CGFloat   _scrollBottom;
    CGFloat   _buttonsHeight;
    CGFloat   _maxContentWidth;
    CGFloat   _maxAlertViewHeight;
}

- (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image message:(NSString *)message buttonTitles:(NSArray *)buttonTitles
{
    if (self = [self initWithFrame:CGRectZero]){
        _title = [title copy];
        _image = image;
        _message = [message copy];
        _buttonTitles = [NSArray arrayWithArray:buttonTitles];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:CGRectMake(0, 0, kBAAlertWidth, 0)]){
        [self loadData];
        [self loadUI];
    }
    return self;
}

- (void)loadData{
    _didLayouted = NO;
    _hideWhenTapOutside = NO;
    _buttons = [NSMutableArray new];
    _lines = [NSMutableArray new];
    
    _modal = [BAModal ba_modalWithContentView:self];
    _modal.hideWhenTouchOutside = NO;
    _modal.dimBackgroundWhenShow = NO;
    _modal.showAnimation = [self showAnimation];
    _modal.hideAnimation = [self hideAnimation];
}

- (void)loadUI{
    _backgroundView = [UIView new];
    _backgroundView.backgroundColor = BA_White_Color;
    
    _backgroundView.layer.cornerRadius = kBAAlertRadius;
    _backgroundView.layer.shadowColor = [UIColor colorWithWhite:0 alpha:0.5].CGColor;
    _backgroundView.layer.shadowOffset = CGSizeZero;
    _backgroundView.layer.shadowOpacity = 1;
    _backgroundView.layer.shadowRadius = kBAAlertRadius;
    _backgroundView.layer.borderWidth = 0.5;
    _backgroundView.layer.borderColor = ba_RGBAColor(110, 115, 120, 1).CGColor;
    
    _containerView = [UIView new];
    _containerView.layer.cornerRadius = kBAAlertRadius;
    _containerView.layer.masksToBounds = YES;
    
    _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    [_containerView addSubview:_scrollView];
    
    [self addSubview:_backgroundView];
    [self addSubview:_containerView];
}

#pragma mark - ***** setter / getter
//- (void)setBgroundColor:(UIColor *)bgroundColor
//{
//    _bgroundColor = bgroundColor;
//    _backgroundView.backgroundColor = bgroundColor;
//}
//
//- (void)setTitleColor:(UIColor *)titleColor
//{
//    _titleColor = titleColor;
//    _titleLabel.textColor = [UIColor colorWithWhite:1 alpha:0.85];
//}

#pragma mark - ***** 动画
- (ba_modal_animation)showAnimation{
    return ^CGFloat(){
        self.alpha = 0;
        CGFloat d1 = 0.2, d2 = 0.15;
        self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.4, 0.4);
        [UIView animateWithDuration:d1 animations:^{
            self.alpha = 1;
            self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:d2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                self.alpha = 1;
                self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
            } completion:^(BOOL finished2) {
            }];
        }];
        return (d1+d2);
    };
}

- (ba_modal_animation)hideAnimation{
    return ^CGFloat(){
        CGFloat d1 = 0.2, d2 = 0.1;
        [UIView animateWithDuration:d2 animations:^{
            self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        } completion:^(BOOL finished){
            [UIView animateWithDuration:d1 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                self.alpha = 0;
                self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.4, 0.4);
            } completion:^(BOOL finished2){
            }];
        }];
        return (d1+d2);
    };
}

#pragma mark - prepare for show

- (void)prepareForShow{
    if (_didLayouted){
        return;
    }
    [self resetViews];
    _scrollBottom = 0;
    CGFloat insetY = kBAAlertPaddingV;
    _maxContentWidth = kBAAlertWidth-2*kBAAlertPaddingH;
    _maxAlertViewHeight = [UIScreen mainScreen].bounds.size.height-50;
    [self loadTitle];
    [self loadImage];
    [self loadMessage];
    _buttonsHeight = kBAAlertButtonHeight*((_buttonTitles.count>2||_buttonTitles.count==0)?_buttonTitles.count:1);
    self.frame = CGRectMake(0, 0, kBAAlertWidth, MIN(MAX(_scrollBottom+2*insetY+_buttonsHeight, 2*kBAAlertRadius+kBAAlertPaddingV), _maxAlertViewHeight));
    _backgroundView.frame = self.bounds;
    _backgroundView.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
    _containerView.frame = self.bounds;
    _scrollView.frame = CGRectMake(0, insetY, CGRectGetWidth(_containerView.frame),MIN(_scrollBottom, CGRectGetHeight(_containerView.frame)-2*insetY-_buttonsHeight));
    _scrollView.contentSize = CGSizeMake(_maxContentWidth, _scrollBottom);
    _didLayouted = YES;
    
    [self loadButtons];
}

- (void)resetViews{
    if (_titleLabel){
        [_titleLabel removeFromSuperview];
        _titleLabel.text = @"";
    }
    if (_imageView){
        [_imageView removeFromSuperview];
        _imageView.image = nil;
    }
    if (_messageLabel){
        [_messageLabel removeFromSuperview];
        _messageLabel.text = @"";
    }
    if (_buttons.count > 0){
        [_buttons makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [_buttons removeAllObjects];
    }
    if (_lines.count > 0){
        [_lines makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [_lines removeAllObjects];
    }
}

- (void)addLabel:(UILabel *)label maxHeight:(CGFloat)maxHeight{
    CGSize size = [label sizeThatFits:CGSizeMake(_maxContentWidth, maxHeight)];
    label.frame = CGRectMake(kBAAlertPaddingH, _scrollBottom, _maxContentWidth, size.height);
    [_scrollView addSubview:label];
    
    _scrollBottom = CGRectGetMaxY(label.frame)+kBAAlertPaddingV;
}

- (void)addLine:(CGRect)frame toView:(UIView *)view{
    UIView *line = [[UIView alloc] initWithFrame:frame];
    line.backgroundColor = ba_RGBAColor(160, 170, 160, 0.5);
    [view addSubview:line];
    [_lines addObject:line];
}

- (void)loadTitle{
    if (!_title){
        return;
    }
    if (!_titleLabel){
        _titleLabel = [UILabel new];
        _titleLabel.textColor = BA_Black_Color;
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 0;
    }
    _titleLabel.text = _title;
    [self addLabel:_titleLabel maxHeight:100];
    [self addLine:CGRectMake(kBAAlertPaddingH, _scrollBottom, _maxContentWidth, 0.5) toView:_scrollView];
    _scrollBottom += kBAAlertPaddingV;
}

- (void)loadImage{
    if (!_image){
        return;
    }
    if (!_imageView){
        _imageView = [UIImageView new];
    }
    _imageView.image = _image;
    CGSize size = _image.size;
    if (size.width > _maxContentWidth){
        size = CGSizeMake(_maxContentWidth, size.height/size.width*_maxContentWidth);
    }
    _imageView.frame = CGRectMake(kBAAlertPaddingH+_maxContentWidth/2-size.width/2, _scrollBottom, size.width, size.height);
    [_scrollView addSubview:_imageView];
    
    _scrollBottom = CGRectGetMaxY(_imageView.frame)+kBAAlertPaddingV;
}

- (void)loadMessage{
    if (!_message){
        return;
    }
    if (!_messageLabel){
        _messageLabel = [UILabel new];
        _messageLabel.textColor = BA_Black_Color;
        _messageLabel.font = [UIFont systemFontOfSize:17];
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.numberOfLines = 0;
    }
    _messageLabel.text = _message;
    [self addLabel:_messageLabel maxHeight:100000];
}

- (void)loadButtons{
    if (!_buttonTitles || _buttonTitles.count==0){
        return;
    }
    CGFloat buttonHeight = kBAAlertButtonHeight;
    CGFloat buttonWidth = kBAAlertWidth;
    CGFloat top = CGRectGetHeight(_containerView.frame)-_buttonsHeight;
    [self addLine:CGRectMake(0, top-0.5, buttonWidth, 0.5) toView:_containerView];
    if (1 == _buttonTitles.count){
        [self addButton:CGRectMake(0, top, buttonWidth, buttonHeight) title:[_buttonTitles firstObject] tag:0];
    }
    else if (2 == _buttonTitles.count){
        [self addButton:CGRectMake(0, top, buttonWidth/2, buttonHeight) title:[_buttonTitles firstObject] tag:0];
        [self addButton:CGRectMake(0+buttonWidth/2, top, buttonWidth/2, buttonHeight) title:[_buttonTitles lastObject] tag:1];
        [self addLine:CGRectMake(0+buttonWidth/2-.5, top, 0.5, buttonHeight) toView:_containerView];
    }
    else{
        
        for (NSInteger i=0; i<_buttonTitles.count; i++){
            [self addButton:CGRectMake(0, top, buttonWidth, buttonHeight) title:_buttonTitles[i] tag:i];
            top += buttonHeight;
            if (_buttonTitles.count-1!=i){
                [self addLine:CGRectMake(0, top, buttonWidth, 0.5) toView:_containerView];
            }
        }
        [_lines enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [_containerView bringSubviewToFront:obj];
        }];
        
    }
}

- (UIButton *)addButton:(CGRect)frame title:(NSString *)title tag:(NSInteger)tag{
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    button.tag = tag;
    [button setTitleColor:ba_RGBAColor(220, 210, 200, 1) forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageWithColor:ba_RGBAColor(135, 140, 145, 0.65)] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageWithColor:ba_RGBAColor(135, 140, 145, 0.45)] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_containerView addSubview:button];
    [_buttons addObject:button];
    return button;
}

- (void)buttonClicked:(UIButton *)button{
    [self hide:YES];
    if (self.actionHandler){
        self.actionHandler(button.tag);
    }
}

#pragma mark - show / hide

- (void)show:(BOOL)animated{
    [self prepareForShow];
    _modal.hideWhenTouchOutside = self.hideWhenTapOutside;
    _modal.didShowHandler = self.didShowHandler;
    _modal.didHideHandler = self.didHideHandler;
    [_modal show:animated];
}

- (void)hide:(BOOL)animated{
    [_modal hide:animated];
}

- (BOOL)onShow{
    return _modal.onShow;
}

@end

@implementation BAAlertView (Show)

+ (instancetype)showTitle:(NSString *)title
                    image:(UIImage *)image
                  message:(NSString *)message
             buttonTitles:(NSArray *)buttonTitles
                  handler:(void (^)(NSInteger))handler{
    BAAlertView *alert = [[BAAlertView alloc] initWithTitle:title
                                                      image:image
                                                    message:message
                                               buttonTitles:buttonTitles];
    [alert setActionHandler:handler];
    [alert show:YES];
    return alert;
}

+ (instancetype)showTitle:(NSString *)title
                  message:(NSString *)message{
    BAAlertView *alert = [[BAAlertView alloc] initWithTitle:title
                                                      image:nil
                                                    message:message
                                               buttonTitles:nil];
    alert.hideWhenTapOutside = YES;
    [alert show:YES];
    return alert;
}

+ (instancetype)showTitle:(NSString *)title
                  message:(NSString *)message
                hideDelay:(CGFloat)delay{
    if (delay>0){
        BAAlertView *alert = [self showTitle:title message:message];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [alert hide:YES];
        });
        return alert;
    }
    return nil;
}

@end
