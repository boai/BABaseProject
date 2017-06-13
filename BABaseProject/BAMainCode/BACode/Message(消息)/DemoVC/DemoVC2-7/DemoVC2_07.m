//
//  DemoVC2_07.m
//  testDemo
//
//  Created by 博爱 on 2016/11/22.
//  Copyright © 2016年 DS-Team. All rights reserved.
//

#import "DemoVC2_07.h"
#import "NSMutableArray+BASort.h"


static const NSInteger kTempCount = 100;

@interface DemoVC2_07 ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;

@property (nonatomic, strong) NSMutableArray<UIView *> *tempViewArray;

@property (nonatomic, strong) UILabel        *timeLabel;

@property (nonatomic        ) CADisplayLink  *displayLink;
@property (nonatomic, strong) dispatch_semaphore_t sema;
@property (nonatomic, assign) NSTimeInterval nowTime;

@end

@implementation DemoVC2_07


#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self ba_setupUI];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

#pragma mark - custom method
- (void)ba_setupUI
{
    self.title = @"排序算法";
    [self ba_viewLayout];

}

- (void)ba_viewLayout
{
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithTitle:@"重置" style:UIBarButtonItemStylePlain target:self action:@selector(onResetAction:)];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithTitle:@"排序" style:UIBarButtonItemStylePlain target:self action:@selector(onSortAction:)];
    self.navigationItem.rightBarButtonItems = @[item1, item2];
    
    self.timeLabel.frame = CGRectMake(CGRectGetWidth(self.view.bounds) * 0.5 - 50, CGRectGetHeight(self.view.bounds) * 0.8 + 30, 120, 40);
    
    [_segmentControl addTarget:self action:@selector(onSegmentControlChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self onResetAction:nil];
}

- (void)invalidateTimer
{
    if (self.displayLink)
    {
        [self.displayLink invalidate];
        self.displayLink = nil;
    }
    self.sema = nil;
}

- (void)printBarDataArray
{
#if 1
    NSMutableString *string = [NSMutableString string];
    [self.tempViewArray enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [string appendFormat:@"%@ ", @(CGRectGetHeight(obj.frame))];
    }];
    NSLog(@"数组内容：%@", string);
#endif
}

- (NSComparisonResult)ba_compareWithDataOne:(UIView *)dataOne dataTwo:(UIView *)dataTwo
{
    /*! 模拟进行比较所需的耗时 */
    dispatch_semaphore_wait(self.sema, DISPATCH_TIME_FOREVER);
    
    CGFloat height1 = CGRectGetHeight(dataOne.frame);
    CGFloat height2 = CGRectGetHeight(dataTwo.frame);
    if (height1 == height2)
    {
        return NSOrderedSame;
    }
    return height1 < height2 ? NSOrderedAscending:NSOrderedDescending;
}

- (void)ba_exchangePositionWithBarOne:(UIView *)barOne barTwo:(UIView *)barTwo
{
    dispatch_async(dispatch_get_main_queue(), ^{
        CGRect frameOne = barOne.frame;
        CGRect frameTwo = barTwo.frame;
        frameOne.origin.x = barTwo.frame.origin.x;
        frameTwo.origin.x = barOne.frame.origin.x;
        barOne.frame = frameOne;
        barTwo.frame = frameTwo;
    });
}

#pragma mark - event response
- (void)onResetAction:(UIBarButtonItem *)sender
{
    [self invalidateTimer];
    self.timeLabel.text = @"";
    
    CGFloat width = CGRectGetWidth(self.view.bounds);
    CGFloat barMargin = 1;
    CGFloat barWith = floorf((width - barMargin * (kTempCount + 1))/ kTempCount);
    CGFloat barX = roundf((width - (barMargin + barWith) * kTempCount + barMargin) / 2.0);
    CGFloat barY = CGRectGetMaxY(_segmentControl.frame) + 10;
    CGFloat barBottom = CGRectGetHeight(self.view.bounds) * 0.8;
    CGFloat barHeight = barBottom - barY;
    
    [self.tempViewArray enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGFloat barHeight2 = 20 + arc4random_uniform(barHeight - 20);
        /*! 若需要制造高概率重复数据请打开此行，令数值为10的整数倍(或修改为其它倍数) */
//        barHeight2 = roundf(barHeight / 10) * 10;
        obj.frame = CGRectMake(barX + idx * (barMargin + barWith), barBottom - barHeight2, barWith, barHeight2);
    }];
    NSLog(@"重置成功!");
    [self printBarDataArray];
}

