//
//  DemoVC2_06.m
//  BABaseProject
//
//  Created by boai on 2016/10/12.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC2_06.h"

@interface DemoVC2_06 ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UILabel *label2;

@end

@implementation DemoVC2_06

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.label.hidden = NO;
}

- (UILabel *)label
{
    if (!_label)
    {
        /*! 需要点击的字符不同 */
        NSString *label_text2 = @"您好！您是陆晓峰吗？你中奖了，领取地址“www.baidu.com”,领奖码“8888”";
        NSMutableAttributedString *attributedString2 = [[NSMutableAttributedString alloc]initWithString:label_text2];
        [attributedString2 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, label_text2.length)];
        /*! 要在这里改位置哈！ */
        [attributedString2 addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(20, 13)];
        [attributedString2 addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(20, 13)];
        /*! 要在这里改位置哈！ */
        [attributedString2 addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(39, 4)];
        
        _label = [UILabel new];
        _label.frame = CGRectMake(20, CGRectGetMaxY(_label2.frame) + 20, BA_SCREEN_WIDTH - 40,50);
        _label.backgroundColor = [UIColor lightGrayColor];
        _label.numberOfLines = 0;
        _label.attributedText = attributedString2;
        
        [self.view addSubview:_label];
        
        BA_WEAKSELF;
        [_label ba_addAttributeTapActionWithStrings:@[@"www.baidu.com",@"8888"] tapClicked:^(NSString *string, NSRange range, NSInteger index) {
            NSString *message = [NSString stringWithFormat:@"点击了“%@”字符\nrange: %@\nindex: %ld",string,NSStringFromRange(range),index];
            [weakSelf.view ba_showAlertView:@"温馨提示：" message:message];
        }];
        
        /*! 设置是否有点击效果，默认是 YES */
        _label.enabledTapEffect = NO;
    }
    return _label;
}

