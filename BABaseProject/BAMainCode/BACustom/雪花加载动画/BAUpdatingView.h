//
//  BAUpdatingView.h
//  BABaseProject
//
//  Created by 博爱 on 16/5/4.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BASnowView.h"
#import "UIView+BAGlowView.h"
#import "CALayer+BAMaskLayer.h"


@interface BAUpdatingView : UIView

- (void)insertIntoView:(UIView *)view;

- (void)show;
- (void)hide;
- (void)showFailed;

@end
