//
//  BAKit_DefineCurrent.h
//  BAKit
//
//  Created by boai on 2017/6/9.
//  Copyright © 2017年 boai. All rights reserved.
//

#ifndef BAKit_DefineCurrent_h
#define BAKit_DefineCurrent_h

#import "NSDate+BAKit.h"
#import "NSDateFormatter+BAKit.h"
#import "NSString+BATime.h"

/**
 当前日期

 @return 当前日期
 */
CG_INLINE NSDate *
BAKit_Current_Date(void){
    return [NSDate date];
}

/**
 当前日历

 @return 当前日历
 */
CG_INLINE NSCalendar *
BAKit_Current_Calendar(void){
    return [NSCalendar currentCalendar];
}

/**
 当前时间【year】
 
 @return 当前时间【year】
 */
CG_INLINE NSInteger
BAKit_Current_Year(void){
    return BAKit_Current_Date().year;
}

/**
 当前时间【month】
 
 @return 当前时间【month】
 */
CG_INLINE NSInteger
BAKit_Current_Month(void){
    return BAKit_Current_Date().month;
}

/**
 当前时间【day】
 
 @return 当前时间【day】
 */
CG_INLINE NSInteger
BAKit_Current_Day(void){
    return BAKit_Current_Date().day;
}

/**
 当前时间【hour】
 
 @return 当前时间【hour】
 */
CG_INLINE NSInteger
BAKit_Current_Hour(void){
    return BAKit_Current_Date().hour;
}

/**
 当前时间【minute】
 
 @return 当前时间【minute】
 */
CG_INLINE NSInteger
BAKit_Current_Minute(void){
    return BAKit_Current_Date().minute;
}

/**
 当前时间【weekday】
 
 @return 当前时间【weekday】
 */
CG_INLINE NSString *
BAKit_Current_Weekday(void){
    return [NSString ba_time_getWeekdayWithDate:BAKit_Current_Date()];
}

/**
 当前时间【YMDHMS】
 
 @return 当前时间【YMDHMS】
 */
CG_INLINE NSString *
BAKit_Current_DateYMDHMS(void){
    return [NSString ba_time_getSystermCurrentDateYMDHMS];
}

/**
 当前时间【YMDHMS】
 
 @return 当前时间【YMDHMS】
 */
CG_INLINE NSString *
BAKit_Current_DateWithFormatString(NSString *formatString){
    return [NSString ba_time_getSystermCurrentDateWithFormatString:formatString];
}



#endif /* BAKit_DefineCurrent_h */
