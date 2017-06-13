
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
 * 博客    : http://boaihome.com
 
 *********************************************************************************
 
 */


#import <UIKit/UIKit.h>
#import <CoreLocation/CLLocation.h>

@class BAKit_CityModel;

/**
 选择器样式，默认为：BAKit_PickerViewTypeCity

 - BAKit_PickerViewTypeCity: 城市选择器
 - BAKit_PickerViewTypeArray: 普通数组自定义数据
 - BAKit_PickerViewTypeDate: 日期选择器：年月日，可以完全自定义 NSDateFormatter
 - BAKit_PickerViewTypeDateYM: 日期选择器：年月，可以完全自定义 NSDateFormatter
 - BAKit_PickerViewTypeDateWeek: 日期选择器：年周，如：2017年，第21周

 */
typedef NS_ENUM(NSUInteger, BAKit_PickerViewType) {
    BAKit_PickerViewTypeCity = 0,
    BAKit_PickerViewTypeArray,
    BAKit_PickerViewTypeDate,
    BAKit_PickerViewTypeDateYM,
    BAKit_PickerViewTypeDateWeek
};

/**
 日期选择器样式下返回的数据格式，默认为：BAKit_PickerViewDateTypeYMD

 - BAKit_PickerViewDateTypeYY: 如：2017
 - BAKit_PickerViewDateTypeYM: 如：2017-03
 - BAKit_PickerViewDateTypeYMD: 如：20172017-03-01
 - BAKit_PickerViewDateTypeYMDHMS: 如：2017-03-01 18:20:12
 - BAKit_PickerViewDateTypeYMDEHMS: 如：2017-03-01，周二, 18:20:12
 - BAKit_PickerViewDateTypeHM: 如：18:20
 - BAKit_PickerViewDateTypeHMS: 如：18:20:12
 */
typedef NS_ENUM(NSUInteger, BAKit_PickerViewDateType) {
    BAKit_PickerViewDateTypeYY = 0,
    BAKit_PickerViewDateTypeYM,
    BAKit_PickerViewDateTypeYMD,
    BAKit_PickerViewDateTypeYMDHMS,
    BAKit_PickerViewDateTypeYMDEHMS,
    BAKit_PickerViewDateTypeHM,
    BAKit_PickerViewDateTypeHMS
};

/**
 设置日期选择器的样式，具体的显示顺序取决于设备的本地化设置。默认为：BAKit_PickerViewDateModeDate

 - BAKit_PickerViewDateModeTime: 显示时、分、AM／PM标志(可选)
 - BAKit_PickerViewDateModeDate: 显示年、月、日
 - BAKit_PickerViewDateModeDateAndTime: 显示日期的月、日、星期，时间的时、分、AM／PM标志(可选)
 - BAKit_PickerViewDateModeCountDownTimer: 显示时、分。应用程序必须实现一个计数器（NSTimer对象），让倒计时中的时间不断减少。
 */
typedef NS_ENUM(NSInteger, BAKit_PickerViewDateMode) {
    BAKit_PickerViewDateModeTime,
    /*! 选择此样式后，dateType 默认为：BAKit_PickerViewDateTypeYMD */
    BAKit_PickerViewDateModeDate,
    /*! 选择此样式后，dateType 默认为：ba_setupDateFormatterWithYMDEHMS */
    BAKit_PickerViewDateModeDateAndTime,
    BAKit_PickerViewDateModeCountDownTimer
};

typedef NS_ENUM(NSUInteger, BAKit_PickerViewAnimationType) {
    BAKit_PickerViewAnimationTypeScale = 0,
    BAKit_PickerViewAnimationTypeTop,
    BAKit_PickerViewAnimationTypeBottom,
    BAKit_PickerViewAnimationTypeLeft,
    BAKit_PickerViewAnimationTypeRight
};

/**
 设置取消和确定按钮相对pickerView的位置
 
 - BAKit_PickerViewPositionTypeNormal: 默认PickerView在屏幕的底部
 - BAKit_PickerViewPositionTypeBottom: 设置pickerView在屏幕的中心
 
 */
typedef NS_ENUM(NSUInteger, BAKit_PickerViewPositionType) {
    BAKit_PickerViewPositionTypeNormal = 0,
    BAKit_PickerViewPositionTypeCenter,
};

/**
 设置取消和确定按钮相对pickerView的位置
 
 - BAKit_PickerViewButtonPositionTypeNormal: 默认“取消”和“确定”button在pickerView的顶部
 - BAKit_PickerViewButtonPositionTypeBottom: 设置“取消”和“确定”button在pickerView的底部
 
 */
