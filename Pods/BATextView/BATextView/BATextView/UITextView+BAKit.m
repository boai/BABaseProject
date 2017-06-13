//
//  UITextView+BAKit.m
//  BAQMUIDemo
//
//  Created by boai on 2017/5/31.
//  Copyright © 2017年 boaihome. All rights reserved.
//

#import "UITextView+BAKit.h"
#import <objc/runtime.h>

#import "BATextView.h"

@interface UITextView ()

/**
 存储最后一次改变高度后的值
 */
@property(nonatomic, assign) CGFloat ba_lastHeight;

@end

@implementation UITextView (BAKit)

+ (void)load
{
    BAKit_Objc_exchangeMethodAToB(NSSelectorFromString(@"dealloc"),
                                  @selector(ba_textView_dealloc));
}

#pragma mark - custom method
- (BOOL)ba_textView_isEmpty
{
    return (self == nil || self.text == nil || self.text.length <= 0 || [self.text isEqualToString:@""] || [self.text isEqualToString:self.ba_placeholder]);
}

- (void)ba_textView_addNoti
{
    [self ba_removeNoti];
    
    [BAKit_NotiCenter addObserver:self selector:@selector(handleDidBeginEditingNotificationAction:) name:UITextViewTextDidBeginEditingNotification object:nil];
    [BAKit_NotiCenter addObserver:self selector:@selector(handleDidEndEditingNotificationAction:) name:UITextViewTextDidEndEditingNotification object:nil];
    
//    // 这些属性改变时，都要作出一定的改变，尽管已经监听了TextDidChange的通知，也要监听text属性，因为通知监听不到setText：
//    NSArray *propertys = @[@"frame", @"bounds", @"font", @"text", @"textAlignment", @"textContainerInset"];
//    
//    // 监听属性
//    for (NSString *property in propertys)
//    {
//        [self addObserver:self forKeyPath:property options:NSKeyValueObservingOptionNew context:nil];
//    }
}

#pragma mark - 通知事件处理
- (void)handleDidBeginEditingNotificationAction:(NSNotification *)notification
{
    if ([self.text isEqualToString:self.ba_placeholder] && [self isFirstResponder])
    {
//        NSLog(@"%s，开始编辑", __func__);
        self.text = @"";
        self.font = self.ba_textFont;
        self.textColor = self.ba_textColor;
    }
}

- (void)handleDidEndEditingNotificationAction:(NSNotification *)notification
{
    if ([self ba_textView_isEmpty])
    {
//        NSLog(@"%s，结束编辑", __func__);
        self.text = self.ba_placeholder;
        self.font = self.ba_placeholderFont;
        self.textColor = self.ba_placeholderColor;
    }
}

