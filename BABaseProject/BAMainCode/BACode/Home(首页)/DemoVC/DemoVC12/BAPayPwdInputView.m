//
//  BAPayPwdInputView.m
//  BABaseProject
//
//  Created by 博爱 on 16/6/27.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BAPayPwdInputView.h"

#define kColorBorder [UIColor colorWithWhite:0.824 alpha:1.000]
static const CGFloat dotDiameter = 10.f;

@interface BAPayPwdInputView ()

/*! secure dot */
@property (strong, nonatomic) NSMutableArray *secureDots;
/*! keyboard responder */
@property (strong, nonatomic) UITextField *responder;

@end

@implementation BAPayPwdInputView

#pragma mark - Life cycle

- (instancetype)init {
    self = [super init];
    if (!self) return nil;
    [self addNotifications];
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (!self) return nil;
    [self addNotifications];
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat margin = dotDiameter*0.5;
    CGFloat lineX = 0.f;
    CGFloat lineY = 0.f;
    CGSize lineSize = CGSizeMake(0.5, self.frame.size.height);
    CGFloat w = self.frame.size.width / self.length;
    
    for (int i = 0; i < self.length-1; i++) {
        UIView *line = self.subviews[i];
        lineX = w*(i+1);
        line.frame = CGRectMake(lineX, lineY, lineSize.width, lineSize.height);
    }
    
    for (int i = 0; i < self.secureDots.count; i++) {
        CAShapeLayer *dot = self.secureDots[i];
        dot.position = CGPointMake(w * (0.5 + i) - margin, self.frame.size.height * 0.5 - margin);
    }
}

#pragma mark - Overwrite

- (BOOL)becomeFirstResponder {
    [super becomeFirstResponder];
    [self addSubview:self.responder];
    [self.responder becomeFirstResponder];
    return YES;
}

- (BOOL)resignFirstResponder {
    [super resignFirstResponder];
    [self endEditing:YES];
    return YES;
}

- (BOOL)endEditing:(BOOL)force {
    [super endEditing:force];
    if (force) {
        self.responder.text = nil;
        [self.secureDots enumerateObjectsUsingBlock:^(CAShapeLayer *_Nonnull dot, NSUInteger idx, BOOL * _Nonnull stop) {
            dot.hidden = YES;
        }];
    }
    return force;
}

#pragma mark - Setter/Getter

- (void)setLength:(NSUInteger)length {
    _length = length;
    if (length > 0) {
        [self configurViewWithLength:length];
    }
}

- (NSMutableArray *)secureDots {
    if (!_secureDots) {
        _secureDots = [NSMutableArray arrayWithCapacity:self.length];
    }
    return _secureDots;
}

- (UITextField *)responder {
    if (!_responder) {
        _responder = [[UITextField alloc] initWithFrame:CGRectZero];
        _responder.clearsOnBeginEditing = YES;
        _responder.keyboardType = UIKeyboardTypeNumberPad;
        _responder.hidden = YES;
    }
    return _responder;
}

#pragma mark - Privite

- (void)configurViewWithLength:(NSUInteger)length {
    
    self.layer.borderWidth = 0.5f;
    self.layer.borderColor = kColorBorder.CGColor;
    
    //separator line
    for (int i = 0; i < length - 1; i++) {
        UIView *line = [[UIView alloc] init];
        line.backgroundColor = [UIColor colorWithWhite:0.824 alpha:1.000];
        [self addSubview:line];
    }
    
    //secure dots
    [self.secureDots removeAllObjects];
    for (int i = 0; i < length; i++) {
        CAShapeLayer *dot = [CAShapeLayer layer];
        dot.fillColor = [UIColor blackColor].CGColor;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, dotDiameter, dotDiameter)];
        dot.path = path.CGPath;
        dot.hidden = YES;
        [self.layer addSublayer:dot];
        
        [self.secureDots addObject:dot];
    }
}

- (void)addNotifications {
    __weak typeof(&*self)weakSelf = self;
    
    [[NSNotificationCenter defaultCenter] addObserverForName:UITextFieldTextDidChangeNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        
        NSUInteger length = weakSelf.responder.text.length;
        if (length <= weakSelf.length && weakSelf.inputDidCompletion) {
            self.inputDidCompletion(weakSelf.responder.text);
        }else if (length > weakSelf.length) {
            self.responder.text = [weakSelf.responder.text substringToIndex:weakSelf.length];
        }
        [self.secureDots enumerateObjectsUsingBlock:^(CAShapeLayer *dot, NSUInteger idx, BOOL * stop) {
            dot.hidden = idx < length ? NO : YES;
        }];
    }];
}


@end