typedef NS_ENUM(NSUInteger, BAKit_PickerViewButtonPositionType) {
    BAKit_PickerViewButtonPositionTypeNormal = 0,
    BAKit_PickerViewButtonPositionTypeBottom,
};

/**
 城市选择器的返回值

 @param model BAKit_CityModel
 */
typedef void (^BAKit_PickerViewBlock)(BAKit_CityModel *model);

/**
 普通数组自定义数据返回，日期选择器返回值

 @param resultString resultString
 */
typedef void (^BAKit_PickerViewResultBlock)(NSString *resultString);

@interface BAKit_PickerView : UIView

#pragma mark - 自定义样式
@property (nonatomic, copy) BAKit_PickerViewBlock block;
@property (nonatomic, copy) BAKit_PickerViewResultBlock resultBlock;

/*! 是否开启边缘触摸隐藏 默认：YES */
@property (nonatomic, assign) BOOL isTouchEdgeHide;

/**
 动画样式
 */
@property(nonatomic, assign) BAKit_PickerViewAnimationType animationType;

/**
 选择器样式，默认为城市选择器
 */
@property(nonatomic, assign) BAKit_PickerViewType pickerViewType;
@property(nonatomic, assign) BAKit_PickerViewDateType dateType;
@property(nonatomic, assign) BAKit_PickerViewDateMode dateMode;
@property(nonatomic, assign) BAKit_PickerViewButtonPositionType buttonPositionType;
@property(nonatomic, assign) BAKit_PickerViewPositionType pickerViewPositionType;

/**
 自定义 NSDateFormatter，返回的日期格式，注意：如果同时设置 BAKit_PickerViewDateType 和 customDateFormatter，以 customDateFormatter 为主
 */
@property(nonatomic, strong) NSDateFormatter *customDateFormatter;

/**
 自定义数据的数组，如：@[@"男", @"女"]
 */
@property(nonatomic, strong) NSArray *dataArray;

/**
 toolBar 背景颜色，默认：白色
 */
@property(nonatomic, strong) UIColor *backgroundColor_toolBar;

/**
 pickView 背景颜色，默认：白色
 */
@property(nonatomic, strong) UIColor *backgroundColor_pickView;

/**
 cancleButton title颜色，默认：黑色
 */
@property(nonatomic, strong) UIColor *buttonTitleColor_cancle;

/**
 sureButton title颜色，默认：黑色
 */
@property(nonatomic, strong) UIColor *buttonTitleColor_sure;

/**
 pickView 字体，默认：[UIFont boldSystemFontOfSize:17]，注意：日期选择器暂时不能修改字体，有可能被苹果审核不通过，如有特殊需求，可通过 runtime 修改
 */
@property(nonatomic, strong) UIFont *ba_pickViewFont;

/**
 pickView 字体颜色，默认：[UIColor blackColor]，注意：日期选择器暂时不能修改字体，有可能被苹果审核不通过，如有特殊需求，可通过 runtime 修改
 */
@property(nonatomic, strong) UIColor *ba_pickViewTextColor;


#pragma mark - custom method

/**
 快速创建一个 pickerView
 
 @param pickerViewType type 类型
 @param configuration 可以设置 BAKit_PickerView 的自定义内容
 @param block 回调
 */
+ (void)ba_creatPickerViewWithType:(BAKit_PickerViewType)pickerViewType
                     configuration:(void (^)(BAKit_PickerView *tempView))configuration
                             block:(BAKit_PickerViewResultBlock)block;

/**
 快速创建一个 城市选择器

 @param configuration 可以设置BAKit_PickerView 的自定义内容
 @param block 回调
 */
+ (void)ba_creatCityPickerViewWithConfiguration:(void (^)(BAKit_PickerView *tempView)) configuration
                                          block:(BAKit_PickerViewBlock)block;

/**
 快速创建一个 自定义单列 pickerView

 @param dataArray 数组
 @param configuration 可以设置BAKit_PickerView 的自定义内容
 @param block 回调
 */
+ (void)ba_creatCustomPickerViewWithDataArray:(NSArray *)dataArray
                                configuration:(void (^)(BAKit_PickerView *tempView)) configuration
                                        block:(BAKit_PickerViewResultBlock)block;
/**
 显示 pick
 */
- (void)ba_pickViewShow;

/**
 隐藏 pick
 */
- (void)ba_pickViewHidden;

@end

@interface BAKit_CityModel : NSObject

/**
 省
 */
@property (nonatomic, copy) NSString *province;

/**
 市
 */
@property (nonatomic, copy) NSString *city;

/**
 区
 */
@property (nonatomic, copy) NSString *area;

/**
 经纬度
 */
@property (nonatomic, assign) CLLocationCoordinate2D coordie;

@end


