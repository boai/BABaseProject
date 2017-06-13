
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

#ifndef BAKit_DefineCommon_h
#define BAKit_DefineCommon_h

#ifndef __OPTIMIZE__
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...){}
#endif

#pragma mark - weak / strong
    #define BAKit_WeakSelf        @BAKit_Weakify(self);
    #define BAKit_StrongSelf      @BAKit_Strongify(self);

/*！
 * 强弱引用转换，用于解决代码块（block）与强引用self之间的循环引用问题
 * 调用方式: `@BAKit_Weakify`实现弱引用转换，`@BAKit_Strongify`实现强引用转换
 *
 * 示例：
 * @BAKit_Weakify
 * [obj block:^{
     * @strongify_self
     * self.property = something;
 * }];
 */
#ifndef BAKit_Weakify
    #if DEBUG
        #if __has_feature(objc_arc)
            #define BAKit_Weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
        #else
            #define BAKit_Weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
        #endif
    #else
        #if __has_feature(objc_arc)
            #define BAKit_Weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
        #else
            #define BAKit_Weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
        #endif
    #endif
#endif

/*！
 * 强弱引用转换，用于解决代码块（block）与强引用对象之间的循环引用问题
 * 调用方式: `@BAKit_Weakify(object)`实现弱引用转换，`@BAKit_Strongify(object)`实现强引用转换
 *
 * 示例：
 * @BAKit_Weakify(object)
 * [obj block:^{
     * @BAKit_Strongify(object)
     * strong_object = something;
 * }];
 */
#ifndef BAKit_Strongify
    #if DEBUG
        #if __has_feature(objc_arc)
            #define BAKit_Strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
        #else
            #define BAKit_Strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
        #endif
    #else
        #if __has_feature(objc_arc)
            #define BAKit_Strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
        #else
            #define BAKit_Strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
        #endif
    #endif
#endif

/*! 主线程同步队列 */
#define dispatch_main_sync_safe(block)\
    if ([NSThread isMainThread]) {\
    block();\
    } else {\
    dispatch_sync(dispatch_get_main_queue(), block);\
    }
/*! 主线程异步队列 */
#define dispatch_main_async_safe(block)\
    if ([NSThread isMainThread]) {\
    block();\
    } else {\
    dispatch_async(dispatch_get_main_queue(), block);\
    }

#pragma mark - runtime
/*! runtime set */
#define BAKit_Objc_setObj(key, value) objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC)

/*! runtime setCopy */
#define BAKit_Objc_setObjCOPY(key, value) objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_COPY)

/*! runtime get */
#define BAKit_Objc_getObj objc_getAssociatedObject(self, _cmd)

/*! runtime exchangeMethod */
#define BAKit_Objc_exchangeMethodAToB(methodA,methodB) method_exchangeImplementations(class_getInstanceMethod([self class], methodA), class_getInstanceMethod([self class], methodB));

/*! 懒加载 */
#define BAKit_Lazy(object, assignment) (object = object ?: assignment)


#pragma mark - NotiCenter
    #define BAKit_NotiCenter [NSNotificationCenter defaultCenter]

#define BAKit_NSUserDefaults [NSUserDefaults standardUserDefaults]

/*! 获取sharedApplication */
#define BAKit_SharedApplication    [UIApplication sharedApplication]



/*! 用safari打开URL */
#define BAKit_OpenUrl(urlStr)      [BAKit_SharedApplication openURL:[NSURL URLWithString:urlStr]]

/*! 复制文字内容 */
#define BAKit_CopyContent(content) [[UIPasteboard generalPasteboard] setString:content]

