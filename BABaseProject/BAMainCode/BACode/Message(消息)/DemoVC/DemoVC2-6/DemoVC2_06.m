//
//  DemoVC2_06.m
//  BABaseProject
//
//  Created by boai on 2016/10/12.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC2_06.h"

@interface DemoVC2_06 ()

@end

@implementation DemoVC2_06

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)ba_setupUI
{
    UILabel *label = [[UILabel alloc]initWithFrame:self.view.bounds];
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:label];
    
    NSString *strings = @"在工艺的创新和精准程度上，iPhone 7 达到了我们前所未及的新高度。亮黑色的外观与我们以往的设计截然不同，外壳具备了防溅抗水的特性1，主屏幕按钮经过焕然一新的打造。再加上触感圆润无缝的新款一体成型机身设计，无论是拿在手里还是看在眼里，iPhone 7 都一样令人赞叹。\n两款尺寸，五色外观。\n与 iPhone 7 和 iPhone 7 Plus 携同而来的，\n是两款新的外观颜色：精美磨砂质感的黑色，和深邃闪耀的亮黑色。无论是 4.7 英寸还是 5.5 英寸，这两种机型均采用坚固的 7000 系列铝金属打造而成，并另有经典的银色、金色和玫瑰金色外观可供选择。";
    
    NSString *heightLightStr = @"亮黑色";
    NSRange heightLightRange = [strings rangeOfString:heightLightStr];
    
    /*! 创建 NSMutableAttributedString  */
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:strings];
    
    /*! 改变某位置的颜色 */
    [attributedString ba_changeColor:[UIColor cyanColor] range:heightLightRange];
    
    /*! 改变某位置的颜色 */
    [attributedString ba_changeColor:[UIColor redColor] from:3 length:5];
    
    /*! 改变某位置的普通字号 */
    [attributedString ba_changeSystemFontFloat:30 range:NSMakeRange(10, 2)];
    
    /*! 改变某位置的粗体字号 */
    [attributedString ba_changeBoldFontFloat:30 range:NSMakeRange(30, 2)];
    
    /*! 改变某位置的行距 */
    //    [attributedString ba_changeLineSpacing:20 from:60 length:50];
    
    /*! 改变某位置的段落距离 */
    //    [attributedString ba_changeParagraphSpacing:20 from:200 length:10];
    
    /*! 改变段的顶部和文本内容的开头之间的距离 */
    //    [attributedString ba_changeBeforeLparagraphSpacing:50 from:200 length:10];
    
    /*! 根据位置加下划线 */
    [attributedString ba_changeUnderlineWitRange:NSMakeRange(100, 10)];
    
    /*! 全部加下划线 */
    //    [attributedString ba_changeUnderlineAtAll];
    
    /*! 根据位置加删除线 */
    [attributedString ba_changeStrikethroughWitRange:NSMakeRange(200, 10)];
    
    /*! 全部加删除线 */
    //    [attributedString ba_changeStrikethroughAtAll];
    
    label.attributedText = attributedString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
