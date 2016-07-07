
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

#import "BAKitManager.h"

@interface BAKitManager (BALabel)

@property (nonatomic, copy, readonly) ba_sting               label_text;
@property (nonatomic, copy, readonly) ba_color               label_textColor;
@property (nonatomic, copy, readonly) ba_font                label_font;
@property (nonatomic, copy, readonly) ba_color               label_shadowColor;

@property (nonatomic, copy, readonly) ba_size                label_shadowOffset;
@property (nonatomic, copy, readonly) ba_textAlignment       label_textAlignment;
@property (nonatomic, copy, readonly) ba_lineBreakMode       label_lineBreakMode;
@property (nonatomic, copy, readonly) ba_attributedString    label_attributedString;

@property (nonatomic, readonly, copy) ba_color               label_highlightedTextColor;
@property (nonatomic, readonly, copy) ba_bool                label_highlighted;

@property (nonatomic, readonly, copy) ba_bool                label_userInteractionEnabled;
@property (nonatomic, readonly, copy) ba_bool                label_enabled;

@property (nonatomic, readonly, copy) ba_bool                label_adjustsFontSizeToFitWidth;

@property (nonatomic, readonly, copy) ba_integer             label_numberOfLines;
@property (nonatomic, readonly, copy) ba_baselineAdjustment  label_baselineAdjustment;
@property (nonatomic, readonly, copy) ba_float         label_minimumScaleFactor NS_AVAILABLE_IOS(6_0);
@property (nonatomic, readonly, copy) ba_bool          label_allowsDefaultTighteningForTruncation NS_AVAILABLE_IOS(9_0);
@property (nonatomic, readonly, copy) ba_float         label_preferredMaxLayoutWidth NS_AVAILABLE_IOS(6_0);

@end
