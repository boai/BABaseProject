
/*!
 *  @brief      BAAlert
 *
 *  @author     BAHome
 *  @copyright  Copyright © 2016年 BAHome. All rights reserved.
 *  @version    V1.1.0
 */

#import "BAActionSheetCell.h"

@implementation BAActionSheetCell

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat min_x = 0;
    CGFloat min_y = 0;
    CGFloat min_w = 0;
    CGFloat min_h = 0;
    
    if (self.actionSheetType == BAActionSheetTypeNormal)
    {
        min_x = 15;
        min_w = 30;
        min_y = 7;
        min_h = min_w;
        self.imageView.frame = CGRectMake(min_x, min_y, min_w, min_h);
        
        min_w = CGRectGetWidth(self.frame) - CGRectGetMaxX(self.imageView.frame) - 15 * 2;
        if (self.imageView.image.size.width > 0)
        {
            min_x = CGRectGetMaxX(self.imageView.frame) + 10;
        }
        min_y = 0;
        min_h = CGRectGetHeight(self.frame);
        if (self.detailTextLabel.text.length > 0)
        {
            min_y = 5;
            min_h = CGRectGetHeight(self.frame)/2 - 5;
        }
        self.textLabel.frame = CGRectMake(min_x, min_y, min_w, min_h);
        min_y = CGRectGetMaxY(self.textLabel.frame);
        self.detailTextLabel.frame = CGRectMake(min_x, min_y, min_w, min_h);
    }
    else if (self.actionSheetType == BAActionSheetTypeCustom)
    {
        min_x = 15;
        min_w = CGRectGetWidth(self.frame) - 15 * 2;
        min_y = 0;
        min_h = CGRectGetHeight(self.frame);
        self.textLabel.frame = CGRectMake(min_x, min_y, min_w, min_h);
    }
}

- (void)setActionSheetType:(BAActionSheetType)actionSheetType
{
    _actionSheetType = actionSheetType;
}

@end

