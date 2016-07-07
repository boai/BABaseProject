
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

#import "GCDQueue.h"
#import "GCDGroup.h"

static GCDQueue *mainQueue;
static GCDQueue *globalQueue;
static GCDQueue *highPriorityGlobalQueue;
static GCDQueue *lowPriorityGlobalQueue;
static GCDQueue *backgroundPriorityGlobalQueue;

@interface GCDQueue ()

@property (strong, readwrite, nonatomic) dispatch_queue_t dispatchQueue;

@end

@implementation GCDQueue

+ (GCDQueue *)mainQueue {
    
    return mainQueue;
}

+ (GCDQueue *)globalQueue {
    
    return globalQueue;
}

+ (GCDQueue *)highPriorityGlobalQueue {
    
    return highPriorityGlobalQueue;
}

+ (GCDQueue *)lowPriorityGlobalQueue {
    
    return lowPriorityGlobalQueue;
}

+ (GCDQueue *)backgroundPriorityGlobalQueue {
    
    return backgroundPriorityGlobalQueue;
}

+ (void)initialize {
    
    /**
     Initializes the class before it receives its first message.
     
     1. The runtime sends the initialize message to classes in a
     thread-safe manner.
     
     2. initialize is invoked only once per class. If you want to
     perform independent initialization for the class and for
     categories of the class, you should implement load methods.
     */
    if (self == [GCDQueue self])  {
        
        mainQueue                     = [GCDQueue new];
        globalQueue                   = [GCDQueue new];
        highPriorityGlobalQueue       = [GCDQueue new];
        lowPriorityGlobalQueue        = [GCDQueue new];
        backgroundPriorityGlobalQueue = [GCDQueue new];
        
        mainQueue.dispatchQueue                     = dispatch_get_main_queue();
        globalQueue.dispatchQueue                   = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        highPriorityGlobalQueue.dispatchQueue       = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
        lowPriorityGlobalQueue.dispatchQueue        = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
        backgroundPriorityGlobalQueue.dispatchQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    }
}

- (instancetype)init {
    
    return [self initSerial];
}

- (instancetype)initSerial {
    
    self = [super init];
    
    if (self) {
        
        self.dispatchQueue = dispatch_queue_create(nil, DISPATCH_QUEUE_SERIAL);
    }
    
    return self;
}

- (instancetype)initSerialWithLabel:(NSString *)label {

    self = [super init];
    
    if (self)
    {
        self.dispatchQueue = dispatch_queue_create([label UTF8String], DISPATCH_QUEUE_SERIAL);
    }
    
    return self;
}

- (instancetype)initConcurrent {
    
    self = [super init];
    
    if (self) {
        
        self.dispatchQueue = dispatch_queue_create(nil, DISPATCH_QUEUE_CONCURRENT);
    }
    
    return self;
}

- (instancetype)initConcurrentWithLabel:(NSString *)label {
    
    self = [super init];
    
    if (self) {
        
        self.dispatchQueue = dispatch_queue_create([label UTF8String], DISPATCH_QUEUE_CONCURRENT);
    }
    
    return self;
}

- (void)execute:(dispatch_block_t)block {
    
    NSParameterAssert(block);
    dispatch_async(self.dispatchQueue, block);
}

- (void)execute:(dispatch_block_t)block afterDelay:(int64_t)delta {
    
    NSParameterAssert(block);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delta), self.dispatchQueue, block);
}

- (void)execute:(dispatch_block_t)block afterDelaySecs:(float)delta {
    
    NSParameterAssert(block);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delta * NSEC_PER_SEC), self.dispatchQueue, block);
}

- (void)waitExecute:(dispatch_block_t)block {
    
    /*
     As an optimization, this function invokes the block on
     the current thread when possible.
     
     作为一个建议,这个方法尽量在当前线程池中调用.
     */
    
    NSParameterAssert(block);
    dispatch_sync(self.dispatchQueue, block);
}

