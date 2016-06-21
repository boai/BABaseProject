
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

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/*! 主视图显示位置 */
typedef NS_ENUM(NSUInteger, BAModelPositionMode) {
    BAModelPositionCenter,
    BAModelPositionCenterTop,
    BAModelPositionCenterBottom,
    BAModelPositionCustom
};

/*! 动画所需时间 */
typedef CGFloat (^ba_modal_animation)();

/*! 回调 */
typedef void(^ba_modal_block)();

@interface BAModal : NSObject

/**
 * @discussion 所显示的主视图
 */
@property (strong, nonatomic, readonly) UIView *contentView;

/**
 * @discussion contentView位置，默认STModelPositionCenter
 */
@property (assign, nonatomic) BAModelPositionMode positionMode;

/**
 * @discussion 自定义位置，只有当position为STModelPositionCustom时生效
 */
@property (assign, nonatomic) CGPoint position;

/**
 * @discussion 点击contentView外的区域是否执行hide，默认为NO
 */
@property (assign, nonatomic) BOOL hideWhenTouchOutside;

/**
 * @discussion 当touchOutDismiss为YES时，是否发生动画，默认是YES
 */
@property (assign, nonatomic) BOOL animatedHideWhenTouchOutside;

/**
 * @discussion 背景是否加蒙版，默认为YES
 */
@property (assign, nonatomic) BOOL dimBackgroundWhenShow;

/**
 * @discussion 自定义背景蒙版颜色，默认为nil
 */
@property (strong, nonatomic) UIColor *dimBackgroundColor;


//// 当不设置执行动画时，且animated为YES，会默认执行一个过渡动画
/**
 * @discussion 显示时的动画
 */
@property (strong, nonatomic) ba_modal_animation showAnimation;

/**
 * @discussion 隐藏时的动画
 */
@property (strong, nonatomic) ba_modal_animation hideAnimation;

/**
 * @discussion 显示后/隐藏后回调
 */
@property (strong, nonatomic) ba_modal_block didShowHandler;
@property (strong, nonatomic) ba_modal_block didHideHandler;

/**
 * @discussion 显示
 */
- (void)show:(BOOL)animated;

/**
 * @discussion 显示指定的contentView，若之前已设置，则替换掉。
 */
- (void)showContentView:(UIView *)contentView animated:(BOOL)animated;

/**
 * @discussion 是否已经显示
 */
@property (assign, readonly, nonatomic) BOOL onShow;

/**
 * @discussion 隐藏
 */
- (void)hide:(BOOL)animated;






+ (instancetype)ba_modal;

+ (instancetype)ba_modalWithContentView:(UIView *)contentView;





@end
