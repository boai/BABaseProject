
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

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class BAKitManager;

typedef BAKitManager *(^ba_color)(UIColor *);
typedef BAKitManager *(^ba_font)(UIFont *);

/*! string */
typedef BAKitManager *(^ba_sting)(NSString *);
typedef BAKitManager *(^ba_attributedString)(NSAttributedString *);

/*! text */
typedef BAKitManager *(^ba_color)(UIColor *);
typedef BAKitManager *(^ba_font)(UIFont *);
typedef BAKitManager *(^ba_textAlignment)(NSTextAlignment);
typedef BAKitManager *(^ba_lineBreakMode)(NSLineBreakMode);
typedef BAKitManager *(^ba_baselineAdjustment)(UIBaselineAdjustment );

/*! image */
typedef BAKitManager *(^ba_image)(UIImage *);
typedef BAKitManager *(^ba_image_state)(UIImage *, UIControlState);

/*! view */
typedef BAKitManager *(^ba_view)(UIView *);
typedef BAKitManager *(^ba_tintAdjustmentMode)(UIViewTintAdjustmentMode );

/*! 数据类型 */
typedef BAKitManager *(^ba_void)(void);
typedef BAKitManager *(^ba_float)(CGFloat);
typedef BAKitManager *(^ba_bool)(BOOL);
typedef BAKitManager *(^ba_bool_bool)(BOOL, BOOL);
typedef BAKitManager *(^ba_float_bool)(CGFloat, BOOL);
typedef BAKitManager *(^ba_point_bool)(CGPoint, BOOL);
typedef BAKitManager *(^ba_integer)(NSInteger);
typedef BAKitManager *(^ba_uinteger)(NSUInteger);

/*! size */
typedef BAKitManager *(^ba_edgeInsets)(UIEdgeInsets);
typedef BAKitManager *(^ba_rect)(CGRect);
typedef BAKitManager *(^ba_point)(CGPoint);
typedef BAKitManager *(^ba_size)(CGSize);
typedef BAKitManager *(^ba_range)(NSRange);
typedef BAKitManager *(^ba_transform)(CGAffineTransform transform);
typedef BAKitManager *(^ba_contentMode)(UIViewContentMode);


@interface BAKitManager : NSObject

/* category use,overlook */
@property (nonatomic, weak) id main;           //clear is UIControl or UIView

@property (nonatomic, weak) __kindof UILabel *ba_label;


@end
