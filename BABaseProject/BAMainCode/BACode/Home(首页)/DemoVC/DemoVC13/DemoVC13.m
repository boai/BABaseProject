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
//    [self test6];
    
    [self test11];
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

- (void)test11
{
    //    [self ba_syncConcurrent];
    
    //    [self ba_asyncConcurrent];
    
    //    [self ba_syncSerial];
    
    //    [self ba_asyncSerial];
    
    //    [self ba_syncMain];
    
    //    dispatch_async(dispatch_queue_create("boai.queue", DISPATCH_QUEUE_CONCURRENT), ^{
    //        [self ba_syncMain];
    //    });
    
    //    [self ba_asyncMain];
    
    //    [self ba_asyncMain2];
    
    //    [self ba_barrier];
    
    //    [self ba_dispatch_after];
    
    //    [self ba_dispatch_once];
    
    //    [self ba_dispatch_apply];
    
    [self ba_dispatch_group_async];
}

#pragma mark - **** 1. 并发队列 + 同步执行 不会开启新线程，执行完一个任务，再执行下一个任务
- (void)ba_syncConcurrent
{
    NSLog(@"syncConcurrent---begin");
    dispatch_queue_t queue = dispatch_queue_create("test.queue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_sync(queue, ^{
        for (int i = 0; i < 3; i ++)
        {
            NSLog(@"线程1-1------%@",[NSThread currentThread]);
        }
    });
    
    dispatch_sync(queue, ^{
        for (int i = 0; i < 3; i ++)
        {
            NSLog(@"线程1-2------%@",[NSThread currentThread]);
        }
    });
    
    dispatch_sync(queue, ^{
        for (int i = 0; i < 3; i ++)
        {
            NSLog(@"线程1-3------%@",[NSThread currentThread]);
        }
    });
    
    NSLog(@"syncConcurrent---end");
    
    /*!
     从并发队列 + 同步执行中可以看到，所有任务都是在主线程中执行的。由于只有一个线程，所以任务只能一个一个执行。
     同时我们还可以看到，所有任务都在打印的syncConcurrent---begin和syncConcurrent---end之间，这说明任务是添加到队列中马上执行的。
     */
    
    /*!
     输出结果：
     2016-11-16 14:37:47.411 GCDTestDemo[18432:559826] syncConcurrent---begin
     2016-11-16 14:37:47.413 GCDTestDemo[18432:559826] 线程1------<NSThread: 0x7fc7d4504970>{number = 1, name = main}
     2016-11-16 14:37:47.413 GCDTestDemo[18432:559826] 线程1------<NSThread: 0x7fc7d4504970>{number = 1, name = main}
     2016-11-16 14:37:47.413 GCDTestDemo[18432:559826] 线程1------<NSThread: 0x7fc7d4504970>{number = 1, name = main}
     2016-11-16 14:37:47.413 GCDTestDemo[18432:559826] 线程2------<NSThread: 0x7fc7d4504970>{number = 1, name = main}
     2016-11-16 14:37:47.413 GCDTestDemo[18432:559826] 线程2------<NSThread: 0x7fc7d4504970>{number = 1, name = main}
     2016-11-16 14:37:47.414 GCDTestDemo[18432:559826] 线程2------<NSThread: 0x7fc7d4504970>{number = 1, name = main}
     2016-11-16 14:37:47.414 GCDTestDemo[18432:559826] 线程3------<NSThread: 0x7fc7d4504970>{number = 1, name = main}
     2016-11-16 14:37:47.414 GCDTestDemo[18432:559826] 线程3------<NSThread: 0x7fc7d4504970>{number = 1, name = main}
     2016-11-16 14:37:47.414 GCDTestDemo[18432:559826] 线程3------<NSThread: 0x7fc7d4504970>{number = 1, name = main}
     2016-11-16 14:37:47.414 GCDTestDemo[18432:559826] syncConcurrent---end
     
     */
}

