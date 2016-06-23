//
//  DemoVC13.m
//  BABaseProject
//
//  Created by 博爱 on 16/6/23.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC13.h"

@interface DemoVC13 ()

@end

@implementation DemoVC13

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self test1];
//    [self test2];
//    [self test3];
//    [self test4];
//    [self test5];
    [self test6];
}

/*! 
 GCD基础知识1
 如果是在子线程中调用 同步函数 + 主队列, 那么没有任何问题
 */
- (void)test1
{
    /*! 
     1、什么是GCD？
     全称是Grand CentralDispatch，可译为“伟大的中枢调度器”
     纯C语言，提供了非常多强大的函数
     
     2、GCD的优势
     GCD是苹果公司为多核的并行运算提出的解决方案
     GCD会自动利用更多的CPU内核（比如双核、四核）
     GCD会自动管理线程的生命周期（创建线程、调度任务、销毁线程），相比NSThread需要手动管理线程声明周期
     只需要告诉GCD想要执行什么任务，不需要编写任何线程管理代码
     
     3、GCD中有2个核心概念：任务、队列
     任务：执行什么操作
     队列：用来存放任务
     队列的类型：并发队列 与 串行队列
     将任务添加到队列中，GCD会自动将队列中的任务取出，放到对应的线程中执行，任务的取出遵循队列的  FIFO原则：先进先出，后进后出

     */
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    /*! 
     异步 dispatch_async：可以在新的线程中执行任务，具备开启新线程的能力
     dispatch_`async`(dispatch_queue_tqueue, dispatch_block_tblock);
     另外一个执行任务的方法：dispatch_barrier_async 栅栏

     场景：在前面的任务执行结束后它才执行，而且它后面的任务等它执行完成之后才会执行
     注意：这个queue不能是全局的并发队列
     
     dispatch_barrier_async(dispatch_queue_tqueue, dispatch_block_tblock);
     */
    dispatch_async(queue, ^{
       
            /*! block会在子线程中执行 */
         BALog(@"线程1：%@", [NSThread currentThread]);
        
        /*! 
         
         同步 dispatch_sync : 只能在当前线程中执行任务，不具备开启新线程的能力
         注意：使用sync函数往当前串行队列中添加任务，会卡住当前的串行队列
         
         */
        dispatch_sync(queue, ^{
           
            /*! block一定会在主线程执行 */
            BALog(@"线程2：%@", [NSThread currentThread]);
        });
    });
    
    
    /*! 打印结果 */
    
    /*! 
     线程1：<NSThread: 0x170470740>{number = 8, name = (null)}
     线程2：<NSThread: 0x170470740>{number = 8, name = (null)}
     */
    
}

/*! 
 GCD基础知识2
 如果是在主线程中调用同步函数 + 主队列, 那么会导致死锁
 导致死锁的原因:
 sync函数是在主线程中执行的, 并且会等待block执行完毕. 先调用
 block是添加到主队列的, 也需要在主线程中执行. 后调用
 */
- (void)test2
{
//    if ([NSThread currentThread])
//    {
//        BALog(@"线程3：%@", [NSThread currentThread]);
//    }
    
    /*! 主队列: */
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    /*! 如果是调用 同步函数, 那么会等同步函数中的任务执行完毕, 才会执行后面的代码 */
    /*! 
     注意: 如果dispatch_sync方法是在主线程中调用的, 并且传入的队列是主队列, 那么会导致死锁 
     */
    dispatch_sync(queue, ^{
       
        BALog(@"线程4：%@", [NSThread currentThread]);
        
    });
    
    /*! 打印结果 */
    
    /*!
    
     线程2：<NSThread: 0x17007cf40>{number = 1, name = main}
     线程1：<NSThread: 0x170669500>{number = 8, name = (null)}
     
     此处
     会崩掉！
     
     */
}

/*! 
 GCD基础知识3
 异步 + 主队列 : 不会创建新的线程, 并且任务是在主线程中执行
 */