- (void)barrierExecute:(dispatch_block_t)block {
    
    /*
     The queue you specify should be a concurrent queue that you
     create yourself using the dispatch_queue_create function.
     If the queue you pass to this function is a serial queue or
     one of the global concurrent queues, this function behaves
     like the dispatch_async function.
     
     使用的线程池应该是你自己创建的并发线程池.如果你传进来的参数为串行线程池
     或者是系统的并发线程池中的某一个,这个方法就会被当做一个普通的async操作
     */
    
    NSParameterAssert(block);
    dispatch_barrier_async(self.dispatchQueue, block);
}

- (void)waitBarrierExecute:(dispatch_block_t)block {
    
    /*
     The queue you specify should be a concurrent queue that you
     create yourself using the dispatch_queue_create function.
     If the queue you pass to this function is a serial queue or
     one of the global concurrent queues, this function behaves
     like the dispatch_sync function.
     
     使用的线程池应该是你自己创建的并发线程池.如果你传进来的参数为串行线程池
     或者是系统的并发线程池中的某一个,这个方法就会被当做一个普通的sync操作
     
     As an optimization, this function invokes the barrier block
     on the current thread when possible.
     
     作为一个建议,这个方法尽量在当前线程池中调用.
     */
    
    NSParameterAssert(block);
    dispatch_barrier_sync(self.dispatchQueue, block);
}

- (void)suspend {
    
    dispatch_suspend(self.dispatchQueue);
}

- (void)resume {
    
    dispatch_resume(self.dispatchQueue);
}

- (void)execute:(dispatch_block_t)block inGroup:(GCDGroup *)group {
    
    NSParameterAssert(block);
    dispatch_group_async(group.dispatchGroup, self.dispatchQueue, block);
}

- (void)notify:(dispatch_block_t)block inGroup:(GCDGroup *)group {
    
    NSParameterAssert(block);
    dispatch_group_notify(group.dispatchGroup, self.dispatchQueue, block);
}

#pragma mark - 便利的构造方法
+ (void)executeInMainQueue:(dispatch_block_t)block afterDelaySecs:(NSTimeInterval)sec {

    NSParameterAssert(block);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * sec), mainQueue.dispatchQueue, block);
}

+ (void)executeInGlobalQueue:(dispatch_block_t)block afterDelaySecs:(NSTimeInterval)sec {
    
    NSParameterAssert(block);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * sec), globalQueue.dispatchQueue, block);
}

+ (void)executeInHighPriorityGlobalQueue:(dispatch_block_t)block afterDelaySecs:(NSTimeInterval)sec {
    
    NSParameterAssert(block);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * sec), highPriorityGlobalQueue.dispatchQueue, block);
}

+ (void)executeInLowPriorityGlobalQueue:(dispatch_block_t)block afterDelaySecs:(NSTimeInterval)sec {
    
    NSParameterAssert(block);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * sec), lowPriorityGlobalQueue.dispatchQueue, block);
}

+ (void)executeInBackgroundPriorityGlobalQueue:(dispatch_block_t)block afterDelaySecs:(NSTimeInterval)sec {
    
    NSParameterAssert(block);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * sec), backgroundPriorityGlobalQueue.dispatchQueue, block);
}

+ (void)executeInMainQueue:(dispatch_block_t)block {
    
    NSParameterAssert(block);
    dispatch_async(mainQueue.dispatchQueue, block);
}

+ (void)executeInGlobalQueue:(dispatch_block_t)block {
    
    NSParameterAssert(block);
    dispatch_async(globalQueue.dispatchQueue, block);
}

+ (void)executeInHighPriorityGlobalQueue:(dispatch_block_t)block {
    
    NSParameterAssert(block);
    dispatch_async(highPriorityGlobalQueue.dispatchQueue, block);
}

+ (void)executeInLowPriorityGlobalQueue:(dispatch_block_t)block {

    NSParameterAssert(block);
    dispatch_async(lowPriorityGlobalQueue.dispatchQueue, block);
}

+ (void)executeInBackgroundPriorityGlobalQueue:(dispatch_block_t)block {

    NSParameterAssert(block);
    dispatch_async(backgroundPriorityGlobalQueue.dispatchQueue, block);
}

@end
