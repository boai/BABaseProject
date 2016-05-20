
/*!
 *  @header BAKit.h
 *          BABaseProject
 *
 *  @brief  BAKit
 *
 *  @author 博爱
 *  @copyright    Copyright © 2016年 博爱. All rights reserved.
 *  @version    V1.0
 */

//                            _ooOoo_
//                           o8888888o
//                           88" . "88
//                           (| -_- |)
//                            O\ = /O
//                        ____/`---'\____
//                      .   ' \\| |// `.
//                       / \\||| : |||// \
//                     / _||||| -:- |||||- \
//                       | | \\\ - /// | |
//                     | \_| ''\---/'' | |
//                      \ .-\__ `-` ___/-. /
//                   ___`. .' /--.--\ `. . __
//                ."" '< `.___\_<|>_/___.' >'"".
//               | | : `- \`.;`\ _ /`;.`/ - ` : | |
//                 \ \ `-. \_ __\ /__ _/ .-` / /
//         ======`-.____`-.___\_____/___.-`____.-'======
//                            `=---='
//
//         .............................................
//                  佛祖镇楼                  BUG辟易
//          佛曰:
//                  写字楼里写字间，写字间里程序员；
//                  程序人员写程序，又拿程序换酒钱。
//                  酒醒只在网上坐，酒醉还来网下眠；
//                  酒醉酒醒日复日，网上网下年复年。
//                  但愿老死电脑间，不愿鞠躬老板前；
//                  奔驰宝马贵者趣，公交自行程序员。
//                  别人笑我忒疯癫，我笑自己命太贱；
//                  不见满街漂亮妹，哪个归得程序员？

/*
 
 *********************************************************************************
 *
 * 在使用BAKit的过程中如果出现bug请及时以以下任意一种方式联系我，我会及时修复bug
 *
 * QQ     : 可以添加SDAutoLayout群 497140713 在这里找到我(博爱1616【137361770】)
 * 微博    : 博爱1616
 * Email  : 137361770@qq.com
 * GitHub : https://github.com/boai
 * 博客园  : http://www.cnblogs.com/boai/
 * 博客    : http://boai.github.io
 
 *********************************************************************************
 
 */

#import "BAModal.h"

@interface BAModalWindow : NSObject

+ (instancetype)ba_sharedModalWindow;

- (void)ba_showModal:(BAModal *)modal animated:(BOOL)animated duration:(CGFloat)duration completion:(void(^)())comletion;

- (void)ba_hideModal:(BAModal *)modal animated:(BOOL)animated duration:(CGFloat)duration completion:(void(^)())comletion;

@end


static BAModal *_ba_modal = nil;
@interface BAModal ()

@property (strong, nonatomic) UIView                  *containerView;

@property (strong, nonatomic) UIView                  *backgroundTapView;

@property (strong, nonatomic) UITapGestureRecognizer  *tap;

@property (assign, nonatomic) BOOL                     onShowing;

@property (assign, nonatomic) BOOL                     onTop;

@end

@implementation BAModal

+ (instancetype)ba_modal
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _ba_modal = [[self alloc] init];
        
    });
    return _ba_modal;
}

+ (instancetype)ba_modalWithContentView:(UIView *)contentView{
    BAModal *modal = [self ba_modal];
    [modal addModalContentView:contentView];
    return modal;;
}

- (instancetype)init{
    if (self = [super init]){
        _positionMode = BAModelPositionCenter;
        _position = CGPointMake(CGRectGetWidth([UIScreen mainScreen].bounds)/2.0, CGRectGetHeight([UIScreen mainScreen].bounds)/2.0);
        _onShowing = NO;
        _onTop = NO;
        _hideWhenTouchOutside = NO;
        _animatedHideWhenTouchOutside = YES;
        _dimBackgroundWhenShow = YES;
    }
    return self;
}

- (void)addModalContentView:(UIView *)contentView{
    _contentView = contentView;
}

#pragma mark - setter / getter

- (void)setPositionMode:(BAModelPositionMode)positionMode{
    if (_positionMode != positionMode){
        _positionMode = positionMode;
        [self updateContentViewPosition];
    }
}

- (UIView *)containerView{
    if (!_containerView){
        CGSize size = [UIScreen mainScreen].bounds.size;
        _containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
        _containerView.backgroundColor = [UIColor clearColor];
        
        _backgroundTapView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
        _backgroundTapView.backgroundColor = [UIColor clearColor];
        [_containerView addSubview:_backgroundTapView];
        
        _tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped)];
        _tap.enabled = _hideWhenTouchOutside;
        [_backgroundTapView addGestureRecognizer:_tap];
    }
    return _containerView;
}