- (void)ba_setupUI
{
    _label2 = [[UILabel alloc]initWithFrame:CGRectMake(10, 80, BA_SCREEN_WIDTH - 20, BA_SCREEN_HEIGHT*0.6)];
    _label2.textAlignment = NSTextAlignmentCenter;
    _label2.numberOfLines = 0;
    _label2.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_label2];
    
    NSString *strings = @"在工艺的创新和精准程度上，iPhone 7 达到了我们前所未及的新高度。亮黑色的外观与我们以往的设计截然不同，外壳具备了防溅抗水的特性1，主屏幕按钮经过焕然一新的打造。再加上触感圆润无缝的新款一体成型机身设计，无论是拿在手里还是看在眼里，iPhone 7 都一样令人赞叹。\n两款尺寸，五色外观。\n与 iPhone 7 和 iPhone 7 Plus 携同而来的，\n是两款新的外观颜色：精美磨砂质感的黑色，和深邃闪耀的亮黑色。无论是 4.7 英寸还是 5.5 英寸，这两种机型均采用坚固的 7000 系列铝金属打造而成，并另有经典的银色、金色和玫瑰金色外观可供选择。";
    
    NSString *heightLightStr = @"亮黑色";
    NSRange heightLightRange = [strings rangeOfString:heightLightStr];
    
    /*! 第2种：综合创建富文本的方法 */
    NSMutableAttributedString *attributedString2 = [[NSMutableAttributedString alloc] initWithStrings:@[@"1我们是富文本", @"2我们是富文本", @"3我们是富文本"] attributesArray:@[@{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:[UIColor blackColor],                                                                                                   NSKernAttributeName:@2.0,                                                                                                    NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle),                                                                                                    NSStrokeColorAttributeName:[UIColor blueColor],                                                                                                   NSStrokeWidthAttributeName:@2.0,                                                                                                     NSVerticalGlyphFormAttributeName:@(0)}, @{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:[UIColor blackColor],                                                                                                   NSKernAttributeName:@2.0,                                                                                                    NSStrikethroughStyleAttributeName:@(NSUnderlineStyleDouble),                                                                                                    NSStrokeColorAttributeName:[UIColor redColor],                                                                                                   NSStrokeWidthAttributeName:@2.0,                                                                                                     NSVerticalGlyphFormAttributeName:@(0)}] space:@[@(1),@(5),@(10)]];
    
    /*! 第1种：创建 NSMutableAttributedString  */
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:strings];
    
    /*! 改变某位置的颜色 */
    [attributedString ba_changeColor:[UIColor cyanColor] range:heightLightRange];
    
    /*! 改变某位置的颜色 */
    [attributedString ba_changeColor:[UIColor redColor] range:NSMakeRange(3, 5)];
    
    /*! 改变某位置的普通字号 */
    [attributedString ba_changeSystemFont:[UIFont systemFontOfSize:30] range:NSMakeRange(10, 2)];
    
    /*! 设置字形倾斜度，取值为 NSNumber（float）,正值右倾，负值左倾   */
    [attributedString ba_changeObliquenessValue:@(1) range:NSMakeRange(3, 5)];
    
    /*! 改变某位置的行距 */
    //    [attributedString ba_changeLineSpacing:20 from:60 length:50];
    
    /*! 改变某位置的段落距离 */
    //    [attributedString ba_changeParagraphSpacing:20 from:200 length:10];
    
    /*! 改变段的顶部和文本内容的开头之间的距离 */
    //    [attributedString ba_changeBeforeLparagraphSpacing:50 from:200 length:10];
    
    /*! 根据位置、长度 设置下划线样式：根据枚举选择 */
    [attributedString ba_changeUnderlineStyle:NSUnderlineStyleDouble color:[UIColor greenColor] Range:NSMakeRange(100, 10)];
    
    /*! 全部加下划线 */
    //    [attributedString ba_changeUnderlineAtAll];
    
    /*! 根据位置加删除线 */
    [attributedString ba_changeStrikethroughStyle:NSUnderlineStyleDouble color:[UIColor redColor] Range:NSMakeRange(200, 10)];
    
    /*! 全部加删除线 */
    //    [attributedString ba_changeStrikethroughAtAll];
    
    /*! 根据位置修改默认字距 0表示禁用字距调整 */
    [attributedString ba_changeKernWithValue:@(10) Range:NSMakeRange(1, 5)];
    
    /*! 根据位置修改描边颜色 */
    [attributedString ba_changeStrokeColorWithColor:[UIColor greenColor]  strokeWidth:@(2.0) Range:NSMakeRange(1, 5)];
    
    /*! 阴影 */
    NSShadow *shadow = [[NSShadow alloc] init];
    [shadow ba_shadowWithColor:[UIColor grayColor]
                  shadowOffset:CGSizeMake(1, 3)
              shadowBlurRadius:1];
    [attributedString ba_changeShadowWithShadow:shadow Range:NSMakeRange(1, 3)];
    
    /*! 根据位置修改宽度 */
    [attributedString ba_changeExpansionWithValue:@(0.6) Range:NSMakeRange(1, 3)];
    
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:20],
                          NSForegroundColorAttributeName:[UIColor blackColor],
                          NSKernAttributeName:@2.0,
                          NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle),
                          NSStrokeColorAttributeName:[UIColor blueColor],
                          NSStrokeWidthAttributeName:@2.0,
                          NSShadowAttributeName:shadow,
                          NSVerticalGlyphFormAttributeName:@(0)};
    
    [attributedString ba_changeAttributeDict:dic range:NSMakeRange(65, 5)];
    
    [attributedString ba_changeStrikethroughStyle:NSUnderlineStyleDouble color:[UIColor redColor] Range:NSMakeRange(1, 3)];
    
    /*! 设置连体属性，取值为NSNumber 对象(整数)，0 表示没有连体字符，1 表示使用默认的连体字符，  //  2 表示使用所有连体符号，默认值为 1（iOS 不支持 2） */
    //    - (NSRange)ba_changeLigatureWithValue:(int)value range:(NSRange)range
    //
    //    NSString *ligatureStr = @"flush";
    //
    //    NSDictionary *attrDict1 = @{ NSLigatureAttributeName: [NSNumber numberWithInt: 0],
    //                                 NSFontAttributeName: [UIFont fontWithName: @"futura" size: 30] };
    
    //    label.attributedText = [[NSAttributedString alloc] initWithString: ligatureStr attributes: attrDict1];
    //
    //    NSDictionary *attrDict2 = @{ NSLigatureAttributeName: @(1), NSFontAttributeName: [UIFont fontWithName: @"futura" size: 30]};
    //
    //    label2.attributedText = [[NSAttributedString alloc] initWithString: ligatureStr attributes: attrDict2];
    
    _label2.attributedText = attributedString;
    //    label.attributedText = attributedString2;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