- (void)handleTextDidChangeNotificationAction:(NSNotification *)notification
{
    UITextView *textView = notification.object;

    if (self.ba_maxWordLimitNumber && [self isFirstResponder])
    {
        NSString *toBeString = textView.text;
        // 键盘输入模式
        NSString *lang = [[UIApplication sharedApplication] textInputMode].primaryLanguage;
        if ([lang isEqualToString:@"zh-Hans"])
        {
            // 简体中文输入，包括简体拼音，健体五笔，简体手写
            UITextRange *selectedRange = [textView markedTextRange];
            // 获取高亮部分
            UITextPosition *position = [textView positionFromPosition:selectedRange.start offset:0];
            // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
            if (!position)
            {
                if (toBeString.length >= self.ba_maxWordLimitNumber)
                {
                    textView.text = [toBeString substringToIndex:self.ba_maxWordLimitNumber];
                }
            }
            // 有高亮选择的字符串，则暂不对文字进行统计和限制
            else
            {
                
            }
        }
        // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
        else
        {
            if (toBeString.length >= self.ba_maxWordLimitNumber)
            {
                textView.text = [toBeString substringToIndex:self.ba_maxWordLimitNumber];
            }
        }
//        NSLog(@"内容：%@，\n字数：%lu", textView.text, (unsigned long)textView.text.length);

        if (self.ba_textView_WordDidChangedBlock)
        {
            self.ba_textView_WordDidChangedBlock(textView.text.length);
        }
    }
    
    // 计算高度，extern double ceil(double); 如果参数是小数，则求最小的整数但不小于本身.
    CGFloat current_textHeight = ceil([self sizeThatFits:CGSizeMake(self.bounds.size.width, CGFLOAT_MAX)].height);
    
    if (current_textHeight != self.ba_lastHeight)
    {
        CGFloat current_textViewHeight = current_textHeight >= self.ba_maxHeight ? self.ba_maxHeight : current_textHeight;
        
        if (current_textViewHeight >= self.ba_minHeight)
        {
            // 改变 textView 的高度
            CGRect new_frame = self.frame;
            if (current_textViewHeight > self.ba_maxHeight)
            {
                current_textViewHeight = self.ba_maxHeight;
            }
            
            new_frame.size.height = current_textViewHeight;
            self.frame = new_frame;
            
            if (self.ba_textView_HeightDidChangedBlock)
            {
                self.ba_textView_HeightDidChangedBlock(current_textViewHeight);
            }
            self.ba_lastHeight = current_textViewHeight;
            [self ba_scrollToBottomAnimated:NO];
        }
    }
}

/**
 快速设定自动布局
 
 @param maxHeight 最大高度
 @param minHeight 最小高度
 @param block BAKit_TextView_HeightDidChangedBlock
 */
- (void)ba_textView_autoLayoutWithMaxHeight:(CGFloat)maxHeight
                                  minHeight:(CGFloat)minHeight
                                      block:(BAKit_TextView_HeightDidChangedBlock)block
{
    self.ba_maxHeight = maxHeight;
    self.ba_minHeight = minHeight;
    self.ba_textView_HeightDidChangedBlock = block;
}

/**
 快速设定最大字数限制返回当前字数
 
 @param limitNumber 最大字数限制
 @param block BAKit_TextView_WordDidChangedBlock
 */
- (void)ba_textView_wordLimitWithMaxWordLimitNumber:(NSInteger)limitNumber
                                              block:(BAKit_TextView_WordDidChangedBlock)block
{
    self.ba_maxWordLimitNumber = limitNumber;
    self.ba_textView_WordDidChangedBlock = block;
}

- (void)ba_scrollToBottomAnimated:(BOOL)animated
{
    CGPoint off = self.contentOffset;
    off.y = self.contentSize.height - self.bounds.size.height + self.contentInset.bottom;
    [self setContentOffset:off animated:animated];
}

- (void)ba_textView_dealloc
{
    [self ba_removeNoti];
}

- (void)ba_removeNoti
{
    [BAKit_NotiCenter removeObserver:self name:UITextViewTextDidBeginEditingNotification object:nil];
    [BAKit_NotiCenter removeObserver:self name:UITextViewTextDidEndEditingNotification object:nil];
    [BAKit_NotiCenter removeObserver:self name:UITextViewTextDidChangeNotification object:nil];
}

- (void)ba_textView_default
{
    if (!self.ba_maxHeight)
    {
        self.ba_maxHeight = CGFLOAT_MAX;
    }
    if (!self.ba_textFont)
    {
        self.ba_textFont = [UIFont systemFontOfSize:15];
    }
    if (!self.ba_textColor)
    {
        self.ba_textColor = [UIColor blackColor];
    }
//    self.textContainerInset = UIEdgeInsetsMake(5, 0, 5, 15);
    [self ba_textView_addNoti];
}

#pragma mark - setter / getter
- (void)setBa_placeholder:(NSString *)ba_placeholder
{
    BAKit_Objc_setObj(@selector(ba_placeholder), ba_placeholder);
    self.text = self.ba_placeholder;
    [self ba_textView_default];
}

- (NSString *)ba_placeholder
{
    return BAKit_Objc_getObj;
}