- (void)onSortAction:(UIBarButtonItem *)sender
{
    [self invalidateTimer];
    self.sema = dispatch_semaphore_create(0);

    _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(handleDisplayLinkAction:)];
    _displayLink.frameInterval = 0.0001;
    [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];

    _nowTime = [[NSDate date] timeIntervalSince1970];

    __weak typeof(self) weakSelf = self;

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       
        switch (weakSelf.segmentControl.selectedSegmentIndex) {
            case 0:
                [weakSelf selectSort];
                break;
            case 1:
                [weakSelf bubbleSort];
                break;
            case 2:
                [weakSelf quickSort];
                break;
            case 3:
                [weakSelf heapSort];
                break;
            case 4:
                [weakSelf insertSort];
                break;
                
            default:
                break;
        }
        NSLog(@"%@", weakSelf.timeLabel.text);
        [weakSelf invalidateTimer];
        [weakSelf printBarDataArray];
    });
}

- (void)onSegmentControlChanged:(UISegmentedControl *)sender
{
    [self onResetAction:nil];
}

/*! 耗时(秒):82.512 */
- (void)selectSort
{
    [self.tempViewArray ba_selectSortWithComparator:^NSComparisonResult(UIView *obj1, UIView *obj2) {
        return [self ba_compareWithDataOne:obj1 dataTwo:obj2];
    } didExchange:^(UIView *obj1, UIView *obj2) {
        [self ba_exchangePositionWithBarOne:obj1 barTwo:obj2];
    }];
}

/*! 耗时(秒):82.495 */
- (void)bubbleSort
{
    [self.tempViewArray ba_bubbleSortWithComparator:^NSComparisonResult(id obj1, id obj2) {
        return [self ba_compareWithDataOne:obj1 dataTwo:obj2];
    } didExchange:^(id obj1, id obj2) {
        [self ba_exchangePositionWithBarOne:obj1 barTwo:obj2];
    }];
}

/*! 耗时(秒):13.500 */
- (void)quickSort
{
    [self.tempViewArray ba_quickSortWithComparator:^NSComparisonResult(id obj1, id obj2) {
        return [self ba_compareWithDataOne:obj1 dataTwo:obj2];
    } didExchange:^(id obj1, id obj2) {
        [self ba_exchangePositionWithBarOne:obj1 barTwo:obj2];
    }];
}

/*! 耗时(秒):17.058 */
- (void)heapSort
{
    [self.tempViewArray ba_heapSortWithComparator:^NSComparisonResult(id obj1, id obj2) {
        return [self ba_compareWithDataOne:obj1 dataTwo:obj2];
    } didExchange:^(id obj1, id obj2) {
        [self ba_exchangePositionWithBarOne:obj1 barTwo:obj2];
    }];
}

/*! 耗时(秒):47.238 */
- (void)insertSort
{
    [self.tempViewArray ba_insertSortWithComparator:^NSComparisonResult(id obj1, id obj2) {
        return [self ba_compareWithDataOne:obj1 dataTwo:obj2];
    } didExchange:^(id obj1, id obj2) {
        [self ba_exchangePositionWithBarOne:obj1 barTwo:obj2];
    }];
}

- (void)handleDisplayLinkAction:(CADisplayLink *)displayLink
{
    /*! 定时器信号 */
    __weak typeof(self) weakSelf = self;
    // 发出信号量，唤醒排序线程
    dispatch_semaphore_signal(weakSelf.sema);
    // 更新计时
    NSTimeInterval interval = [[NSDate date] timeIntervalSince1970] - _nowTime;
    dispatch_async(dispatch_get_main_queue(), ^{
        weakSelf.timeLabel.text = [NSString stringWithFormat:@"耗时(秒):%2.3f", interval];
    });
}

#pragma mark - setter / getter
- (UILabel *)timeLabel
{
    if (!_timeLabel)
    {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.font = [UIFont systemFontOfSize:14];
        _timeLabel.textColor = [UIColor darkTextColor];
        [self.view addSubview:_timeLabel];
    }
    return _timeLabel;
}

- (NSMutableArray<UIView *> *)tempViewArray
{
    if (!_tempViewArray)
    {
        _tempViewArray = [NSMutableArray arrayWithCapacity:kTempCount];
        
        for (NSInteger i = 0; i < kTempCount; i++)
        {
            UIView *barView = [UIView new];
            barView.backgroundColor = BAKit_ColorRandom();
            [self.view addSubview:barView];
            
            [_tempViewArray addObject:barView];
        }
    }
    return _tempViewArray;
}

@end
