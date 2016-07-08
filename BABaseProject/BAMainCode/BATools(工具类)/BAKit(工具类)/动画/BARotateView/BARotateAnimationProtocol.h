//
//  BARotateAnimationProtocol.h
//  BABaseProject
//
//  Created by 博爱 on 16/7/7.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIView+BARotateAnimationProtocol.h"

@protocol BARotateAnimationProtocol <NSObject>

/*!
 *  Rotate to up (default).
 *
 *  @param animated Animated or not.
 */
- (void)ba_changeToUpAnimated:(BOOL)animated;

/*!
 *  Rotate to left.
 *
 *  @param animated Animated or not.
 */
- (void)ba_changeToLeftAnimated:(BOOL)animated;

/*!
 *  Rotate to right.
 *
 *  @param animated Animated or not.
 */
- (void)ba_changeToRightAnimated:(BOOL)animated;

/*!
 *  Rotate to down.
 *
 *  @param animated Animated or not.
 */
- (void)ba_changeToDownAnimated:(BOOL)animated;

@end