#define BAKit_ImageName(imageName)  [UIImage imageNamed:imageName]
#define BAKit_ImageBADiscoveryName(imageName) BAKit_ImageName([@"BADiscovery.bundle/" stringByAppendingString:imageName])
#define BAKit_ImageBAProfileName(imageName) BAKit_ImageName([@"BAProfile.bundle/" stringByAppendingString:imageName])
#define BAKit_ImageBATabBundleName(imageName) BAKit_ImageName([@"BATabBundle.bundle/" stringByAppendingString:imageName])
#define BAKit_ImageBAWeXinAppName(imageName) BAKit_ImageName([@"BAWeXinApp.bundle/" stringByAppendingString:imageName])

/*! 默认图片 */
#define BAKit_DefaultImage      BAKit_ImageName(@"image_default")
#define BAKit_DefaultUserImage  BAKit_ImageName(@"contacts_defult")
#define BAKit_DefaultVideoImage BAKit_ImageName(@"video_defult")

/*! 默认文字 */
#define BAKit_DefaultLoading             @"加载中..."
#define BAKit_DefaultLoading_location    @"定位中，请稍后..."

#pragma mark - 获取时间间隔
/*! 获取时间间隔 */
#define BAKit_CFAbsoluteTime_start  CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
#define BAKit_CFAbsoluteTime_end   CFAbsoluteTime end = CFAbsoluteTimeGetCurrent(); \
NSLog(@"获取时间间隔 = %f", end -start);

#pragma mark - 获取沙盒目录路径
/*! 获取沙盒 Cache 目录路径 */
#define BAKit_Path_Cache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]

/*! 获取沙盒 home 目录路径 */
#define BAKit_Path_Home NSHomeDirectory()


#pragma mark - 简单警告框
    /*! view 用 BAKit_ShowAlertWithMsg */
    #define BAKit_ShowAlertWithMsg(msg) [[[UIAlertView alloc] initWithTitle:@"温馨提示" message:(msg) delegate:nil cancelButtonTitle:@"确 定" otherButtonTitles:nil] show];
    /*! VC 用 BAKit_ShowAlertWithMsg */
    #define BAKit_ShowAlertWithMsg_ios8(msg) UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:msg preferredStyle:UIAlertControllerStyleAlert];\
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确 定" style:UIAlertActionStyleDefault handler:nil];\
        [alert addAction:sureAction];\
        [self presentViewController:alert animated:YES completion:nil];

#pragma mark - 内联函数
/*!
 为什么引入内联函数：
 引入内联函数是为了解决函数调用效率的问题
 由于函数之间的调用，会从一个内存地址调到另外一个内存地址，当函数调用完毕之后还会返回原来函数执行的地址。函数调用会有一定的时间开销，引入内联函数就是为了解决这一问题
 
 使用内联函数 和 宏定义的区别：
 1.使用inline修饰的函数，在编译的时候，会把代码直接嵌入调用代码中。就相当于用#define 宏定义来定义一个add 函数那样！与#define的区别是:
 1)#define定义的格式要有要求，而使用inline则就行平常写函数那样，只要加上 inline 即可！
 2)使用#define宏定义的代码，编译器不会对其进行参数有效性检查，仅仅只是对符号表进行替换。
 3）#define宏定义的代码，其返回值不能被强制转换成可转换的适合的转换类型。可参考百度文科 关于inline
 
 2.在inline加上`static修饰符，只是为了表明该函数只在该文件中可见！也就是说，在同一个工程中，就算在其他文件中也出现同名、同参数的函数也不会引起函数重复定义的错误！
 */

#pragma mark 随机数
/*!
 *  获取一个随机整数范围在：[0,i)包括0，不包括i
 *
 *  @param i 最大的数
 *
 *  @return 获取一个随机整数范围在：[0,i)包括0，不包括i
 */
/*!
 rand()和random()实际并不是一个真正的伪随机数发生器，在使用之前需要先初始化随机种子，否则每次生成的随机数一样。
 arc4random() 是一个真正的伪随机算法，不需要生成随机种子，因为第一次调用的时候就会自动生成。而且范围是rand()的两倍。在iPhone中，RAND_MAX是0x7fffffff (2147483647)，而arc4random()返回的最大值则是 0x100000000 (4294967296)。
 精确度比较：arc4random() > random() > rand()。
 */
