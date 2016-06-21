//
//  DemoVC9.m
//  BABaseProject
//
//  Created by 博爱 on 16/5/26.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC9.h"
#import "MyLayout.h"
#import "DemoVC9_Model.h"

@interface DemoVC9 ()

/*! 数据 */
@property (nonatomic, strong) NSMutableArray  *dataArray;

@end

@implementation DemoVC9

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"浮动布局2";
    self.view.backgroundColor = BA_White_Color;
    
    [self setupUI];
}

- (void)setupUI
{
    UIScrollView *scrollView = [UIScrollView new];
    self.view = scrollView;
    scrollView.backgroundColor = BA_Yellow_Color;

    MyLinearLayout *rootLayout = [MyLinearLayout linearLayoutWithOrientation:MyLayoutViewOrientation_Vert];
    rootLayout.myLeftMargin = rootLayout.myRightMargin = 0;
    rootLayout.backgroundColor = BA_White_Color;
    [scrollView addSubview:rootLayout];
    
    /*! 里面的子视图的宽度都和布局视图相等，这样子视图就不需要设置宽度了。 */
    rootLayout.gravity = MyMarginGravity_Horz_Fill;
    rootLayout.padding = UIEdgeInsetsMake(20, 10, 20, 10);
    
    for (int i = 0; i < 3; i++)
    {
        UILabel *label = [UILabel new];
        label.text = [NSString stringWithFormat:@"第%d分区", i + 1];
        [label sizeToFit];
        label.myTopMargin = 10;
        [rootLayout addSubview:label];
        
        /*! 流式布局，从左到右，从上到下用MyLayoutViewOrientation_Vert。 每列的数量是3个。 */
        MyFlowLayout *flowLayout = [MyFlowLayout flowLayoutWithOrientation:MyLayoutViewOrientation_Vert arrangedCount:3];
        
        /*! 高度由子视图决定 */
        flowLayout.wrapContentHeight = YES;
        /*! 每个子视图之间的水平间距是5 */
        flowLayout.subviewHorzMargin = 5;
        /*! 每个子视图之间的垂直间距是5 */
        flowLayout.subviewVertMargin = 5;
        /*! 平均分配每个子视图的宽度。 */
        flowLayout.averageArrange = YES;
        
        [rootLayout addSubview:flowLayout];
        
        for (int j = 0; j < self.dataArray.count; j ++)
        {
            DemoVC9_Model *model = self.dataArray[j];
            
            UIView *itemView = [self createItemLayout:model.imageName title:model.title];
            /*! 让子视图的高度等于宽度加10. 子视图的宽度由上面的averageArrange会确定好。 */
            itemView.heightDime.equalTo(itemView.widthDime).add(10);
            [flowLayout addSubview:itemView];
        }
    }
}

- (UIView*)createItemLayout:(NSString*)image title:(NSString*)title
{
    MyLinearLayout *itemLayout = [MyLinearLayout linearLayoutWithOrientation:MyLayoutViewOrientation_Vert];
    /*! 默认垂直线性布局的高度是由子视图包裹，这里不需要顾设置为NO。 */
    itemLayout.wrapContentHeight = NO;
    
    /*! 里面的子视图的宽度都和布局视图相等，这样子视图就不需要设置宽度了。 */
    itemLayout.gravity = MyMarginGravity_Horz_Fill;
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:image]];
    /*! 高度占用布局视图的剩余空间。 */
    imageView.weight = 1;
    [itemLayout addSubview:imageView];
    
    UILabel *label = [UILabel new];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = title;
    label.numberOfLines = 0;
    [label sizeToFit];
    [itemLayout addSubview:label];
    
    return itemLayout;
}

#pragma mark - ***** setter / getter
- (NSMutableArray *)dataArray
{
    if (!_dataArray)
    {
        _dataArray = @[].mutableCopy;
        
        NSArray *imageArray = @[@"BACollectionView.bundle/1.png",
                                @"BACollectionView.bundle/2.png",
                                @"BACollectionView.bundle/3.png",
                                @"BACollectionView.bundle/4.png",
                                @"BACollectionView.bundle/5.png",
                                @"BACollectionView.bundle/6.png",
                                @"BACollectionView.bundle/7.png",
                                @"BACollectionView.bundle/8.png",
                                @"BACollectionView.bundle/9.png"
                                ];
        NSArray *descArray = @[@"博爱",
                               @"LEE",
                               @"张三",
                               @"我是LEE的老师",
                               @"我是LEE的老师",
                               @"我是LEE的老师",
                               @"我是LEE的老师",
                               @"我是LEE的老师",
                               @"小三"];
        NSArray *sourceArray = @[@"专题",
                                 @"海外网",
                                 @"网易",
                                 @"网易",
                                 @"网易",
                                 @"网易",
                                 @"人民日报",
                                 @"锤子论坛"];
        
        
        for (int j = 0; j < 12; j ++)
        {
            int imageRandomIndex  = arc4random_uniform(8);
            int descRandomIndex   = arc4random_uniform(8);
            int sourceRandomIndex = arc4random_uniform(8);
            
            DemoVC9_Model *model   = [DemoVC9_Model new];
            model.imageName       = imageArray[imageRandomIndex];
            model.title           = descArray[descRandomIndex];
            model.source          = sourceArray[sourceRandomIndex];
            
            [_dataArray addObject:model];
        }
    }
    return _dataArray;
}



@end