#pragma mark - **** 2. 并发队列 + 异步执行 可同时开启多线程，任务交替执行
- (void)ba_asyncConcurrent
{
    NSLog(@"asyncConcurrent---begin");
    
    dispatch_queue_t queue = dispatch_queue_create("test.queue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 3; i ++)
        {
            NSLog(@"线程2-1------%@",[NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 3; i ++)
        {
            NSLog(@"线程2-2------%@",[NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 3; i ++)
        {
            NSLog(@"线程2-3------%@",[NSThread currentThread]);
        }
    });
    
    NSLog(@"asyncConcurrent---end");
    
    /*!
     在并发队列 + 异步执行中可以看出，除了主线程，又开启了3个线程，并且任务是交替着同时执行的。
     另一方面可以看出，所有任务是在打印的syncConcurrent---begin和syncConcurrent---end之后才开始执行的。说明任务不是马上执行，而是将所有任务添加到队列之后才开始同步执行。
     */
    
    /*!
     输出结果：
     
     2016-11-16 14:48:16.639 GCDTestDemo[18669:577059] asyncConcurrent---begin
     2016-11-16 14:48:16.640 GCDTestDemo[18669:577102] 线程2-1------<NSThread: 0x7f9c94d19c50>{number = 2, name = (null)}
     2016-11-16 14:48:16.640 GCDTestDemo[18669:577059] asyncConcurrent---end
     2016-11-16 14:48:16.640 GCDTestDemo[18669:577103] 线程2-2------<NSThread: 0x7f9c94c13690>{number = 3, name = (null)}
     2016-11-16 14:48:16.640 GCDTestDemo[18669:577146] 线程2-3------<NSThread: 0x7f9c94d19870>{number = 4, name = (null)}
     2016-11-16 14:48:16.640 GCDTestDemo[18669:577102] 线程2-1------<NSThread: 0x7f9c94d19c50>{number = 2, name = (null)}
     2016-11-16 14:48:16.641 GCDTestDemo[18669:577103] 线程2-2------<NSThread: 0x7f9c94c13690>{number = 3, name = (null)}
     2016-11-16 14:48:16.641 GCDTestDemo[18669:577146] 线程2-3------<NSThread: 0x7f9c94d19870>{number = 4, name = (null)}
     2016-11-16 14:48:16.641 GCDTestDemo[18669:577102] 线程2-1------<NSThread: 0x7f9c94d19c50>{number = 2, name = (null)}
     2016-11-16 14:48:16.642 GCDTestDemo[18669:577103] 线程2-2------<NSThread: 0x7f9c94c13690>{number = 3, name = (null)}
     2016-11-16 14:48:16.643 GCDTestDemo[18669:577146] 线程2-3------<NSThread: 0x7f9c94d19870>{number = 4, name = (null)}
     */
}

#pragma mark - **** 3. 串行队列 + 同步执行 不会开启新线程，在当前线程执行任务。任务是串行的，执行完一个任务，再执行下一个任务
- (void)ba_syncSerial
{
    NSLog(@"syncSerial---begin");
    
    dispatch_queue_t queue = dispatch_queue_create("test.queue", DISPATCH_QUEUE_SERIAL);
    
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; ++i) {
            NSLog(@"线程3-1------%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; ++i) {
            NSLog(@"线程3-2------%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; ++i) {
            NSLog(@"线程3-3------%@",[NSThread currentThread]);
        }
    });
    
    NSLog(@"syncSerial---end");
    
    /*!
     在串行队列 + 同步执行可以看到，所有任务都是在主线程中执行的，并没有开启新的线程。而且由于串行队列，所以按顺序一个一个执行。
     同时我们还可以看到，所有任务都在打印的syncConcurrent---begin和syncConcurrent---end之间，这说明任务是添加到队列中马上执行的。
     */
    
    /*!
     输出结果：
     2016-11-16 14:54:30.971 GCDTestDemo[18818:587736] syncSerial---begin
     2016-11-16 14:54:30.972 GCDTestDemo[18818:587736] 1------<NSThread: 0x7f99c3404250>{number = 1, name = main}
     2016-11-16 14:54:30.972 GCDTestDemo[18818:587736] 1------<NSThread: 0x7f99c3404250>{number = 1, name = main}
     2016-11-16 14:54:30.974 GCDTestDemo[18818:587736] 2------<NSThread: 0x7f99c3404250>{number = 1, name = main}
     2016-11-16 14:54:30.975 GCDTestDemo[18818:587736] 2------<NSThread: 0x7f99c3404250>{number = 1, name = main}
     2016-11-16 14:54:30.976 GCDTestDemo[18818:587736] 3------<NSThread: 0x7f99c3404250>{number = 1, name = main}
     2016-11-16 14:54:30.976 GCDTestDemo[18818:587736] 3------<NSThread: 0x7f99c3404250>{number = 1, name = main}
     2016-11-16 14:54:30.977 GCDTestDemo[18818:587736] syncSerial---end
     */
}

#pragma mark - **** 4. 串行队列 + 异步执行 会开启新线程，但是因为任务是串行的，执行完一个任务，再执行下一个任务
- (void)ba_asyncSerial
{
    NSLog(@"asyncSerial---begin");
    
    dispatch_queue_t queue = dispatch_queue_create("boai.queue", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 3; i ++)
        {
            NSLog(@"线程4-1------%@",[NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 3; i ++)
        {
            NSLog(@"线程4-2------%@",[NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 3; i ++)
        {
            NSLog(@"线程4-3------%@",[NSThread currentThread]);
        }
    });
    
    NSLog(@"asyncSerial---end");
    
    /*!
     在串行队列 + 异步执行可以看到，开启了一条新线程，但是任务还是串行，所以任务是一个一个执行。
     另一方面可以看出，所有任务是在打印的syncConcurrent---begin和syncConcurrent---end之后才开始执行的。说明任务不是马上执行，而是将所有任务添加到队列之后才开始同步执行。
     */
    
    /*!
     输出结果：
     2016-11-16 15:02:33.771 GCDTestDemo[18998:601095] asyncSerial---begin
     2016-11-16 15:02:33.772 GCDTestDemo[18998:601095] asyncSerial---end
     2016-11-16 15:02:33.772 GCDTestDemo[18998:601340] 线程4-1------<NSThread: 0x7f891ff12d00>{number = 2, name = (null)}
     2016-11-16 15:02:33.772 GCDTestDemo[18998:601340] 线程4-1------<NSThread: 0x7f891ff12d00>{number = 2, name = (null)}
     2016-11-16 15:02:33.773 GCDTestDemo[18998:601340] 线程4-1------<NSThread: 0x7f891ff12d00>{number = 2, name = (null)}
     2016-11-16 15:02:33.773 GCDTestDemo[18998:601340] 线程4-2------<NSThread: 0x7f891ff12d00>{number = 2, name = (null)}
     2016-11-16 15:02:33.774 GCDTestDemo[18998:601340] 线程4-2------<NSThread: 0x7f891ff12d00>{number = 2, name = (null)}
     2016-11-16 15:02:33.774 GCDTestDemo[18998:601340] 线程4-2------<NSThread: 0x7f891ff12d00>{number = 2, name = (null)}
     2016-11-16 15:02:33.775 GCDTestDemo[18998:601340] 线程4-3------<NSThread: 0x7f891ff12d00>{number = 2, name = (null)}
     2016-11-16 15:02:33.775 GCDTestDemo[18998:601340] 线程4-3------<NSThread: 0x7f891ff12d00>{number = 2, name = (null)}
     2016-11-16 15:02:33.775 GCDTestDemo[18998:601340] 线程4-3------<NSThread: 0x7f891ff12d00>{number = 2, name = (null)}
     */
}

#pragma mark - **** 5. 主队列 + 同步执行 互等卡住不可行(在主线程中调用)
- (void)ba_syncMain
{
    NSLog(@"syncMain---begin");
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    dispatch_sync(queue, ^{
        for (int i = 0; i < 3; i ++)
        {
            NSLog(@"线程5-1------%@",[NSThread currentThread]);
        }
    });
    
    dispatch_sync(queue, ^{
        for (int i = 0; i < 3; i ++)
        {
            NSLog(@"线程5-2------%@",[NSThread currentThread]);
        }
    });
    
    dispatch_sync(queue, ^{
        for (int i = 0; i < 3; i ++)
        {
            NSLog(@"线程5-3------%@",[NSThread currentThread]);
        }
    });
    
    
    NSLog(@"syncMain---end");
    
    /*!
     这时候，我们惊奇的发现，在主线程中使用主队列 + 同步执行，任务不再执行了，而且syncMain---end也没有打印。这是为什么呢？
     
     这是因为我们在主线程中执行这段代码。我们把任务放到了主队列中，也就是放到了主线程的队列中。而同步执行有个特点，就是对于任务是立马执行的。那么当我们把第一个任务放进主队列中，它就会立马执行。但是主线程现在正在处理syncMain方法，所以任务需要等syncMain执行完才能执行。而syncMain执行到第一个任务的时候，又要等第一个任务执行完才能往下执行第二个和第三个任务。
     
     那么，现在的情况就是syncMain方法和第一个任务都在等对方执行完毕。这样大家互相等待，所以就卡住了，所以我们的任务执行不了，而且syncMain---end也没有打印。
     */
    
    /*!
     输出结果：
     
     2016-11-16 15:14:56.652 GCDTestDemo[19238:622720] syncMain---begin
     */
    
    /*!
     要是如果不再主线程中调用，而在其他线程中调用会如何呢？
     
     不会开启新线程，执行完一个任务，再执行下一个任务（在其他线程中调用）
     
     dispatch_queue_t queue = dispatch_queue_create("test.queue", DISPATCH_QUEUE_CONCURRENT);
     
     dispatch_async(queue, ^{
     [self syncMain];
     });
     
     在其他线程中使用主队列 + 同步执行可看到：所有任务都是在主线程中执行的，并没有开启新的线程。而且由于主队列是串行队列，所以按顺序一个一个执行。
     另一方面可以看出，所有任务是在打印的syncConcurrent---begin和syncConcurrent---end之后才开始执行的。说明任务不是马上执行，而是将所有任务添加到队列之后才开始同步执行。
     
     2016-11-16 15:20:31.785 GCDTestDemo[19365:631782] syncMain---begin
     2016-11-16 15:20:31.789 GCDTestDemo[19365:631710] 线程5-1------<NSThread: 0x7fc620e040d0>{number = 1, name = main}
     2016-11-16 15:20:31.790 GCDTestDemo[19365:631710] 线程5-1------<NSThread: 0x7fc620e040d0>{number = 1, name = main}
     2016-11-16 15:20:31.790 GCDTestDemo[19365:631710] 线程5-1------<NSThread: 0x7fc620e040d0>{number = 1, name = main}
     2016-11-16 15:20:31.791 GCDTestDemo[19365:631710] 线程5-2------<NSThread: 0x7fc620e040d0>{number = 1, name = main}
     2016-11-16 15:20:31.791 GCDTestDemo[19365:631710] 线程5-2------<NSThread: 0x7fc620e040d0>{number = 1, name = main}
     2016-11-16 15:20:31.791 GCDTestDemo[19365:631710] 线程5-2------<NSThread: 0x7fc620e040d0>{number = 1, name = main}
     2016-11-16 15:20:31.792 GCDTestDemo[19365:631710] 线程5-3------<NSThread: 0x7fc620e040d0>{number = 1, name = main}
     2016-11-16 15:20:31.792 GCDTestDemo[19365:631710] 线程5-3------<NSThread: 0x7fc620e040d0>{number = 1, name = main}
     2016-11-16 15:20:31.792 GCDTestDemo[19365:631710] 线程5-3------<NSThread: 0x7fc620e040d0>{number = 1, name = main}
     2016-11-16 15:20:31.793 GCDTestDemo[19365:631782] syncMain---end
     
     */
    
}

#pragma mark - **** 6. 主队列 + 异步执行 只在主线程中执行任务，执行完一个任务，再执行下一个任务
- (void)ba_asyncMain
{
    NSLog(@"asyncMain---begin");
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 3; i ++)
        {
            NSLog(@"线程6-1------%@",[NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 3; i ++)
        {
            NSLog(@"线程6-2------%@",[NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 3; i ++)
        {
            NSLog(@"线程6-3------%@",[NSThread currentThread]);
        }
    });
    
    
    NSLog(@"asyncMain---end");
    
    /*!
     我们发现所有任务都在主线程中，虽然是异步执行，具备开启线程的能力，但因为是主队列，所以所有任务都在主线程中，并且一个接一个执行。
     另一方面可以看出，所有任务是在打印的syncConcurrent---begin和syncConcurrent---end之后才开始执行的。说明任务不是马上执行，而是将所有任务添加到队列之后才开始同步执行。
     */
    
    /*!
     输出结果：
     2016-11-16 15:53:19.216 GCDTestDemo[19969:684717] asyncMain---begin
     2016-11-16 15:53:19.217 GCDTestDemo[19969:684717] asyncMain---end
     2016-11-16 15:53:19.224 GCDTestDemo[19969:684717] 线程6-1------<NSThread: 0x7fad50d06880>{number = 1, name = main}
     2016-11-16 15:53:19.225 GCDTestDemo[19969:684717] 线程6-1------<NSThread: 0x7fad50d06880>{number = 1, name = main}
     2016-11-16 15:53:19.226 GCDTestDemo[19969:684717] 线程6-1------<NSThread: 0x7fad50d06880>{number = 1, name = main}
     2016-11-16 15:53:19.227 GCDTestDemo[19969:684717] 线程6-2------<NSThread: 0x7fad50d06880>{number = 1, name = main}
     2016-11-16 15:53:19.228 GCDTestDemo[19969:684717] 线程6-2------<NSThread: 0x7fad50d06880>{number = 1, name = main}
     2016-11-16 15:53:19.229 GCDTestDemo[19969:684717] 线程6-2------<NSThread: 0x7fad50d06880>{number = 1, name = main}
     2016-11-16 15:53:19.233 GCDTestDemo[19969:684717] 线程6-3------<NSThread: 0x7fad50d06880>{number = 1, name = main}
     2016-11-16 15:53:19.235 GCDTestDemo[19969:684717] 线程6-3------<NSThread: 0x7fad50d06880>{number = 1, name = main}
     2016-11-16 15:53:19.236 GCDTestDemo[19969:684717] 线程6-3------<NSThread: 0x7fad50d06880>{number = 1, name = main}
     */
}


#pragma mark - **** 7. GCD线程之间的通讯 在iOS开发过程中，我们一般在主线程里边进行UI刷新，例如：点击、滚动、拖拽等事件。我们通常把一些耗时的操作放在其他线程，比如说图片下载、文件上传等耗时操作。而当我们有时候在其他线程完成了耗时操作时，需要回到主线程，那么就用到了线程之间的通讯。
- (void)ba_asyncMain2
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        /*! 在此执行耗时操作 */
        for (int i = 0; i < 3; i ++)
        {
            NSLog(@"线程7-1------%@",[NSThread currentThread]);
        }
        
        /*! 回到主线程更新 UI */
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"线程7-2------%@",[NSThread currentThread]);
        });
        
    });
    
    /*!
     可以看到在其他线程中先执行操作，执行完了之后回到主线程执行主线程的相应操作。
     */
    
    /*!
     输出结果：
     2016-11-16 16:07:50.654 GCDTestDemo[20232:707780] 线程7-1------<NSThread: 0x7fc7de429970>{number = 2, name = (null)}
     2016-11-16 16:07:50.655 GCDTestDemo[20232:707780] 线程7-1------<NSThread: 0x7fc7de429970>{number = 2, name = (null)}
     2016-11-16 16:07:50.655 GCDTestDemo[20232:707780] 线程7-1------<NSThread: 0x7fc7de429970>{number = 2, name = (null)}
     2016-11-16 16:07:50.659 GCDTestDemo[20232:707642] 线程7-2------<NSThread: 0x7fc7de5005e0>{number = 1, name = main}
     */
}

