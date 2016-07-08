//
//  DemoVC2_02_HeaderView.h
//  BABaseProject
//
//  Created by 博爱 on 16/7/7.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BABaseHeaderFooterView.h"
#import "BARotateView.h"

@interface DemoVC2_02_HeaderView : BABaseHeaderFooterView

/*!
 *  Change to normal state.
 *
 *  @param animated Animated or not.
 */
- (void)ba_normalStateAnimated:(BOOL)animated;

/*!
 *  Change to extended state.
 *
 *  @param animated Animated or not.
 */
- (void)ba_extendStateAnimated:(BOOL)animated;

@end
