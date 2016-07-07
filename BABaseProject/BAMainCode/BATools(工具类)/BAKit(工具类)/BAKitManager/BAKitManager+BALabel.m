//
//  BAKitManager+BALabel.m
//  BABaseProject
//
//  Created by 博爱 on 16/7/7.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BAKitManager+BALabel.h"

@implementation BAKitManager (BALabel)

- (ba_sting)label_text
{
    __weak typeof(self) weakSelf = self;
    
    return ^BAKitManager *(NSString *text){
        weakSelf.ba_label.text = text;
        return weakSelf;
    };
}

- (ba_color)label_textColor
{
    __weak typeof(self) weakSelf = self;
    
    return ^BAKitManager *(UIColor *textColor){
        weakSelf.ba_label.textColor = textColor;
        return weakSelf;
    };
}

@end