#pragma mark - **** 8. GCD的栅栏方法 dispatch_barrier_async 我们有时需要异步执行两组操作，而且第一组操作执行完之后，才能开始执行第二组操作。这样我们就需要一个相当于栅栏一样的一个方法将两组异步执行的操作组给分割起来，当然这里的操作组里可以包含一个或多个任务。这就需要用到dispatch_barrier_async方法在两个操作组间形成栅栏。
- (void)ba_barrier
{
    dispatch_queue_t queue = dispatch_queue_create("boa.barrier", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        NSLog(@"线程8-1-----%@", [NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"线程8-2-----%@", [NSThread currentThread]);
    });
    
    dispatch_barrier_async(queue, ^{
        NSLog(@"---- 这里是栅栏，执行完前面的所有任务，才能继续栅栏后面的任务！-----%@", [NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"线程8-3-----%@", [NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"线程8-4-----%@", [NSThread currentThread]);
    });
    
    /*!
     可以看出在执行完栅栏前面的操作之后，才执行栅栏操作，最后再执行栅栏后边的操作。
     */
    
    /*!
     输出结果：
     2016-11-16 16:24:10.802 GCDTestDemo[20568:736069] 线程8-1-----<NSThread: 0x7f9291c091d0>{number = 2, name = (null)}
     2016-11-16 16:24:10.802 GCDTestDemo[20568:736070] 线程8-2-----<NSThread: 0x7f9291d8e400>{number = 3, name = (null)}
     2016-11-16 16:24:10.803 GCDTestDemo[20568:736070] ---- 这里是栅栏，执行完前面的所有任务，才能继续栅栏后面的任务！-----<NSThread: 0x7f9291d8e400>{number = 3, name = (null)}
     2016-11-16 16:24:10.803 GCDTestDemo[20568:736070] 线程8-3-----<NSThread: 0x7f9291d8e400>{number = 3, name = (null)}
     2016-11-16 16:24:10.803 GCDTestDemo[20568:736069] 线程8-4-----<NSThread: 0x7f9291c091d0>{number = 2, name = (null)}
     */
}

#pragma mark - **** 9.GCD的延时执行方法 dispatch_after 当我们需要延迟执行一段代码时，就需要用到GCD的dispatch_after方法。
- (void)ba_dispatch_after
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        /*! 2秒后异步执行这里的代码... */
        NSLog(@"--- 2秒后异步执行这里的代码... ---");
    });
}

