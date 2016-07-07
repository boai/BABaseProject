
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
 * QQ     : 可以添加ios开发技术群 479663605 在这里找到我(博爱1616【137361770】)
 * 微博    : 博爱1616
 * Email  : 137361770@qq.com
 * GitHub : https://github.com/boai
 * 博客园  : http://www.cnblogs.com/boai/
 * 博客    : http://boai.github.io
 
 *********************************************************************************
 
 */

#import "BAKitManager+BALabel.h"

@implementation BAKitManager (BALabel)

- (ba_sting)label_text
{
    __weak typeof(self) weakSelf = self;
    
    return ^BAKitManager *(NSString *text){
        weakSelf.ba_label.text = text;
        return weakSelf;
    };
}

- (ba_color)label_textColor
{
    __weak typeof(self) weakSelf = self;
    return ^BAKitManager *(UIColor *textColor){
        weakSelf.ba_label.textColor = textColor;
        return weakSelf;
    };
}

- (ba_font)label_font
{
    __weak typeof(self) weakSelf = self;
    return ^BAKitManager *(UIFont *font){
        weakSelf.ba_label.font = font;
        return weakSelf;
    };
}

- (ba_color)label_shadowColor
{
    __weak typeof(self) weakSelf = self;
    return ^BAKitManager *(UIColor *shadowColor){
        weakSelf.ba_label.shadowColor = shadowColor;
        return weakSelf;
    };
}

- (ba_bool )label_highlighted
{
    __weak typeof(self) weakSelf = self;
    return ^BAKitManager *(BOOL highlighted){
        weakSelf.ba_label.highlighted = highlighted;
        return weakSelf;
    };
}

- (ba_bool )label_userInteractionEnabled
{
    __weak typeof(self) weakSelf = self;

    return ^BAKitManager *(BOOL userInteractionEnabled){
        weakSelf.ba_label.userInteractionEnabled = userInteractionEnabled;
        return weakSelf;
    };
}

- (ba_bool )label_enabled
{
    __weak typeof(self) weakSelf = self;

    return ^BAKitManager *(BOOL enabled){
        weakSelf.ba_label.enabled = enabled;
        return weakSelf;
    };
}

- (ba_bool )label_adjustsFontSizeToFitWidth
{
    __weak typeof(self) weakSelf = self;

    return ^BAKitManager *(BOOL adjustsFontSizeToFitWidth){
        weakSelf.ba_label.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth;
        return weakSelf;
    };
}

- (ba_bool )label_allowsDefaultTighteningForTruncation
{
    __weak typeof(self) weakSelf = self;

    return ^BAKitManager *(BOOL allowsDefaultTighteningForTruncation){
        weakSelf.ba_label.allowsDefaultTighteningForTruncation = allowsDefaultTighteningForTruncation;
        return weakSelf;
    };
}

- (ba_color )label_highlightedTextColor
{
    __weak typeof(self) weakSelf = self;

    return ^BAKitManager *(UIColor *highlightedTextColor){
        weakSelf.ba_label.highlightedTextColor = highlightedTextColor;
        return weakSelf;
    };
}

- (ba_size )label_shadowOffset
{
    __weak typeof(self) weakSelf = self;

    return ^BAKitManager *(CGSize shadowOffset){
        weakSelf.ba_label.shadowOffset = shadowOffset;
        return weakSelf;
    };
}

- (ba_textAlignment )label_textAlignment
{
    __weak typeof(self) weakSelf = self;

    return ^BAKitManager *(NSTextAlignment textAlignment){
        weakSelf.ba_label.textAlignment = textAlignment;
        return weakSelf;
    };
}

- (ba_lineBreakMode )label_lineBreakMode
{
    __weak typeof(self) weakSelf = self;

    return ^BAKitManager *(NSLineBreakMode lineBreakMode){
        weakSelf.ba_label.lineBreakMode = lineBreakMode;
        return weakSelf;
    };
}

- (ba_attributedString )label_attributedText
{
    __weak typeof(self) weakSelf = self;

    return ^BAKitManager *(NSAttributedString *attributedText){
        weakSelf.ba_label.attributedText = attributedText;
        return weakSelf;
    };
}

- (ba_integer )label_numberOfLines
{
    __weak typeof(self) weakSelf = self;

    return ^BAKitManager *(NSInteger numberOfLines){
        weakSelf.ba_label.numberOfLines = numberOfLines;
        return weakSelf;
    };
}

- (ba_baselineAdjustment )label_baselineAdjustment
{
    __weak typeof(self) weakSelf = self;

    return ^BAKitManager *(UIBaselineAdjustment baselineAdjustment){
        weakSelf.ba_label.baselineAdjustment = baselineAdjustment;
        return weakSelf;
    };
}

- (ba_float )label_minimumScaleFactor
{
    __weak typeof(self) weakSelf = self;

    return ^BAKitManager *(CGFloat minimumScaleFactor){
        weakSelf.ba_label.minimumScaleFactor = minimumScaleFactor;
        return weakSelf;
    };
}

- (ba_float )label_preferredMaxLayoutWidth
{
    __weak typeof(self) weakSelf = self;

    return ^BAKitManager *(CGFloat preferredMaxLayoutWidth){
        weakSelf.ba_label.preferredMaxLayoutWidth = preferredMaxLayoutWidth;
        return weakSelf;
    };
}

@end