CG_INLINE NSInteger
BAKit_RandomNumber(NSInteger i){
    return arc4random() % i;
}

/**
 计算列数【根据 array.count、每行多少个 item，计算列数】
 
 @param array array
 @param rowCount 每行多少个 item
 @return 列数
 */
CG_INLINE NSInteger
BAKit_getColumnCountWithArrayAndRowCount(NSArray *array, NSInteger rowCount){
    NSUInteger count = array.count;
    
    NSUInteger i = 0;
    if (count % rowCount == 0)
    {
        i = count / rowCount;
    }
    else
    {
        i = count / rowCount + 1;
    }
    return i;
}

CG_INLINE NSUInteger BAKit_hexStrToInt(NSString *str) {
    uint32_t result = 0;
    sscanf([str UTF8String], "%X", &result);
    return result;
}

#import "NSString+BATrims.h"
CG_INLINE BOOL BAKit_hexStrToRGBA(NSString *str,
                                  CGFloat *r, CGFloat *g, CGFloat *b, CGFloat *a) {
    str = [[str ba_trimWhitespaceAndNewlines] uppercaseString];
    if ([str hasPrefix:@"#"]) {
        str = [str substringFromIndex:1];
    } else if ([str hasPrefix:@"0X"]) {
        str = [str substringFromIndex:2];
    }
    
    NSUInteger length = [str length];
    //         RGB            RGBA          RRGGBB        RRGGBBAA
    if (length != 3 && length != 4 && length != 6 && length != 8) {
        return NO;
    }
    
    //RGB,RGBA,RRGGBB,RRGGBBAA
    if (length < 5) {
        *r = BAKit_hexStrToInt([str substringWithRange:NSMakeRange(0, 1)]) / 255.0f;
        *g = BAKit_hexStrToInt([str substringWithRange:NSMakeRange(1, 1)]) / 255.0f;
        *b = BAKit_hexStrToInt([str substringWithRange:NSMakeRange(2, 1)]) / 255.0f;
        if (length == 4)  *a = BAKit_hexStrToInt([str substringWithRange:NSMakeRange(3, 1)]) / 255.0f;
        else *a = 1;
    } else {
        *r = BAKit_hexStrToInt([str substringWithRange:NSMakeRange(0, 2)]) / 255.0f;
        *g = BAKit_hexStrToInt([str substringWithRange:NSMakeRange(2, 2)]) / 255.0f;
        *b = BAKit_hexStrToInt([str substringWithRange:NSMakeRange(4, 2)]) / 255.0f;
        if (length == 8) *a = BAKit_hexStrToInt([str substringWithRange:NSMakeRange(6, 2)]) / 255.0f;
        else *a = 1;
    }
    return YES;
}

#pragma mark 从本地文件读取数据
/*!
 从本地文件读取数据

 @param fileName 文件名
 @param type type 类型
 @return data
 */
CG_INLINE NSData *
BAKit_GetDataWithContentsOfFile(NSString *fileName, NSString *type){
    return [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:fileName ofType:type]];
}

#pragma mark json 解析 data 数据
/*!
 json 解析 data 数据

 @param data 需要解析的 data
 @return NSDictionary
 */
CG_INLINE NSDictionary *
BAKit_GetDictionaryWithData(NSData *data){
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
}

#pragma mark json 解析 ，直接从本地文件读取 json 数据，返回 NSDictionary
/*!
 json 解析 data 数据
 
 @param fileName 文件名
 @param type type 类型
 @return NSDictionary
 */
CG_INLINE NSDictionary *
BAKit_GetDictionaryWithContentsOfFile(NSString *fileName, NSString *type){
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:fileName ofType:type]];
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
}



#endif /* BAKit_DefineCommon_h */
