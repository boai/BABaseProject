
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

#import <UIKit/UIKit.h>

/*! BATextField 样式枚举 */
typedef NS_ENUM(NSInteger, BATextFieldStyle) {
    /*! 默认 */
    BATextfieldStyleNone,
    /*! 手机号码格式化 【格式化结果：138 1111 1111】 */
    BATextfieldStylePhone,
    /*! 银行卡卡号格式化【格式化结果：1111 1111 1111 1234】 */
    BATextfieldStyleBank
};

@interface BATextField : UITextField

/*! textfiled 输入的格式化格式 有四种 */
@property (nonatomic) BATextFieldStyle textfieldStyle;

/*! 可以用 xib 直接设置 */

/**
 *  电话号码限制验证码限制(默认只能输入11位数字)
 */
@property (assign, nonatomic) IBInspectable BOOL phoneRestrict;
/**
 *  限制输入长度
 */
@property (assign, nonatomic) IBInspectable NSInteger lengthRestrict;
/**
 *  带小数点的数字限制(默认只能输入小数位后2位)
 */
@property (assign, nonatomic) IBInspectable BOOL decimalsRestrict;
/**
 *  验证码限制(默认只能输入6位数字)
 */
@property (assign, nonatomic) IBInspectable BOOL verCodeRestrict;
/**
 *  限制只能输入数字
 */
@property (assign, nonatomic) IBInspectable BOOL numberRestrict;


@end
