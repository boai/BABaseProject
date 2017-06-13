
/*!
 *  @brief      BAAlert
 *
 *  @author     BAHome
 *  @copyright  Copyright © 2016年 BAHome. All rights reserved.
 *  @version    V1.1.0
 */

#import "BAActionSheet.h"
#import "BAActionSheetCell.h"
#import "CALayer+Animation.h"
#import "BAAlert_OC.h"

static NSString * const kCellID = @"BAActionSheetCell";

@interface BAActionSheet ()
<
    UITableViewDelegate,
    UITableViewDataSource
>
/*! tableView */
@property (strong, nonatomic) UITableView  *tableView;

/*! 点击事件回调 */
@property (nonatomic, copy) BAActionSheet_ActionBlock actionBlock;

@property (nonatomic, strong) UIWindow *actionSheetWindow;
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, assign) BOOL isExpand;
@property (nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, assign) BOOL isAnimating;

@end

@implementation BAActionSheet

/*!
 *
 *  @param configuration 属性配置：如 bgColor、buttonTitleColor、isTouchEdgeHide...
 *  @param actionBlock   block回调点击的选项
 */
+ (void)ba_actionSheetShowWithConfiguration:(BAActionSheet_ConfigBlock)configuration
                                actionBlock:(BAActionSheet_ActionBlock)actionBlock
{
    BAActionSheet *actionSheet = [[self alloc] init];
    
    if (configuration)
    {
        configuration(actionSheet);
    }
    actionSheet.actionBlock = actionBlock;
    [actionSheet ba_actionSheetShow];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupCommonUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupCommonUI];
    }
    return self;
}

- (void)setupCommonUI
{
    self.backgroundColor = BAAlert_Color_Translucent;
    self.actionSheetType = BAActionSheetTypeNormal;
    self.isExpand = NO;
    self.isTouchEdgeHide = YES;
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(handleDeviceOrientationRotateAction:) name:UIDeviceOrientationDidChangeNotification object:nil];
}

