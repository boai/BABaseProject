//
//  DemoVC5_TextPart.h
//  BABaseProject
//
//  Created by 博爱 on 16/5/9.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DemoVC5_TextPart : NSObject

/*! 这段文字的内容 */
@property (nonatomic, strong                     ) NSString *text;
/*! 这段文字的范围 */
@property (nonatomic, assign                     ) NSRange   range;
/*! 是否为特殊文字 */
@property (nonatomic, assign, getter = isSpecical) BOOL      specical;

@end
