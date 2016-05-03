//
//  BAFPSLabel.m
//  Pods
//
//  Created by HyanCat on 16/4/4.
//
//

#import "BAFPSLabel.h"
#import <Masonry/Masonry.h>

#define IOS8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

@interface BAFPSLabel ()
{
    NSUInteger _tickCount;
}
@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, assign) CFTimeInterval lastTime;
@property (nonatomic, assign) NSUInteger fps;

@end

@implementation BAFPSLabel

+ (instancetype)showInWindow:(UIWindow *)window
{
    BAFPSLabel *label = [[BAFPSLabel alloc] initWithFrame:CGRectZero];
    label.layer.cornerRadius = 4.f;
    label.layer.masksToBounds = YES;
    label.textAlignment = NSTextAlignmentCenter;
    label.userInteractionEnabled = NO;
    label.font = [UIFont fontWithName:@"Menlo" size:12];
    
    [window addSubview:label];
    
    label.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *leadingLayout =[NSLayoutConstraint constraintWithItem:label
                                                                    attribute:NSLayoutAttributeLeading
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:window
                                                                    attribute:NSLayoutAttributeLeading
                                                                   multiplier:1
                                                                     constant:10.f];
    NSLayoutConstraint *bottomLayout = [NSLayoutConstraint constraintWithItem:label
                                                                    attribute:NSLayoutAttributeBottom
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:window
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1
                                                                     constant:-10.f];
    NSLayoutConstraint *widthLayout = [NSLayoutConstraint constraintWithItem:label
                                                                   attribute:NSLayoutAttributeWidth
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:nil
                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                  multiplier:0
                                                                    constant:60.f];
    NSLayoutConstraint *heightLayout = [NSLayoutConstraint constraintWithItem:label
                                                                    attribute:NSLayoutAttributeHeight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:nil
                                                                    attribute:NSLayoutAttributeNotAnAttribute
                                                                   multiplier:0
                                                                     constant:20.f];
    if (IOS8_OR_LATER) {
        [NSLayoutConstraint activateConstraints:@[leadingLayout, bottomLayout, widthLayout, heightLayout]];
    }
    else {
        [window addConstraints:@[leadingLayout, bottomLayout, widthLayout, heightLayout]];
    }
    
    return label;
}

- (void)dealloc
{
    [_displayLink invalidate];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(tick:)];
        [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
        _autoHide = NO;
        
        [self addObserver:self forKeyPath:NSStringFromSelector(@selector(fps)) options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if (object == self && [keyPath isEqualToString:NSStringFromSelector(@selector(fps))]) {
        NSUInteger oldFps = [[change valueForKey:NSKeyValueChangeOldKey] unsignedIntegerValue];
        NSUInteger newFps = [[change valueForKey:NSKeyValueChangeNewKey] unsignedIntegerValue];
        if (oldFps != newFps) {
            [self _displayFPS];
        }
    }
}

- (void)tick:(CADisplayLink *)displayLink
{
    CFTimeInterval currentTime = displayLink.timestamp;
    if (_lastTime == 0) {
        // first time.
        _lastTime = currentTime;
        return;
    }
    _tickCount++;
    CFTimeInterval delta = currentTime - _lastTime;
    if (delta < 1) return;
    // get fps
    self.fps = MIN(lrint(_tickCount / delta), 60);
    _tickCount = 0;
    _lastTime = currentTime;
}

- (void)fadeOut
{
    CATransition *fadeTransition = [CATransition animation];
    [self.layer addAnimation:fadeTransition forKey:kCATransition];
    [self setAttributedText:nil];
    self.layer.backgroundColor = nil;
}

- (void)_displayFPS
{
    if (self.attributedText == nil) {
        // fade in
        CATransition *fadeTransition = [CATransition animation];
        [self.layer addAnimation:fadeTransition forKey:kCATransition];
    }
    
    CGFloat hue = self.fps > 24 ? (self.fps - 24) / 120.f : 0;
    self.textColor = [UIColor colorWithHue:hue saturation:1 brightness:0.9 alpha:1];
    self.text = [NSString stringWithFormat:@"%@ FPS", @(self.fps)];
    self.layer.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7f].CGColor;
    
    if (self.autoHide) {
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(fadeOut) object:nil];
        [self performSelector:@selector(fadeOut) withObject:nil afterDelay:2];
    }
}

@end
