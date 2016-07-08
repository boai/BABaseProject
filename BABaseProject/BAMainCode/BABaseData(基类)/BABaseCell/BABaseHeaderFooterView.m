//
//  BABaseHeaderFooterView.m
//  BABaseProject
//
//  Created by 博爱 on 16/7/7.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BABaseHeaderFooterView.h"

@implementation BABaseHeaderFooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier])
    {
        [self ba_setupHeaderFooterView];
        [self ba_buildSubview];
    }
    return self;
}

/*!
 *  Setup HeaderFooterView, override by subclass.
 */
- (void)ba_setupHeaderFooterView
{

}

/*!
 *  Build subview, override by subclass.
 */
- (void)ba_buildSubview
{
    
}

/*!
 *  Load content, override by subclass.
 */
- (void)ba_loadContent
{
    
}

@end
