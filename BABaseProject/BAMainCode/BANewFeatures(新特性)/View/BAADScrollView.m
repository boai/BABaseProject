//
//  BAADScrollView.m
//  BABaseProject
//
//  Created by boai on 16/8/5.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BAADScrollView.h"
#import "BAADLabel.h"

@interface BAADScrollView ()<UIScrollViewDelegate>

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation BAADScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.delegate = self;
        self.scrollsToTop = NO;
    }
    return self;
}

#pragma mark - ***** UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat scrollW = self.bounds.size.width;
    int page = (scrollView.contentOffset.x + scrollW * 0.5) / scrollW;
    page --;
    self.pageControl.currentPage = page;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{

}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{

}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{

}

- (void)scrollViewDidStop:(UIScrollView *)scrollView
{

}

#pragma mark - ***** setter / getter
- (void)setTitlesArray:(NSArray *)titlesArray
{
    _titlesArray = titlesArray;
    
    self.pageControl.numberOfPages = titlesArray.count;
    [self ba_setBanner];
}

- (void)ba_setBanner
{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    CGFloat W = [UIScreen mainScreen].bounds.size.width;
    CGFloat H = 30;
    CGFloat Y = self.bounds.size.height - H;
    
    BAADLabel *lastLabel = [[BAADLabel alloc] init];
    
    BAADLabel *firstLabel = [[BAADLabel alloc] init];
    
    for (int i = 0; i < self.titlesArray.count; i++) {
        
        BAADLabel *advertLabel = [[BAADLabel alloc] init];
        
        CGFloat X = i * W + W;
        advertLabel.frame = CGRectMake(X , Y, W, H);
        advertLabel.text = self.titlesArray[i];
        
        if (i == 0) {
            firstLabel.text = self.titlesArray[i];
        }
        if (i == self.titlesArray.count - 1) {
            lastLabel.text = self.titlesArray[i];
        }
        [self addSubview:advertLabel];
    }
    
    lastLabel.frame = CGRectMake(0, Y, W, H);
    [self addSubview:lastLabel];
    
    firstLabel.frame = CGRectMake((self.titlesArray.count + 1) * W, Y, W, H);
    [self addSubview:firstLabel];
    
    CGFloat contentW = (self.titlesArray.count + 2) * W;
    self.contentSize = CGSizeMake(contentW, 0);
    
    self.showsHorizontalScrollIndicator = NO;
    
    self.pagingEnabled = YES;
    
    self.pageControl.currentPage = 0;
    
    [self setContentOffset:CGPointMake(W, 0)];
    
//    [self addTimer];
}




@end
