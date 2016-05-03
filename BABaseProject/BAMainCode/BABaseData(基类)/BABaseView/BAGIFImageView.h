//
//  BAGIFImageView.h
//  UIImageView-PlayGIF
//
//  Created by Yang Fei on 14-3-26.
//  Copyright (c) 2014年 yangfei.me. All rights reserved.
//

/*******************************************************
 *  Dependencies:
 *      - QuartzCore.framework
 *      - ImageIO.framework
 *  Parameters:
 *      Pass value to one of them:
 *      - gifData NSData from a GIF
 *      - gifPath local path of a GIF
 *  Usage:
 *      - startGIF
 *      - stopGIF
 *      - isGIFPlaying
 *  P.S.:
 *      Need category? Use UIImageView+PlayGIF.h/m
 *******************************************************/

/*******************************************************
 *  依赖:
 *      - QuartzCore.framework
 *      - ImageIO.framework
 *  参数:
 *      以下传参2选1：
 *      - gifData       GIF图片的NSData
 *      - gifPath       GIF图片的本地路径
 *  调用:
 *      - startGIF      开始播放
 *      - stopGIF       结束播放
 *      - isGIFPlaying  判断是否正在播放
 *  另外：
 *      想用 category？请使用 UIImageView+PlayGIF.h/m
 *******************************************************/

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <ImageIO/ImageIO.h>

@interface BAGIFImageView : UIImageView
@property (nonatomic, strong) NSString          *gifPath;
@property (nonatomic, strong) NSData            *gifData;

- (void)startGIF;
- (void)stopGIF;
- (BOOL)isGIFPlaying;

@end