- (ba_modal_animation)showAnimation{
    if (!_showAnimation){
        return ^CGFloat(){
            CGFloat d = 0.3;
            _containerView.alpha = 0;
            [UIView animateWithDuration:d
                             animations:^{
                                 _containerView.alpha = 1;
                             }];
            return d;
        };
    }
    return _showAnimation;
}

- (ba_modal_animation)hideAnimation{
    if (!_hideAnimation){
        return ^CGFloat(){
            CGFloat d = 0.3;
            [UIView animateWithDuration:d
                             animations:^{
                                 _containerView.alpha = 0;
                             }];
            return d;
        };
    }
    return _hideAnimation;
}

- (BOOL)onShow{
    return _onShowing;
}

- (BAModalWindow *)window{
    return [BAModalWindow ba_sharedModalWindow];
}

#pragma mark - action

- (void)setHideWhenTouchOutside:(BOOL)hideWhenTouchOutside{
    _hideWhenTouchOutside = hideWhenTouchOutside;
    _tap.enabled = _hideWhenTouchOutside;
}

- (void)tapped{
    if (_hideWhenTouchOutside && !CGRectContainsPoint(_contentView.frame, [_tap locationInView:_containerView])){
        [self hide:_animatedHideWhenTouchOutside];
    }
}

#pragma mark - for show / hide

- (void)updateContentViewPosition{
    switch (_positionMode) {
        case BAModelPositionCenter:{
            _contentView.center = CGPointMake(CGRectGetMidX(_containerView.bounds), CGRectGetMidY(_containerView.bounds));
            break;
        }
        case BAModelPositionCenterTop:{
            _contentView.center = CGPointMake(CGRectGetMidX(_containerView.bounds), CGRectGetHeight(_contentView.bounds)/2.0);
            break;
        }
        case BAModelPositionCenterBottom:{
            _contentView.center = CGPointMake(CGRectGetMidX(_containerView.bounds), CGRectGetHeight(_containerView.bounds)-CGRectGetHeight(_contentView.bounds)/2.0);
            break;
        }
        case BAModelPositionCustom:{
            _contentView.center = self.position;
        }
        default:
            break;
    }
}

