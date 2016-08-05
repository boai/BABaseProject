//
//  BAADLabel.m
//  BABaseProject
//
//  Created by boai on 16/8/5.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BAADLabel.h"

@implementation BAADLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.bakit_manager
        .label_font([UIFont fontWithName:@"SFOuterLimitsUpright" size:20.0f])
        .label_textAlignment(NSTextAlignmentCenter)
        .label_textColor(BA_White_Color);
    }
    return self;
}

@end
