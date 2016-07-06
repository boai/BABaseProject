//
//  DemoVC2_01.m
//  BABaseProject
//
//  Created by 博爱 on 16/6/28.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC2_01.h"
#import "DemoVC2_01_Model.h"
#import "DemoVC2_01_cell.h"

@interface DemoVC2_01 ()
<
    UITableViewDelegate,
    UITableViewDataSource
>

@property (nonatomic, strong) UITableView    *tableView;
@property (nonatomic, strong) NSMutableArray *datasArray;

@end

@implementation DemoVC2_01

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.hidden = NO;
    [self createDataSource];

}

- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [self.view addSubview:_tableView];
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0 , 0, 0, 0));
        }];
        
        _tableView.tableFooterView = [UIView new];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

        [_tableView registerClass:[DemoVC2_01_cell class] forCellReuseIdentifier:@"DemoVC2_01_cell"];

    }
    return _tableView;
}

- (NSMutableArray *)datasArray
{
    if (!_datasArray)
    {
        _datasArray = @[].mutableCopy;
    }
    return _datasArray;
}

- (void)createDataSource
{
    NSArray *strings = @[
                         @"AFNetworking is a delightful networking library for iOS and Mac OS X. It's built on top of the Foundation URL Loading System, extending the powerful high-level networking abstractions built into Cocoa. It has a modular architecture with well-designed, feature-rich APIs that are a joy to use. Perhaps the most important feature of all, however, is the amazing community of developers who use and contribute to AFNetworking every day. AFNetworking powers some of the most popular and critically-acclaimed apps on the iPhone, iPad, and Mac. Choose AFNetworking for your next project, or migrate over your existing projects—you'll be happy you did!",
                         
                         @"欢迎使用 iPhone SE，迄今最高性能的 4 英寸 iPhone。在打造这款手机时，我们在深得人心的 4 英寸设计基础上，从里到外重新构想。它所采用的 A9 芯片，正是在 iPhone 6s 上使用的先进芯片。1200 万像素的摄像头能拍出令人叹为观止的精彩照片和 4K 视频，而 Live Photos 则会让你的照片栩栩如生。这一切，成就了一款外形小巧却异常强大的 iPhone。",
                         
                         @"★タクシー代がなかったので、家まで歩いて帰った。★もし事故が発生した场所、このレバーを引いて列车を止めてください。（丁）为了清楚地表示出一个短语或句节，其后须标逗号。如：★この薬を、夜寝る前に一度、朝起きてからもう一度、饮んでください。★私は、空を飞ぶ鸟のように、自由に生きて行きたいと思った。*****为了清楚地表示词语与词语间的关系，须标逗号。标注位置不同，有时会使句子的意思发生变化。如：★その人は大きな音にびっくりして、横から飞び出した子供にぶつかった。★その人は、大きな音にびっくりして横から飞び出した子供に、ぶつかった。",
                         
                         @"Two roads diverged in a yellow wood, And sorry I could not travel both And be one traveler, long I stood And looked down one as far as I could To where it bent in the undergrowth; Then took the other, as just as fair, And having perhaps the better claim, Because it was grassy and wanted wear; Though as for that the passing there Had worn them really about the same, And both that morning equally lay In leaves no step had trodden black. Oh, I kept the first for another day! Yet knowing how way leads on to way, I doubted if I should ever come back. I shall be telling this with a sigh Somewhere ages and ages hence: Two roads diverged in a wood, and I- I took the one less traveled by, And that has made all the difference. ",
                         
                         @"Star \"https://github.com/boai\" :)"
                         ];
    
    [GCDQueue executeInMainQueue:^{
        
        NSMutableArray *indexPaths = [NSMutableArray array];
        
        for (int i = 0; i < strings.count; i++) {
            
            DemoVC2_01_Model *model = [[DemoVC2_01_Model alloc] init];
            model.contentString    = strings[i];
            
            [model calculateTheNormalStringHeightWithStringAttribute:@{NSFontAttributeName : [UIFont HeitiSCWithFontSize:14.f]}
                                                          fixedWidth:BA_SCREEN_WIDTH - 20];
            [model calculateTheExpendStringHeightWithStringAttribute:@{NSFontAttributeName : [UIFont HeitiSCWithFontSize:14.f]}
                                                          fixedWidth:BA_SCREEN_WIDTH - 20];
            
            BACellDataAdapter *adapter = [BACellDataAdapter ba_cellDataAdapterWithCellReuseIdentifier:@"DemoVC2_01_cell" data:model
                                                                                    cellHeight:model.normalStringHeight
                                                                                      cellType:BAShowCellTextTypeNormal];
            [self.datasArray addObject:adapter];
            [indexPaths addObject:[NSIndexPath indexPathForRow:i inSection:0]];
        }
        
        [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
        
    } afterDelaySecs:0.5f];
    
    // Execute in MainQueue after delay 1 secs.
    [GCDQueue executeInMainQueue:^{
        
        [self tableView:self.tableView didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        
    } afterDelaySecs:1.f];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.datasArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BACellDataAdapter *dataAdapter = self.datasArray[indexPath.row];
    BABaseCell *cell = [tableView dequeueReusableCellWithIdentifier:dataAdapter.cellReuseIdentifier];
    [cell ba_setWeakReferenceWithCellDataAdapter:dataAdapter data:dataAdapter.data indexPath:indexPath tableView:tableView];
    [cell ba_loadContent];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DemoVC2_01_cell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell ba_selectedEvent];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BACellDataAdapter *dataAdapter = self.datasArray[indexPath.row];
    return dataAdapter.cellHeight;
}

@end
