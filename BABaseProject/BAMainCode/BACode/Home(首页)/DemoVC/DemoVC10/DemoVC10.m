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

@interface DemoVC10 ()

@property (nonatomic, strong) DemoVC10_CollectionView *collectionView;

@end

@implementation DemoVC10

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setVCBgColor:BA_Yellow_Color];
    self.collectionView.hidden = NO;

}

#pragma mark - ***** setter / getter
- (DemoVC10_CollectionView *)collectionView
{
    if (!_collectionView)
    {
        _collectionView = [[DemoVC10_CollectionView alloc] initWithFrame:CGRectZero withblock:^(UICollectionView *collection, NSIndexPath *indexPath, NSArray *dataArray) {
            
            NSDictionary *dict = [DemoVC10Model mj_keyValuesArrayWithObjectArray:dataArray][indexPath.row];
            NSString *message = [[NSString alloc] initWithFormat:@"你点击了第%ld个section，第%ld个cell：%@",(long)indexPath.section,(long)indexPath.row, dict[@"desc"]];
            BALog(@"%@", message);
            
            [self.view showAlertView:@"温馨提示：" message:message];
            
        }];
        
        [self.view addSubview:_collectionView];
        
        _collectionView.sd_layout.spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));

    }
    return _collectionView;
}
@end