- (void)prepareUIForShow{
    [self.containerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [_containerView addSubview:_backgroundTapView];
    [self.containerView addSubview:_contentView];
    [self updateContentViewPosition];
}

- (void)showContentView:(UIView *)contentView animated:(BOOL)animated{
    NSAssert(contentView!=nil, @"没有可显示的视图");
    [self addModalContentView:contentView];
    [self show:animated];
}

- (void)show:(BOOL)animated{
    NSAssert(_contentView!=nil, @"没有可显示的视图");
    [self prepareUIForShow];
    [self.window ba_showModal:self animated:animated duration:animated?self.showAnimation():0 completion:self.didShowHandler];
}

- (void)hide:(BOOL)animated{
    [self.window ba_hideModal:self animated:animated duration:animated?self.hideAnimation():0 completion:self.didHideHandler];
}

@end

#define BAModalWindowDefaultBackgroundColor [UIColor colorWithWhite:0 alpha:0.55]

@interface BAModalWindow ()

@property (strong, nonatomic) NSMutableArray *modalsStack;

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UIView *dimBackgroundView;

@property (assign, nonatomic) BOOL shouldDimBackground;

@end

@implementation BAModalWindow{
    BOOL _onShowing;
}

+ (instancetype)ba_sharedModalWindow
{
    static dispatch_once_t onceToken;
    static BAModalWindow *_sharedModalWindow = nil;
    dispatch_once(&onceToken, ^{
        _sharedModalWindow = [[self alloc] init];
    });
    return _sharedModalWindow;
}

- (instancetype)init
{
    if (self = [super init])
    {
        _modalsStack = [[NSMutableArray alloc] init];
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _window.windowLevel = UIWindowLevelAlert;
        _window.backgroundColor = [UIColor clearColor];
        _window.opaque = NO;
        _dimBackgroundView = [[UIView alloc] initWithFrame:_window.bounds];
        [_window addSubview:_dimBackgroundView];
    }
    return self;
}

#pragma mark - public modal operation

- (void)ba_showModal:(BAModal *)modal animated:(BOOL)animated duration:(CGFloat)duration completion:(void(^)())comletion{
    BAModal *topModal = [self topModal];
    [self pushModal:modal];
    [self reloadData];
    _window.hidden = NO;
    [self transitionFromModal:topModal
                      toModal:modal
                     animated:animated
                     duration:duration
                   completion:comletion];
}

- (void)ba_hideModal:(BAModal *)modal animated:(BOOL)animated duration:(CGFloat)duration completion:(void(^)())comletion{
    if ([self hasModal:modal]){
        if ([[self topModal] isEqual:modal]){
            BAModal *toModal = (_modalsStack.count>1)?_modalsStack[_modalsStack.count-2]:nil;
            [self transitionFromModal:modal
                              toModal:toModal
                             animated:animated
                             duration:duration
                           completion:^{
                               [self popModal:modal];
                               [modal.containerView removeFromSuperview];
                               
                               BOOL isNoModal = nil == [self topModal];
                               if (isNoModal){
                                   _window.hidden = YES;
                               }
                               else{
                                   [self reloadData];
                               }
                               if (comletion){
                                   comletion();
                               }
                           }];
        }
        else{
            [self popModal:modal];
            [modal.containerView removeFromSuperview];
        }
    }
}

#pragma mark - show or hide

- (void)transitionFromModal:(BAModal *)fromModal
                    toModal:(BAModal *)toModal
                   animated:(BOOL)animated
                   duration:(CGFloat)duration
                 completion:(void(^)())completion{
    
    CGFloat fromA = 0, toA = 0;
    UIColor *fromColor = nil, *toColor = nil;
    
    BOOL(^colosIsEqual)(UIColor *, UIColor *) = ^BOOL(UIColor *color1, UIColor *color2){
        if (color1 && color2){
            CGFloat r1, r2, g1, g2, b1, b2, a1, a2;
            [color1 getRed:&r1 green:&g1 blue:&b1 alpha:&a1];
            [color2 getRed:&r2 green:&g2 blue:&b2 alpha:&a2];
            return (r1==r2)&&(g1==g2)&&(b1==b2)&&(a1==a2);
        }
        else if (!color1 && !color2){
            return YES;
        }
        return NO;
    };
    
    if (nil != fromModal){
        fromA = fromModal.dimBackgroundWhenShow?1:0;
        fromColor = fromModal.dimBackgroundColor?:BAModalWindowDefaultBackgroundColor;
    }
    
    if (nil != toModal){
        toA = toModal.dimBackgroundWhenShow?1:0;
        toColor = toModal.dimBackgroundColor?:BAModalWindowDefaultBackgroundColor;
    }
    
    _dimBackgroundView.alpha = fromA;
    _dimBackgroundView.backgroundColor = fromColor;
    if (fromA == toA && colosIsEqual(fromColor, toColor)){
        // 如果没有任何变化UIView动画会立即结束，采用以下方法进行回调
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (completion){
                completion();
            }
        });
    }
    else{
        [UIView animateWithDuration:animated?duration:0
                         animations:^{
                             _dimBackgroundView.alpha = toA;
                             _dimBackgroundView.backgroundColor = toColor;
                         }
                         completion:^(BOOL finished) {
                             if (completion){
                                 completion();
                             }
                         }];
    }
}

- (void)reloadData{
    BAModal *topModal = [self topModal];
    if (topModal){
        self.shouldDimBackground = topModal.dimBackgroundWhenShow;
        _dimBackgroundView.backgroundColor = topModal.dimBackgroundColor?:BAModalWindowDefaultBackgroundColor;
        
        [topModal.containerView removeFromSuperview];
        [_window addSubview:topModal.containerView];
        
        [[_modalsStack valueForKey:@"containerView"] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [(UIView *)obj setHidden:(obj!=topModal.containerView)];
        }];
    }
}

- (void)setShouldDimBackground:(BOOL)shouldDimBackground{
    _shouldDimBackground = shouldDimBackground;
    _dimBackgroundView.alpha = _shouldDimBackground?1:0;
}

#pragma mark - stack operation

- (void)pushModal:(BAModal *)modal{
    if ([self hasModal:modal]){
        [self popModal:modal];
    }
    [_modalsStack addObject:modal];
}

- (BAModal *)popModal:(BAModal *)modal{
    if ([self hasModal:modal]){
        [_modalsStack removeObject:modal];
    }
    return [self topModal];
}

- (BAModal *)topModal{
    if (_modalsStack.count > 0){
        return [_modalsStack lastObject];
    }
    return nil;
}

- (BOOL)hasModal:(BAModal *)modal{
    return (nil!=modal)&&([_modalsStack indexOfObject:modal] != NSNotFound);
}







@end
