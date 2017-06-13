//
//  NSString+BAEmoji.h
//  BAKit
//
//  Created by boai on 2017/6/7.
//  Copyright © 2017年 boai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BAEmoji)

/**
 将文字转换成表情字符
 
 @return 表情字符
 */
- (NSString *)ba_stringReplaceEmojiTextWithUnicode;

/**
 将表情字符转换成文字
 
 @return 文字
 */
- (NSString *)ba_stringReplaceEmojiUnicodeWithText;

@end