- (void)test3
{
    /*! 
     主队列:
     特点: 只要将任务添加到主队列中, 那么任务"一定"会在主线程中执行
     无论你是调用同步函数还是异步函数
     */
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_async(queue, ^{
        BALog(@"线程5：%@", [NSThread currentThread]);
    });
    
    /*! 打印结果 */

    /*!
     线程5：<NSThread: 0x17406ed00>{number = 1, name = main}
     */
}

/*!
 GCD基础知识4
 同步 + 并发 : 不会开启新的线程
 */
- (void)test4
{
    /*! 1.创建一个并发队列 */
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    /*! 2.将任务添加到队列中 */
    dispatch_sync(queue, ^{
        BALog(@"任务1：%@", [NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        BALog(@"任务2：%@", [NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        BALog(@"任务3：%@", [NSThread currentThread]);
    });
    BALog(@"线程6：%@", [NSThread currentThread]);
    
    /*! 打印结果 */
    /*!
     任务1：<NSThread: 0x17007af80>{number = 1, name = main}
     任务2：<NSThread: 0x17007af80>{number = 1, name = main}
     任务3：<NSThread: 0x17007af80>{number = 1, name = main}
     线程6：<NSThread: 0x17007af80>{number = 1, name = main}
     */
    
}

/*!
 GCD基础知识5
 异步 +　串行：会开启新的线程
 但是只会开启一个新的线程
 注意: 如果调用 异步函数, 那么不用等到函数中的任务执行完毕, 就会执行后面的代码
 */
- (void)test5
{
    /*! 1.创建串行队列 */
    dispatch_queue_t queue = dispatch_queue_create("com.boai", DISPATCH_QUEUE_SERIAL);
    /*! 
     能够创建新线程的原因:
     我们是使用"异步"函数调用
     只创建1个子线程的原因:
     我们的队列是串行队列
     */
    /*! 2.将任务添加到队列中 */
    dispatch_async(queue, ^{
        NSLog(@"任务1：%@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"任务2：%@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"任务3：%@", [NSThread currentThread]);
    });
    BALog(@"线程7：%@", [NSThread currentThread]);
    
    /*! 打印结果 */
    /*!
     线程7：<NSThread: 0x17006dc80>{number = 1, name = main}
     */
}

/*!
 GCD基础知识6
 异步 + 并发 : 会开启新的线程
 如果任务比较多, 那么就会开启多个线程
 */
- (void)test6
{
    /*!
     执行任务
     dispatch_async
     dispatch_sync
     */
    
    /*! 
     第一个参数: 队列的名称
     第二个参数: 告诉系统需要创建一个并发队列还是串行队列
     DISPATCH_QUEUE_SERIAL :串行
     DISPATCH_QUEUE_CONCURRENT　并发
     */
    //    dispatch_queue_t queue = dispatch_queue_create("com.boai", DISPATCH_QUEUE_CONCURRENT);
    
    // 系统内部已经给我们提供好了一个现成的并发队列
    
    /*
     第一个参数: iOS8以前是优先级, iOS8以后是服务质量
     iOS8以前
     *  - DISPATCH_QUEUE_PRIORITY_HIGH          高优先级 2
     *  - DISPATCH_QUEUE_PRIORITY_DEFAULT:      默认的优先级 0
     *  - DISPATCH_QUEUE_PRIORITY_LOW:          低优先级 -2
     *  - DISPATCH_QUEUE_PRIORITY_BACKGROUND:
     
     iOS8以后
     *  - QOS_CLASS_USER_INTERACTIVE  0x21 用户交互(用户迫切想执行任务)
     *  - QOS_CLASS_USER_INITIATED    0x19 用户需要
     *  - QOS_CLASS_DEFAULT           0x15 默认
     *  - QOS_CLASS_UTILITY           0x11 工具(低优先级, 苹果推荐将耗时操作放到这种类型的队列中)
     *  - QOS_CLASS_BACKGROUND        0x09 后台
     *  - QOS_CLASS_UNSPECIFIED       0x00 没有设置
     
     第二个参数: 废物
     */

    
}




@end
