//
//  DemoVC2_02_studentCell.m
//  BABaseProject
//
//  Created by 博爱 on 16/7/20.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC2_02_studentCell.h"
#import "DemoVC2_02_studentModel.h"

@interface DemoVC2_02_studentCell ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *ageLabel;

@end

@implementation DemoVC2_02_studentCell

- (void)ba_loadContent
{
    DemoVC2_02_studentModel *model = self.data;
    
    self.nameLabel.text            = model.name;
    self.ageLabel.text             = model.age.stringValue;
}

- (void)ba_setupCell
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)ba_buildSubview
{
    self.nameLabel      = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 200, 60)];
    self.nameLabel.font = [UIFont fontWithName:@"AppleSDGothicNeo-Thin" size:20.f];
    [self addSubview:self.nameLabel];
    
    self.ageLabel               = [[UILabel alloc] initWithFrame:CGRectMake(BA_SCREEN_WIDTH - 220, 0, 200, 60)];
    self.ageLabel.textAlignment = NSTextAlignmentRight;
    self.ageLabel.font          = [UIFont fontWithName:@"AppleSDGothicNeo-Thin" size:20.f];
    [self addSubview:self.ageLabel];
    
    UIView *line         = [[UIView alloc] initWithFrame:CGRectMake(0, 59.5f, BA_SCREEN_WIDTH, 0.5f)];
    line.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.1f];
    [self addSubview:line];
}

- (void)ba_showSelectedAnimation
{
    UIView *tmpView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, BA_SCREEN_WIDTH, 60)];
    tmpView.backgroundColor = [[UIColor cyanColor] colorWithAlphaComponent:0.15f];
    tmpView.alpha           = 0.f;
    
    [self addSubview:tmpView];
    
    [UIView animateWithDuration:0.20 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        tmpView.alpha = 0.9f;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.20 delay:0.1 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            tmpView.alpha = 0.f;
            
        } completion:^(BOOL finished) {
            
            [tmpView removeFromSuperview];
        }];
    }];
    
}

@end
