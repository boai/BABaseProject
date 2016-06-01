//
//  DemoVC10.m
//  BABaseProject
//
//  Created by 博爱 on 16/5/27.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC10.h"
#import "DemoVC10_CollectionView.h"
#import "DemoVC10Model.h"
#import "DemoVC10Cell.h"

@interface DemoVC10 ()

@property (nonatomic, strong) DemoVC10_CollectionView *collectionView;

@end

@implementation DemoVC10

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title                 = @"collectionView";
    [self setVCBgColor:BA_Yellow_Color];
    self.collectionView.hidden = NO;
    self.editButton.hidden     = NO;

}

- (UIButton *)editButton
{
    if (!_editButton)
    {
        _editButton = [[UIButton alloc] init];
        [_editButton setTintColor:BA_Orange_Color];
        [_editButton setTitle:@"编辑" forState:UIControlStateNormal];
        [_editButton addTarget:self action:@selector(editButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_editButton sizeToFit];
        
        UIBarButtonItem *menuItem = [[UIBarButtonItem alloc] initWithCustomView:_editButton];
        self.navigationItem.rightBarButtonItem = menuItem;
    }
    return _editButton;
}

- (IBAction)editButtonAction:(UIButton *)sender
{
    /*! 从正常状态变为可删除状态 */
    if (self.collectionView.cellState == DemoVC10_cellStateNormal)
    {
        self.collectionView.cellState = DemoVC10_cellStateDelete;
        [self.editButton setTitle:@"完成" forState:UIControlStateNormal];
        
        /*! 循环遍历整个CollectionView */
        for (DemoVC10Cell *cell in self.collectionView.collectionView.visibleCells)
        {
            //            NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
            cell.deleteButton.hidden = NO;
        }
    }
    else if (self.collectionView.cellState == DemoVC10_cellStateDelete)
    {
        self.collectionView.cellState = DemoVC10_cellStateNormal;
        [self.editButton setTitle:@"编辑" forState:UIControlStateNormal];
    }
    [self.collectionView.collectionView reloadData];
}

#pragma mark - ***** setter / getter
- (DemoVC10_CollectionView *)collectionView
{
    BA_Weak;
    if (!_collectionView)
    {
        _collectionView = [[DemoVC10_CollectionView alloc] initWithFrame:CGRectZero withblock:^(UICollectionView *collection, NSIndexPath *indexPath, NSArray *dataArray) {
            
            NSDictionary *dict = [DemoVC10Model mj_keyValuesArrayWithObjectArray:dataArray][indexPath.row];
            NSString *message = [[NSString alloc] initWithFormat:@"你点击了第%ld个section，第%ld个cell：%@",(long)indexPath.section,(long)indexPath.row, dict[@"desc"]];
            BALog(@"%@", message);
            
            [weakSelf.view showAlertView:@"温馨提示：" message:message];
            
        }];
        
        [self.view addSubview:_collectionView];
        
        _collectionView.sd_layout.spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));

    }
    return _collectionView;
}
@end
