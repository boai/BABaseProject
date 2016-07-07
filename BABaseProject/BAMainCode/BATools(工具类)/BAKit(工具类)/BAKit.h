
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



#ifndef BAKit_h
#define BAKit_h


#pragma mark - ****** 系统类
/*! 系统类 */
#import "BALog.h"
#import "BAApp.h"

#pragma mark - ****** UIKit类
/*! UIKit类 */
// 控件类
//#import <BAButton.h>
#import "BAPickerView.h"
#import "BATextView.h"
#import "BAAlertView.h"


// 扩展类
#import "UIButton+BAKit.h"
#import "UIImage+BAKit.h"
#import "UIImageView+BAKit.h"
#import "UILabel+BAKit.h"
#import "UIScrollView+BAKit.h"
#import "UITableView+BAKit.h"
#import "UITextField+BAKit.h"
#import "UIView+BAKit.h"
#import "UIWebView+BAKit.h"

#import "UIColor+BAKit.h"
#import "UIFont+BAKit.h"
#import "UIWindow+BAKit.h"
#import "UIDevice+BAKit.h"

#pragma mark - ****** Foundation类
/*! Foundation类 */
#import "NSArray+BAKit.h"
#import "NSMutableArray+BAKit.h"
#import "NSDictionary+BAKit.h"
#import "NSMutableDictionary+BAKit.h"
#import "NSString+BAKit.h"

#import "NSFileManager+BAKit.h"
#import "NSNumber+BAKit.h"
#import "NSDate+BAKit.h"
#import "NSProcessInfo+BAKit.h"
#import "NSThread+BAKit.h"

#pragma mark - ****** 其他封装
/*! GCD */
#import "GCD/GCD.h"

#pragma mark - ****** BAKitManager类
/*! BAKitManager */
#import "BAKitManager.h"
#import "BAKitManager+BALabel.h"


#endif /* BAKit_h */