#pragma mark - **** 10.GCD的一次性代码(只执行一次) dispatch_once 我们在创建单例、或者有整个程序运行过程中只执行一次的代码时，我们就用到了GCD的dispatch_once方法。使用dispatch_once函数能保证某段代码在程序运行过程中只被执行1次。
- (void)ba_dispatch_once
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        /*! 只执行1次的代码(这里面默认是线程安全的) */
        NSLog(@"--- 只执行1次的代码(这里面默认是线程安全的) ---");
    });
}

#pragma mark - **** 11.GCD的快速迭代方法 dispatch_apply 通常我们会用for循环遍历，但是GCD给我们提供了快速迭代的方法dispatch_apply，使我们可以同时遍历。比如说遍历0~5这6个数字，for循环的做法是每次取出一个元素，逐个遍历。dispatch_apply可以同时遍历多个数字。
- (void)ba_dispatch_apply
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_apply(8, queue, ^(size_t index) {
        NSLog(@"dispatch_apply 快速循环 %zd------%@",index, [NSThread currentThread]);
    });
    
    /*!
     从输出结果中前边的时间中可以看出，几乎是同时遍历的。
     */
    
    /*!
     输出结果：
     2016-11-16 16:40:35.227 GCDTestDemo[20924:763423] dispatch_apply 快速循环 1------<NSThread: 0x7f9a15d3b4a0>{number = 3, name = (null)}
     2016-11-16 16:40:35.227 GCDTestDemo[20924:763422] dispatch_apply 快速循环 0------<NSThread: 0x7f9a15f45490>{number = 2, name = (null)}
     2016-11-16 16:40:35.227 GCDTestDemo[20924:763290] dispatch_apply 快速循环 2------<NSThread: 0x7f9a15e06090>{number = 1, name = main}
     2016-11-16 16:40:35.227 GCDTestDemo[20924:763427] dispatch_apply 快速循环 3------<NSThread: 0x7f9a15c3ac20>{number = 4, name = (null)}
     2016-11-16 16:40:35.228 GCDTestDemo[20924:763423] dispatch_apply 快速循环 4------<NSThread: 0x7f9a15d3b4a0>{number = 3, name = (null)}
     2016-11-16 16:40:35.228 GCDTestDemo[20924:763422] dispatch_apply 快速循环 5------<NSThread: 0x7f9a15f45490>{number = 2, name = (null)}
     2016-11-16 16:40:35.228 GCDTestDemo[20924:763290] dispatch_apply 快速循环 6------<NSThread: 0x7f9a15e06090>{number = 1, name = main}
     2016-11-16 16:40:35.228 GCDTestDemo[20924:763427] dispatch_apply 快速循环 7------<NSThread: 0x7f9a15c3ac20>{number = 4, name = (null)}
     */
}

