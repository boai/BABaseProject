
/*!
 *  @header BAKit.h
 *          BABaseProject
 *
 *  @brief  BAKit
 *
 *  @author 博爱
 *  @copyright    Copyright © 2016年 博爱. All rights reserved.
 *  @version    V1.0
 */

//                            _ooOoo_
//                           o8888888o
//                           88" . "88
//                           (| -_- |)
//                            O\ = /O
//                        ____/`---'\____
//                      .   ' \\| |// `.
//                       / \\||| : |||// \
//                     / _||||| -:- |||||- \
//                       | | \\\ - /// | |
//                     | \_| ''\---/'' | |
//                      \ .-\__ `-` ___/-. /
//                   ___`. .' /--.--\ `. . __
//                ."" '< `.___\_<|>_/___.' >'"".
//               | | : `- \`.;`\ _ /`;.`/ - ` : | |
//                 \ \ `-. \_ __\ /__ _/ .-` / /
//         ======`-.____`-.___\_____/___.-`____.-'======
//                            `=---='
//
//         .............................................
//                  佛祖镇楼                  BUG辟易
//          佛曰:
//                  写字楼里写字间，写字间里程序员；
//                  程序人员写程序，又拿程序换酒钱。
//                  酒醒只在网上坐，酒醉还来网下眠；
//                  酒醉酒醒日复日，网上网下年复年。
//                  但愿老死电脑间，不愿鞠躬老板前；
//                  奔驰宝马贵者趣，公交自行程序员。
//                  别人笑我忒疯癫，我笑自己命太贱；
//                  不见满街漂亮妹，哪个归得程序员？

/*
 
 *********************************************************************************
 *
 * 在使用BAKit的过程中如果出现bug请及时以以下任意一种方式联系我，我会及时修复bug
 *
 * QQ     : 可以添加SDAutoLayout群 497140713 在这里找到我(博爱1616【137361770】)
 * 微博    : 博爱1616
 * Email  : 137361770@qq.com
 * GitHub : https://github.com/boai
 * 博客园  : http://www.cnblogs.com/boai/
 * 博客    : http://boai.github.io
 
 *********************************************************************************
 
 */


#import "BATabBar.h"
#import "BATabBarButton.h"

@interface BATabBar ()

@property (nonatomic, weak  ) UIButton        *plusButton;

@property (nonatomic, strong) NSMutableArray  *buttons;

@property (nonatomic, weak  ) UIButton        *selectedButton;

@end

@implementation BATabBar

- (NSMutableArray *)buttons
{
    if (!_buttons)
    {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

- (void)setItems:(NSArray *)items
{
    _items = items;
    
    // 遍历模型数组，创建对应tabBarButton
    for (UITabBarItem *item in _items)
    {
        BATabBarButton *btn = [BATabBarButton buttonWithType:UIButtonTypeCustom];
        
        // 给按钮赋值模型，按钮的内容由模型对应决定
        btn.item = item;
        
        btn.tag = self.buttons.count;
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        
        if (btn.tag == 0)
        {
            // 选中第0个
            [self btnClick:btn];
        }
        [self addSubview:btn];
        
        // 把按钮添加到按钮数组
        [self.buttons addObject:btn];
    }
}

// 点击tabBarButton调用
- (void)btnClick:(UIButton *)button
{
    _selectedButton.selected = NO;
    button.selected = YES;
    _selectedButton = button;
    
    // 通知tabBarVc切换控制器，
    if ([_delegate respondsToSelector:@selector(tabBar:didClickButton:)])
    {
        [_delegate tabBar:self didClickButton:button.tag];
    }
}

//- (UIButton *)plusButton
//{
//    if (!_plusButton)
//    {
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
//        [btn setImage:[UIImage imageNamed:@"tabbar_compose_background_icon_add"] forState:UIControlStateHighlighted];
//        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
//        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
//        
//        // 默认按钮的尺寸和背景图一样大
//        // sizeToFit ： 默认会根据按钮的背景图片活着image 和文字计算出按钮的最适合的尺寸
//        [btn sizeToFit];
//        
//        _plusButton = btn;
//        [self addSubview:_plusButton];
//    }
//    return _plusButton;
//}

// 调整子控件的位置
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    CGFloat W = self.bounds.size.width;
//    CGFloat H = self.bounds.size.height;
    
    CGFloat btn_X = 0;
    CGFloat btn_Y = 0;
    CGFloat btn_W = W / (self.items.count);
    CGFloat btn_H = self.bounds.size.height;
    
//    int i = 0;
//    // 设置tabBarButton的frame
//    for (UIView *tabBarButton in self.buttons) {
//        if (i == 2) {
//            i = 3;
//        }
//        btnX = i * btnW;
//        tabBarButton.frame = CGRectMake(btnX, btnY, btnW, btnH);
//        i++;
//    }
    
    
    int i = 0;
    // 调整系统自带的tabBar上的按钮位置frame
    for (UIView *tabBarButton in self.buttons)
    {
//        if (i == 2)
//        {
//            i = 3;
//        }
        btn_X = i * btn_W;
        
        tabBarButton.frame = CGRectMake(btn_X, btn_Y, btn_W, btn_H);
        
        i++;
    }
    
    // 设置添加按钮的位置
//    self.plusButton.center = CGPointMake(W * 0.5, H * 0.5);
//    self.plusButton.bounds = CGRectMake(0, 0, self.plusButton.currentBackgroundImage.size.width, self.plusButton.currentBackgroundImage.size.height);
//    
}




@end