#pragma mark - UITableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.actionSheetType == BAActionSheetTypeCustom)
    {
        return 2;
    }
    else if (self.actionSheetType == BAActionSheetTypeNormal)
    {
        return 1;
    }
    else if (self.actionSheetType == BAActionSheetTypeExpand)
    {
        return self.dataArray.count;
    }
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.actionSheetType == BAActionSheetTypeCustom)
    {
        return (section == 0) ? self.dataArray.count : 1;
    }
    else if (self.actionSheetType == BAActionSheetTypeNormal)
    {
        return self.dataArray.count;
    }
    else if (self.actionSheetType == BAActionSheetTypeExpand)
    {
        if (self.isExpand)
        {
            if (section == self.indexPath.section)
            {
                BAActionSheetModel *model = self.dataArray[section];
                
                return model.subContentArray.count;
            }
        }
        else
        {
            return 0;
        }
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    BAActionSheetCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID];
    
    if (!cell)
    {
        cell = [[BAActionSheetCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kCellID];
    }
    cell.actionSheetType = self.actionSheetType;
    
    if (self.actionSheetType == BAActionSheetTypeCustom)
    {
        if (indexPath.section == 0)
        {
            BAActionSheetModel *model = self.dataArray[indexPath.row];
            cell.textLabel.text = model.content;
        }
        else if (indexPath.section == 1)
        {
            cell.textLabel.text = @"取 消";
        }
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    else if (self.actionSheetType == BAActionSheetTypeNormal)
    {
        BAActionSheetModel *model = self.dataArray[indexPath.row];
        cell.textLabel.text = model.content;
        cell.detailTextLabel.text = model.subContent;
        cell.imageView.image = [UIImage imageNamed:model.imageUrl];
        cell.detailTextLabel.textColor = BAAlert_Color_gray7;
        
        if (indexPath.row == 0)
        {
            self.indexPath = indexPath;
        }
        
        if (self.indexPath == indexPath)
        {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
        else
        {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        
    }
    else if (self.actionSheetType == BAActionSheetTypeExpand)
    {
        if (self.isExpand)
        {
            BAActionSheetModel *model = self.dataArray[indexPath.section];
            if (model.subContentArray.count)
            {
                BAActionSheetSubContentModel *subContentModel = model.subContentArray[indexPath.row];
                cell.textLabel.text = subContentModel.subContent;
                cell.textLabel.textColor = BAAlert_Color_gray7;
                
                cell.backgroundColor = BAAlert_Color_gray11;
                
                return cell;
            }
            if (indexPath.row == model.subContentArray.count-1)
            {
                self.isExpand = NO;
            }
        }
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (self.actionSheetType == BAActionSheetTypeCustom)
    {
        if (indexPath.section == 0)
        {
            if (self.actionBlock)
            {
                [self ba_actionSheetHidden];
                BAActionSheetModel *model = self.dataArray[indexPath.row];
                
                self.actionBlock(indexPath, model);
            }
        }
        else if (indexPath.section == 1)
        {
            [self ba_actionSheetHidden];
        }
    }
    else if (self.actionSheetType == BAActionSheetTypeNormal)
    {
        // 之前选中的，取消选择
        UITableViewCell *celled = [tableView cellForRowAtIndexPath:self.indexPath];
        celled.accessoryType = UITableViewCellAccessoryNone;
        // 记录当前选中的位置索引
        self.indexPath = indexPath;
        // 当前选择的打勾
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        
        if (self.actionBlock)
        {
            [self ba_actionSheetHidden];
            BAActionSheetModel *model = self.dataArray[indexPath.row];
            self.actionBlock(self.indexPath, model);
        }
    }
    else if (self.actionSheetType == BAActionSheetTypeExpand)
    {
        if (self.actionBlock)
        {
            [self ba_actionSheetHidden];
            BAActionSheetModel *model = self.dataArray[indexPath.section];
            
            self.actionBlock(indexPath, model);
        }
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.actionSheetType == BAActionSheetTypeNormal)
    {
        UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [self.tableView reloadData];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (self.actionSheetType == BAActionSheetTypeCustom)
    {
        return (section == 0) ? FLT_MIN : 10;
    }
    else if (self.actionSheetType == BAActionSheetTypeNormal)
    {
        return FLT_MIN;
    }
    else if (self.actionSheetType == BAActionSheetTypeExpand)
    {
        return 44;
    }
    else
    {
        return FLT_MIN;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return FLT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (self.actionSheetType == BAActionSheetTypeExpand)
    {
        BAActionSheetModel *model = self.dataArray[section];
        
        UIButton *header = [UIButton new];
        header.backgroundColor = [UIColor whiteColor];
        header.userInteractionEnabled = YES;
        [header addTarget:self action:@selector(handleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        header.tag = section;
        
        NSString *imageName = @"";
        imageName = @"BAAlert.bundle/Images/arow_down";

        UIButton *expandButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [expandButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        expandButton.frame = CGRectMake(SCREENWIDTH - 50, 0, 30, 30);
        expandButton.userInteractionEnabled = NO;
        
        UILabel *titleLabel = [UILabel new];
        titleLabel.frame = CGRectMake(15, 0, SCREENWIDTH - 15 * 2, 43);
        titleLabel.text = model.content;
        
        [header addSubview:titleLabel];
        if (model.subContentArray.count > 0)
        {
            [header addSubview:expandButton];
        }
        
        return header;
    }
    return [UIView new];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"触摸了边缘隐藏View！");
    UITouch *touch = [touches anyObject];
    UIView *view = [touch view];
    
    if (self.isAnimating)
    {
        NSLog(@"请在动画结束时点击！");
        return;
    }
    if (!self.isTouchEdgeHide)
    {
        NSLog(@"触摸了View边缘，但您未开启触摸边缘隐藏方法，请设置 isTouchEdgeHide 属性为 YES 后再使用！");
    }
    
    if ([view isKindOfClass:[self class]])
    {
        [self ba_actionSheetHidden];
    }
}

- (void)handleDeviceOrientationRotateAction:(NSNotification *)noti
{
    [self ba_layoutSubViews];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)ba_layoutSubViews
{
    CGFloat min_x = 0;
    CGFloat min_y = 0;
    CGFloat min_w = 0;
    CGFloat min_h = 0;
    CGFloat header_h = 0;
    
    self.frame = [UIScreen mainScreen].bounds;
    
    min_w = SCREENWIDTH;
    min_h = (self.title.length > 0) ? 44 : 0;
    self.headerView.frame = CGRectMake(min_x, min_y, min_w, min_h);
    _titleLabel.frame = self.headerView.bounds;

    
    header_h = CGRectGetHeight(self.headerView.frame);
    if (self.actionSheetType == BAActionSheetTypeCustom)
    {
        min_h = (self.dataArray.count + 1) * 44 + 10;
    }
    else if (self.actionSheetType == BAActionSheetTypeNormal)
    {
        min_h = (self.dataArray.count) * 44;
    }
    else if (self.actionSheetType == BAActionSheetTypeExpand)
    {
        if (self.isExpand)
        {
            BAActionSheetModel *model = self.dataArray[self.indexPath.section];
            min_h = (self.dataArray.count + model.subContentArray.count) * 44;
        }
        else
        {
            min_h = (self.dataArray.count) * 44;
        }
    }
    min_y = SCREENHEIGHT - min_h;
    min_y -= header_h;
    min_y = MAX(min_y, 0);
    min_h += header_h;
    min_h = MIN(min_h, SCREENHEIGHT);
    if (min_h == SCREENHEIGHT)
    {
        _tableView.scrollEnabled = YES;
    }
    self.tableView.frame = CGRectMake(min_x, min_y, min_w, min_h);;
    
    if (self.title.length > 0)
    {
        self.tableView.tableHeaderView = self.headerView;
    }
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    [self.tableView reloadData];
}

- (void)ba_actionSheetShow
{
    [self.actionSheetWindow addSubview:self];
    
    [self ba_layoutSubViews];
    
    /*! 设置默认样式为： */
    if (self.isShowAnimate && !self.animatingStyle)
    {
        _animatingStyle = BAAlertAnimatingStyleScale;
    }
    /*! 如果没有开启动画，就直接默认第一个动画样式 */
    else if (!self.isShowAnimate && self.animatingStyle)
    {
        self.showAnimate = YES;
    }
    else
    {
        if (!self.animatingStyle)
        {
            NSLog(@"您没有开启动画，也没有设置动画样式，默认为没有动画！");
        }
    }
    
    if (self.isShowAnimate)
    {
        [self showAnimationWithView:self.tableView];
    }
}

- (void)ba_actionSheetHidden
{
    if (self.isShowAnimate)
    {
        [self dismissAnimationView:self.tableView];
    }
    else
    {
        [self ba_removeSelf];
    }
}

#pragma mark - 进场动画
- (void )showAnimationWithView:(UIView *)animationView
{
    self.isAnimating = YES;
    BAKit_WeakSelf
    if (self.animatingStyle == BAAlertAnimatingStyleScale)
    {
        [animationView scaleAnimationShowFinishAnimation:^{
            BAKit_StrongSelf
            self.isAnimating = NO;
        }];
    }
    else if (self.animatingStyle == BAAlertAnimatingStyleShake)
    {
        [animationView.layer shakeAnimationWithDuration:1.0 shakeRadius:16.0 repeat:1 finishAnimation:^{
            BAKit_StrongSelf
            self.isAnimating = NO;
        }];
    }
    else if (self.animatingStyle == BAAlertAnimatingStyleFall)
    {
        [animationView.layer fallAnimationWithDuration:0.35 finishAnimation:^{
            BAKit_StrongSelf
            self.isAnimating = NO;
        }];
    }
}

#pragma mark - 出场动画
- (void )dismissAnimationView:(UIView *)animationView
{
    self.isAnimating = YES;
    BAKit_WeakSelf;
    if (self.animatingStyle == BAAlertAnimatingStyleScale)
    {
        [animationView scaleAnimationDismissFinishAnimation:^{
            BAKit_StrongSelf
            self.isAnimating = NO;
            [self performSelector:@selector(ba_removeSelf)];
        }];
    }
    else if (self.animatingStyle == BAAlertAnimatingStyleShake)
    {
        [animationView.layer floatAnimationWithDuration:0.35f finishAnimation:^{
            BAKit_StrongSelf
            self.isAnimating = NO;
            [self performSelector:@selector(ba_removeSelf)];
        }];
    }
    else if (self.animatingStyle == BAAlertAnimatingStyleFall)
    {
        [animationView.layer floatAnimationWithDuration:0.35f finishAnimation:^{
            BAKit_StrongSelf
            self.isAnimating = NO;
            [self performSelector:@selector(ba_removeSelf)];
        }];
    }
}

- (void)ba_removeSelf
{
    [self.tableView removeFromSuperview];
    self.tableView = nil;
    [self removeFromSuperview];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)handleButtonAction:(UIButton *)sender
{
    BAActionSheetModel *model = self.dataArray[sender.tag];
    for (NSInteger i = 0; i < model.subContentArray.count; i++)
    {
        self.indexPath = [NSIndexPath indexPathForRow:i inSection:sender.tag];
    }
    
    if (model.subContentArray.count > 0)
    {
        self.isExpand = !self.isExpand;
    }
    else
    {
        self.isExpand = NO;
        if (self.actionBlock)
        {
            [self ba_actionSheetHidden];
            BAActionSheetModel *model = self.dataArray[sender.tag];
            
            self.actionBlock(self.indexPath, model);
        }
    }
    
    [self ba_layoutSubViews];
    
    [self.tableView reloadData];
}

#pragma mark - setter / getter
- (UITableView *)tableView
{
    if ( !_tableView )
    {
        _tableView                 = [[UITableView alloc] init];
        _tableView.delegate        = self;
        _tableView.dataSource      = self;
        _tableView.scrollEnabled   = NO;
        _tableView.backgroundColor = BAAlert_Color_gray11;
        
        [self addSubview:_tableView];
    }
    return _tableView;
}

- (UIView *)headerView
{
    if (!_headerView)
    {
        _headerView = [UIView new];
        
        _titleLabel = [UILabel new];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = self.title;
        
        [self.headerView addSubview:_titleLabel];
    }
    return _headerView;
}

- (UIWindow *)actionSheetWindow
{
    if (!_actionSheetWindow)
    {
        _actionSheetWindow = [UIApplication sharedApplication].keyWindow;
        
        if (self.actionSheetWindow.windowLevel != UIWindowLevelNormal)
        {
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"windowLevel == %ld AND hidden == 0 " , UIWindowLevelNormal];
            self.actionSheetWindow = [[UIApplication sharedApplication].windows filteredArrayUsingPredicate:predicate].firstObject;
        }
        self.actionSheetWindow.backgroundColor = BAAlert_Color_Translucent;
    }

    return _actionSheetWindow;
}

- (void)setIsTouchEdgeHide:(BOOL)isTouchEdgeHide
{
    _isTouchEdgeHide = isTouchEdgeHide;
}

- (void)setShowAnimate:(BOOL)showAnimate
{
    _showAnimate = showAnimate;
}

- (void)setAnimatingStyle:(BAAlertAnimatingStyle)animatingStyle
{
    _animatingStyle = animatingStyle;
}

- (void)setActionSheetType:(BAActionSheetType)actionSheetType
{
    _actionSheetType = actionSheetType;
}

- (void)setIsAnimating:(BOOL)isAnimating
{
    _isAnimating = isAnimating;
}

@end

@implementation BAActionSheetModel

@end

@implementation BAActionSheetSubContentModel

@end