- (void)setBa_placeholderColor:(UIColor *)ba_placeholderColor
{
    BAKit_Objc_setObj(@selector(ba_placeholderColor), ba_placeholderColor);
    self.textColor = self.ba_placeholderColor;
    [self ba_textView_default];
}

- (UIColor *)ba_placeholderColor
{
    return BAKit_Objc_getObj;
}

- (void)setBa_placeholderFont:(UIFont *)ba_placeholderFont
{
    BAKit_Objc_setObj(@selector(ba_placeholderFont), ba_placeholderFont);
    self.font = self.ba_placeholderFont;
    [self ba_textView_default];
}

- (UIFont *)ba_placeholderFont
{
    return BAKit_Objc_getObj;
}

- (void)setBa_maxHeight:(CGFloat)ba_maxHeight
{
    BAKit_Objc_setObj(@selector(ba_maxHeight), @(ba_maxHeight));
    [self ba_textView_default];
}

- (CGFloat)ba_maxHeight
{
    return [BAKit_Objc_getObj floatValue];
}

- (void)setBa_minHeight:(CGFloat)ba_minHeight
{
    BAKit_Objc_setObj(@selector(ba_minHeight), @(ba_minHeight));
    [self ba_textView_default];
}

- (CGFloat)ba_minHeight
{
    return [BAKit_Objc_getObj floatValue];
}

- (void)setBa_lastHeight:(CGFloat)ba_lastHeight
{
    BAKit_Objc_setObj(@selector(ba_lastHeight), @(ba_lastHeight));
}

- (CGFloat)ba_lastHeight
{
    return [BAKit_Objc_getObj floatValue];
}

- (void)setBa_textView_HeightDidChangedBlock:(BAKit_TextView_HeightDidChangedBlock)ba_textView_HeightDidChangedBlock
{
    BAKit_Objc_setObjCOPY(@selector(ba_textView_HeightDidChangedBlock), ba_textView_HeightDidChangedBlock);
    [self ba_textView_default];
    // 监听文字改变
    [BAKit_NotiCenter addObserver:self selector:@selector(handleTextDidChangeNotificationAction:) name:UITextViewTextDidChangeNotification object:nil];
}

- (BAKit_TextView_HeightDidChangedBlock)ba_textView_HeightDidChangedBlock
{
    return BAKit_Objc_getObj;
}

- (void)setBa_textFont:(UIFont *)ba_textFont
{
    BAKit_Objc_setObj(@selector(ba_textFont), ba_textFont);
    self.font = self.ba_textFont;
    [self ba_textView_default];
}

- (UIFont *)ba_textFont
{
    return BAKit_Objc_getObj;
}

- (void)setBa_textColor:(UIColor *)ba_textColor
{
    BAKit_Objc_setObj(@selector(ba_textColor), ba_textColor);
    self.textColor = ba_textColor;
    [self ba_textView_default];
}

- (UIColor *)ba_textColor
{
    return BAKit_Objc_getObj;
}

- (void)setBa_maxWordLimitNumber:(NSInteger)ba_maxWordLimitNumber
{
    BAKit_Objc_setObj(@selector(ba_maxWordLimitNumber), @(ba_maxWordLimitNumber));
}

- (NSInteger)ba_maxWordLimitNumber
{
    return [BAKit_Objc_getObj integerValue];
}

- (void)setBa_textView_WordDidChangedBlock:(BAKit_TextView_WordDidChangedBlock)ba_textView_WordDidChangedBlock
{
    BAKit_Objc_setObjCOPY(@selector(ba_textView_WordDidChangedBlock), ba_textView_WordDidChangedBlock);
    [self ba_textView_default];
    // 监听文字改变
    [BAKit_NotiCenter addObserver:self selector:@selector(handleTextDidChangeNotificationAction:) name:UITextViewTextDidChangeNotification object:nil];
}

- (BAKit_TextView_WordDidChangedBlock)ba_textView_WordDidChangedBlock
{
    return BAKit_Objc_getObj;
}

@end