#pragma mark - **** 12.GCD的队列组 dispatch_group 有时候我们会有这样的需求：分别异步执行2个耗时操作，然后当2个耗时操作都执行完毕后再回到主线程执行操作。这时候我们可以用到GCD的队列组。 我们可以先把任务放到队列中，然后将队列放入队列组中。 调用队列组的dispatch_group_notify回到主线程执行操作。
- (void)ba_dispatch_group_async
{
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        /*! 执行1个耗时的异步操作 */
        NSLog(@"--- 执行第 1 个耗时的异步操作 ---");
    });
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        /*! 执行1个耗时的异步操作 */
        NSLog(@"--- 执行第 2 个耗时的异步操作 ---");
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        /*! 等前面的异步操作都执行完毕后，回到主线程... */
        NSLog(@"--- 等前面的异步操作都执行完毕后，回到主线程... ---");
    });
    
    /*!
     输出结果：
     2016-11-16 16:54:30.375 GCDTestDemo[21212:787439] --- 执行第 2 个耗时的异步操作 ---
     2016-11-16 16:54:30.375 GCDTestDemo[21212:787438] --- 执行第 1 个耗时的异步操作 ---
     2016-11-16 16:54:30.379 GCDTestDemo[21212:787353] --- 等前面的异步操作都执行完毕后，回到主线程... ---
     */
}


@end
