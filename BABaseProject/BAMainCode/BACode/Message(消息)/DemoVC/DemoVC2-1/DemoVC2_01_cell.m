//
//  DemoVC2_01_cell.m
//  BABaseProject
//
//  Created by 博爱 on 16/7/6.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC2_01_cell.h"
#import "DemoVC2_01_Model.h"

/*! 字体封装 */
//#import "UIFont+BAKit.h"

@interface DemoVC2_01_cell ()

@property (nonatomic, strong) UILabel  *normalLabel;
@property (nonatomic, strong) UILabel  *expendLabel;
@property (nonatomic, strong) UIView   *line;
@property (nonatomic, strong) UIView   *stateView;

@end

@implementation DemoVC2_01_cell

- (void)ba_setupCell
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)ba_buildSubview
{
    self.line                 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, BA_SCREEN_WIDTH, 0.5f)];
    self.line.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.25f];
    
    self.stateView                 = [[UIView alloc] initWithFrame:CGRectMake(0, 13, 2, 15)];
    self.stateView.backgroundColor = [UIColor grayColor];
    
    self.normalLabel               = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, BA_SCREEN_WIDTH - 20, 0)];
    self.normalLabel.bakit_manager
    .label_numberOfLines(3.0f)
    .label_textColor([UIColor grayColor])
    .label_font([UIFont HeitiSCWithFontSize:14.0f]);

    self.expendLabel               = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, BA_SCREEN_WIDTH - 20, 0)];
    self.expendLabel.bakit_manager
    .label_numberOfLines(.0f)
    .label_textColor(BAKit_Color_Black)
    .label_font([UIFont HeitiSCWithFontSize:14.0f]);
    
    [self.contentView ba_AddSubViewsWithArray:@[_line, _stateView, _normalLabel, _expendLabel]];
}

- (void)ba_changeState
{
    DemoVC2_01_Model *model = self.dataAdapter.data;
    BACellDataAdapter *dataAdapter = self.dataAdapter;
    
//    
//    if (dataAdapter.cellType == BAShowCellTextTypeNormal) {
//        
//        dataAdapter.cellType = BAShowCellTextTypeNormal;
//        [self ba_updateWithNewCellHeight:model.expendStringHeight animated:YES];
//        [self ba_expendState];
//        
//    } else {
//        
//        dataAdapter.cellType = BAShowCellTextTypeExpend;
//        [self ba_updateWithNewCellHeight:model.normalStringHeight animated:YES];
//        [self ba_normalState];
//    }

    
    switch (dataAdapter.cellType) {
        case BAShowCellTextTypeExpend:
            
            dataAdapter.cellType = BAShowCellTextTypeNormal;
            [self ba_updateWithNewCellHeight:model.normalStringHeight animated:YES];
            [self normalState];
            break;
            
        case BAShowCellTextTypeNormal:
            
            dataAdapter.cellType = BAShowCellTextTypeExpend;
            [self ba_updateWithNewCellHeight:model.expendStringHeight animated:YES];
            [self expandState];
            break;
            
        default:
            break;
    }
}

- (void)normalState
{
    [UIView animateWithDuration:0.35f animations:^{
        self.normalLabel.alpha = 1.0f;
        self.expendLabel.alpha = 0.f;
        self.stateView.backgroundColor = BAKit_Color_Gray_1;
    }];
}

- (void)expandState
{
    [UIView animateWithDuration:0.35f animations:^{
        self.normalLabel.alpha = 0.f;
        self.expendLabel.alpha = 1.f;
        self.stateView.backgroundColor = BAKit_Color_Red;
    }];
}

- (void)ba_loadContent
{
    DemoVC2_01_Model *model = self.dataAdapter.data;
    BACellDataAdapter *dataAdapter = self.dataAdapter;

    switch (dataAdapter.cellType) {
        case BAShowCellTextTypeNormal:
            
            self.normalLabel.bakit_manager
            .label_text(model.contentString);
            self.normalLabel.frame = CGRectMake(10, 10, BA_SCREEN_WIDTH - 20, 0);
            self.normalLabel.alpha = 1;
            [self.normalLabel sizeToFit];
            
            self.expendLabel.bakit_manager
            .label_text(model.contentString);
            self.expendLabel.frame = CGRectMake(10, 10, BA_SCREEN_WIDTH - 20, 0);
            self.expendLabel.alpha = 0;
            [self.expendLabel sizeToFit];
            
            self.stateView.backgroundColor = [UIColor grayColor];
            
            break;
            
        case BAShowCellTextTypeExpend:
            
            self.normalLabel.bakit_manager
            .label_text(model.contentString);
            self.normalLabel.frame = CGRectMake(10, 10, BA_SCREEN_WIDTH - 20, 0);
            self.normalLabel.alpha = 0;
            [self.normalLabel sizeToFit];
            
            self.expendLabel.bakit_manager
            .label_text(model.contentString);
            self.expendLabel.frame = CGRectMake(10, 10, BA_SCREEN_WIDTH - 20, 0);
            self.expendLabel.alpha = 1;
            [self.expendLabel sizeToFit];
            
            self.stateView.backgroundColor = [UIColor redColor];
            
            break;
            
        default:
            break;
    }

    if (self.indexPath.row == 0)
        self.line.hidden = YES;
    else
        self.line.hidden = NO;

}

- (void)ba_selectedEvent
{
    [self ba_changeState];
}

@end
