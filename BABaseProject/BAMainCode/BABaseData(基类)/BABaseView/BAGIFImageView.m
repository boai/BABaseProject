//
//  BAGIFImageView.m
//  UIImageView-PlayGIF
//
//  Created by Yang Fei on 14-3-26.
//  Copyright (c) 2014年 yangfei.me. All rights reserved.
//

/**********************************************************************/
#import <Foundation/Foundation.h>
#import "BAGIFImageView.h"

@interface BAGIFManager : NSObject
@property (nonatomic, strong) CADisplayLink  *displayLink;
@property (nonatomic, strong) NSHashTable    *gifViewHashTable;

+ (BAGIFManager *)shared;
- (void)stopGIFView:(BAGIFImageView *)view;

@end

@implementation BAGIFManager

+ (BAGIFManager *)shared{
    static BAGIFManager *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[BAGIFManager alloc] init];
    });
    return _sharedInstance;
}
- (id)init{
	self = [super init];
	if (self) {
		_gifViewHashTable = [NSHashTable hashTableWithOptions:NSHashTableWeakMemory];
	}
	return self;
}
- (void)play{
    for (BAGIFImageView *imageView in _gifViewHashTable) {
        [imageView performSelector:@selector(play)];
    }
}
- (void)stopDisplayLink{
    if (self.displayLink) {
        [self.displayLink invalidate];
        self.displayLink = nil;
    }
}
- (void)stopGIFView:(BAGIFImageView *)view{
    [_gifViewHashTable removeObject:view];
    if (_gifViewHashTable.count<1 && !_displayLink) {
        [self stopDisplayLink];
    }
}
@end
/**********************************************************************/

#import "BAGIFImageView.h"

@interface BAGIFImageView(){
    size_t              _index;
    size_t              _frameCount;
    float               _timestamp;
    CGImageSourceRef    _gifSourceRef;
}
@end

@implementation BAGIFImageView

- (void)removeFromSuperview{
    [super removeFromSuperview];
    [self stopGIF];
}

- (void)startGIF{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        if (![[BAGIFManager shared].gifViewHashTable containsObject:self]) {
            if ((self.gifData || self.gifPath)) {
                CGImageSourceRef gifSourceRef;
                if (self.gifData) {
                    gifSourceRef = CGImageSourceCreateWithData((__bridge CFDataRef)(self.gifData), NULL);
                }else{
                    gifSourceRef = CGImageSourceCreateWithURL((__bridge CFURLRef)[NSURL fileURLWithPath:self.gifPath], NULL);
                }
                if (!gifSourceRef) {
                    return;
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [[BAGIFManager shared].gifViewHashTable addObject:self];
                    _gifSourceRef = gifSourceRef;
                    _frameCount = CGImageSourceGetCount(gifSourceRef);
                });
            }
        }
    });
    if (![BAGIFManager shared].displayLink) {
        [BAGIFManager shared].displayLink = [CADisplayLink displayLinkWithTarget:[BAGIFManager shared] selector:@selector(play)];
        [[BAGIFManager shared].displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    }
}

- (void)stopGIF{
    if (_gifSourceRef) {
        CFRelease(_gifSourceRef);
        _gifSourceRef = nil;
    }
    [[BAGIFManager shared] stopGIFView:self];
}

- (void)play{
    float nextFrameDuration = [self frameDurationAtIndex:MIN(_index+1, _frameCount-1)];
    if (_timestamp < nextFrameDuration) {
        _timestamp += [BAGIFManager shared].displayLink.duration;
        return;
    }
	_index ++;
	_index = _index%_frameCount;
	CGImageRef ref = CGImageSourceCreateImageAtIndex(_gifSourceRef, _index, NULL);
	self.layer.contents = (__bridge id)(ref);
    CGImageRelease(ref);
    _timestamp = 0;
}

- (BOOL)isGIFPlaying{
    return _gifSourceRef?YES:NO;
}

- (float)frameDurationAtIndex:(size_t)index{
    CFDictionaryRef dictRef = CGImageSourceCopyPropertiesAtIndex(_gifSourceRef, index, NULL);
    NSDictionary *dict = (__bridge NSDictionary *)dictRef;
    NSDictionary *gifDict = (dict[(NSString *)kCGImagePropertyGIFDictionary]);
    NSNumber *unclampedDelayTime = gifDict[(NSString *)kCGImagePropertyGIFUnclampedDelayTime];
    NSNumber *delayTime = gifDict[(NSString *)kCGImagePropertyGIFDelayTime];
    CFRelease(dictRef);
    if (unclampedDelayTime.floatValue) {
        return unclampedDelayTime.floatValue;
    }else if (delayTime.floatValue) {
        return delayTime.floatValue;
    }else{
        return 1/24.0;
    }
}

@end
