//
//  UIButton+BAHook.m
//  BABaseProject
//
//  Created by 博爱 on 2016/11/3.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "UIButton+BAHook.h"
#import "NSObject+BAHook.h"
#import "BAUserStatistics.h"

static const void *buttonClickedCountKey       = &buttonClickedCountKey;
static const void *ButtonCurrentActionBlockKey = &ButtonCurrentActionBlockKey;

@implementation UIButton (BAHook)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        SEL originalSelector = @selector(addTarget:action:forControlEvents:);
        SEL swizzledSelector = @selector(swiz_addTarget:action:forControlEvents:);
        [[self class] ba_swizzlingOriginalSelector:originalSelector
                                  swizzledSelector:swizzledSelector];
        
    });
}

- (void)swiz_addTarget:(nullable id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
    __weak typeof(target) weakTarget = target;
    
    __weak typeof(self) weakSelf = self;
    
    /*! 利用 关联对象 给UIButton 增加了一个 block */
    if (action) {
        
        [self  setButtonCurrentActionBlock:^{
            @try {
                ((void (*)(void *, SEL,  typeof(weakSelf) ))objc_msgSend)((__bridge void *)(weakTarget), action , weakSelf);
            } @catch (NSException *exception) {
            } @finally {
            }
            
        }];
    }
    
    /*! 发送消息 其实是本身  要执行的action 先执行，写下来的 xw_clicked:方法 */
    [self swiz_addTarget:self action:@selector(ba_clicked:) forControlEvents:controlEvents];
}

- (void)ba_clicked:(UIButton *)sender
{
    self.buttonClickedCount ++;
    
    NSLog(@"%@ 点击 %ld次 ",[sender titleForState:UIControlStateNormal], self.buttonClickedCount);
    
    [BAUserStatistics sendEventToServer:@(self.buttonClickedCount).stringValue];
    
    /*! 执行原来要执行的方法 */
    sender.ButtonCurrentActionBlock();
}

#pragma mark - ***** 统计按钮点击次数
- (void)setButtonClickedCount:(NSInteger)buttonClickedCount
{
    objc_setAssociatedObject(self, buttonClickedCountKey, @(buttonClickedCount), OBJC_ASSOCIATION_ASSIGN);
}

- (NSInteger)buttonClickedCount
{
    return [objc_getAssociatedObject(self, buttonClickedCountKey) integerValue];
}

- (void)setButtonCurrentActionBlock:(void (^)())ButtonCurrentActionBlock
{
    objc_setAssociatedObject(self, ButtonCurrentActionBlockKey, ButtonCurrentActionBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)())ButtonCurrentActionBlock
{
    return objc_getAssociatedObject(self, ButtonCurrentActionBlockKey);
}



@end
