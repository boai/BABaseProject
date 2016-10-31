
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
 * QQ     : 博爱1616【137361770】
 * 微博    : 博爱1616
 * Email  : 137361770@qq.com
 * GitHub : https://github.com/boai
 * 博客园  : http://www.cnblogs.com/boai/
 * 博客    : http://boai.github.io
 
 *********************************************************************************
 
 */

#import "BATextField.h"
#import <objc/runtime.h>

/*! 电话号码限制验证码限制(默认只能输入11位数字) */
static const void *phoneRestrictKey    = & phoneRestrictKey;
/*! 长度限制 */
static const void *lengthRestrictKey   = & lengthRestrictKey;
/*! 带小数点的数字限制(默认只能输入小数位后2位) */
static const void *decimalsRestrictKey = & decimalsRestrictKey;
/*! 验证码限制(默认只能输入6位数字) */
static const void *verCodeRestrictKey  = & verCodeRestrictKey;
/*! 限制只能输入数字 */
static const void *numberRestrictKey   = & numberRestrictKey;

@interface BATextField () <UITextFieldDelegate>

@end

@implementation BATextField

/*! 初始化配置 */
- (void)setup
{
    self.delegate         = self;
    self.phoneRestrict    = NO;
    self.decimalsRestrict = NO;
    self.verCodeRestrict  = NO;
    self.lengthRestrict   = 0;
    self.numberRestrict   = NO;
}

- (instancetype)init
{
    if (self = [super init])
    {
        [self performSelector:@selector(setup)];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self performSelector:@selector(setup)];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        [self performSelector:@selector(setup)];
    }
    return self;
}

#pragma mark - 重写电话号码限制getter和setter的方法
- (void)setPhoneRestrict:(BOOL)phoneRestrict
{
    /*! 
     objc_setAssociatedObject(self, &imageURLkey, url,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
     这四个后面的参数分别表示:源对象，关键字，关联的对象和一个关联策略。
     关键策略是一个枚举值。
     */
    /*! 指定一个弱引用关联的对象 */
    objc_setAssociatedObject(self, phoneRestrictKey, @(phoneRestrict), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)phoneRestrict
{
    /*! 
     objc_getAssociatedObject(self, &imageURLkey);  
     这个来获取关联的对象。
     
     但我们不需要关联时。需要移除关联
     objc_setAssociatedObject(self, &imageURLkey, nil, OBJC_ASSOCIATION_ASSIGN);
     */
    return [objc_getAssociatedObject(self, phoneRestrictKey) boolValue];
}

#pragma mark - 重写限制输入长度getter和setter的方法
- (void)setLengthRestrict:(NSInteger)lengthRestrict
{
    objc_setAssociatedObject(self, lengthRestrictKey, @(lengthRestrict), OBJC_ASSOCIATION_ASSIGN);
}

- (NSInteger)lengthRestrict
{
   return [objc_getAssociatedObject(self, lengthRestrictKey) integerValue];
}

#pragma mark - 重写带小数点的数字限制getter和setter的方法
- (void)setDecimalsRestrict:(BOOL)decimalsRestrict
{
    objc_setAssociatedObject(self, decimalsRestrictKey, @(decimalsRestrict), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)decimalsRestrict
{
    return [objc_getAssociatedObject(self, decimalsRestrictKey) boolValue];
}

#pragma mark - 重写验证码限制getter和setter的方法
- (void)setVerCodeRestrict:(BOOL)verCodeRestrict
{
    objc_setAssociatedObject(self, verCodeRestrictKey, @(verCodeRestrict), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)verCodeRestrict
{
    return [objc_getAssociatedObject(self, verCodeRestrictKey) boolValue];
}

#pragma mark - 限制只能输入数子
- (void)setNumberRestrict:(BOOL)numberRestrict
{
    objc_setAssociatedObject(self, numberRestrictKey, @(numberRestrict), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)numberRestrict
{
    return [objc_getAssociatedObject(self, numberRestrictKey) boolValue];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSUInteger lengthOfString = string.length;
    NSUInteger proposedNewLength = textField.text.length -range.length + lengthOfString;
    
    /*! 限制字符串长度 */
    if (self.lengthRestrict > 0)
    {
        if (proposedNewLength > self.lengthRestrict)
        {
            return NO;
        }
    }
    
    if (self.decimalsRestrict)
    {
        /*! 只允许数字输入 */
        for (NSInteger loopIndex = 0; loopIndex < lengthOfString; loopIndex ++)
        {
            unichar character = [string characterAtIndex:loopIndex];
            /*! 46 unichar for " . " */
            if (character < 46)
            {
                return NO;
            }
            /*! 47 unichar for " / " */
            if (character == 47)
            {
                return NO;
            }
            /*! 48 ~ 57 unichar for 0 ~ 9 */
            if (character > 57)
            {
                return NO;
            }
        }
        
        /*! 获取Textfield实际内容 */
        NSString *currentText = @"";
        if (range.length)
        {
            currentText = [textField.text substringWithRange:NSMakeRange(0, textField.text.length - range.length)];
        }
        else
        {
            currentText = [textField.text stringByAppendingString:string];
        }
        
        /*! 判断是否已经输入小数点 */
        if ([currentText rangeOfString:@"."].location != NSNotFound)
        {
            /*! 不能重复输入小数点(判断当前输入的字符是否是" . ",再判断原内容是否已经有" . ") */
            if ([string isEqualToString:@"."] && [textField.text rangeOfString:@"."].location != NSNotFound)
            {
                return false;
            }
            /*! 获取小数点在当前内容的坐标 */
            NSRange pointRange = [currentText rangeOfString:@"."];
            if ((currentText.length - 1) - pointRange.location > 2)
            {
                return false;
            }
        }
    }
    
    if (self.phoneRestrict || self.verCodeRestrict)
    {
        /*! 只允许数字输入 */
        for (NSInteger loopIndex = 0; loopIndex < lengthOfString; loopIndex++)
        {
            unichar character = [string characterAtIndex:loopIndex];
            if (character < 48 || character > 57)
            {
                return NO;
            }
        }
        
        if (self.phoneRestrict)
        {
            if (proposedNewLength > 11)
            {
                return NO;
            }
        }
        else if (self.verCodeRestrict)
        {
            if (proposedNewLength > 6)
            {
                return NO;
            }
        }
    }
    
    /*! 只允许数字输入 */
    if (self.numberRestrict)
    {
        for (NSInteger loopIndex = 0; loopIndex < lengthOfString; loopIndex++)
        {
            int character = [string characterAtIndex:loopIndex];
            if (character < 48 || character > 57)
            {
                return NO;
            }
            else
            {
                if (self.lengthRestrict > 0)
                {
                    if (proposedNewLength > self.lengthRestrict)
                    {
                        return NO;
                    }
                }
            }
        }
    }
    return YES;
}













@end
