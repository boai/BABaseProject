# BAPickView
[![BAHome Team Name](https://img.shields.io/badge/Team-BAHome-brightgreen.svg?style=flat)](https://github.com/BAHome "BAHome Team")
![](https://img.shields.io/badge/platform-iOS-red.svg) ![](https://img.shields.io/badge/language-Objective--C-orange.svg) 
![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 
![](https://img.shields.io/cocoapods/v/BAPickView.svg?style=flat) ![](https://img.shields.io/cocoapods/dt/BAPickView.svg
)  [![](https://img.shields.io/badge/微博-博爱1616-red.svg)](http://weibo.com/538298123)

## 1、功能及简介
* 1、城市选择器，三级联动，可返回省市县和精确的经纬度 <br>
* 2、可以自定义 array 显示，性别选择等【目前只支持单行数据】
* 3、日期选择器：年月日，可以完全自定义 NSDateFormatter
* 4、日期选择器：年月，可以完全自定义 NSDateFormatter
* 5、日期选择器：年周，如：2017年，第21周
* 6、横竖屏适配完美
* 7、可以自定义按钮颜色、背景颜色等
* 8、新增各种展示、消失动画，如：缩放、上下左右展示、消失动画等
* 9、可以自由设置 pickView 居中或者在底部显示，还可以自由定制 toolbar 居中或者在底部显示 <br>
* 10、可以自由设置 pickView 字体、字体颜色等内容，注意：日期选择器暂时不能修改字体，有可能被苹果审核不通过，如有特殊需求，可通过 runtime 修改 <br>

## 2、图片示例
![BAPickView.gif](https://github.com/BAHome/BAPickView/blob/master/Images/BAPickView.gif)

## 3、安装、导入示例和源码地址
* 1、pod 导入【最新版本：![](https://img.shields.io/cocoapods/v/BAPickView.svg?style=flat)】： <br>
 `pod 'BAPickView'`  <br>
如果发现 `pod search BAPickView` 搜索出来的不是最新版本，需要在终端执行 cd 转换文件路径命令退回到 desktop，然后执行 `pod setup` 命令更新本地spec缓存（可能需要几分钟），然后再搜索就可以了。<br>
具体步骤：
  - pod setup : 初始化
  - pod repo update : 更新仓库
  - pod search BAPickView
* 2、文件夹拖入：下载demo，把 BAPickView 文件夹拖入项目即可，<br>
* 3、导入头文件：<br>
`  #import "BAPickView_OC.h" `<br>
* 4、项目源码地址：<br>
 OC 版 ：[https://github.com/BAHome/BAPickView](https://github.com/BAHome/BAPickView)<br>

## 4、BAPickView 的类结构及 demo 示例
![BAPickView1.png](https://github.com/BAHome/BAPickView/blob/master/Images/BAPickView1.png)

### BAPickView_OC.h
```
#ifndef BAPickView_OC_h
#define BAPickView_OC_h

#import "BAKit_PickerView.h"
#import "BAPickView_Config.h"
#import "NSDate+BAKit.h"
#import "UIView+BARectCorner.h"
#import "NSDateFormatter+BAKit.h"
#import "UIView+BAAnimation.h"

/*!
 *********************************************************************************
 ************************************ 更新说明 ************************************
 *********************************************************************************
 
 欢迎使用 BAHome 系列开源代码 ！
 如有更多需求，请前往：https://github.com/BAHome
 
 项目源码地址：
 OC 版 ：https://github.com/BAHome/BAPickView
 
 最新更新时间：2017-06-03 【倒叙】 <br>
 最新Version：【Version：1.0.3】 <br>
 更新内容： <br>
 1.0.3.1、可以自由设置 pickView 居中或者在底部显示，还可以自由定制 toolbar 居中或者在底部显示 <br>
 1.0.3.2、可以自由设置 pickView 字体、字体颜色等内容，注意：日期选择器暂时不能修改字体，有可能被苹果审核不通过，如有特殊需求，可通过 runtime 修改 <br>
 
 最新更新时间：2017-05-27 【倒叙】 <br>
 最新Version：【Version：1.0.2】 <br>
 更新内容： <br>
 1.0.2.1、新增进出场动画，缩放、上下左右展示、消失动画  <br>
 1.0.2.2、修复 isTouchEdgeHide 失效的 bug <br>
 
 最新更新时间：2017-05-22 【倒叙】 <br>
 最新Version：【Version：1.0.1】 <br>
 更新内容： <br>
 1.0.1.1、新增年周选择器，如：2017年，第21周  <br>
 
 最新更新时间：2017-05-16 【倒叙】 <br>
 最新Version：【Version：1.0.0】 <br>
 更新内容： <br>
 1.0.0.1、城市选择器，三级联动，可返回省市县和精确的经纬度  <br>
 1.0.0.2、可以自定义 array 显示，性别选择等【目前只支持单行数据】  <br>
 1.0.0.3、日期选择器：年月日，可以完全自定义 NSDateFormatter  <br>
 1.0.0.4、日期选择器：年月，可以完全自定义 NSDateFormatter  <br>
 1.0.0.5、横竖屏适配完美  <br>
 1.0.0.6、可以自定义按钮颜色、背景颜色等  <br>
 1.0.0.7、理论完全兼容现有所有 iOS 系统版本  <br>

*/

#endif /* BAPickView_OC_h */
```

### BAKit_PickerView.h
```
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
```

### NSDate+BAKit.h
```
#import <Foundation/Foundation.h>


#define BAKit_Current_Calendar [NSCalendar currentCalendar]
#define BAKit_Current_Date     [NSDate date]

@interface NSDate (BAKit)

@property (nonatomic, readonly) NSInteger year;
@property (nonatomic, readonly) NSInteger month;
@property (nonatomic, readonly) NSInteger day;
@property (nonatomic, readonly) NSInteger nearestHour;
@property (nonatomic, readonly) NSInteger hour;
@property (nonatomic, readonly) NSInteger minute;
@property (nonatomic, readonly) NSInteger second;
@property (nonatomic, readonly) NSInteger nanosecond;
@property (nonatomic, readonly) NSInteger weekday;
//PRC 中国
@property (nonatomic, readonly) NSInteger weekdayPRC;
@property (nonatomic, readonly) NSInteger weekdayOrdinal;
@property (nonatomic, readonly) NSInteger weekOfMonth;
@property (nonatomic, readonly) NSInteger weekOfYear;
@property (nonatomic, readonly) NSInteger yearForWeekOfYear;
@property (nonatomic, readonly) NSInteger quarter;

/**
 确定每个月是否为闰月
 */
@property (nonatomic, readonly) BOOL isLeapMonth;

/**
 确定每个月是否为闰年
 */
@property (nonatomic, readonly) BOOL isLeapYear;

/**
 是否是今天
 */
@property (nonatomic, readonly) BOOL isToday;

/**
 是否是昨天
 */
@property (nonatomic, readonly) BOOL isYesterday;
@property (nonatomic, readonly) BOOL isTomorrow;
@property (nonatomic, readonly) BOOL isThisWeek;
@property (nonatomic, readonly) BOOL isNextWeek;
@property (nonatomic, readonly) BOOL isLastWeek;
@property (nonatomic, readonly) BOOL isThisMonth;
@property (nonatomic, readonly) BOOL isThisYear;
@property (nonatomic, readonly) BOOL isNextYear;
@property (nonatomic, readonly) BOOL isLastYear;
@property (nonatomic, readonly) BOOL isInFuture;
@property (nonatomic, readonly) BOOL isInPast;

@property (nonatomic, readonly) BOOL isTypicallyWorkday;
@property (nonatomic, readonly) BOOL isTypicallyWeekend;


/*!
 *  计算上报时间差: 几分钟前，几天前，传入 NSDate，自动解析
 *
 *  @return 计算上报时间差: 几分钟前，几天前
 */
- (NSString *)ba_dateFormattedWithDate;

/*!
 *  计算上报时间差: 几分钟前，几天前，传入 NSString 类型的 date，如：@"2017-04-25 11:18:01"，自动解析
 *
 *  @return 计算上报时间差: 几分钟前，几天前
 */
+ (NSString *)ba_dateCreated_at:(NSString *)date;

/*!
 *  获得一个比当前时间大n年的时间，格式为 yyyy-MM-dd
 */
+ (NSString *)ba_dateAfterYears:(NSInteger)count;

/*!
 *  返回一个只有年月日的时间
 */
- (NSDate *)ba_dateWithYMD;

- (NSDate *)ba_dateWithYM;

/*!
 *  获得与当前时间的差距
 */
- (NSDateComponents *)ba_dateDeltaWithNow;

/**
 距离当前的时间间隔描述

 @return 时间间隔描述
 */
- (NSString *)ba_dateTimeIntervalDescription;

/**
 精确到分钟的日期描述

 @return 日期描述
 */
- (NSString *)ba_dateMinuteDescription;

/**
 标准时间日期描述

 @return 标准时间日期描述
 */
- (NSString *)ba_dateFormattedTime;

/**
 当前日期 距离 1970 时间间隔毫秒

 @return 当前日期 距离 1970 时间间隔毫秒
 */
- (double)ba_dateTimeIntervalSince1970InMilliSecond;

/**
 距离 时间间隔毫秒 后的日期

 @param timeIntervalInMilliSecond 时间间隔毫秒
 @return 距离 时间间隔毫秒 后的日期
 */
+ (NSDate *)ba_dateWithTimeIntervalInMilliSecondSince1970:(double)timeIntervalInMilliSecond;

/**
 时间间隔格式化

 @param time 时间间隔
 @return 时间格式化
 */
+ (NSString *)ba_dateFormattedTimeFromTimeInterval:(long long)time;

#pragma mark UTC
//UTC世界统一时间
- (NSNumber *)ba_dateGetUtcTimeIntervalSince1970;
- (NSNumber *)ba_dateGetUtcTimeIntervalIntSince1970;
- (NSString *)ba_dateTimeIntervalStringSince1970;

#pragma mark - 距离当前日期最近的日期
+ (NSDate *)ba_dateTomorrow;
+ (NSDate *)ba_dateYesterday;
+ (NSDate *)ba_dateWithDaysFromNow:(NSInteger)days;
+ (NSDate *)ba_dateWithDaysBeforeNow:(NSInteger)days;
+ (NSDate *)ba_dateWithHoursFromNow:(NSInteger)dHours;
+ (NSDate *)ba_dateWithHoursBeforeNow:(NSInteger)dHours;
+ (NSDate *)ba_dateWithMinutesFromNow:(NSInteger)dMinutes;
+ (NSDate *)ba_dateWithMinutesBeforeNow:(NSInteger)dMinutes;

#pragma mark - 比较日期
- (BOOL)ba_dateIsEqualToDateIgnoringTime:(NSDate *)aDate;
- (BOOL)ba_dateIsSameWeekAsDate:(NSDate *)aDate;
- (BOOL)ba_dateIsSameMonthAsDate:(NSDate *)aDate;
- (BOOL)ba_dateIsSameYearAsDate:(NSDate *)aDate;
- (BOOL)ba_dateIsEarlierThanDate:(NSDate *)aDate;
- (BOOL)ba_dateIsLaterThanDate:(NSDate *)aDate;

#pragma mark - 调整日期
- (NSDate *)ba_dateByAddingDays:(NSInteger)dDays;
- (NSDate *)ba_dateBySubtractingDays:(NSInteger)dDays;
- (NSDate *)ba_dateByAddingHours:(NSInteger)dHours;
- (NSDate *)ba_dateBySubtractingHours:(NSInteger)dHours;
- (NSDate *)ba_dateByAddingMinutes:(NSInteger)dMinutes;
- (NSDate *)ba_dateBySubtractingMinutes:(NSInteger)dMinutes;
- (NSDate *)ba_dateAtStartOfDay;
- (NSDateComponents *)ba_dateComponentsWithOffsetFromDate:(NSDate *)aDate;

#pragma mark - 时间间隔
- (NSInteger)ba_dateMinutesAfterDate:(NSDate *)aDate;
- (NSInteger)ba_dateMinutesBeforeDate:(NSDate *)aDate;
- (NSInteger)ba_dateHoursAfterDate:(NSDate *)aDate;
- (NSInteger)ba_dateHoursBeforeDate:(NSDate *)aDate;
- (NSInteger)ba_dateDaysAfterDate:(NSDate *)aDate;
- (NSInteger)ba_dateDaysBeforeDate:(NSDate *)aDate;
- (NSInteger)ba_dateDistanceInDaysToDate:(NSDate *)anotherDate;
/**
 多少天之后
 */
- (NSDate *)ba_dateGetAfterYear:(int)year OrMonth:(int)month OrDay:(int)day;

#pragma mark - 一年有多少周
+ (NSString *)ba_dateGetWeekInyearOrMouth:(BOOL)inYear WithDate:(NSDate *)date;
// 2015、2009、004、1998 这四年是 53 周（目前已知），其余均是52周
+ (NSInteger)ba_dateGetWeekNumbersOfYear:(NSInteger)year;

@end

/**
 *  中国农历
 */

@interface NSDate (LunarCalendar)

/**
 * 例如 : 2016丙申年四月初一
 */

- (NSInteger)lunarShortYear;  // 农历年份,数字表示  2016

- (NSString *)lunarLongYear;  // 农历年份,干支表示  丙申年

- (NSInteger)lunarShortMonth; // 农历月份,数字表示  4

- (NSString *)lunarLongMonth; // 农历月份,汉字表示  四月

- (NSInteger)lunarShortDay;   // 农历日期,数字表示  1

- (NSString *)lunarLongDay;   // 农历日期,汉字表示  初一

- (NSString *)lunarSolarTerms;// 农历节气 (立春 雨水 惊蛰 春分...)

/** 传入阳历的年月日返回当天的农历节气 */
+ (NSString *)getLunarSolarTermsWithYear:(int)iYear Month:(int)iMonth Day:(int)iDay;

@end
```
### demo 示例
```
- (void)pickView1
{
    BAKit_WeakSelf
    [BAKit_PickerView ba_creatCityPickerViewWithConfiguration:^(BAKit_PickerView *tempView) {
        BAKit_StrongSelf
        // 设置“取消“和”确定“ button 在 pickerView 的底部
        tempView.buttonPositionType = BAKit_PickerViewButtonPositionTypeBottom;
        // 设置 pickerView 在屏幕中的位置
        tempView.pickerViewPositionType = BAKit_PickerViewPositionTypeCenter;
        // 是否开启边缘触摸隐藏 默认：YES
        tempView.isTouchEdgeHide = NO;
        // 动画样式
        tempView.animationType = BAKit_PickerViewAnimationTypeBottom;
        /**
         pickView 字体，默认：[UIFont boldSystemFontOfSize:17]
         */
        tempView.ba_pickViewFont = [UIFont systemFontOfSize:17];
        /**
         pickView 字体颜色，默认：[UIColor blackColor]
         */
        tempView.ba_pickViewTextColor = [UIColor orangeColor];
        
        self.pickView = tempView;
    } block:^(BAKit_CityModel *model) {
        BAKit_StrongSelf
        // 返回 BAKit_CityModel，包含省市县 和 详细的经纬度
        NSString *msg = [NSString stringWithFormat:@"%@%@%@\n纬度：%f\n经度：%f", model.province, model.city, model.area, model.coordie.latitude, model.coordie.longitude];
        NSLog(@"%@", msg);
        BAKit_ShowAlertWithMsg_ios8(msg);
    }];
}

- (void)pickView2
{
    NSArray *array = @[@"男", @"女"];
    
    BAKit_WeakSelf
    [BAKit_PickerView ba_creatCustomPickerViewWithDataArray:array configuration:^(BAKit_PickerView *tempView) {
        BAKit_StrongSelf
        // 可以自由定制 toolBar 和 pickView 的背景颜色
        tempView.backgroundColor_toolBar = [UIColor cyanColor];
        tempView.backgroundColor_pickView = [UIColor greenColor];
        tempView.animationType = BAKit_PickerViewAnimationTypeTop;
        tempView.pickerViewPositionType = BAKit_PickerViewPositionTypeCenter;
        self.pickView = tempView;
    } block:^(NSString *resultString) {
        BAKit_StrongSelf
        BAKit_ShowAlertWithMsg_ios8(resultString);
    }];
}

- (void)pickView3
{
    BAKit_WeakSelf
    [BAKit_PickerView ba_creatPickerViewWithType:BAKit_PickerViewTypeDate configuration:^(BAKit_PickerView *tempView) {
        BAKit_StrongSelf
        
        // 可以自由定制 NSDateFormatter
        tempView.dateMode = BAKit_PickerViewDateModeDate;
        tempView.dateType = BAKit_PickerViewDateTypeYMD;
//        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//        formatter.dateFormat = @"yyyy年MM月dd日";
//        tempView.customDateFormatter = formatter;
        // 可以自由定制按钮颜色
        tempView.buttonTitleColor_sure = [UIColor redColor];
        tempView.buttonTitleColor_cancle = [UIColor greenColor];
        tempView.animationType = BAKit_PickerViewAnimationTypeLeft;

        self.pickView = tempView;
        
    } block:^(NSString *resultString) {
        BAKit_StrongSelf
        BAKit_ShowAlertWithMsg_ios8(resultString);
    }];
}

- (void)pickView4
{
    BAKit_WeakSelf
    [BAKit_PickerView ba_creatPickerViewWithType:BAKit_PickerViewTypeDateYM configuration:^(BAKit_PickerView *tempView) {
        BAKit_StrongSelf
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyy-MM";
        tempView.customDateFormatter = formatter;
        tempView.animationType = BAKit_PickerViewAnimationTypeRight;
        self.pickView = tempView;
    } block:^(NSString *resultString) {
        BAKit_StrongSelf
        BAKit_ShowAlertWithMsg_ios8(resultString);
    }];
}

- (void)pickView5
{
    BAKit_WeakSelf
    [BAKit_PickerView ba_creatPickerViewWithType:BAKit_PickerViewTypeDateWeek configuration:^(BAKit_PickerView *tempView) {
        
        BAKit_StrongSelf
        self.pickView = tempView;
    } block:^(NSString *resultString) {
        BAKit_StrongSelf
        BAKit_ShowAlertWithMsg_ios8(resultString);
    }];
}

其他示例可下载demo查看源码！
```

## 5、更新记录：【倒叙】
 欢迎使用 [【BAHome】](https://github.com/BAHome) 系列开源代码 ！
 如有更多需求，请前往：[【https://github.com/BAHome】](https://github.com/BAHome) 
 
 最新更新时间：2017-06-03 【倒叙】 <br>
 最新Version：【Version：1.0.3】 <br>
 更新内容： <br>
 1.0.3.1、可以自由设置 pickView 居中或者在底部显示，还可以自由定制 toolbar 居中或者在底部显示 <br>
 1.0.3.2、可以自由设置 pickView 字体、字体颜色等内容，注意：日期选择器暂时不能修改字体，有可能被苹果审核不通过，如有特殊需求，可通过 runtime 修改 <br>
 
 最新更新时间：2017-05-27 【倒叙】 <br>
 最新Version：【Version：1.0.2】 <br>
 更新内容： <br>
 1.0.2.1、新增进出场动画，缩放、上下左右展示、消失动画  <br>
 1.0.2.2、修复 isTouchEdgeHide 失效的 bug <br>
 
 最新更新时间：2017-05-22 【倒叙】 <br>
 最新Version：【Version：1.0.1】 <br>
 更新内容： <br>
 1.0.1.1、新增年周选择器，如：2017年，第21周  <br>

 最新更新时间：2017-05-16 【倒叙】 <br>
 最新Version：【Version：1.0.0】 <br>
 更新内容： <br>
 1.0.0.1、城市选择器，三级联动，可返回省市县和精确的经纬度  <br>
 1.0.0.2、可以自定义 array 显示，性别选择等【目前只支持单行数据】  <br>
 1.0.0.3、日期选择器：年月日，可以完全自定义 NSDateFormatter  <br>
 1.0.0.4、日期选择器：年月，可以完全自定义 NSDateFormatter  <br>
 1.0.0.5、横竖屏适配完美  <br>
 1.0.0.6、可以自定义按钮颜色、背景颜色等  <br>
 1.0.0.7、理论完全兼容现有所有 iOS 系统版本  <br>

## 6、bug 反馈 和 联系方式
> 1、开发中遇到 bug，希望小伙伴儿们能够及时反馈与我们 BAHome 团队，我们必定会认真对待每一个问题！ <br>

> 2、联系方式 <br> 
QQ群：479663605  【注意：此群为 2 元 付费群，介意的小伙伴儿勿扰！】<br> 
博爱QQ：137361770 <br> 
博爱微博：[![](https://img.shields.io/badge/微博-博爱1616-red.svg)](http://weibo.com/538298123) <br> 

## 7、开发环境 和 支持版本
> 开发使用 Xcode Version 8.3.2 (8E2002) ，理论上支持所有 iOS 版本，如有版本适配问题，请及时反馈！多谢合作！

## 8、感谢
> 感谢 BAHome 团队成员倾力合作，后期会推出一系列 常用 UI 控件的封装，大家有需求得也可以在 issue 提出，如果合理，我们会尽快推出新版本！<br>

> BAHome 的发展离不开小伙伴儿的信任与推广，再次感谢各位小伙伴儿的支持！

